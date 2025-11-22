import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/constants/app_colors.dart';
import 'package:restaurant_app_sonic/core/utils/screen.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Screen.h * .13,
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: TabBar(
        indicatorColor: Colors.transparent,
        unselectedLabelColor: Colors.grey,
        labelColor: Colors.white,
        // textScaler: TextScaler.linear(BorderSide.strokeAlignOutside),
        tabs: [
          Tab(icon: Icon(CupertinoIcons.home, size: 30), text: "Home"),
          Tab(icon: Icon(CupertinoIcons.cart, size: 30), text: "Cart"),
          Tab(
            icon: Icon(Icons.local_dining_rounded, size: 30),
            text: "Order history",
          ),
          Tab(
            icon: Icon(CupertinoIcons.profile_circled, size: 30),
            text: "profile",
          ),
        ],
      ),
    );
  }
}
