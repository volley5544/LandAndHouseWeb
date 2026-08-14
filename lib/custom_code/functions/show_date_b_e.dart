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

String? showDateBE(String? inputDateStr) {
  if (DateTime.tryParse('${inputDateStr!}') == null ||
      inputDateStr! == '' ||
      inputDateStr! == 'null') {
    return '';
  }

  final datetimeFormatDate = DateFormat('dd/MM/y');
  String datetimeDate =
      datetimeFormatDate.format(DateTime.parse(inputDateStr!));
  print(datetimeDate);

  List<String> splitDate = datetimeDate.split('/');
  print(splitDate);
  String dateBE =
      '${splitDate[0]}/${splitDate[1]}/${int.parse(splitDate[2]) + 543}';
  print(dateBE);
  return dateBE;
}
