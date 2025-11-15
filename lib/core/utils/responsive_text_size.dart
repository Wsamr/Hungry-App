import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/constants/break_points.dart';

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
    if (width < Breakpoints.tablet) {
      return width / 500;
    } else if (width < Breakpoints.desktop) {
      return width / 700;
    } else {
      return width / 1100;
    }
  }
}
