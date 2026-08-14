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

String? returnNumberWithComma2Decimal(String? number) {
  if (number! == '' ||
      number! == null ||
      number!.trim().isEmpty ||
      number! == 'null' ||
      double.tryParse(number!) == null) {
    return '0.00';
  }

  // แปลง String เป็น Double และจัดการกรณีแปลงไม่สำเร็จ
  double parsedNumber = double.tryParse(number) ?? 0.0;

  // RegExp สำหรับใส่จุลภาค
  RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  String Function(Match) mathFunc = (Match match) => '${match[1]},';

  // แปลงเป็น String พร้อม .00 และใส่จุลภาค
  String formattedNumber = parsedNumber
      .toStringAsFixed(2) // แสดงทศนิยม 2 ตำแหน่ง
      .replaceFirst(RegExp(r'\.'), '#') // ป้องกัน . กระทบ regex
      .replaceAllMapped(reg, mathFunc) // ใส่จุลภาค
      .replaceFirst('#', '.'); // คืนจุดทศนิยมกลับมา

  return formattedNumber;
}
