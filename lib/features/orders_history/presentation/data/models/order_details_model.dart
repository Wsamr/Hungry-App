import 'package:restaurant_app_sonic/core/constants/api_endpoints.dart';

class OrderDetailsModel {
  final int id;
  final String status;
  final String totalPrice;
  final String createdAt;
  final List<OrderItemModel> items;

  OrderDetailsModel({
    required this.id,
    required this.status,
    required this.totalPrice,
    required this.createdAt,
    required this.items,
  });
  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    return OrderDetailsModel(
      id: json[ApiKeys.id],
      status: json[ApiKeys.status],
      totalPrice: json[ApiKeys.totalPrice].toString(),
      createdAt: json[ApiKeys.createdAt],
      items: (json[ApiKeys.items] as List? ?? [])
          .map((e) => OrderItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class OrderItemModel {
  final int productId;
  final String name;
  final String image;
  final int quantity;
  final String price;
  final String spicy;
  final List<OrderOptionModel> topping;
  final List<OrderOptionModel> sideOption;

  OrderItemModel({
    required this.image,
    required this.productId,
    required this.name,
    required this.quantity,
    required this.price,
    required this.spicy,
    required this.topping,
    required this.sideOption,
  });
  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      image: json[ApiKeys.image],
      productId: json[ApiKeys.productId],
      name: json[ApiKeys.name],
      quantity: json[ApiKeys.quantity],
      price: json[ApiKeys.price].toString(),
      spicy: json[ApiKeys.spicy].toString(),
      topping: (json[ApiKeys.toppings] as List? ?? [])
          .map((e) => OrderOptionModel.fromJson(e as Map<String, dynamic>))
          .toList(),

      sideOption: (json[ApiKeys.sideOptions] as List? ?? [])
          .map((e) => OrderOptionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class OrderOptionModel {
  final int id;
  final String name;
  final String image;
  OrderOptionModel({required this.id, required this.name, required this.image});
  factory OrderOptionModel.fromJson(Map<String, dynamic> json) {
    return OrderOptionModel(
      id: json[ApiKeys.id],
      name: json[ApiKeys.name],
      image: json[ApiKeys.image],
    );
  }
}
