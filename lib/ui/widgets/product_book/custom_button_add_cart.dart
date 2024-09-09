import 'package:flutter/material.dart';

import '../../../const/app_colors.dart';

class CustomAddCart extends StatelessWidget {
  const CustomAddCart({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 56,
        width: 212,
        decoration: BoxDecoration(
          color: AppColors.dark,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Text(
            'Add To Cart',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
