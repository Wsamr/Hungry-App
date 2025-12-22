// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:restaurant_app_sonic/core/api/api_consumer.dart';
import 'package:restaurant_app_sonic/core/constants/api_endpoints.dart';
import 'package:restaurant_app_sonic/core/errors/exceptions.dart';
import 'package:restaurant_app_sonic/core/functions/check_internet_connection.dart';
import 'package:restaurant_app_sonic/features/product/data/models/add_to_cart_model.dart';

class CheckOutWebService {
  final ApiConsumer apiConsumer;
  CheckOutWebService({required this.apiConsumer});
  Future<Map<String, dynamic>> saveOrder(List<AddToCartModel> items) async {
    await checkInternetConnection();
    try {
      final body = {ApiKeys.items: items.map((item) => item.toMap()).toList()};

      final data = await apiConsumer.post(
        ApiEndpoints.saveOrderEndPoint,
        data: body,
      );
      return data;
    } on ServerException catch (e) {
      rethrow;
    }
  }
}
