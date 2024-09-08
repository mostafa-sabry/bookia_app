import 'package:bookia_store/const/app_colors.dart';
import 'package:bookia_store/ui/screens/category_screen.dart';
import 'package:bookia_store/ui/screens/home_screen.dart';
import 'package:bookia_store/ui/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../screens/book_mark_screen..dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> screens = [
    const HomeScreen(),
    const BookMarkScreen(),
    const CategoryScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: screens,
      items: [
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset('assets/svgs/home.svg'),
          iconSize: 99,
          title: 'Home',
          activeColorPrimary: AppColors.primary,
          inactiveColorPrimary: AppColors.gray,
        ),
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset('assets/svgs/bookmark.svg'),
          title: 'Book',
          activeColorPrimary: AppColors.primary,
          inactiveColorPrimary: AppColors.gray,
        ),
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset('assets/svgs/category.svg'),
          title: 'Category',
          activeColorPrimary: AppColors.primary,
          inactiveColorPrimary: AppColors.gray,
        ),
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset('assets/svgs/profile.svg'),
          title: 'Profile',
          activeColorPrimary: AppColors.primary,
          inactiveColorPrimary: AppColors.gray,
        ),
      ],
    );
  }
}
