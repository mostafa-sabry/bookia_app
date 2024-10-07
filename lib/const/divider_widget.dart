import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 22),
      child: Row(
        children: [
          SizedBox(
            width: 110,
            child: Divider(
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
