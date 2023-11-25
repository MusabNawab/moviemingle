import 'package:flutter/material.dart';

class DateWidget extends StatelessWidget {
  const DateWidget({super.key, required this.premiered, required this.ended});

  final String? premiered;
  final String? ended;

  Widget heading(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            heading("Start Date"),
            Text(
              premiered ?? "Unknown",
              style: const TextStyle(fontSize: 15),
            ),
          ],
        ),
        Column(
          children: [
            heading("End Date"),
            Text(
              premiered == null ? "Unknown" : ended ?? "Ongoing",
              style: const TextStyle(fontSize: 15),
            ),
          ],
        )
      ],
    );
  }
}
