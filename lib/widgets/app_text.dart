import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  double textSize;
  final String text;
  final Color color;

  AppText(
      {Key? key,
      this.textSize = 16,
      required this.text,
      this.color = Colors.black54})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text, style: TextStyle(
      color: color,
      fontWeight: FontWeight.w300,
      fontSize: textSize
    ),
    );
  }
}
