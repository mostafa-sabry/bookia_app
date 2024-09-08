import 'package:bookia_store/consts/app_colors.dart';
import 'package:bookia_store/core/api_services/get_all_book_services.dart';
import 'package:bookia_store/models/book_model.dart';
import 'package:bookia_store/ui/widgets/custom_shop_book_widget.dart';
import 'package:bookia_store/ui/widgets/text_widget_app.dart';
import 'package:flutter/material.dart';

import '../widgets/header_home_widget.dart';
import '../widgets/home_heder_custom_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeadersHomeWidget(),
              const SizedBox(
                height: 30,
              ),
              const HederCustomWidget(),
              const SizedBox(
                height: 20,
              ),
              TextWidgetApp(title: "Popular Books", color: AppColors.dark),
              const SizedBox(
                height: 18,
              ),
              Expanded(
                child: FutureBuilder<List<BookModel>>(
                  future: GetAllBook().getAllBook(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (snapshot.hasData) {
                      List<BookModel> books = snapshot.data!;
                      if (books.isEmpty) {
                        return const Center(child: Text('No data found'));
                      }
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                        ),
                        itemCount: books.length,
                        itemBuilder: (context, index) {
                          return CustomShopBookWidget(
                            book: books[index],
                          );
                        },
                      );
                    } else {
                      return const Center(
                          child: Text('Unexpected error occurred'));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
