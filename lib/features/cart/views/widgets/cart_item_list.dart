import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app_sonic/core/constants/app_images.dart';
import 'package:restaurant_app_sonic/core/constants/error_messages.dart';
import 'package:restaurant_app_sonic/core/utils/screen.dart';
import 'package:restaurant_app_sonic/features/cart/cart_cubit/cart_cubit.dart';
import 'package:restaurant_app_sonic/features/cart/views/widgets/cart_item_widget.dart';
import 'package:restaurant_app_sonic/features/cart/views/widgets/cart_items_list_loading.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key});

  final int countItem = 4;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final cubit = context.read<CartCubit>();
        if (state.status == CartStatus.failure) {
          return Center(
            child: Text(state.errorMessage ?? ErrorMessages.unknown),
          );
        }
        if (state.status == CartStatus.success) {
          return state.cartItems.isNotEmpty
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: Screen.w * .04),
                  child: ListView.separated(
                    padding: EdgeInsets.only(bottom: Screen.h * .3),
                    itemCount: state.cartItems.length,
                    itemBuilder: (context, index) {
                      return CartItemWidget(
                        cartItemModel: state.cartItems[index],
                        value: state.cartItems[index].quantity,
                        removeOnTap: () {
                          cubit.removeCartItem(state.cartItems[index].itemId);
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: Screen.h * .02);
                    },
                  ),
                )
              : Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    AppImages.cartEmpty,
                    height: Screen.h * .25,
                  ),
                );
        }
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: Screen.w * .04),
          child: CartItemsListLoading(),
        );
      },
    );
  }
}
