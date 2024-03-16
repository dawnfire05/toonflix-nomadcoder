import 'package:flutter/material.dart';

class Episode extends StatelessWidget {
  final String title;
  const Episode({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.8),
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.7),
            offset: const Offset(3, 3),
            blurStyle: BlurStyle.outer,
            blurRadius: 3,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
