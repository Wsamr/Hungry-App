import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:restaurant_app_sonic/core/api/api_consumer.dart';
import 'package:restaurant_app_sonic/core/constants/api_endpoints.dart';
import 'package:restaurant_app_sonic/core/errors/exceptions.dart';
import 'package:restaurant_app_sonic/core/functions/check_internet_connection.dart';

class OrderHistoryWebService {
  final ApiConsumer apiConsumer;
  OrderHistoryWebService({required this.apiConsumer});

  Future<dynamic> getOrderHistory() async {
    await checkInternetConnection();
    try {
      final data = await apiConsumer.get(ApiEndpoints.ordersHistory);
      return data;
    } on ServerException catch (e) {
      rethrow;
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<dynamic> getOrderDetails(int id) async {
    await checkInternetConnection();
    try {
      final data = await apiConsumer.get(
        "${ApiEndpoints.orderHistoryDetail}$id",
      );
      return data;
    } on ServerException catch (e) {
      rethrow;
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }
}
