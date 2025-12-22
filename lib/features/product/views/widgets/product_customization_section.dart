import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app_sonic/core/utils/res_text_size.dart';
import 'package:restaurant_app_sonic/core/utils/screen.dart';
import 'package:restaurant_app_sonic/core/widgets/custom_floating_icon_button.dart';
import 'package:restaurant_app_sonic/features/product/logic/addtocart_cubit/product_selection_cubit.dart';
import 'package:restaurant_app_sonic/features/product/views/widgets/slider_spicy_custom.dart';

class ProductCustomizationSection extends StatelessWidget {
  const ProductCustomizationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductSelectionCubit, ProductSelectionState>(
      builder: (context, state) {
        final cubit = context.read<ProductSelectionCubit>();
        return Padding(
          padding: EdgeInsets.only(right: Screen.w * .04),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      "Quantity",
                      style: TextStyle(
                        fontSize: ResTextSize.getResFontSize(
                          context,
                          fontSize: 16,
                        ),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: Screen.h * .003),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomFloatingIconButton(
                          heroTag: "remove",
                          onPressed: () {
                            cubit.updateQuantity(state.quantity - 1);
                          },
                          iconData: Icons.remove,
                        ),
                        Text(
                          state.quantity.toString(),
                          style: TextStyle(
                            fontSize: ResTextSize.getResFontSize(
                              context,
                              fontSize: 16,
                            ),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        CustomFloatingIconButton(
                          heroTag: "add",
                          onPressed: () {
                            cubit.updateQuantity(state.quantity + 1);
                          },
                          iconData: Icons.add,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: Screen.w * .1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Spicy",
                        style: TextStyle(
                          fontSize: ResTextSize.getResFontSize(
                            context,
                            fontSize: 16,
                          ),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SliderSpicyCustom(
                        value: state.spicyLevel,
                        onChanged: (value) {
                          cubit.updateSpicyLevel(value);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
