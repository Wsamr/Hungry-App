import 'package:dio/dio.dart';
import 'package:restaurant_app_sonic/core/constants/api_endpoints.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    //headers
    options.headers[ApiKeys.accept] = ApiKeys.applicationJson;
    super.onRequest(options, handler);
  }
}
