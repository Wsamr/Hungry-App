// ignore_for_file: public_member_api_docs, sort_constructors_first
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
    //! interceptors
    dio.interceptors.add(ApiInterceptors());
    dio.interceptors.add(LoggerInterceptor());
  }

  Future _request(Future<Response> Function() requestFunc) async {
    try {
      final response = await requestFunc();
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future get(String path, {Map<String, dynamic>? queryParameters}) async {
    return _request(() => dio.get(path, queryParameters: queryParameters));
  }

  @override
  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    return _request(
      () => dio.post(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      ),
    );
  }

  @override
  Future patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    return _request(
      () => dio.patch(
        path,
        data: isFormData ? FormData.fromMap(data ?? {}) : data,
        queryParameters: queryParameters,
      ),
    );
  }

  @override
  Future delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    return _request(
      () => dio.delete(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      ),
    );
  }
}
