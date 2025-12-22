import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/constants/app_colors.dart';
import 'package:restaurant_app_sonic/core/utils/res_text_size.dart';
import 'package:restaurant_app_sonic/core/utils/screen.dart';
import 'package:restaurant_app_sonic/core/widgets/custom_button_container.dart';

class BottomSalaryContainer extends StatelessWidget {
  const BottomSalaryContainer({
    super.key,
    this.buttonName,
    this.onTap,
    this.salary,
    required this.isLoading,
  });
  final String? buttonName;
  final String? salary;
  final void Function()? onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: Screen.h * .13,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Screen.w * .04),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: ResTextSize.getResFontSize(
                        context,
                        fontSize: 28,
                      ),
                    ),
                    children: [
                      TextSpan(
                        text: "\$",
                        style: TextStyle(color: AppColors.mainColor),
                      ),
                      TextSpan(text: salary ?? "18.19"),
                    ],
                  ),
                ),
              ],
            ),
            CustomButtonContainer(
              isLoading: isLoading,
              title: buttonName ?? "Add To Cart",
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }
}
