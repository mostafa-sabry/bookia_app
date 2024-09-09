import 'package:bookia_store/ui/widgets/product_book/custom_button_add_cart.dart';
import 'package:flutter/material.dart';

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
      child: Container(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Image.network(
              product.image ?? 'https://i.sstatic.net/6M513.png',
            ),
            const SizedBox(height: 12),
            Container(
              child: TextWidgetApp(
                title: product.name ?? "The Republic",
                color: AppColors.dark,
                fontSize: 30,
              ),
            ),
            Container(
              child: TextWidgetApp(
                title: product.category ?? "",
                color: AppColors.primary,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 22),
            TextWidgetApp(
              title: product.description ?? "",
              color: AppColors.gray,
              fontSize: 12,
            ),
            const SizedBox(height: 22),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidgetApp(
                  title: r'$' '${product.price}' ?? "255",
                  color: AppColors.gray,
                  fontSize: 24,
                ),
                const CustomAddCart(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
