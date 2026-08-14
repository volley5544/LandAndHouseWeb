import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '/flutter_flow/custom_functions.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/custom_auth/auth_util.dart';

String? rawangFormattedFunction(String? rawangText) {
  String rawang = rawangText!.replaceAll(' ', '');
  rawang = rawang.replaceAll('-', '');
  String outputRawang = '';
  if (rawang!.length == 11) {
    outputRawang =
        '${rawang!.substring(0, 4)} ${rawang!.substring(4, 5)} ${rawang!.substring(5, 9)} ${rawang!.substring(9, 11)}';
  } else if (rawang!.length == 12) {
    outputRawang =
        '${rawang!.substring(0, 4)} ${rawang!.substring(4, 6)} ${rawang!.substring(6, 10)} ${rawang!.substring(10, 12)}';
  } else if (rawang!.length == 13) {
    outputRawang =
        '${rawang!.substring(0, 4)} ${rawang!.substring(4, 7)} ${rawang!.substring(7, 11)} ${rawang!.substring(11, 13)}';
  } else if (rawang!.length > 13) {
    outputRawang =
        '${rawang!.substring(0, 4)} ${rawang!.substring(4, 7)} ${rawang!.substring(7, 11)} ${rawang!.substring(11, 13)}';
  } else {
    outputRawang = rawang!;
  }

  return outputRawang;
}
