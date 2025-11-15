import 'package:restaurant_app_sonic/core/constants/api_endpoints.dart';

class ErrorModel {
  String errorMessage;
  ErrorModel({required this.errorMessage});

  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(errorMessage: jsonData[ApiKeys.message]);
  }
}
