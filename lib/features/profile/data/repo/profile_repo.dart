import 'package:dartz/dartz.dart';
import 'package:restaurant_app_sonic/core/constants/error_messages.dart';
import 'package:restaurant_app_sonic/core/errors/exceptions.dart';
import 'package:restaurant_app_sonic/features/profile/data/model/profile_response_model.dart';
import 'package:restaurant_app_sonic/features/profile/data/model/update_profile_model.dart';
import 'package:restaurant_app_sonic/features/profile/data/web/profile_web_service.dart';

abstract class ProfileRepo {
  Future<Either<String, ProfileResponseModel>> getProfileInfo();
  Future<Either<String, ProfileResponseModel>> updateProfileInfo(
    UpdateProfileModel? user,
  );
  Future<Either<String, ProfileResponseModel>> logout();
}

class ProfileRepoImp extends ProfileRepo {
  final ProfileWebService profileWebService;
  ProfileRepoImp({required this.profileWebService});
  @override
  Future<Either<String, ProfileResponseModel>> getProfileInfo() async {
    try {
      final data = await profileWebService.getProfileInfo();
      return right(ProfileResponseModel.fromMap(data));
    } on NoInternetException {
      return left(ErrorMessages.noInternet);
    } on ServerException catch (e) {
      return left(e.errorModel.errorMassage);
    } catch (_) {
      return left(ErrorMessages.unknown);
    }
  }

  @override
  Future<Either<String, ProfileResponseModel>> updateProfileInfo(
    UpdateProfileModel? user,
  ) async {
    try {
      final data = await profileWebService.updateProfileInfo(user);
      return right(ProfileResponseModel.fromMap(data));
    } on NoInternetException {
      return left(ErrorMessages.noInternet);
    } on ServerException catch (e) {
      return left(e.errorModel.errorMassage);
    } catch (_) {
      return left(ErrorMessages.unknown);
    }
  }

  @override
  Future<Either<String, ProfileResponseModel>> logout() async {
    try {
      final data = await profileWebService.logout();
      return right(ProfileResponseModel.fromMap(data));
    } on NoInternetException {
      return left(ErrorMessages.noInternet);
    } on ServerException catch (e) {
      return left(e.errorModel.errorMassage);
    } catch (_) {
      return left(ErrorMessages.unknown);
    }
  }
}
