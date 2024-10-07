import 'package:bookia_store/const/app_colors.dart';
import 'package:bookia_store/cubit/cubit_cart/cubit/addcart_cubit.dart';
import 'package:bookia_store/ui/screens/checkout_screen.dart';
import 'package:bookia_store/ui/widgets/custom_button_welcome.dart';
import 'package:bookia_store/ui/widgets/text_widget_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AddcartCubit>(context);
    cubit.getAddCart();

    return BlocConsumer<AddcartCubit, AddcartState>(
      listener: (context, state) {
        if (state is AddcartError) {
          // Uncomment this if you want to show a snackbar for errors
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('حدث خطأ: ${state.errorMessage}'),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 2),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is AddcartLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is AddcartLoaded) {
          return SafeArea(
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    const SizedBox(height: 25),
                    const Text(
                      'Cart',
                      style: TextStyle(fontSize: 25),
                    ),
                    const SizedBox(height: 30),
                    Expanded(
                      child: state.addCarts.isEmpty
                          ? Center(
                              child:
                                  SvgPicture.asset("assets/svgs/category.svg"))
                          : ListView.builder(
                              itemCount: state.addCarts.length,
                              itemBuilder: (context, index) {
                                final cart = state.addCarts[index];
                                return Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  child: Stack(
                                    children: [
                                      Row(
                                        children: [
                                          Image.network(
                                            cart.image,
                                            width: 116,
                                            // fit: BoxFit.fill,
                                          ),
                                          const SizedBox(width: 15),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                TextWidgetApp(
                                                  title: cart.title,
                                                  color: AppColors.dark,
                                                  fontSize: 18,
                                                ),
                                                TextWidgetApp(
                                                  title: cart.price,
                                                  color: AppColors.dark,
                                                  fontSize: 16,
                                                ),
                                                const SizedBox(height: 15),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    IconButton(
                                                      onPressed: () {
                                                        // context
                                                        //     .read<AddcartCubit>()
                                                        //     .decreaseQuantity(cart);
                                                      },
                                                      icon: Icon(
                                                        Icons.remove,
                                                        color:
                                                            AppColors.primary,
                                                        size: 30,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    Text(
                                                      '01',
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        color: AppColors.dark,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    IconButton(
                                                      onPressed: () {},
                                                      icon: Icon(
                                                        Icons.add,
                                                        color:
                                                            AppColors.primary,
                                                        size: 30,
                                                      ),
                                                    ),
                                                  ],
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
                                                .read<AddcartCubit>()
                                                .removeCart(cart);
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
                    state.addCarts.isNotEmpty
                        ? CustomElevatedButtonWidget(
                            title: 'Checkout',
                            color: AppColors.primary,
                            colorSubTitle: AppColors.background,
                            onPressed: () {
                              // Navigate to checkout screen here
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CheckoutScreen(),
                                ),
                              );
                            },
                          )
                        : const SizedBox.shrink(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
        } else if (state is AddcartError) {
          return Center(child: Text(state.errorMessage));
        } else {
          return const Center(child: Text('No Data Available'));
        }
      },
    );
  }
}
