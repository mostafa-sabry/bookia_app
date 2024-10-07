import 'package:bookia_store/cubit/book_cubit/books_cubit.dart';
import 'package:bookia_store/cubit/cubit_book/cubit_wishlist/cubit/wishlist_cubit.dart';
import 'package:bookia_store/cubit/cubit_cart/cubit/addcart_cubit.dart';
import 'package:bookia_store/cubit/order/cubit/order_cubit.dart';

import 'package:bookia_store/cubit/user_cubit/cubit/user_cubit.dart';
import 'package:bookia_store/firebase_options.dart';
import 'package:bookia_store/repositories/get_books_repo.dart';
import 'package:bookia_store/repositories/get_order.dart';
import 'package:bookia_store/repositories/user_repositories.dart';
import 'package:bookia_store/ui/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserCubit(UserRepositories()),
        ),
        BlocProvider(
          create: (context) => BooksCubit(GetBooksRepositories())..getBooks(),
        ),
        BlocProvider(
          create: (context) => WishlistCubit()..getWish(),
        ),
        BlocProvider(
          create: (context) => AddcartCubit()..getAddCart(),
        ),
        BlocProvider(
          create: (context) => OrderCubit(GetOrderRepo()),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WelcomeScreen(),
      ),
    );
  }
}
