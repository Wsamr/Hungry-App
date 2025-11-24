import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/constants/app_images.dart';
import 'package:restaurant_app_sonic/core/utils/res_text_size.dart';
import 'package:restaurant_app_sonic/core/utils/screen.dart';

class ProductOptionItemWidget extends StatelessWidget {
  const ProductOptionItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: Screen.h * .15,
          width: Screen.w * .3,
          decoration: BoxDecoration(
            color: Color(0xff3C2F2F),
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  spreadRadius: 6,
                  blurRadius: 8,
                ),
              ],
            ),
            child: Image.asset(AppImages.tomatoImage, height: Screen.h * .07),
          ),
        ),
        Positioned(
          bottom: Screen.h * .05,
          left: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Screen.w * .05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tomato",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ResTextSize.getResFontSize(context, fontSize: 14),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: Screen.w * .05,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
