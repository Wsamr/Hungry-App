import 'package:restaurant_app_sonic/core/models/option_model.dart';

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

class CartItemModel {
  final int itemId;
  final int productId;
  final String name;
  final String image;
  final int quantity;
  final String price;
  final double spicy;
  final List<OptionModel> toppings;
  final List<OptionModel> sideOptions;

  CartItemModel({
    required this.itemId,
    required this.productId,
    required this.name,
    required this.image,
    required this.quantity,
    required this.price,
    required this.spicy,
    required this.toppings,
    required this.sideOptions,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      itemId: json['item_id'],
      productId: json['product_id'],
      name: json['name'],
      image: json['image'],
      quantity: json['quantity'],
      price: json['price'].toString(),
      spicy: json['spicy'] is String
          ? double.parse(json['spicy'])
          : (json['spicy'] as num).toDouble(),
      toppings: (json['toppings'] as List)
          .map((e) => OptionModel.fromJson(e))
          .toList(),
      sideOptions: (json['side_options'] as List)
          .map((e) => OptionModel.fromJson(e))
          .toList(),
    );
  }
}
