import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/constants/app_colors.dart';
import 'package:restaurant_app_sonic/core/utils/res_text_size.dart';
import 'package:restaurant_app_sonic/core/utils/screen.dart';
import 'package:restaurant_app_sonic/features/home/data/models/product_model.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({super.key, required this.productModel, this.onTap});

  final ProductModel productModel;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        elevation: 5,
        shadowColor: Colors.black45,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Screen.w * .03),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(productModel.image, height: Screen.h * .18),
              Text(
                productModel.title,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: ResTextSize.getResFontSize(context, fontSize: 20),
                ),
              ),
              SizedBox(height: Screen.h * .002),
              Text(
                productModel.description,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: ResTextSize.getResFontSize(context, fontSize: 16),
                ),
              ),
              SizedBox(height: Screen.h * .01),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow),
                  SizedBox(width: Screen.w * .03),
                  Text(
                    productModel.rate,
                    style: TextStyle(
                      fontSize: ResTextSize.getResFontSize(
                        context,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.favorite, color: AppColors.mainColor),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
