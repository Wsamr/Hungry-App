import 'package:flutter/material.dart';

abstract class ResponsiveTextSize {
  static double getResponsiveFontSize(
    BuildContext context, {
    required double fontSize,
  }) {
    double scaleFactor = getScaleFactor(context);
    double responsiveSize = scaleFactor * fontSize;
    double lowerFont = fontSize * .8;
    double upperFont = fontSize * 1;
    return responsiveSize.clamp(lowerFont, upperFont);
  }

  static double getScaleFactor(context) {
    var width = MediaQuery.sizeOf(context).width;
    // if (width < 1300) {
    //   return width / 1100;
    // } else {
    //   return width / 1500;
    // }
    if (width < 400) return 0.8; // small phones
    if (width < 800) return 0.9; // normal phones
    if (width < 1200) return 1.0; // tablets
    if (width < 1600) return 1.1; // small desktops
    return 1.2;
  }
}
