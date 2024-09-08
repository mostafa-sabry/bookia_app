import 'package:bookia_store/consts/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ArrwoBackWidget extends StatelessWidget {
const  ArrwoBackWidget({super.key, required this.onPressed});

final  Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 41,
        width: 41,
        margin: const EdgeInsets.symmetric(vertical: 30),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: IconButton(
          onPressed: onPressed,
          icon: SvgPicture.asset(
            'assets/svgs/arrwo.svg',
          ),
        ),
      ),
    );
  }
}
