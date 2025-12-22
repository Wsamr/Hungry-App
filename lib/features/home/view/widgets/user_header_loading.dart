import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/utils/screen.dart';
import 'package:restaurant_app_sonic/features/home/data/repo/fake_repo.dart';
import 'package:restaurant_app_sonic/features/home/view/widgets/user_header_widget.dart';
import 'package:shimmer/shimmer.dart';

class UserHeaderLoadingSliver extends StatelessWidget {
  const UserHeaderLoadingSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      flexibleSpace: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: UserHeaderWidget(user: user),
      ),
      toolbarHeight: Screen.h * .1,
      pinned: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
    );
  }
}
