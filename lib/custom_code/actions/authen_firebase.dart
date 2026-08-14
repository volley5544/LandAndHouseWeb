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

import 'package:firebase_auth/firebase_auth.dart';

Future<String> authenFirebase() async {
  // Add your function code here!
  // await FirebaseAuth.instance.signInWithCustomToken(customToken!);
  // var fireBaseToken = await FirebaseAuth.instance.currentUser!.getIdToken(true);
  final auth = FirebaseAuth.instance;
  final customToken = null;

  try {
    final existing = auth.currentUser;

    // A custom token identifies a specific user, so it must win over an
    // anonymous session that may already be in place.
    if (customToken != null && customToken.isNotEmpty) {
      if (existing != null && !existing.isAnonymous) return existing.uid;
      final credential = await auth.signInWithCustomToken(customToken);
      return credential.user?.uid ?? '';
    }

    if (existing != null) return existing.uid;

    final credential = await auth.signInAnonymously();
    return credential.user?.uid ?? '';
  } catch (e) {
    // Never block app start on this. A failure here surfaces later as a 403 on
    // upload, which is the honest symptom; throwing here would blank the app.
    print('authenFirebase failed: $e');
    return '';
  }
}
