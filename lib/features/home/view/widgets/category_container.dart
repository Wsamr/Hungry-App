import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/constants/app_colors.dart';
import 'package:restaurant_app_sonic/core/utils/res_text_size.dart';
import 'package:restaurant_app_sonic/core/utils/screen.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({
    super.key,

    required this.category,
    this.onTap,
    this.isSelected = false,
  });

  final String category;
  final void Function()? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: Screen.w * .04,
          vertical: Screen.h * .008,
        ),
        margin: EdgeInsets.only(right: Screen.w * .02),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.mainColor : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          category,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: ResTextSize.getResFontSize(context, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
