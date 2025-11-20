import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurant_app_sonic/core/constants/app_images.dart';
import 'package:restaurant_app_sonic/core/functions/convert_image_to_xfile_or_file.dart';
import 'package:restaurant_app_sonic/core/functions/upload_image.dart';

class RegisterRequestModel {
  final String name;
  final String email;
  final String phone;
  final String password;
  final XFile? image;

  RegisterRequestModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    this.image,
  });

  Future<Map<String, dynamic>> toJson() async {
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "password": password,
      "image": (image != null)
          ? await uploadImageToAPI(image!)
          : await uploadImageToAPI(
              await convertImageToXFileOrFile(AppImages.personImage),
            ),
    };
  }

  Future<FormData> toFormData() async {
    final formData = FormData.fromMap({
      "name": name,
      "email": email,
      "phone": phone,
      "password": password,
    });

    if (image != null) {
      formData.files.add(
        MapEntry(
          "image",
          await MultipartFile.fromFile(image!.path, filename: image!.name),
        ),
      );
    }

    return formData;
  }
}
