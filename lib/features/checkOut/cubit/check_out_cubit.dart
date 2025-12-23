import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_app_sonic/features/cart/data/models/cart_item_model.dart';
import 'package:restaurant_app_sonic/features/checkOut/cubit/check_out_state.dart';
import 'package:restaurant_app_sonic/features/product/data/models/add_to_cart_model.dart';
import 'package:restaurant_app_sonic/features/checkOut/data/repo/check_out_repo.dart';
import 'package:restaurant_app_sonic/core/constants/error_messages.dart';

class CheckOutCubit extends Cubit<CheckOutState> {
  final CheckOutRepo checkOutRepo;

  CheckOutCubit({required this.checkOutRepo}) : super(CheckOutInitial());

  Future<void> saveOrder(List<CartItemModel> cartItems) async {
    if (cartItems.isEmpty) {
      emit(CheckOutFailure("Cart is empty, please add items first."));
      return;
    }

    emit(CheckOutLoading());

    final orderItems = cartItems.map((item) {
      return AddToCartModel(
        productId: item.productId,
        quantity: item.quantity,
        spicy: item.spicy,
        toppings: item.toppings.map((t) => t.id).toList(),
        sideOptions: item.sideOptions.map((s) => s.id).toList(),
      );
    }).toList();

    try {
      final result = await checkOutRepo.saveOrder(orderItems);

      result.fold(
        (error) => emit(CheckOutFailure(error)),
        (response) => emit(CheckOutSuccess()),
      );
    } catch (e) {
      emit(CheckOutFailure(ErrorMessages.unknown));
    }
  }
}
