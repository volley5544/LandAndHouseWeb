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

List<String>? createUniqueValueListLabel(List<String>? inputList) {
  List<String> outputList = [];
  for (int i = 0; i < inputList!.length; i++) {
    if (inputList![i] == 'loan') {
      outputList.add('สินเชื่อ');
    } else if (inputList![i] == 'insurance') {
      outputList.add('ประกัน');
    } else if (inputList![i] == 'one_time') {
      outputList.add('รับทันที');
    } else if (inputList![i] == 'installment') {
      outputList.add('รับแบบแบ่งจ่าย');
    } else if (inputList![i] == 'bank_account') {
      outputList.add('บัญชีธนาคาร');
    } else if (inputList![i] == 'promptpay') {
      outputList.add('พร้อมเพย์');
    } else {
      outputList.add(inputList![i]);
    }
  }

  return outputList;
}
