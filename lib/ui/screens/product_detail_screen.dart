import 'package:bookia_store/core/api_services/show_book_services.dart';
import 'package:bookia_store/models/Product_book_model.dart';
import 'package:flutter/material.dart';

import '../widgets/product_book/custom_product.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen({super.key, required this.productId});
  final int productId;
  AllShowBookServices allShowBookServices = AllShowBookServices();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ProductBookModel>(
      future: allShowBookServices.getShowBook(productId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return const Center(child: Text('No data available'));
        } else {
          final product = snapshot.data!;
          return ProductWidgetBook(
            product: product,
          );
        }
      },
    );
  }
}
