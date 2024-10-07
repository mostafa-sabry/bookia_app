import 'package:bookia_store/const/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSocialLogin extends StatelessWidget {
  const CustomSocialLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SocialAuth(
          image: 'assets/svgs/facebook_ic.svg',
        ),
        SocialAuth(
          image: 'assets/svgs/google_ic.svg',
        ),
        SocialAuth(image: 'assets/svgs/apple_ic.svg'),
      ],
    );
  }
}

class SocialAuth extends StatelessWidget {
  const SocialAuth({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: 100,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(12),
          backgroundColor: AppColors.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {},
        label: SvgPicture.asset(image),
      ),
    );
  }
}
