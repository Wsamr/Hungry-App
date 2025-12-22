import 'package:restaurant_app_sonic/core/constants/api_endpoints.dart';

class AddToCartModel {
  final int productId;
  final int quantity;
  final double spicy;
  final List<int> toppings;
  final List<int> sideOptions;
  AddToCartModel({
    required this.productId,
    required this.quantity,
    this.spicy = 0.1,
    this.toppings = const [],
    this.sideOptions = const [],
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ApiKeys.productId: productId,
      ApiKeys.quantity: quantity,
      ApiKeys.spicy: spicy,
      ApiKeys.toppings: toppings,
      ApiKeys.sideOptions: sideOptions,
    };
  }
}
