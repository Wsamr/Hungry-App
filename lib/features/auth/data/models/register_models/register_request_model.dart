import 'package:image_picker/image_picker.dart';
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
    required this.image,
  });

  Future<Map<String, dynamic>> toJson() async {
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "image": image != null ? await uploadImageToAPI(image!) : null,
      "password": password,
    };
  }
}
