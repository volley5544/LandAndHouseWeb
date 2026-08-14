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

bool? checkRawang(String? input) {
  // ฟังก์ชันตรวจสอบเลขโรมัน
  bool isValidRoman(String roman) {
    // กำหนดรูปแบบที่ถูกต้องของเลขโรมัน (จาก I ถึง IV)
    RegExp romanPattern = RegExp(r'^(I|II|III|IV)$');
    return romanPattern.hasMatch(roman);
  }

  // Regular expression แก้ไขตามเงื่อนไขใหม่
  RegExp pattern =
      RegExp(r'^\d{4} ([IVXLCDM]{1,3}) \d{4} ([0-5][0-9]|6[0-4])$');

  // ตรวจสอบว่า input ตรงกับรูปแบบที่กำหนดหรือไม่
  if (input != null && pattern.hasMatch(input)) {
    // หากตรงกับ pattern จะแยกเลขโรมันออกมา
    var romanMatch = pattern.firstMatch(input); // ใช้ input ที่มาจากภายนอก
    String roman = romanMatch?.group(1) ?? ''; // เอาค่าเลขโรมัน

    // ตรวจสอบว่าเลขโรมันถูกต้องหรือไม่
    if (isValidRoman(roman)) {
      return true; // หากเลขโรมันถูกต้อง
    } else {
      return false; // หากเลขโรมันไม่ถูกต้อง
    }
  } else {
    return false; // หาก input ไม่ตรงกับ pattern หรือเป็น null
  }
}
