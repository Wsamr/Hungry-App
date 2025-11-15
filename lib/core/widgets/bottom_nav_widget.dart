import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/widgets/custom_tab_bar.dart';
import 'package:restaurant_app_sonic/features/home/view/home_view.dart';
import 'package:restaurant_app_sonic/features/profile/view/profile_view.dart';

class BottomNavWidget extends StatelessWidget {
  BottomNavWidget({super.key});
  final List<Widget> screens = [
    HomeView(),
    Scaffold(),
    Scaffold(),
    ProfileView(),
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: screens.length,
      child: Scaffold(
        bottomNavigationBar: CustomTabBar(),
        body: TabBarView(children: screens),
      ),
    );
  }
}

// SvgPicture.asset(AppIcons.homeIcon),
//           Icon(Icons.home),
//           SvgPicture.asset(AppIcons.commentIcon),
//           SvgPicture.asset(AppIcons.userIcon),
