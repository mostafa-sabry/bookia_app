import 'package:flutter/material.dart';
import '../widgets/custom_card_widget.dart';
import '../widgets/header_home_widget.dart';
import '../widgets/home_heder_custom_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadersHomeWidget(),
                SizedBox(height: 20),
                HederCustomWidget(),
                SizedBox(height: 10),
                Text('Popular Books',
                    style: TextStyle(color: Colors.black, fontSize: 24)),
                CustomCardWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
