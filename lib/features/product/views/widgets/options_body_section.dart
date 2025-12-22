import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/features/product/views/widgets/product_options_section.dart';

class OptionsBodySection extends StatelessWidget {
  const OptionsBodySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductOptionsSection(
          optionTitle: "Toppings",
          options: [],

          isToppingList: false,
        ),
        ProductOptionsSection(
          optionTitle: "Side options",
          options: [],
          isToppingList: false,
        ),
      ],
    );
  }
}
