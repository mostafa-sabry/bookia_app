import 'package:bookia_store/const/app_colors.dart';
import 'package:bookia_store/ui/nav_bar/bottom_nav_bar.dart';
import 'package:bookia_store/ui/widgets/custom_button_welcome.dart';
import 'package:flutter/material.dart';

class OrderComplete extends StatelessWidget {
  const OrderComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage(
              'assets/images/sucss.png',
            ),
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Congratulations!!!',
            style: TextStyle(fontSize: 32),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Your order will be delivered soon.Thank you for choosing our app!',
            style: TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 50,
          ),
          CustomElevatedButtonWidget(
              title: 'Back  To Home ',
              color: AppColors.primary,
              colorSubTitle: AppColors.background,
              onPressed: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BottomNavBar(),
                  ),
                );
              }),
          const SizedBox(
            height: 66,
          ),
        ],
      ),
    );
  }
}
