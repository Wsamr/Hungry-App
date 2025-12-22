import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/constants/app_colors.dart';

class SliderSpicyCustom extends StatelessWidget {
  const SliderSpicyCustom({super.key, required this.value, this.onChanged});
  final double value;
  final void Function(double)? onChanged;
  String get spicyText {
    if (value <= 0.3) return "Mild";
    if (value <= 0.6) return "Medium";
    if (value <= 0.9) return "Hot";
    return "Extra Hot";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          min: .1,
          max: 1.2,
          value: value,
          label: spicyText,
          onChanged: onChanged,
          activeColor: value <= 0.3
              ? Colors.blue
              : value <= 0.6
              ? AppColors.mainColor
              : value <= 0.8
              ? Colors.orange
              : Colors.red,
          inactiveColor: Colors.grey.shade300,
        ),
        Text(spicyText),
      ],
    );
  }
}
