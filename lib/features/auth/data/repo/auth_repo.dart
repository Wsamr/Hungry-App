import 'package:dio/dio.dart';
import 'package:restaurant_app_sonic/core/api/api_consumer.dart';
import 'package:restaurant_app_sonic/core/constants/api_endpoints.dart';
import 'package:restaurant_app_sonic/core/errors/exceptions.dart';
import 'package:restaurant_app_sonic/features/auth/data/models/login_models/login_request_model.dart';
import 'package:restaurant_app_sonic/features/auth/data/models/login_models/login_response_model.dart';
import 'package:restaurant_app_sonic/features/auth/data/models/register_models/register_request_model.dart';
import 'package:restaurant_app_sonic/features/auth/data/models/register_models/register_response_model.dart';

abstract class AuthRepo {
  Future<LoginResponseModel> login(LoginRequestModel user);
  Future<RegisterResponseModel> register(RegisterRequestModel user);
}

class AuthRepoImple extends AuthRepo {
  ApiConsumer apiConsumer;
  AuthRepoImple({required this.apiConsumer});
  @override
  Future<LoginResponseModel> login(LoginRequestModel user) async {
    try {
      final response = await apiConsumer.post(
        ApiEndpoints.loginEndPoint,
        data: user.toJson(),
      );
      return LoginResponseModel.fromJson(response);
    } on ServerException catch (e) {
      rethrow;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<RegisterResponseModel> register(RegisterRequestModel user) async {
    try {
      final response = await apiConsumer.post(
        ApiEndpoints.registerEndPoint,
        isFormData: true,
        data: await user.toJson(),
      );
      return RegisterResponseModel.fromJson(response);
    } on DioException catch (dioError) {
      rethrow;
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
