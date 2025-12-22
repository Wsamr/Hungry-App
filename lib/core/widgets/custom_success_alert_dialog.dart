import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/constants/app_colors.dart';
import 'package:restaurant_app_sonic/core/utils/res_text_size.dart';
import 'package:restaurant_app_sonic/core/utils/screen.dart';
import 'package:restaurant_app_sonic/core/widgets/custom_button_widget.dart';
import 'package:svg_flutter/svg.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.title,
    this.subTitle,
    required this.imagePath,
    this.buttonTitle,
    this.onPressed,
  });
  final String title;
  final String? subTitle;
  final String imagePath;
  final String? buttonTitle;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.symmetric(
        horizontal: Screen.w * .06,
        vertical: Screen.h * .03,
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(imagePath, height: Screen.h * .07),
          SizedBox(height: Screen.h * .01),
          Text(
            title,
            style: TextStyle(
              fontSize: ResTextSize.getResFontSize(context, fontSize: 24),
              fontWeight: FontWeight.bold,
              color: AppColors.mainColor,
            ),
          ),
          SizedBox(height: subTitle != null ? Screen.h * .01 : Screen.h * .012),
          subTitle != null
              ? Text(
                  subTitle!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: ResTextSize.getResFontSize(context, fontSize: 18),
                    color: Colors.grey,
                  ),
                )
              : SizedBox.shrink(),

          SizedBox(height: 20),
          CustomButtonWidget(
            onPressed: onPressed,
            size: Size(double.infinity, Screen.h * .08),
            title: buttonTitle ?? "Go Back",
          ),
        ],
      ),
    );
  }
}
