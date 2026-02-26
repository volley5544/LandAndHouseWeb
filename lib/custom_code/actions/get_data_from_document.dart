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

import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<dynamic> getDataFromDocument(String path, String? field) async {
  try {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    DocumentSnapshot documentSnapshot = await firestore.doc(path).get();

    if (documentSnapshot.exists) {
      Map<String, dynamic>? data =
          documentSnapshot.data() as Map<String, dynamic>?;

      if (data != null) {
        if (field != null && field.isNotEmpty) {
          if (data.containsKey(field)) {
            var fieldValue = data[field];
            print('$field: $fieldValue');
            if (fieldValue is Map<String, dynamic>) {
              return fieldValue;
            }
            if (fieldValue is List) {
              return fieldValue;
            }

            return fieldValue;
          } else {
            print('Field "$field" does not exist in document');
          }
        } else {
          return data;
        }
      }
    } else {
      print('Document does not exist at $path');
    }
  } catch (e) {
    print('Error: $e');
  }
  return null;
}
