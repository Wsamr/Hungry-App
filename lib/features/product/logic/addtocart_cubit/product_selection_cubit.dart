import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app_sonic/core/constants/error_messages.dart';
import 'package:restaurant_app_sonic/features/product/data/models/add_to_cart_model.dart';
import 'package:restaurant_app_sonic/features/product/data/repo/product_repo.dart';

part 'product_selection_states.dart';

class ProductSelectionCubit extends Cubit<ProductSelectionState> {
  final ProductRepo productRepo;
  final int productId;
  final double basePrice;
  ProductSelectionCubit(this.productRepo, this.productId, this.basePrice)
    : super(ProductSelectionState.initial(basePrice: basePrice));

  void updateQuantity(int quantity) {
    if (quantity >= 1) {
      emit(state.copyWith(quantity: quantity));
    }
  }

  void updateSpicyLevel(double level) {
    emit(state.copyWith(spicyLevel: level));
  }

  void toggleTopping(int toppingId) {
    final current = List<int>.from(state.toppingsIds);
    if (current.contains(toppingId)) {
      current.remove(toppingId);
    } else {
      current.add(toppingId);
    }
    emit(state.copyWith(selectedToppings: current));
  }

  void toggleSideOption(int sideOptionId) {
    final current = List<int>.from(state.sideOptonsIds);
    if (current.contains(sideOptionId)) {
      current.remove(sideOptionId);
    } else {
      current.add(sideOptionId);
    }
    emit(state.copyWith(selectedSideOptions: current));
  }

  resetStatus() {
    emit(state.copyWith(status: AddToCartStatus.initial));
  }

  addTocart() async {
    emit(state.copyWith(status: AddToCartStatus.loading));
    final request = AddToCartModel(
      productId: productId,
      quantity: state.quantity,
      spicy: state.spicyLevel,
      toppings: state.toppingsIds.map((t) => t).toList(),
      sideOptions: state.sideOptonsIds.map((s) => s).toList(),
    );
    try {
      final result = await productRepo.addToCart(request);
      result.fold(
        (error) {
          emit(
            state.copyWith(
              status: AddToCartStatus.failure,
              errorMessage: error,
            ),
          );
        },
        (r) {
          emit(
            state.copyWith(
              status: AddToCartStatus.success,
              message: "success to add to cart",
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: AddToCartStatus.failure,
          errorMessage: ErrorMessages.unknown,
        ),
      );
    }
  }
}
