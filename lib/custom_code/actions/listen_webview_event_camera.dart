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

import 'dart:js_interop_unsafe';

import 'package:web/web.dart' as web;
import 'dart:js_interop';
import 'package:flutter/scheduler.dart';

Future listenWebviewEventCamera(
    Future Function(String cameraBase64) updateAppStateAction) async {
  // Add your function code here!

  JSFunction jsFn = ((web.CustomEvent event) {
    print("👉 Event type: ${event.type}");
    // print("👉 Event: ${event.initEvent.toString()}");
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Launch async task without returning Future
      await updateAppStateAction('${event.detail}');
    });
    // FFAppState().debugText1 = 'Event type: ${event.type}';
    // FFAppState().debugText2 = 'Event getProperty: ${event.detail}';
  }).toJS;

  web.window.addEventListener('fromFlutterMobile', jsFn!);
}
