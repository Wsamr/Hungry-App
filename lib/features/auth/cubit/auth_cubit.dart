import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurant_app_sonic/core/cached/cache_helper.dart';
import 'package:restaurant_app_sonic/core/constants/cache_keys.dart';
import 'package:restaurant_app_sonic/core/errors/exceptions.dart';
import 'package:restaurant_app_sonic/features/auth/data/models/user_model.dart';
import 'package:restaurant_app_sonic/features/auth/data/models/login_models/login_request_model.dart';
import 'package:restaurant_app_sonic/features/auth/data/models/login_models/login_response_model.dart';
import 'package:restaurant_app_sonic/features/auth/data/models/register_models/register_request_model.dart';
import 'package:restaurant_app_sonic/features/auth/data/repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepo, required this.cacheHelper})
    : super(AuthInitial());
  final AuthRepo authRepo;
  final CacheHelper cacheHelper;
  XFile? image;
  login(LoginRequestModel user) async {
    try {
      emit(LoginLoading());
      LoginResponseModel response = await authRepo.login(user);
      // store token
      final String? token = response.data?.token;
      if (token != null && token.isNotEmpty) {
        await cacheHelper.saveData(CacheKeys.token, token);
        await cacheHelper.saveData(
          CacheKeys.user,
          UserModel.mapToJson(response.data!),
        );
      }
      emit(LoginSuccess(token: token!));
    } on ServerException catch (e) {
      emit(LoginFailure(errorMessage: e.errorModel.errorMassage));
    } catch (e) {
      emit(LoginFailure(errorMessage: e.toString()));
    }
  }

  uploadImage(XFile imagePic) {
    image = imagePic;
    emit(UpLoadingImage());
  }

  register(RegisterRequestModel user) async {
    try {
      emit(ResgisterLoading());
      final response = await authRepo.register(user);
      // store token
      final String? token = response.data?.token;
      if (token != null && token.isNotEmpty) {
        await cacheHelper.saveData(CacheKeys.token, token);
        await cacheHelper.saveData(
          CacheKeys.user,
          UserModel.mapToJson(response.data!),
        );
      }
      emit(ResgisterSuccess(token: token!));
    } on ServerException catch (e) {
      emit(ResgisterFailure(errorMessage: e.errorModel.errorMassage));
    } catch (e) {
      emit(ResgisterFailure(errorMessage: e.toString()));
    }
  }
}
