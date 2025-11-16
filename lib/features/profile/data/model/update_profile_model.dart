import 'dart:convert';

class UpdateProfileModel {
  final String? name;
  final String? email;
  final String? address;
  final String? visa;
  final String? image;
  UpdateProfileModel({
    this.name,
    this.email,
    this.address,
    this.visa,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'address': address,
      'visa': visa,
      'image': image,
    };
  }

  String toJson() => json.encode(toMap());
}
