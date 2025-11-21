import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/utils/res_text_size.dart';

class CustomSubTextWidget extends StatelessWidget {
  const CustomSubTextWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: ResTextSize.getResFontSize(context, fontSize: 22),
      ),
    );
  }
}
