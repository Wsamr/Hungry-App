import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/features/home/data/repo/fake_products_repo.dart';
import 'package:restaurant_app_sonic/features/home/view/widgets/product_card_widget.dart';

class ProductsGridList extends StatelessWidget {
  const ProductsGridList({
    super.key,
    required this.widthScreen,
    required this.heightScreen,
  });

  final double widthScreen;
  final double heightScreen;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: .7,
        crossAxisSpacing: widthScreen * .03,
        mainAxisSpacing: heightScreen * .02,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCardWidget(
          productModel: products[index],
          widthScreen: widthScreen,
          heightScreen: heightScreen,
        );
      },
    );
  }
}
