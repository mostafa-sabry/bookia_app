import 'package:bookia_store/const/app_colors.dart';
import 'package:bookia_store/cubit/cubit_cart/cubit/addcart_cubit.dart';
import 'package:bookia_store/cubit/cubit_book/cubit_wishlist/cubit/wishlist_cubit.dart';
import 'package:bookia_store/ui/widgets/text_widget_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<WishlistCubit>(context);
    cubit.getWish();

    return BlocConsumer<WishlistCubit, WishlistState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is WishlistLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is WishlistLoaded) {
          return SafeArea(
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    const SizedBox(height: 25),
                    const Text(
                      'Wishlist',
                      style: TextStyle(fontSize: 25),
                    ),
                    const SizedBox(height: 30),
                    Expanded(
                      child: state.books.isEmpty
                          ? Center(
                              child:
                                  SvgPicture.asset("assets/svgs/bookmark.svg"))
                          : ListView.builder(
                              itemCount: state.books.length,
                              itemBuilder: (context, index) {
                                final book = state.books[index];
                                return Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  child: Stack(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.network(
                                            book.image,
                                            width: 116,
                                            height: 150,
                                            fit: BoxFit.cover,
                                          ),
                                          const SizedBox(width: 15),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                TextWidgetApp(
                                                  title: book.title,
                                                  color: AppColors.dark,
                                                  fontSize: 18,
                                                ),
                                                const SizedBox(height: 10),
                                                TextWidgetApp(
                                                  title: book.price,
                                                  color: AppColors.dark,
                                                  fontSize: 16,
                                                ),
                                                const SizedBox(height: 15),
                                                GestureDetector(
                                                  onTap: () {
                                                    context
                                                        .read<AddcartCubit>()
                                                        .addToCart(book);
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      const SnackBar(
                                                        content: Text(
                                                          'تم إضافة الكتاب إلى السلة بنجاح',
                                                        ),
                                                        backgroundColor:
                                                            Colors.green,
                                                        duration: Duration(
                                                            seconds: 2),
                                                      ),
                                                    );
                                                  },
                                                  child: Container(
                                                    height: 40,
                                                    width: 181,
                                                    decoration: BoxDecoration(
                                                      color: AppColors.primary,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        'Add To Cart',
                                                        style: TextStyle(
                                                          color: AppColors
                                                              .background,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: IconButton(
                                          onPressed: () {
                                            context
                                                .read<WishlistCubit>()
                                                .removeFromWishlist(book);
                                          },
                                          icon: const Icon(
                                            Icons.delete_forever,
                                            color: Colors.red,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (state is WishlistError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('No Data Available'));
        }
      },
    );
  }
}
