import 'package:flutter/material.dart';

import '../../const/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 72,
      decoration: BoxDecoration(
        color: AppColors.dark,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Center(
        child: Text(
          'Buy Now',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
