import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/constants/app_colors.dart';
import 'package:restaurant_app_sonic/core/utils/responsive_text_size.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({super.key, required this.title, this.fontSize});
  final String title;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: AppColors.mainColor,
        fontWeight: FontWeight.bold,
        fontSize: ResponsiveTextSize.getResponsiveFontSize(
          context,
          fontSize: fontSize ?? 40,
        ),
      ),
    );
  }
}
