// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:typed_data';
import 'dart:convert';
import 'dart:async';
import 'dart:js_interop';
import 'package:web/web.dart' as web;

Future<FFUploadedFile?> sanitizeWebBytes(FFUploadedFile? bytes) async {
  final completer = Completer<Uint8List>();

  // Convert Dart bytes -> JS Uint8Array -> Blob
  final jsArray = bytes!.bytes!.toJS; // requires dart:js_interop
  // final blob = web.Blob([jsArray]);
  final parts = <JSAny>[jsArray as JSAny].toJS;
  final blob = web.Blob(parts);

  // Create object URL
  final url = web.URL.createObjectURL(blob);

  // Load image from blob URL
  final img = web.HTMLImageElement();
  img.src = url;

  img.onLoad.listen((_) {
    // final maxWidth = 1080; // max pixel width
    // final maxHeight = 1920; // max pixel height

// calculate scaled size while keeping aspect ratio
    // final ratio = (img.naturalWidth / img.naturalHeight);
    // int targetWidth = img.naturalWidth;
    // int targetHeight = img.naturalHeight;

    // if (img.naturalWidth > maxWidth) {
    //   targetWidth = maxWidth;
    //   targetHeight = (targetWidth / ratio).toInt();
    // }
    // if (targetHeight > maxHeight) {
    //   targetHeight = maxHeight;
    //   targetWidth = (targetHeight * ratio).toInt();
    // }

    final canvas = web.HTMLCanvasElement();
    canvas.width = img.naturalWidth;
    canvas.height = img.naturalHeight;
    final ctx = canvas.getContext('2d') as web.CanvasRenderingContext2D;
    ctx.drawImage(img, 0, 0);

    // Export to PNG (you can also use "image/jpeg")
    final dataUrl = canvas.toDataURL("image/jpeg", 0.3.toJS);
    final base64Data = dataUrl.split(',').last;
    final cleanBytes = base64Decode(base64Data);

    web.URL.revokeObjectURL(url); // cleanup
    completer.complete(cleanBytes);
  });

  img.onError.listen((err) {
    completer.completeError("❌ Failed to sanitize image: $err");
  });

  FFUploadedFile outputFile = FFUploadedFile(bytes: await completer.future);
  return outputFile;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
