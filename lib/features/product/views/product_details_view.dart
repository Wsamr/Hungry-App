import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/constants/app_images.dart';
import 'package:restaurant_app_sonic/core/utils/screen.dart';
import 'package:restaurant_app_sonic/core/widgets/bottom_salary_container.dart';
import 'package:restaurant_app_sonic/features/product/views/widgets/product_details_top_section.dart';
import 'package:restaurant_app_sonic/features/product/views/widgets/product_options_section.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: Screen.w * .04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SpicyTopSection(image: AppImages.sandwetchImage),
            SizedBox(height: Screen.h * .02),
            ProductOptionsSection(optionTitle: "Toppings"),
            ProductOptionsSection(optionTitle: "Side options"),
            SizedBox(height: Screen.h * .24),
          ],
        ),
      ),

      bottomSheet: BottomSlaryContainer(),
    );
  }
}
