import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/constants/app_colors.dart';
import 'package:restaurant_app_sonic/core/utils/screen.dart';
import 'package:restaurant_app_sonic/features/home/view/models/user_header_model.dart';
import 'package:restaurant_app_sonic/features/home/view/widgets/user_header_widget.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key, required this.user});
  final UserHeaderModel user;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      flexibleSpace: UserHeaderWidget(user: user),
      toolbarHeight: Screen.h * .1,
      pinned: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
    );
  }
}
