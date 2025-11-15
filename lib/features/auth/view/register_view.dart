import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/constants/app_colors.dart';
import 'package:restaurant_app_sonic/features/auth/view/forms/register_form.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: AppColors.mainColor,
          resizeToAvoidBottomInset: true,
          body: CustomPaint(
            painter: BackgroundPaint1(height: screenHeight, width: screenWidth),
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * .04,
                    right: screenWidth * .04,
                    top: screenHeight * .08,
                  ),
                  child: const RegisterForm(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BackgroundPaint1 extends CustomPainter {
  final double width;
  final double height;
  BackgroundPaint1({required this.width, required this.height});
  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()..color = Colors.grey[200]!;
    final paint2 = Paint()..color = AppColors.mainColor;
    canvas.drawCircle(Offset(width * .15, height * .3), width * 1.2, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
