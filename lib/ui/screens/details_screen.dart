import 'package:bookia_store/const/app_colors.dart';
import 'package:bookia_store/cubit/cubit_cart/cubit/addcart_cubit.dart';
import 'package:bookia_store/model/books_model.dart';
import 'package:bookia_store/ui/screens/book_mark_screen..dart';
import 'package:bookia_store/ui/widgets/text_widget_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.book});

  final BooksModel book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const AppBar(),
              Center(
                child: Image.network(
                  book.image,
                  height: 250,
                ),
              ),
              TextWidgetApp(title: book.title, color: AppColors.dark),
              TextWidgetApp(
                title: book.category,
                color: AppColors.primary,
                fontSize: 15,
              ),
              TextWidgetApp(
                title: book.description,
                color: AppColors.gray,
                fontSize: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    book.price,
                    style: TextStyle(color: AppColors.dark, fontSize: 24),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.read<AddcartCubit>().addToCart(book);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('تم إضافة الكتاب إلى السلة بنجاح!'),
                          backgroundColor: Colors.green,
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    child: Container(
                      height: 60,
                      width: 212,
                      decoration: BoxDecoration(
                        color: AppColors.dark,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Add To Cart',
                          style: TextStyle(color: AppColors.background),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: SvgPicture.asset("assets/svgs/arrwo.svg"),
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const WishListScreen();
                  },
                ),
              );
            },
            child: SvgPicture.asset("assets/svgs/bookmark.svg")),
      ],
    );
  }
}
