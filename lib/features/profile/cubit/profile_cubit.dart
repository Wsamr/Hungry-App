import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:restaurant_app_sonic/features/profile/data/model/profile_response_model.dart';
import 'package:restaurant_app_sonic/features/profile/data/model/update_profile_model.dart';
import 'package:restaurant_app_sonic/features/profile/data/repo/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;
  ProfileCubit({required this.profileRepo}) : super(ProfileInitial());

  XFile? imagePic;
  ProfileResponseModel? user;

  uploadingImage(XFile? image) {
    imagePic = image;
    emit(UploadImage());
  }

  getProfileInfo() async {
    try {
      emit(ProfileInfoLoading());
      final result = await profileRepo.getProfileInfo();
      result.fold((error) => emit(ProfileInfoFailure(errorMassege: error)), (
        user,
      ) {
        this.user = user;
        emit(ProfileInfoSuccess(user: user));
      });
    } catch (e) {
      emit(ProfileInfoFailure(errorMassege: e.toString()));
    }
  }

  updateProfile(UpdateProfileModel user) async {
    try {
      emit(UpdateProfileLoading());
      final result = await profileRepo.updateProfileInfo(user);
      result.fold((error) => emit(UpdateProfileFailure(errorMassege: error)), (
        user,
      ) {
        this.user = user;
        emit(UpdateProfileSuccess(user: user));
      });
    } catch (e) {
      emit(UpdateProfileFailure(errorMassege: e.toString()));
    }
  }

  logOut() async {
    try {
      emit(LogOutLoading());
      final result = await profileRepo.logout();
      result.fold((error) => emit(LogOutFailure(errorMassege: error)), (user) {
        this.user = user;
        emit(LogOutSuccess());
      });
    } catch (e) {
      emit(LogOutFailure(errorMassege: e.toString()));
    }
  }
}
