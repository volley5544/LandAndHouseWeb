// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/app_events/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart'; // for compute
import 'package:mime/mime.dart'; // optional if you want MIME detection

Future<List<FFUploadedFile>?> convertBase64ToFFFilesCopy(
    List<String>? imageBase64) async {
  // Add your function code here!
  List<FFUploadedFile> result = [];

  for (final base64Str in imageBase64!) {
    if (base64Str == null || base64Str.isEmpty) continue;

    try {
      final parts = base64Str.split(',');
      final base64Content = parts.length > 1 ? parts[1] : parts[0];
      final bytes = await compute(base64Decode, base64Content);

      result.add(FFUploadedFile(bytes: bytes));
    } catch (e) {
      print('Failed to convert base64 to FFUploadedFile: $e');
    }
  }

  return result;
}
