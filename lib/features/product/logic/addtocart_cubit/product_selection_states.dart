part of 'product_selection_cubit.dart';

enum AddToCartStatus { initial, loading, success, failure }

class ProductSelectionState extends Equatable {
  final int quantity;
  final double spicyLevel;
  final List<int> toppingsIds;
  final List<int> sideOptonsIds;
  final double basePrice;
  // cart
  final AddToCartStatus status;
  final String? message;
  final String? errorMessage;
  const ProductSelectionState({
    required this.basePrice,
    required this.quantity,
    required this.spicyLevel,
    required this.toppingsIds,
    required this.sideOptonsIds,
    this.status = AddToCartStatus.initial,
    this.message,
    this.errorMessage,
  });
  factory ProductSelectionState.initial({required double basePrice}) {
    return ProductSelectionState(
      basePrice: basePrice,
      quantity: 1,
      spicyLevel: 0.1,
      toppingsIds: const [],
      sideOptonsIds: const [],
    );
  }
  ProductSelectionState copyWith({
    int? quantity,
    double? spicyLevel,
    List<int>? selectedToppings,
    List<int>? selectedSideOptions,
    double? basePrice,
    AddToCartStatus? status,
    String? message,
    String? errorMessage,
  }) {
    return ProductSelectionState(
      basePrice: basePrice ?? this.basePrice,
      quantity: quantity ?? this.quantity,
      spicyLevel: spicyLevel ?? this.spicyLevel,
      toppingsIds: selectedToppings ?? toppingsIds,
      sideOptonsIds: selectedSideOptions ?? sideOptonsIds,
      status: status ?? this.status,
      message: message,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    quantity,
    spicyLevel,
    toppingsIds,
    basePrice,
    sideOptonsIds,
    status,
    message,
    errorMessage,
  ];
}
