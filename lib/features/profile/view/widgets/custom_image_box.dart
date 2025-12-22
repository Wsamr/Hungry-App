import 'package:flutter/material.dart';

import 'package:restaurant_app_sonic/core/constants/app_colors.dart';

class CustomImageBox extends StatelessWidget {
  const CustomImageBox({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
    required this.image,
    this.onTap,
  }) : super(key: key);

  final double screenHeight;
  final double screenWidth;

  final void Function()? onTap;
  final ImageProvider<Object> image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: screenHeight * .15,
          width: screenWidth * .3,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.mainColor, width: 8),
            shape: BoxShape.circle,
            image: DecorationImage(image: image, fit: BoxFit.cover),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              height: screenHeight * .05,
              width: screenWidth * .1,
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.add, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
