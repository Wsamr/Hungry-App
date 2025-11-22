import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/utils/screen.dart';
import 'package:restaurant_app_sonic/features/product/views/widgets/product_option_item_widget.dart';

class ProductOptionsList extends StatelessWidget {
  const ProductOptionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Screen.h * .18,
      child: ListView.separated(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return ProductOptionItemWidget();
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: Screen.w * .1);
        },
      ),
    );
  }
}
