// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:restaurant_app_sonic/core/models/option_model.dart';

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

  CartItemModel copyWith({
    int? itemId,
    int? productId,
    String? name,
    String? image,
    int? quantity,
    String? price,
    double? spicy,
    List<OptionModel>? toppings,
    List<OptionModel>? sideOptions,
  }) {
    return CartItemModel(
      itemId: itemId ?? this.itemId,
      productId: productId ?? this.productId,
      name: name ?? this.name,
      image: image ?? this.image,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      spicy: spicy ?? this.spicy,
      toppings: toppings ?? this.toppings,
      sideOptions: sideOptions ?? this.sideOptions,
    );
  }
}
