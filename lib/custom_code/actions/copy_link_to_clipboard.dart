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

import 'package:flutter/services.dart';

Future copyLinkToClipboard(
  BuildContext context,
  String? text,
) async {
  // Add your function code here!
  await Clipboard.setData(ClipboardData(text: text!));

  // Show SnackBar at bottom
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text("✅ Link copied to clipboard"),
      duration: Duration(seconds: 2),
    ),
  );
}
