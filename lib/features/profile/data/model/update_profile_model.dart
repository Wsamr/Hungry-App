import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:restaurant_app_sonic/core/functions/upload_image.dart';

class UpdateProfileModel {
  final String? name;
  final String? email;
  final String? address;
  final String? visa;
  final XFile? image;
  UpdateProfileModel({
    this.name,
    this.email,
    this.address,
    this.visa,
    this.image,
  });

  //!don`t send all but make map only have attribute that you send it
  Future<Map<String, dynamic>> toMap() async {
    final map = <String, dynamic>{};
    if (name != null) map['name'] = name;
    if (email != null) map['email'] = email;
    if (address != null) map['address'] = address;
    if (visa != null) map['visa'] = visa;
    if (image != null) map['image'] = await uploadImageToAPI(image!);

    return map;
  }

  Future<String> toJson() async => json.encode(await toMap());
}
