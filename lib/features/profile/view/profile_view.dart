import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/constants/app_colors.dart';
import 'package:restaurant_app_sonic/core/constants/app_images.dart';
import 'package:restaurant_app_sonic/features/profile/view/widgets/custom_image_box.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomImageBox(screenHeight: screenHeight, screenWidth: screenWidth),
        ],
      ),
    );
  }
}
