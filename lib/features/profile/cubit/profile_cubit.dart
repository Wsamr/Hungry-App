import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:restaurant_app_sonic/core/errors/exceptions.dart';
import 'package:restaurant_app_sonic/features/profile/data/model/profile_response_model.dart';
import 'package:restaurant_app_sonic/features/profile/data/model/update_profile_model.dart';
import 'package:restaurant_app_sonic/features/profile/data/repo/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.profileRepo}) : super(ProfileInitial());
  final ProfileRepo profileRepo;
  XFile? imagePic;
  ProfileResponseModel? user;

  uploadingImage(XFile? image) {
    imagePic = image;
    emit(UploadImage());
  }

  // getProfileInfo() async {
  //   try {
  //     emit(ProfileInfoLoading());
  //     user = await profileRepo.getProfileInfo();
  //     emit(ProfileInfoSuccess(user: user!));
  //   } on ServerException catch (e) {
  //     emit(ProfileInfoFailure(errorMassege: e.errorModel.errorMassage));
  //   } on Exception catch (e) {
  //     emit(ProfileInfoFailure(errorMassege: e.toString()));
  //   }
  // }

  // updateProfile(UpdateProfileModel? user) async {
  //   try {
  //     emit(UpdateProfileLoading());
  //     this.user = await profileRepo.updateProfileInfo(user);
  //     emit(UpdateProfileSuccess(user: this.user!));
  //   } on ServerException catch (e) {
  //     emit(UpdateProfileFailure(errorMassege: e.errorModel.errorMassage));
  //   } on Exception catch (e) {
  //     emit(UpdateProfileFailure(errorMassege: e.toString()));
  //   }
  // }

  // logOut() async {
  //   try {
  //     emit(LogOutLoading());
  //     final response = await profileRepo.logout();
  //     emit(LogOutSuccess());
  //   } on ServerException catch (e) {
  //     emit(LogOutFailure(errorMassege: e.errorModel.errorMassage));
  //   } on Exception catch (e) {
  //     emit(LogOutFailure(errorMassege: e.toString()));
  //   }
  // }
}
