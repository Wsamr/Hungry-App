part of 'cart_cubit.dart';

enum CartStatus { initial, loading, success, failure }

class CartState extends Equatable {
  final CartStatus status;
  final String totalPrice;
  final List<CartItemModel> cartItems;
  final String? errorMessage;
  const CartState({
    required this.status,
    required this.totalPrice,
    required this.cartItems,
    this.errorMessage,
  });

  factory CartState.initial() {
    return const CartState(
      status: CartStatus.initial,
      totalPrice: "0.0",
      cartItems: [],
    );
  }
  factory CartState.loading() {
    return const CartState(
      status: CartStatus.loading,
      totalPrice: "0.0",
      cartItems: [],
    );
  }
  factory CartState.success({
    required String totalPrice,
    required List<CartItemModel> cartItems,
  }) {
    return CartState(
      status: CartStatus.success,
      totalPrice: totalPrice,
      cartItems: cartItems,
    );
  }
  factory CartState.failure(String errorMessage) {
    return CartState(
      status: CartStatus.failure,
      totalPrice: "0.0",
      cartItems: const [],
      errorMessage: errorMessage,
    );
  }
  CartState copyWith({
    CartStatus? status,
    String? totalPrice,
    List<CartItemModel>? cartItems,
    String? errorMessage,
  }) {
    return CartState(
      status: status ?? this.status,
      totalPrice: totalPrice ?? this.totalPrice,
      cartItems: cartItems ?? this.cartItems,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, totalPrice, cartItems, errorMessage];
}
