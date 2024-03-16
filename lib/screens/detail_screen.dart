import 'package:flutter/material.dart';
import 'package:toonflix/services/api_services.dart';

import 'package:toonflix/models/webtoon_detail_model.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:toonflix/widgets/episode_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class DeatilScreen extends StatefulWidget {
  final String title, thumb, id;

  const DeatilScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  State<DeatilScreen> createState() => _DeatilScreenState();
}

class _DeatilScreenState extends State<DeatilScreen> {
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;

  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getWebtoonDetailById(widget.id);
    episodes = ApiService.getWebtoonEpisodesById(widget.id);
  }

  onButtonTap() async {
    final url = Uri.parse("https://google.com");
    await launchUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: widget.id,
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 5,
                            offset: Offset(0, 0),
                            color: Colors.black,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 250,
                      child: Image.network(widget.thumb),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              FutureBuilder(
                future: webtoon,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data!.about,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${snapshot.data!.genre} / ${snapshot.data!.age}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black.withOpacity(0.8),
                          ),
                        )
                      ],
                    );
                  }
                  return const Text("...");
                },
              ),
              const SizedBox(
                height: 15,
              ),
              FutureBuilder(
                future: episodes,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        for (var episode in snapshot.data!)
                          Episode(title: episode.title)
                      ],
                    );
                  }
                  return const Text("");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
