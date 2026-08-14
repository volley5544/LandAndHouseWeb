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

List<int>? getTrueIndexes(List<bool>? statuses) {
  if (statuses == null) {
    return []; // หาก statuses เป็น null ให้คืนลิสต์ว่าง
  }

  List<int> trueIndexes = [];

  for (int i = 0; i < statuses.length; i++) {
    if (statuses[i]) {
      trueIndexes.add(i); // ถ้ามีค่า true ให้เก็บตำแหน่งไว้
    }
  }

  return trueIndexes; // ส่งคืนตำแหน่งที่ค่าเป็น true
}
