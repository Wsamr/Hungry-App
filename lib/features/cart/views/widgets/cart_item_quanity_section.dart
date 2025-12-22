import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/constants/app_colors.dart';
import 'package:restaurant_app_sonic/core/utils/res_text_size.dart';
import 'package:restaurant_app_sonic/core/utils/screen.dart';
import 'package:restaurant_app_sonic/core/widgets/custom_button_widget.dart';
import 'package:restaurant_app_sonic/features/cart/data/models/cart_item_model.dart';

class RemoveSection extends StatelessWidget {
  const RemoveSection({
    super.key,
    this.removeOnTap,
    required this.cartItemModel,
  });

  final void Function()? removeOnTap;
  final CartItemModel cartItemModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,

      spacing: Screen.h * .02,
      children: [
        Material(
          shadowColor: Colors.black,
          elevation: 6,
          shape: CircleBorder(),
          child: CircleAvatar(
            backgroundColor: Colors.red,
            child: IconButton(
              onPressed: removeOnTap,
              icon: Icon(Icons.delete, color: Colors.white),
            ),
          ),
        ),
        Text(
          "${double.parse(cartItemModel.price) * cartItemModel.quantity}\$",
          style: TextStyle(
            color: AppColors.mainColor,
            fontSize: ResTextSize.getResFontSize(context, fontSize: 18),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
