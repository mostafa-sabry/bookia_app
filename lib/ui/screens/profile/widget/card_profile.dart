import 'package:flutter/material.dart';

class CardProfleWidget extends StatelessWidget {
  const CardProfleWidget({
    super.key,
    required this.title,
    required this.color,
  });

  final String title;
  final double fontSize = 18;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(10),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
            color: color,
          ),
        ),
      ),
    );
  }
}
