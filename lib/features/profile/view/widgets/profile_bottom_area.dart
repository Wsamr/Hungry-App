import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/widgets/custom_button_widget.dart';

class ProfileBottomArea extends StatelessWidget {
  const ProfileBottomArea({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomButtonWidget(
            title: "Edit Profile",
            size: Size(screenWidth * .45, screenHeight * .1),
            onPressed: () {},
          ),
          CustomButtonWidget(
            title: "Log out",
            size: Size(screenWidth * .45, screenHeight * .1),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
