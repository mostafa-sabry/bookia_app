import 'package:bookia_store/ui/widgets/text_widget_app.dart';
import 'package:flutter/material.dart';

class HederCustomWidget extends StatelessWidget {
  const HederCustomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 180,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            image: DecorationImage(
              image: AssetImage("assets/images/back_ground_book.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: const TextWidgetApp(
              title:
                  "Find out the best books to read\nwhen you don’t even know what\nto read!!!",
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
