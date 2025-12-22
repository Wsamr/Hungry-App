import 'package:restaurant_app_sonic/core/api/api_consumer.dart';
import 'package:restaurant_app_sonic/core/constants/api_endpoints.dart';
import 'package:restaurant_app_sonic/core/errors/exceptions.dart';
import 'package:restaurant_app_sonic/core/functions/check_internet_connection.dart';

class HomeWebServices {
  ApiConsumer apiConsumer;
  HomeWebServices({required this.apiConsumer});

  // categories
  Future<Map<String, dynamic>> getCategories() async {
    await checkInternetConnection();
    try {
      final data = await apiConsumer.get(ApiEndpoints.categoriesEndPoint);
      return data;
    } on ServerException {
      rethrow;
    }
  }

  //products
  Future<Map<String, dynamic>> getAllProducts() async {
    await checkInternetConnection();
    try {
      final data = await apiConsumer.get(ApiEndpoints.productsEndPoint);
      return data;
    } on ServerException {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getProductsByCategory(int categoryId) async {
    await checkInternetConnection();
    try {
      final data = await apiConsumer.get(
        "${ApiEndpoints.productsByCategoryEndPoint}$categoryId",
      );
      return data;
    } on ServerException {
      rethrow;
    }
  }
}
