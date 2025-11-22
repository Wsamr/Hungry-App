import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/constants/app_colors.dart';

class SliderSpicyCustom extends StatelessWidget {
  const SliderSpicyCustom({super.key, required this.value, this.onChanged});
  final double value;
  final void Function(double)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Slider(
      min: 0,
      max: 1,
      value: value,
      onChanged: onChanged,
      activeColor: AppColors.mainColor,
      inactiveColor: Colors.grey.shade300,
    );
  }
}
