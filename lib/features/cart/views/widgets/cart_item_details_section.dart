import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/utils/screen.dart';

class CartItemDetailseSection extends StatelessWidget {
  const CartItemDetailseSection({
    super.key,
    required this.image,
    required this.title,
    required this.des,
  });
  final String image;
  final String title;
  final String des;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image, height: Screen.h * .1, fit: BoxFit.cover),
        Text(title, style: TextStyle(fontWeight: FontWeight.w600)),
        Text(des, style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}
