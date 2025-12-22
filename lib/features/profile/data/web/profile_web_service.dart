// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:restaurant_app_sonic/core/api/api_consumer.dart';
import 'package:restaurant_app_sonic/core/constants/api_endpoints.dart';
import 'package:restaurant_app_sonic/core/errors/exceptions.dart';
import 'package:restaurant_app_sonic/core/functions/check_internet_connection.dart';
import 'package:restaurant_app_sonic/features/profile/data/model/update_profile_model.dart';

class ProfileWebService {
  final ApiConsumer apiConsumer;
  ProfileWebService({required this.apiConsumer});
  Future<Map<String, dynamic>> getProfileInfo() async {
    await checkInternetConnection();
    try {
      final data = await apiConsumer.get(ApiEndpoints.getProfileEndPoint);
      return data;
    } on ServerException catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> updateProfileInfo(
    UpdateProfileModel? user,
  ) async {
    await checkInternetConnection();
    try {
      final data = user != null ? await user.toMap() : null;
      final response = await apiConsumer.post(
        ApiEndpoints.updateProfileEndPoint,
        isFormData: true,
        data: data,
      );
      return response;
    } on ServerException catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> logout() async {
    await checkInternetConnection();
    try {
      final data = await apiConsumer.post(ApiEndpoints.logoutEndPoint);
      return data;
    } on ServerException catch (e) {
      rethrow;
    }
  }
}
