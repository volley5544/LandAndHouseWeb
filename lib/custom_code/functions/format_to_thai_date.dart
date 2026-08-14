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

String? formatToThaiDate(String? isoDate) {
  if (DateTime.tryParse('${isoDate!}') == null ||
      isoDate! == '' ||
      isoDate! == 'null') {
    return '';
  }

  DateTime date = DateTime.parse(isoDate!);
  int thaiYear = date.year + 543;
  String formattedDate = "${date.day.toString().padLeft(2, '0')}/"
      "${date.month.toString().padLeft(2, '0')}/"
      "$thaiYear";
  return formattedDate;
}
