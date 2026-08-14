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

String? returnThaiDateFromNormalFormat(String? dateInput) {
  if (dateInput! == 'null' ||
      dateInput! == '' ||
      DateTime.parse('${dateInput!}') == null) {
    return '';
  }

  String formattedDate =
      DateFormat('yyyy-MM-dd').format(DateTime.parse('${dateInput!}'));

  String month = 'month';
  List<String> dateSplit = formattedDate!.split('-');
  String dateFormatted = '${dateSplit[0]}-${dateSplit[1]}-${dateSplit[2]}';
  String thaiYear = (int.parse(dateSplit[0]) + 543).toString();

  if (DateFormat('MMMM').format(DateTime.parse(dateFormatted)) == 'January') {
    month = 'ม.ค.';
  } else if (DateFormat('MMMM').format(DateTime.parse(dateFormatted)) ==
      'February') {
    month = 'ก.พ.';
  } else if (DateFormat('MMMM').format(DateTime.parse(dateFormatted)) ==
      'March') {
    month = 'มี.ค.';
  } else if (DateFormat('MMMM').format(DateTime.parse(dateFormatted)) ==
      'April') {
    month = 'เม.ย.';
  } else if (DateFormat('MMMM').format(DateTime.parse(dateFormatted)) ==
      'May') {
    month = 'พ.ค.';
  } else if (DateFormat('MMMM').format(DateTime.parse(dateFormatted)) ==
      'June') {
    month = 'มิ.ย.';
  } else if (DateFormat('MMMM').format(DateTime.parse(dateFormatted)) ==
      'July') {
    month = 'ก.ค.';
  } else if (DateFormat('MMMM').format(DateTime.parse(dateFormatted)) ==
      'August') {
    month = 'ส.ค.';
  } else if (DateFormat('MMMM').format(DateTime.parse(dateFormatted)) ==
      'September') {
    month = 'ก.ย.';
  } else if (DateFormat('MMMM').format(DateTime.parse(dateFormatted)) ==
      'October') {
    month = 'ต.ค.';
  } else if (DateFormat('MMMM').format(DateTime.parse(dateFormatted)) ==
      'November') {
    month = 'พ.ย.';
  } else if (DateFormat('MMMM').format(DateTime.parse(dateFormatted)) ==
      'December') {
    month = 'ธ.ค.';
  }

  return DateFormat(
    'dd $month ${thaiYear[2]}${thaiYear[3]}',
  ).format(DateTime.parse(dateFormatted));
}
