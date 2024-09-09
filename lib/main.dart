import 'package:bookia_store/ui/nav_bar/bottom_nav_bar.dart';
import 'package:bookia_store/ui/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductDetailScreen(
        productId: 1,
      ),
    );
  }
}
