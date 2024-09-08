import 'package:bookia_store/const/app_colors.dart';
import 'package:bookia_store/ui/widgets/text_widget_app.dart';
import 'package:flutter/material.dart';

class DataReturn extends StatelessWidget {
  const DataReturn({super.key, required this.title, required this.onPressed});

  final String title;

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: onPressed,
        child: TextWidgetApp(
          title: title,
          fontSize: 14,
          color: AppColors.darkGray,
        ),
      ),
    );
  }
}
