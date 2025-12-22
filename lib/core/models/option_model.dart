import 'package:restaurant_app_sonic/core/constants/api_endpoints.dart';

class OptionModel {
  final int id;
  final String name;
  final String? image;
  OptionModel({required this.id, required this.name, this.image});
  factory OptionModel.fromJson(Map<String, dynamic> json) {
    return OptionModel(
      id: json[ApiKeys.id],
      name: json[ApiKeys.name],
      image: json[ApiKeys.image],
    );
  }
}
