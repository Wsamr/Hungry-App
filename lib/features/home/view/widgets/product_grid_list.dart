import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/constants/route_names.dart';
import 'package:restaurant_app_sonic/core/utils/screen.dart';
import 'package:restaurant_app_sonic/features/home/data/models/product_model.dart';
import 'package:restaurant_app_sonic/features/home/view/widgets/product_card_widget.dart';

class ProductsGridList extends StatelessWidget {
  const ProductsGridList({Key? key, required this.products}) : super(key: key);
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: Screen.w * .03),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .7,
          crossAxisSpacing: Screen.w * .03,
          mainAxisSpacing: Screen.h * .02,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCardWidget(
            productModel: products[index],
            onTap: () {
              Navigator.pushNamed(
                context,
                RouteNames.productDetailsView,
                arguments: products[index],
              );
            },
          );
        },
      ),
    );
  }
}
