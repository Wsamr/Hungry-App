import 'package:restaurant_app_sonic/core/api/api_consumer.dart';
import 'package:restaurant_app_sonic/core/constants/api_endpoints.dart';
import 'package:restaurant_app_sonic/core/errors/exceptions.dart';
import 'package:restaurant_app_sonic/core/functions/check_internet_connection.dart';

class CartWebService {
  final ApiConsumer apiConsumer;

  CartWebService({required this.apiConsumer});
  Future<Map<String, dynamic>> getCartData() async {
    await checkInternetConnection();
    try {
      final data = await apiConsumer.get(ApiEndpoints.getCartEndPoint);
      return data;
    } on ServerException catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> removeCartItem(int cartItemId) async {
    await checkInternetConnection();
    try {
      final data = await apiConsumer.delete(
        ApiEndpoints.deletCartItemEndPoint + "$cartItemId",
      );
      return data;
    } on ServerException catch (e) {
      rethrow;
    }
  }
}
