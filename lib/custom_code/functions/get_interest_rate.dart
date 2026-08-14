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

String? getInterestRate(
  String? amount,
  dynamic dataLtv,
) {
  if (amount == null || dataLtv == null) return null;

  final amountValue = double.tryParse(amount) ?? 0;

  final List? conditions = dataLtv['interest_condition'];
  if (conditions == null || conditions.isEmpty) {
    return dataLtv['interest_rate_default'];
  }

  for (var condition in conditions) {
    final operator = condition['operator'];
    final compareField = condition['compare_fields'];

    final compareRaw = dataLtv[compareField];
    final compareValue = double.tryParse(compareRaw?.toString() ?? '') ?? 0;

    bool isMatch = false;

    switch (operator) {
      case '<=':
        isMatch = amountValue <= compareValue;
        break;
      case '<':
        isMatch = amountValue < compareValue;
        break;
      case '>=':
        isMatch = amountValue >= compareValue;
        break;
      case '>':
        isMatch = amountValue > compareValue;
        break;
      case '==':
        isMatch = amountValue == compareValue;
        break;
      default:
        isMatch = false;
    }

    if (isMatch) {
      return condition['interest_rate']?.toString();
    }
  }

  // fallback
  return dataLtv['interest_rate_default']?.toString();
}
