import 'package:restaurant_app_sonic/core/api/api_consumer.dart';
import 'package:restaurant_app_sonic/core/constants/api_endpoints.dart';
import 'package:restaurant_app_sonic/core/errors/exceptions.dart';
import 'package:restaurant_app_sonic/features/profile/data/model/profile_response_model.dart';
import 'package:restaurant_app_sonic/features/profile/data/model/update_profile_model.dart';

abstract class ProfileRepo {
  Future<ProfileResponseModel> getProfileInfo();
  Future<ProfileResponseModel> updateProfileInfo(UpdateProfileModel? user);
  Future<ProfileResponseModel> logout();
}

class ProfileRepoImp extends ProfileRepo {
  ApiConsumer apiConsumer;
  ProfileRepoImp({required this.apiConsumer});
  @override
  Future<ProfileResponseModel> getProfileInfo() async {
    try {
      final response = await apiConsumer.get(ApiEndpoints.getProfileEndPoint);
      return ProfileResponseModel.fromMap(response);
    } on ServerException catch (e) {
      rethrow;
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<ProfileResponseModel> updateProfileInfo(
    UpdateProfileModel? user,
  ) async {
    try {
      final data = user != null ? await user.toMap() : null;
      final response = await apiConsumer.post(
        ApiEndpoints.updateProfileEndPoint,
        isFormData: true,
        data: data,
      );
      return ProfileResponseModel.fromMap(response);
    } on ServerException catch (e) {
      rethrow;
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<ProfileResponseModel> logout() async {
    try {
      final response = await apiConsumer.post(ApiEndpoints.logoutEndPoint);
      return ProfileResponseModel.fromMap(response);
    } on ServerException catch (e) {
      rethrow;
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }
}
