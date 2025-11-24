import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/utils/res_text_size.dart';
import 'package:restaurant_app_sonic/core/utils/screen.dart';
import 'package:restaurant_app_sonic/features/product/views/widgets/slider_spicy_custom.dart';

class SpicyTopSection extends StatelessWidget {
  SpicyTopSection({super.key, required this.image});
  final String image;
  final ValueNotifier<double> spicyNotifier = ValueNotifier(0.5);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: Screen.w * .04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(flex: 3, child: Image.asset(image)),
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.only(left: Screen.w * .1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Customize Your Burger to YourTastes. Ultimate Experience",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: ResTextSize.getResFontSize(
                        context,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: spicyNotifier,
                    builder: (context, value, child) => SliderSpicyCustom(
                      value: spicyNotifier.value,
                      onChanged: (value) {
                        spicyNotifier.value = value;
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("🥶"), Text("🌶️")],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
