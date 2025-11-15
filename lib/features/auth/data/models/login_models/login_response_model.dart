import 'package:restaurant_app_sonic/features/auth/data/models/data_model.dart';

class LoginResponseModel {
  final int code;
  final String message;
  final DataModel? data;

  LoginResponseModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      code: json['code'],
      message: json['message'],
      data: (json['data'] != null) ? DataModel.fromJson(json['data']) : null,
    );
  }
}
