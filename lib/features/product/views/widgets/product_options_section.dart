import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/utils/res_text_size.dart';
import 'package:restaurant_app_sonic/core/utils/screen.dart';
import 'package:restaurant_app_sonic/features/product/views/widgets/product_options_list.dart';

class ProductOptionsSection extends StatelessWidget {
  const ProductOptionsSection({super.key, required this.optionTitle});
  final String optionTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          optionTitle,
          style: TextStyle(
            color: Colors.black,
            fontSize: ResTextSize.getResFontSize(context, fontSize: 30),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: Screen.h * .02),
        ProductOptionsList(),
      ],
    );
  }
}
