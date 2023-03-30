import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  MyBottomNavBar({super.key, required this.onTabChange});

  void Function(int)? onTabChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24),
      child: GNav(
        onTabChange:(value) => onTabChange!(value),
        color: Colors.grey[400],
        mainAxisAlignment: MainAxisAlignment.center,
        activeColor: Colors.grey[700],
        tabBackgroundColor: Colors.grey.shade300,
        tabBorderRadius: 24,
        tabActiveBorder: Border.all(color: Colors.white),
        gap: 8,
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Shop',
            margin: EdgeInsets.all(8),
          ),
          GButton(
            icon: Icons.shopping_bag_outlined,
            text: 'Cart',
            margin: EdgeInsets.all(8),
          ),
        ]),
    );
  }
}