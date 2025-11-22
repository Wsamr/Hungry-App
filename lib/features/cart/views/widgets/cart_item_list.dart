import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/utils/screen.dart';
import 'package:restaurant_app_sonic/features/cart/views/cart_view.dart';
import 'package:restaurant_app_sonic/features/cart/views/widgets/cart_item_widget.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Screen.w * .04),
      child: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) {
          return CartItemWidget();
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: Screen.h * .03);
        },
      ),
    );
  }
}
