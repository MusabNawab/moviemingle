import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      TextSpan(
        text: value,
        style: const TextStyle(fontSize: 16),
      ),
    ]));
  }
}
