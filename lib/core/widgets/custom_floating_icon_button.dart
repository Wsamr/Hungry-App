import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/constants/app_colors.dart';

class CustomFloatingIconButton extends StatelessWidget {
  const CustomFloatingIconButton({
    super.key,
    required this.heroTag,
    this.onPressed,
    required this.iconData,
  });
  final String heroTag;
  final void Function()? onPressed;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: heroTag,
      onPressed: onPressed,
      backgroundColor: AppColors.mainColor,
      child: Icon(iconData, color: Colors.white),
    );
  }
}
