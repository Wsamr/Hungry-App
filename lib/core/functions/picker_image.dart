import 'package:image_picker/image_picker.dart';

Future<XFile?> pickImage(ImageSource imagesouce) async {
  XFile? image = await ImagePicker().pickImage(source: imagesouce);
  if (image != null) {
    return image;
  }
  return null;
}
