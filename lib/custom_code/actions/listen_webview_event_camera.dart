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

import 'dart:js_interop_unsafe';

import 'package:web/web.dart' as web;
import 'dart:js_interop';
import 'package:flutter/scheduler.dart';
import '/pages/loading/loading_widget.dart';

Future listenWebviewEventCamera(
  BuildContext context,
  Future Function(String cameraBase64, String actionNameOutput)
      updateAppStateAction,
) async {
  // Add your function code here!

  JSFunction jsFn = ((web.CustomEvent event) {
    print("👉 Event type: ${event.type}");
    // detail is a JS object (JSAny)
    final jsDetail = event.detail;

    final jsObject = jsDetail as JSObject;

    // Get as JSString, then convert
    final jsDataBase64 = jsObject.getProperty<JSString>('dataBase64'.toJS);
    final jsActionName = jsObject.getProperty<JSString>('actionName'.toJS);

    // Safely read its properties
    final dataBase64 = jsDataBase64.toDart;
    final actionName = jsActionName.toDart;

    // print("👉 Event: ${event.initEvent.toString()}");
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Launch async task without returning Future
      showDialog(
        context: context,
        builder: (dialogContext) {
          return Dialog(
            elevation: 0,
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            alignment:
                AlignmentDirectional(1, 1).resolve(Directionality.of(context)),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(dialogContext).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: LoadingWidget(),
            ),
          );
        },
      );
      await updateAppStateAction('${dataBase64}', '${actionName}');
      Navigator.pop(context);
    });
    // FFAppState().debugText1 = 'Event type: ${event.type}';
    // FFAppState().debugText2 = 'Event getProperty: ${event.detail}';
  }).toJS;

  web.window.addEventListener('fromFlutterMobile', jsFn!);
}
