import 'package:flutter/material.dart';

class Screen {
  static late double w;
  static late double h;

  static init(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    w = size.width;
    h = size.height;
  }
}
