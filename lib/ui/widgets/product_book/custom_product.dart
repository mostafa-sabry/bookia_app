import 'package:bookia_store/ui/widgets/product_book/custom_button_add_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../const/app_colors.dart';
import '../../../models/Product_book_model.dart';
import '../text_widget_app.dart';

class ProductWidgetBook extends StatelessWidget {
  const ProductWidgetBook({
    super.key,
    required this.product,
  });

  final ProductBookModel product;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
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
            Image(
              image: NetworkImage(product.image),
            ),
            const SizedBox(
              height: 12,
            ),
            TextWidgetApp(
              title: product.name,
              color: AppColors.dark,
              fontSize: 30,
            ),
            TextWidgetApp(
              title: product.category,
              color: AppColors.primary,
              fontSize: 15,
            ),
            const SizedBox(
              height: 22,
            ),
            TextWidgetApp(
              title: product.description,
              color: AppColors.gray,
              fontSize: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidgetApp(
                  title: r'$${product.price}',
                  color: AppColors.gray,
                  fontSize: 24,
                ),
                const CustomAddCart()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
