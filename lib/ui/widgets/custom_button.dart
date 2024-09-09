import 'package:flutter/material.dart';

import '../../const/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
  });
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }
}
