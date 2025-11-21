import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/constants/app_colors.dart';
import 'package:restaurant_app_sonic/core/utils/res_text_size.dart';

class CustomAuthRichTextWidget extends StatelessWidget {
  const CustomAuthRichTextWidget({
    super.key,
    required this.hyperText,
    required this.mainText,
    this.onTap,
  });
  final String mainText;
  final String hyperText;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Don’t have an account? Register
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: mainText),
                TextSpan(
                  text: hyperText,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: ResTextSize.getResFontSize(context, fontSize: 18),
                    color: AppColors.mainColor,
                  ),
                ),
              ],
              style: TextStyle(
                color: Color(0xff6E6A7C),
                fontSize: ResTextSize.getResFontSize(context, fontSize: 16),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
