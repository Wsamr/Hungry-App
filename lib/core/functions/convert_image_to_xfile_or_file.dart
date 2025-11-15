import 'dart:io';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

Future<String> convertImageToXFileOrFile(
  String imageName, {
  bool isfile = false,
  bool isXfile = false,
}) async {
  var bytes = await rootBundle.load(imageName);
  String tempPath = (await getTemporaryDirectory()).path;
  final fileName = imageName.split('/').last;
  final file = File('$tempPath/$fileName');
  await file.writeAsBytes(
    bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes),
  );
  return XFile(file.path).path;
}
