import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/utils/res_text_size.dart';
import 'package:restaurant_app_sonic/core/utils/screen.dart';
import 'package:restaurant_app_sonic/core/widgets/custom_button_widget.dart';
import 'package:restaurant_app_sonic/features/cart/views/widgets/custom_circle_icon_button.dart';

class CartItemQuantitySection extends StatelessWidget {
  const CartItemQuantitySection({
    super.key,
    this.removeOnTap,
    this.addOnTap,
    this.value = 1,
    this.minusOnTap,
  });
  final void Function()? minusOnTap;
  final void Function()? addOnTap;
  final void Function()? removeOnTap;
  final int? value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomCircleIconButton(iconData: Icons.add, onTap: addOnTap),
            Text(
              value.toString(),
              style: TextStyle(
                fontSize: ResTextSize.getResFontSize(context, fontSize: 16),
                fontWeight: FontWeight.bold,
              ),
            ),
            CustomCircleIconButton(onTap: minusOnTap, iconData: Icons.remove),
          ],
        ),
        SizedBox(height: Screen.h * .02),
        CustomButtonWidget(
          title: "Remove",
          size: Size(double.infinity, Screen.h * .05),
          onPressed: removeOnTap,
        ),
      ],
    );
  }
}
