import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/constants/app_images.dart';
import 'package:restaurant_app_sonic/core/utils/screen.dart';
import 'package:restaurant_app_sonic/features/cart/views/widgets/cart_item_details_section.dart';
import 'package:restaurant_app_sonic/features/cart/views/widgets/cart_item_quanity_section.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    this.minusOnTap,
    this.addOnTap,
    this.removeOnTap,
    this.value,
  });
  final void Function()? minusOnTap;
  final void Function()? addOnTap;
  final void Function()? removeOnTap;
  final int? value;
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
            CartItemDetailseSection(
              image: AppImages.testImage,
              title: "Hamburger",
              des: "Veggie Burger",
            ),
            SizedBox(width: Screen.h * .04),
            Expanded(
              child: CartItemQuantitySection(
                removeOnTap: removeOnTap,
                addOnTap: addOnTap,
                minusOnTap: minusOnTap,
                value: value,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
