import 'package:dio/dio.dart';
import 'package:restaurant_app_sonic/core/cached/cache_helper.dart';
import 'package:restaurant_app_sonic/core/constants/api_endpoints.dart';
import 'package:restaurant_app_sonic/core/constants/cache_keys.dart';
import 'package:restaurant_app_sonic/core/service/service_locator.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    //headers
    options.headers[ApiKeys.accept] = ApiKeys.applicationJson;

    // get tokens
    // String? token = await sl<CacheHelper>().getData(CacheKeys.token);
    String? token = "868|6M5dXSocZS0SThgC1pVYOIv8NODjKWAOghUgmju79e95e50a";
    if (token != null) {
      options.headers[ApiKeys.authorization] =
          "Bearer $token"; // send token with request
    }
    super.onRequest(options, handler);
  }
}
