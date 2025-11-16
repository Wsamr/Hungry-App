import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/constants/app_colors.dart';
import 'package:restaurant_app_sonic/core/constants/app_images.dart';

class CustomImageBox extends StatelessWidget {
  const CustomImageBox({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    this.image,
    this.onTap,
  });

  final double screenHeight;
  final double screenWidth;
  final String? image;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: screenHeight * .2,
          width: screenWidth * .4,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.mainColor, width: 8),
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(image ?? AppImages.onboardingImg1),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              height: screenHeight * .05,
              width: screenWidth * .1,
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                shape: BoxShape.rectangle,
              ),
              child: Icon(Icons.add, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
