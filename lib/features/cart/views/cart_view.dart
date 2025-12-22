import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app_sonic/core/constants/app_icons.dart';
import 'package:restaurant_app_sonic/core/constants/route_names.dart';
import 'package:restaurant_app_sonic/core/utils/screen.dart';
import 'package:restaurant_app_sonic/core/widgets/bottom_salary_container.dart';
import 'package:restaurant_app_sonic/core/widgets/custom_success_alert_dialog.dart';
import 'package:restaurant_app_sonic/features/cart/cart_cubit/cart_cubit.dart';
import 'package:restaurant_app_sonic/features/cart/views/widgets/cart_item_list.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().getCartData();
  }

  @override
  Widget build(BuildContext context) {
    Screen.init(context);
    return Scaffold(
      body: SafeArea(child: CartItemsList()),
      bottomSheet: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          final cubit = context.read<CartCubit>();
          final cartItems = state.cartItems;
          double totalPrice = 0.0;
          cartItems.isNotEmpty
              ? cartItems.forEach((e) {
                  totalPrice += e.quantity * double.parse(e.price);
                })
              : 0;
          return BottomSlaryContainer(
            salary: totalPrice.toString(),
            isLoading: state.status == CartStatus.loading,
            buttonName: "Check Out",
            onTap: () {
              totalPrice == 0
                  ? showDialog(
                      context: context,
                      builder: (context) {
                        return CustomAlertDialog(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          title: "Cart is empty,make order First",
                          imagePath: AppIcons.failureIcon,
                        );
                      },
                    )
                  : Navigator.of(context).pushNamed(
                      RouteNames.checkOutView,
                      arguments: totalPrice.toString(),
                    );
            },
          );
        },
      ),
    );
  }
}
