// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:restaurant_app_sonic/core/constants/api_endpoints.dart';

class ProductModel {
  final int id;
  final String? image;
  final String name;
  final String description;
  final String rate;
  final String price;

  ProductModel({
    required this.id,
    required this.image,
    required this.name,
    required this.description,
    required this.rate,
    required this.price,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json[ApiKeys.id],
      image:
          json[ApiKeys.image] ??
          "https://png.pngtree.com/png-vector/20220505/ourmid/pngtree-not-found-not-found-rectangular-miscellaneous-vector-png-image_13370440.png",
      name: json[ApiKeys.name],
      description: json[ApiKeys.description],
      rate: json[ApiKeys.rating],
      price: json[ApiKeys.price],
    );
  }
}
