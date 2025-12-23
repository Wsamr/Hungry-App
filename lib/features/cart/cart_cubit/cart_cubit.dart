import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app_sonic/core/constants/error_messages.dart';
import 'package:restaurant_app_sonic/features/cart/data/models/cart_item_model.dart';
import 'package:restaurant_app_sonic/features/cart/data/repo/cart_repo.dart';
import 'package:restaurant_app_sonic/features/checkOut/data/repo/check_out_repo.dart';
import 'package:restaurant_app_sonic/features/product/data/models/add_to_cart_model.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo, this.checkOutRepo) : super(CartState.initial());

  final CartRepo cartRepo;
  final CheckOutRepo checkOutRepo;

  void getCartData() async {
    emit(CartState.loading());
    final cartData = await cartRepo.getCartData();
    cartData.fold((error) => emit(CartState.failure(error)), (
      cartResponseModel,
    ) {
      emit(
        CartState.success(
          totalPrice: cartResponseModel.totalPrice,
          cartItems: cartResponseModel.items,
        ),
      );
    });
  }

  void updateQuantity(int itemId, int newQuantity) {
    final index = state.cartItems.indexWhere((item) => item.itemId == itemId);
    if (index == -1) return;

    final updatedItems = List<CartItemModel>.from(state.cartItems);
    updatedItems[index] = updatedItems[index].copyWith(quantity: newQuantity);

    emit(state.copyWith(cartItems: updatedItems));
  }

  void removeCartItem(int cartItemId) async {
    emit(CartState.loading());
    final result = await cartRepo.removeCartItem(cartItemId);

    result.fold(
      (error) => emit(CartState.failure(error)),
      (_) => getCartData(),
    );
  }

  void clearCart() async {
    emit(CartState.loading());

    final itemsToRemove = List<CartItemModel>.from(state.cartItems);

    await Future.wait(
      itemsToRemove.map((item) => cartRepo.removeCartItem(item.itemId)),
    );
  }
}
