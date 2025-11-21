import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/constants/break_points.dart';

abstract class ResTextSize {
  static double getResFontSize(
    BuildContext context, {
    required double fontSize,
  }) {
    double scaleFactor = getScaleFactor(context);
    double responsiveSize = scaleFactor * fontSize;
    double lowerFont = fontSize * .8;
    double upperFont = fontSize * 1.3;
    return responsiveSize.clamp(lowerFont, upperFont);
  }

  static double getScaleFactor(context) {
    var width = MediaQuery.sizeOf(context).width;
    if (width < Breakpoints.mobile) {
      return width / 400; //small mobile
    } else if (width < Breakpoints.tablet) {
      return width / 500; // large mobile
    } else if (width < Breakpoints.desktop) {
      return width / 800; // tablet
    } else {
      return width / 1200; //desktop
    }
  }
}
