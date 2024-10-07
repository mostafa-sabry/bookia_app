import 'package:bookia_store/const/app_colors.dart';
import 'package:bookia_store/ui/screens/auth/login_view.dart';
import 'package:bookia_store/ui/screens/auth/register_view.dart';
import 'package:bookia_store/ui/widgets/custom_button_welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/unsplash_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 170,
            ),
            SvgPicture.asset(
              'assets/svgs/logo1.svg',
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Order Your Book Now!',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'DMSerifDisplay',
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomElevatedButtonWidget(
                    title: 'Login',
                    color: AppColors.primary,
                    fontSize: 15,
                    colorSubTitle: Colors.white,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LoginView(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomElevatedButtonWidget(
                    title: 'Register',
                    color: AppColors.background,
                    fontSize: 15,
                    colorSubTitle: AppColors.dark,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => RegisterView(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
