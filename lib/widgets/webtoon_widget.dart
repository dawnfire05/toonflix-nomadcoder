import 'package:flutter/material.dart';
import 'package:toonflix/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;
  const Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) =>
                DeatilScreen(title: title, thumb: thumb, id: id),
          ),
        );
      },
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Hero(
            tag: id,
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
              child: Image.network(thumb),
            ),
          ),
        ],
      ),
    );
  }
}
