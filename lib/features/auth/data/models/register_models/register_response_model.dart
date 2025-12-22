import 'package:restaurant_app_sonic/features/auth/data/models/user_model.dart';

class RegisterResponseModel {
  final String code;
  final String message;
  final UserModel? data;

  RegisterResponseModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      code: json['code'],
      message: json['message'],
      data: (json['data'] != null) ? UserModel.fromJson(json['data']) : null,
    );
  }
}
