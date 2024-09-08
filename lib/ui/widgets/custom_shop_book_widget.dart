import 'package:bookia_store/consts/app_colors.dart';
import 'package:bookia_store/models/book_model.dart';
import 'package:bookia_store/ui/widgets/text_widget_app.dart';
import 'package:flutter/material.dart';

class CustomShopBookWidget extends StatelessWidget {
  const CustomShopBookWidget({super.key, required this.book});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      decoration: BoxDecoration(
          color: AppColors.containerShop,
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 110,
            child: Image.network(
              book.image,
            ),
          ),
          TextWidgetApp(
            title: book.title,
            color: AppColors.dark,
            fontSize: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidgetApp(
                title: '${book.price}',
                color: AppColors.dark,
                fontSize: 16,
              ),
              // Spacer(),
              // CustomElevatedButtonWidget(
              //   title: "Buy Now",
              //   color: AppColors.dark,
              //   fontSize: 14,
              //   colorSubTitle: AppColors.background,
              //   onPressed: () {},
              // ),
            ],
          )
        ],
      ),
    );
  }
}
