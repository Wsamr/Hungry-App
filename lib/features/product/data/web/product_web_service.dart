// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:restaurant_app_sonic/core/api/api_consumer.dart';
import 'package:restaurant_app_sonic/core/constants/api_endpoints.dart';
import 'package:restaurant_app_sonic/core/errors/exceptions.dart';
import 'package:restaurant_app_sonic/core/functions/check_internet_connection.dart';
import 'package:restaurant_app_sonic/features/product/data/models/add_to_cart_model.dart';

class ProductWebService {
  final ApiConsumer apiConsumer;
  ProductWebService({required this.apiConsumer});
  Future<Map<String, dynamic>> getToppings() async {
    await checkInternetConnection();
    try {
      final data = await apiConsumer.get(ApiEndpoints.toppingsEndPoint);
      return data;
    } on ServerException catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getSideOptions() async {
    await checkInternetConnection();
    try {
      final data = await apiConsumer.get(ApiEndpoints.sideOptionsEndPoint);
      return data;
    } on ServerException catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> addToCart(AddToCartModel req) async {
    await checkInternetConnection();
    try {
      print(
        "POST body: ${{
          ApiKeys.items: [req.toMap()],
        }}",
      );

      final data = await apiConsumer.post(
        ApiEndpoints.addToCartEndPoint,
        data: {
          ApiKeys.items: [req.toMap()],
        },
      );
      return data;
    } on ServerException catch (e) {
      rethrow;
    }
  }
}
