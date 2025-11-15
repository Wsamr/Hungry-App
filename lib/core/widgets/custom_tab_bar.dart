import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/constants/app_colors.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: TabBar(
        indicatorColor: Colors.transparent,
        unselectedLabelColor: Colors.grey,
        labelColor: Colors.white,
        // textScaler: TextScaler.linear(BorderSide.strokeAlignOutside),
        tabs: [
          Tab(icon: Icon(Icons.home_outlined, size: 30)),
          Tab(icon: Icon(Icons.shopping_cart_outlined, size: 30)),
          Tab(icon: Icon(Icons.chat_bubble_outline, size: 30)),
          Tab(icon: Icon(Icons.person_4_outlined, size: 30)),
        ],
      ),
    );
  }
}
