import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/constants/app_colors.dart';
import 'package:restaurant_app_sonic/core/utils/res_text_size.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.title,
    this.onPressed,
    required this.size,
  });
  final String title;
  final void Function()? onPressed;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,

      style: ElevatedButton.styleFrom(
        fixedSize: Size(size.width, size.height),
        backgroundColor: AppColors.mainColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: ResTextSize.getResFontSize(context, fontSize: 24),
          ),
        ),
      ),
    );
  }
}
