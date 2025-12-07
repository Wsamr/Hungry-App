import 'package:restaurant_app_sonic/core/constants/api_endpoints.dart';

class OrderHistoryModel {
  final int id;
  final String status;
  final String totalPrice;
  final String createdAt;
  final String? productImage;
  OrderHistoryModel({
    required this.id,
    required this.status,
    required this.totalPrice,
    required this.createdAt,
    required this.productImage,
  });

  factory OrderHistoryModel.fromJson(Map<String, dynamic> json) {
    return OrderHistoryModel(
      id: json[ApiKeys.id],
      status: json[ApiKeys.status],
      totalPrice: json[ApiKeys.totalPrice].toString(),
      createdAt: json[ApiKeys.createdAt],
      productImage: json[ApiKeys.productImage],
    );
  }
}
