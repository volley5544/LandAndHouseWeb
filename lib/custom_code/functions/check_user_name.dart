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

String? checkUserName(String? name) {
  if (name == null || name.length <= 2) {
    return name; // ถ้าชื่อเป็น null หรือมีความยาวน้อยกว่าหรือเท่ากับ 2 ตัวอักษร ให้คืนค่าชื่อเดิม
  } else {
    return name.substring(0, 2) +
        'x' * math.min(name.length - 2, 5); // ใช้ 'x' แต่ไม่เกิน 5 ตัว
  }
}
