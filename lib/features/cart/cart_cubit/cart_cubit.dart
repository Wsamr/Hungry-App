import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app_sonic/features/cart/data/models/cart_item_model.dart';
import 'package:restaurant_app_sonic/features/cart/data/repo/cart_repo.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo) : super(CartState.initial());
  final CartRepo cartRepo;

  void getCartData() async {
    emit(CartState.loading());
    final cartData = await cartRepo.getCartData();
    cartData.fold(
      (error) {
        emit(CartState.failure(error));
      },
      (cartResponseModel) {
        emit(
          CartState.success(
            totalPrice: cartResponseModel.totalPrice,
            cartItems: cartResponseModel.items,
          ),
        );
      },
    );
  }

  void updateQuantity(int itemId, int newQuantity) {
    final index = state.cartItems.indexWhere((item) => item.itemId == itemId);
    if (index == -1) return;
    final updatedItems = List<CartItemModel>.from(state.cartItems);
    final updatedItem = updatedItems[index].copyWith(quantity: newQuantity);
    updatedItems[index] = updatedItem;
    emit(state.copyWith(cartItems: updatedItems));
  }

  void removeCartItem(int cartItemId) async {
    emit(CartState.loading());
    final result = await cartRepo.removeCartItem(cartItemId);
    result.fold(
      (error) {
        CartState.failure(error);
      },
      (r) async {
        final cartData = await cartRepo.getCartData();
        cartData.fold(
          (error) {
            emit(CartState.failure(error));
          },
          (cartResponseModel) {
            emit(
              CartState.success(
                totalPrice: cartResponseModel.totalPrice,
                cartItems: cartResponseModel.items,
              ),
            );
          },
        );
      },
    );
  }
}
