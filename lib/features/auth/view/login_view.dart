// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/constants/app_colors.dart';
import 'package:restaurant_app_sonic/features/auth/view/forms/login_form.dart';
import 'package:restaurant_app_sonic/features/auth/view/widgets/background_paint.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.mainColor,
        resizeToAvoidBottomInset: true,
        body: CustomPaint(
          painter: BackgroundPaint(height: screenHeight, width: screenWidth),
          child: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.only(
                  left: screenWidth * .04,
                  right: screenWidth * .04,
                  top: screenHeight * .1,
                ),
                child: const LoginForm(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
