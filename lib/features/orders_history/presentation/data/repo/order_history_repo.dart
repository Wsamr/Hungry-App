import 'package:restaurant_app_sonic/core/constants/api_endpoints.dart';
import 'package:restaurant_app_sonic/features/orders_history/presentation/data/models/order_details_model.dart';
import 'package:restaurant_app_sonic/features/orders_history/presentation/data/models/order_history_model.dart';
import 'package:restaurant_app_sonic/features/orders_history/presentation/data/web/order_history_web_service.dart';

abstract class OrderHistoryRepo {
  Future<List<OrderHistoryModel>> getOrderHistory();
  Future<OrderDetailsModel> getOrderDetails(int id);
}

class OrderHistoryRepoImple extends OrderHistoryRepo {
  OrderHistoryWebService orderHistoryWebService;
  OrderHistoryRepoImple({required this.orderHistoryWebService});
  @override
  Future<List<OrderHistoryModel>> getOrderHistory() async {
    final data = await orderHistoryWebService.getOrderHistory();
    final orders = data["data"] as List? ?? [];
    return orders
        .map(
          (order) => OrderHistoryModel.fromJson(order as Map<String, dynamic>),
        )
        .toList();
  }

  @override
  Future<OrderDetailsModel> getOrderDetails(int id) async {
    final data = await orderHistoryWebService.getOrderDetails(id);
    return OrderDetailsModel.fromJson(
      data[ApiKeys.data] as Map<String, dynamic>,
    );
  }
}
