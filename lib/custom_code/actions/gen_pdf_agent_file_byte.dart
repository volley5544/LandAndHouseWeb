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

import 'package:flutter/services.dart' show rootBundle;
import 'dart:typed_data';

Future<FFUploadedFile> genPdfAgentFileByte(String? filePath) async {
  // Add your function code here!

  FFUploadedFile ffFile = FFUploadedFile(
      bytes: await loadAssetAsBytes('${filePath!}'),
      name: '${DateTime.now().millisecondsSinceEpoch}.jpg');

  return ffFile;
}

Future<Uint8List> loadAssetAsBytes(String path) async {
  final byteData = await rootBundle.load(path);
  return byteData.buffer.asUint8List();
}
