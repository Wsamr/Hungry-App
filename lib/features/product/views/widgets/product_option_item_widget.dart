import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/constants/app_images.dart';
import 'package:restaurant_app_sonic/core/models/option_model.dart';
import 'package:restaurant_app_sonic/core/utils/res_text_size.dart';
import 'package:restaurant_app_sonic/core/utils/screen.dart';

class ProductOptionItemWidget extends StatelessWidget {
  const ProductOptionItemWidget({
    super.key,
    required this.optionModel,
    this.addOption,
    this.isSelected = false,
  });
  final OptionModel optionModel;
  final void Function()? addOption;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: Screen.h * .12,
          width: Screen.w * .25,
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
            child: optionModel.image != null && optionModel.image!.isNotEmpty
                ? FadeInImage.assetNetwork(
                    placeholder: AppImages.sandyLoading_,
                    image: optionModel.image!,
                    height: Screen.h * .05,
                    fit: BoxFit.contain,
                  )
                : Image.asset(
                    AppImages.sandyLoading_,
                    height: Screen.h * .05,
                    fit: BoxFit.contain,
                  ),
          ),
        ),
        Positioned(
          bottom: Screen.h * .08,
          left: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Screen.w * .03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  optionModel.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ResTextSize.getResFontSize(context, fontSize: 14),
                  ),
                ),
                GestureDetector(
                  onTap: addOption,
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.green : Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isSelected ? Icons.check : Icons.add,
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
