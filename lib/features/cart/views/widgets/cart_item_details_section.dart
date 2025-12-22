import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/constants/app_colors.dart';
import 'package:restaurant_app_sonic/core/utils/screen.dart';
import 'package:restaurant_app_sonic/features/cart/data/models/cart_item_model.dart';

class CartItemDetailseSection extends StatelessWidget {
  const CartItemDetailseSection({super.key, required this.cartItemModel});
  final CartItemModel cartItemModel;

  @override
  Widget build(BuildContext context) {
    final titles = cartItemModel.name.split(" ");
    return Row(
      children: [
        Image.network(
          cartItemModel.image,
          height: Screen.h * .1,
          fit: BoxFit.cover,
        ),
        SizedBox(width: Screen.w * .03),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(titles[0], style: TextStyle(fontWeight: FontWeight.w600)),
            Text(
              titles.getRange(1, titles.length).join(" "),
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: Screen.h * .01),
            Row(
              children: [
                Text(
                  "Quantity: ${cartItemModel.quantity}",
                  style: TextStyle(fontSize: 14, color: AppColors.mainColor),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
