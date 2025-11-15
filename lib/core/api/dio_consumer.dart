import 'package:dio/dio.dart';
import 'package:restaurant_app_sonic/core/api/api_consumer.dart';
import 'package:restaurant_app_sonic/core/api/api_interceptors.dart';
import 'package:restaurant_app_sonic/core/api/logger_interceptors.dart';
import 'package:restaurant_app_sonic/core/constants/api_endpoints.dart';
import 'package:restaurant_app_sonic/core/errors/exceptions.dart';

class DioConsumer extends ApiConsumer {
  Dio dio;
  DioConsumer({required this.dio}) {
    dio.options.baseUrl = ApiEndpoints.baseUrl;
    dio.interceptors.add(ApiInterceptors());
    dio.interceptors.add(LoggerInterceptor());
  }

  @override
  Future get(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.delete(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.patch(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }
}
