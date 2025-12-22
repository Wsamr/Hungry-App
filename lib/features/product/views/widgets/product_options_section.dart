import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/models/option_model.dart';
import 'package:restaurant_app_sonic/core/utils/res_text_size.dart';
import 'package:restaurant_app_sonic/core/utils/screen.dart';
import 'package:restaurant_app_sonic/features/product/views/widgets/product_options_list.dart';

class ProductOptionsSection extends StatelessWidget {
  const ProductOptionsSection({
    super.key,
    required this.optionTitle,
    required this.options,
    required this.isToppingList,
  });
  final String optionTitle;
  final List<OptionModel> options;
  final bool isToppingList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            optionTitle,
            style: TextStyle(
              color: Colors.black,
              fontSize: ResTextSize.getResFontSize(context, fontSize: 26),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: Screen.h * .02),
          ProductOptionsList(options: options, isToppingList: isToppingList),
        ],
      ),
    );
  }
}
