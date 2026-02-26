// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:typed_data';
import 'package:image/image.dart' as img;

Future<FFUploadedFile?> sanitizeImagePicker(
    FFUploadedFile? imagePickerFile) async {
  // Try to decode with `image` package

  final decoded = img.decodeImage(imagePickerFile!.bytes!);
  if (decoded == null) {
    print("❌ Could not decode image");
    return FFUploadedFile();
  }

  // Re-encode as clean JPEG (or PNG)
  final sanitizedBytes = Uint8List.fromList(img.encodePng(decoded));

  FFUploadedFile bytesFileOutput = FFUploadedFile(bytes: sanitizedBytes);

  return bytesFileOutput;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
