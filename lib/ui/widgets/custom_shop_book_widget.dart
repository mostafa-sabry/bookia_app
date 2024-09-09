import 'package:bookia_store/const/app_colors.dart';
import 'package:bookia_store/models/book_model.dart';
import 'package:bookia_store/ui/widgets/custom_button.dart';
import 'package:bookia_store/ui/widgets/text_widget_app.dart';
import 'package:flutter/material.dart';

class CustomShopBookWidget extends StatelessWidget {
  const CustomShopBookWidget({
    super.key,
    required this.book,
  });

  final BookModel book;
  // final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      decoration: BoxDecoration(
          color: AppColors.containerShop,
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 100,
            child: Image.network(
              book.image,
            ),
          ),
          TextWidgetApp(
            title: book.name,
            color: AppColors.dark,
            fontSize: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidgetApp(
                  title: '${book.price}',
                  color: AppColors.dark,
                  fontSize: 16,
                ),
                const Spacer(),
                const CustomButton(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
