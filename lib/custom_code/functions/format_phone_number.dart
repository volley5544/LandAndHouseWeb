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

String? formatPhoneNumber(String? input) {
  if (input == null || input.isEmpty) {
    return 'หมายเลขโทรศัพท์ไม่ถูกต้อง';
  }

  // กรองเฉพาะตัวเลข
  String phoneNumber = input.replaceAll(RegExp(r'[^0-9]'), '');

  // ตรวจสอบว่าเบอร์โทรศัพท์มีตัวหน้าสุดเป็นเลข 0 หรือไม่
  if (phoneNumber.isNotEmpty && phoneNumber[0] != '0') {
    return 'หมายเลขโทรศัพท์ไม่ถูกต้อง (ตัวแรกต้องเป็นเลข 0)';
  }
  // หากหมายเลขถูกต้อง และมีความยาว 10 ตัว
  else if (phoneNumber.length == 10) {
    return phoneNumber[0] +
        phoneNumber[1] +
        'X' +
        '-' +
        'X' +
        'X' +
        'X' +
        '-' +
        'X' +
        phoneNumber[7] +
        phoneNumber[8] +
        phoneNumber[9];
  }
  // หากมีความยาว 9 ตัว
  else if (phoneNumber.length == 9) {
    return phoneNumber[0] +
        phoneNumber[1] +
        '-' +
        'X' +
        'X' +
        'X' +
        '-' +
        'X' +
        phoneNumber[6] +
        phoneNumber[7] +
        phoneNumber[8];
  }
  // หากมีความยาว 4 ตัว
  else if (phoneNumber.length == 4) {
    return phoneNumber[0] + 'X' + 'X' + phoneNumber[3];
  }
  // หากไม่ตรงตามเงื่อนไขใดๆ
  else {
    return 'หมายเลขโทรศัพท์ไม่ถูกต้อง';
  }
}
