import 'package:bookia_store/const/app_colors.dart';
import 'package:bookia_store/core/api_services/show_book_services.dart';
import 'package:bookia_store/ui/widgets/custom_button.dart';
import 'package:bookia_store/ui/widgets/text_widget_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../const/arrwo_back_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen({super.key, required this.productId});
  final int productId;
  AllShowBookServices allShowBookServices = AllShowBookServices();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset("assets/svgs/arrwo.svg"),
                  SvgPicture.asset("assets/svgs/bookmark.svg"),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Image(
                image: AssetImage("assets/images/dec_book.png"),
              ),
              const SizedBox(
                height: 12,
              ),
              TextWidgetApp(
                title: "Black Heart",
                color: AppColors.dark,
                fontSize: 30,
              ),
              TextWidgetApp(
                title: "Broché",
                color: AppColors.primary,
                fontSize: 15,
              ),
              const SizedBox(
                height: 22,
              ),
              TextWidgetApp(
                title: "Auteur: Margot Atwood",
                color: AppColors.gray,
                fontSize: 12,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidgetApp(
                      title: r'$' '295',
                      color: AppColors.gray,
                      fontSize: 24,
                    ),
                    CustomButton(
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
