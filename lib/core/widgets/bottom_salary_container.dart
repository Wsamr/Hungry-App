import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/constants/app_colors.dart';
import 'package:restaurant_app_sonic/core/utils/res_text_size.dart';
import 'package:restaurant_app_sonic/core/utils/screen.dart';
import 'package:restaurant_app_sonic/core/widgets/custom_button_container.dart';

class BottomSlaryContainer extends StatelessWidget {
  const BottomSlaryContainer({super.key, this.buttonName, this.onTap});
  final String? buttonName;
  final void Function()? onTap;
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
                Text(
                  "Total",
                  style: TextStyle(
                    fontSize: ResTextSize.getResFontSize(context, fontSize: 24),
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                // SizedBox(height: Screen.h * .014),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: ResTextSize.getResFontSize(
                        context,
                        fontSize: 36,
                      ),
                    ),
                    children: [
                      TextSpan(
                        text: "\$",
                        style: TextStyle(color: AppColors.mainColor),
                      ),
                      TextSpan(text: "18.19"),
                    ],
                  ),
                ),
              ],
            ),
            CustomButtonContainer(
              title: buttonName ?? "Add To Cart",
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }
}
