// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:restaurant_app_sonic/core/constants/app_colors.dart';
import 'package:restaurant_app_sonic/core/constants/app_images.dart';

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
          height: screenHeight * .2,
          width: screenWidth * .4,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.mainColor, width: 8),
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image: image, fit: BoxFit.cover),
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
