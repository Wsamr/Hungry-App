import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/features/home/data/models/product_model.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    super.key,
    required this.widthScreen,
    required this.heightScreen,
    required this.productModel,
  });

  final double widthScreen;
  final double heightScreen;
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5,
      shadowColor: Colors.black45,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: widthScreen * .03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(productModel.image, height: heightScreen * .18),
            Text(
              productModel.title,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Text(
              productModel.description,
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow),
                SizedBox(width: widthScreen * .02),
                Text(productModel.rate),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
