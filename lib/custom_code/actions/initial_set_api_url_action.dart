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

Future initialSetApiUrlAction() async {
  // Add your function code here!
  ApplicationRecord? queryUrl;

  queryUrl =
      await ApplicationRecord.getDocumentOnce(FFAppState().configDocument!);

  FFAppState().apiUrlDocData = queryUrl!.apiUrl;
  FFAppState().mgmUserManualUrl =
      '${FFAppState().apiUrlDocData.mgmUserManualUrl}';
  // print('Api Url : ${FFAppState().apiUrlDocData.agentWebApiUrlUat}');
}
