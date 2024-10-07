import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    required this.title,
    required this.color,
    required this.background,
  });
  final Function()? onTap;
  final String title;
  final Color color;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 72,
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: color),
          ),
        ),
      ),
    );
  }
}
