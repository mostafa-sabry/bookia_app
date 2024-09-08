import 'package:flutter/material.dart';

class TextWidgetApp extends StatelessWidget {
  const TextWidgetApp({
    super.key,
    required this.title,
    this.fontSize = 25,
    this.fontFamily = 'DMSerifDisplay',
    required this.color,
    this.textAlign = TextAlign.left,
  });

  final String title;
  final double fontSize;
  final String fontFamily;
  final Color color;
  final TextAlign textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontFamily: fontFamily,
      ),
    );
  }
}
