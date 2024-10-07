import 'package:bookia_store/ui/screens/profile/my_oeder.dart';
import 'package:bookia_store/ui/screens/profile/widget/avtar.dart';
import 'package:bookia_store/ui/screens/profile/widget/card_profile.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView(
              children: [
                const HedersAvatar(
                  name: 'Mostafa Mahfouz',
                  email: 'mostafa@eraasoft.com',
                ),
                const SizedBox(
                  height: 35,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyOrder()));
                  },
                  child: const CardProfleWidget(
                    title: 'My Orders',
                    color: Color(0xff606060),
                  ),
                ),
                const CardProfleWidget(
                  title: 'Edit Profile',
                  color: Color(0xff606060),
                ),
                const CardProfleWidget(
                  title: 'Reset Password',
                  color: Color(0xff606060),
                ),
                const CardProfleWidget(
                  title: 'FAQ',
                  color: Color(0xff606060),
                ),
                const CardProfleWidget(
                  title: 'Contact Us',
                  color: Color(0xff606060),
                ),
                const CardProfleWidget(
                  title: 'Privacy & Terms',
                  color: Color(0xff606060),
                ),
              ],
            )),
      ),
    );
  }
}
