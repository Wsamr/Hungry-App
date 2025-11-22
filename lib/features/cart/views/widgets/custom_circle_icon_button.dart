import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/constants/app_colors.dart';

class CustomCircleIconButton extends StatelessWidget {
  const CustomCircleIconButton({super.key, this.onTap, required this.iconData});
  final void Function()? onTap;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: AppColors.mainColor,
        child: Icon(iconData, color: Colors.white),
      ),
    );
  }
}
