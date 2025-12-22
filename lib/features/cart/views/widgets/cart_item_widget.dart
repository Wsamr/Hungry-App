import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/utils/screen.dart';
import 'package:restaurant_app_sonic/features/cart/data/models/cart_item_model.dart';
import 'package:restaurant_app_sonic/features/cart/views/widgets/cart_item_details_section.dart';
import 'package:restaurant_app_sonic/features/cart/views/widgets/cart_item_quanity_section.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    this.minusOnTap,
    this.addOnTap,
    this.removeOnTap,
    this.value,
    required this.cartItemModel,
  });
  final void Function()? minusOnTap;
  final void Function()? addOnTap;
  final void Function()? removeOnTap;
  final int? value;
  final CartItemModel cartItemModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Screen.w * .04,
          vertical: Screen.h * .02,
        ),
        child: Row(
          children: [
            CartItemDetailseSection(cartItemModel: cartItemModel),
            Expanded(
              child: RemoveSection(
                cartItemModel: cartItemModel,
                removeOnTap: removeOnTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
