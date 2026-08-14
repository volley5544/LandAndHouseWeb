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

String? formatToThaiDateWithMonth(
  String? dateInput,
  bool? timeFormat,
) {
  print('formatThaiDateFunc : ${dateInput!}');
  if (DateTime.tryParse('${dateInput!}') == null ||
      dateInput! == '' ||
      dateInput! == 'null') {
    print('formatThaiDateFunc If');
    return '';
  }
  print('formatThaiDateFunc 2');
  // DateTime dateTimeParse = DateTime.parse(dateInput!);
  DateTime dateTime = DateFormat("dd-MM-yyyy HH:mm").parse(dateInput!);
  print('formatThaiDateFunc 3');
  // Thai short month names
  List<String> thaiMonths = [
    '',
    'ม.ค.',
    'ก.พ.',
    'มี.ค.',
    'เม.ย.',
    'พ.ค.',
    'มิ.ย.',
    'ก.ค.',
    'ส.ค.',
    'ก.ย.',
    'ต.ค.',
    'พ.ย.',
    'ธ.ค.'
  ];
  print('formatThaiDateFunc 3.1');

  // Get Thai Buddhist Era year (year + 543)
  int buddhistYear = dateTime.year + 543;
  print('formatThaiDateFunc 3.1');
  // Use only last 2 digits of Buddhist year
  String yearShort = buddhistYear.toString().substring(2);
  print('formatThaiDateFunc 3.2');
  // Get date parts
  int day = dateTime.day;
  print('formatThaiDateFunc 3.3');
  String monthName = thaiMonths[dateTime.month];
  print('formatThaiDateFunc 3.4');
  String time = DateFormat('HH:mm').format(dateTime);
  print('formatThaiDateFunc 4');

  // Build final string
  if (timeFormat!) {
    return '$day $monthName $yearShort $time น.';
  } else {
    return '$day $monthName $yearShort';
  }
}
