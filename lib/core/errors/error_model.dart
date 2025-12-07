import 'package:restaurant_app_sonic/core/constants/api_endpoints.dart';

class ErrorModel {
  String errorMassage;
  ErrorModel({required this.errorMassage});

  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(errorMassage: jsonData[ApiKeys.message]);
  }
}
