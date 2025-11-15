import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/constants/app_colors.dart';

class BackgroundPaint extends CustomPainter {
  final double width;
  final double height;
  BackgroundPaint({required this.width, required this.height});
  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()..color = Colors.grey[200]!;
    final paint2 = Paint()..color = AppColors.mainColor;
    canvas.drawCircle(Offset(width * .15, height * .3), width * 1.2, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
