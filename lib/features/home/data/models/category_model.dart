// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:restaurant_app_sonic/core/constants/api_endpoints.dart';

class CategoryModel {
  final int id;
  final String name;
  CategoryModel({required this.id, required this.name});
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(id: json[ApiKeys.id], name: json[ApiKeys.name]);
  }
}
