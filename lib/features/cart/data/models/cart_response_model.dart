import 'package:restaurant_app_sonic/features/cart/data/models/cart_item_model.dart';

class CartResponseModel {
  final int id;
  final String totalPrice;
  final List<CartItemModel> items;

  CartResponseModel({
    required this.id,
    required this.totalPrice,
    required this.items,
  });

  factory CartResponseModel.fromJson(Map<String, dynamic> json) {
    return CartResponseModel(
      id: json['id'],
      totalPrice: json['total_price'],
      items: (json['items'] as List)
          .map((item) => CartItemModel.fromJson(item))
          .toList(),
    );
  }
}
