// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String token;
  final String name;
  final String email;
  final String? image;

  UserModel({
    required this.token,
    required this.name,
    required this.email,
    required this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      token: json['token'],
      name: json['name'],
      email: json['email'],
      image: json['image'] != null ? json['image'] as String : null,
    );
  }

  static Map<String, dynamic> toMap(UserModel user) {
    return <String, dynamic>{
      'token': user.token,
      'name': user.name,
      'email': user.email,
      'image': user.image,
    };
  }

  static String mapToJson(UserModel model) =>
      json.encode(UserModel.toMap(model));

  static UserModel jsonToObject(String json) =>
      UserModel.fromJson(jsonDecode(json));
}
