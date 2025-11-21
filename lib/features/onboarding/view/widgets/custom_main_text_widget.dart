import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/constants/app_colors.dart';
import 'package:restaurant_app_sonic/core/utils/res_text_size.dart';

class CustomMainTextWidget extends StatelessWidget {
  const CustomMainTextWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: AppColors.mainColor,
        fontWeight: FontWeight.bold,
        fontSize: ResTextSize.getResFontSize(context, fontSize: 32),
      ),
    );
  }
}
