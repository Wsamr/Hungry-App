// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class UpdateProfileSuccess extends ProfileState {
  final ProfileResponseModel user;
  UpdateProfileSuccess({required this.user});
}

class UpdateProfileLoading extends ProfileState {}

class UpdateProfileFailure extends ProfileState {
  final String errorMassege;
  UpdateProfileFailure({required this.errorMassege});
}

class UploadImage extends ProfileState {}

class ProfileInfoSuccess extends ProfileState {
  final ProfileResponseModel user;
  ProfileInfoSuccess({required this.user});
}

class ProfileInfoLoading extends ProfileState {}

class ProfileInfoFailure extends ProfileState {
  final String errorMassege;
  ProfileInfoFailure({required this.errorMassege});
}

class LogOutLoading extends ProfileState {}

class LogOutSuccess extends ProfileState {}

class LogOutFailure extends ProfileState {
  final String errorMassege;
  LogOutFailure({required this.errorMassege});
}
