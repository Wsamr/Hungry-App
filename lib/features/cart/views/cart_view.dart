import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/utils/screen.dart';
import 'package:restaurant_app_sonic/core/widgets/bottom_salary_container.dart';
import 'package:restaurant_app_sonic/features/cart/views/widgets/cart_item_list.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    Screen.init(context);
    return Scaffold(
      body: CartItemsList(),
      bottomSheet: BottomSlaryContainer(buttonName: "Check Out"),
    );
  }
}
