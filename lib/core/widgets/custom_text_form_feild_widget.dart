import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/constants/app_colors.dart';

class CustomTextFormFelidWidget extends StatelessWidget {
  CustomTextFormFelidWidget({
    super.key,
    this.controller,
    this.validator,
    this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    this.onChanged,
    this.suffixIcon,
  });
  TextEditingController? controller;
  String? Function(String?)? validator;
  String? hintText;
  final Widget? prefixIcon;
  void Function(String)? onChanged;
  bool obscureText;
  Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: BorderSide(color: AppColors.mainColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: BorderSide(color: Colors.orange, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Color(0xff6E6A7C),
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
