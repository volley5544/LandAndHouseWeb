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

List<bool>? setSelectedData(
  int? listLength,
  int? index,
) {
  List<bool> statuses = List.filled(listLength!, false);

  statuses[index!] = true; // เปลี่ยนตำแหน่งที่ 6 (index 5) ให้เป็น true
  //print(statuses);  // แสดงผลใหม่หลังจากการเปลี่ยนค่า
  return statuses;
}
