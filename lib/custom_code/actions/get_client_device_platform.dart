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

import 'package:web/web.dart' as web;

Future<String> getClientDevicePlatform() async {
  // Add your function code here!
  String clientPlatform = '';

  final userAgent = web.window.navigator.userAgent.toLowerCase();

  if (userAgent.contains('android')) {
    clientPlatform = 'android';
  } else if (userAgent.contains('iphone') ||
      userAgent.contains('ipad') ||
      userAgent.contains('ipod')) {
    clientPlatform = 'ios';
  } else if (userAgent.contains('windows')) {
    clientPlatform = 'windows';
  } else if (userAgent.contains('mac')) {
    clientPlatform = 'macos';
  } else {
    clientPlatform = 'unknown';
  }

  return clientPlatform;
}
