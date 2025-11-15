part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {
  final String token;
  LoginSuccess({required this.token});
}

class LoginFailure extends AuthState {
  final String errorMessage;
  LoginFailure({required this.errorMessage});
}

class UpLoadingImage extends AuthState {}

class ResgisterLoading extends AuthState {}

class ResgisterSuccess extends AuthState {
  final String token;
  ResgisterSuccess({required this.token});
}

class ResgisterFailure extends AuthState {
  final String errorMessage;
  ResgisterFailure({required this.errorMessage});
}
