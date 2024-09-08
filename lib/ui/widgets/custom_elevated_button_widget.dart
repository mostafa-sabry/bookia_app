import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomElevatedButtonWidget extends StatelessWidget {
  CustomElevatedButtonWidget({
    super.key,
    required this.title,
    required this.color,
    this.fontSize = 15,
    required this.colorSubTitle,
    required this.onPressed,
  });

  final String title;
  final Color color;
  final Color colorSubTitle;
  final fontWeight = 'DMSerifDisplay';
  final double fontSize;
  Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onPressed,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: fontSize,
              color: colorSubTitle,
              fontFamily: 'DMSerifDisplay',
            ),
          ),
        ),
      ),
    );
  }
}
