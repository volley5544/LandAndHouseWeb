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

List<AgentCommisionHistoryDataModelStruct>? addDataToCommistion(
    List<AgentCommisionHistoryDataModelStruct>? listData) {
  // Auto-generate next installment number

  double sumPayAmt = 0;
  double sumTax = 0;
  double sumReceiveAmt = 0;
  double sumUnpaidAmt = 0;
  String lastNonEmptyRemaining = "0.00";
  // Loop through list and add up numeric fields
  for (final item in listData!) {
    sumPayAmt += double.tryParse(item.comPayAmt ?? '0') ?? 0;
    sumTax += double.tryParse(item.comTax ?? '0') ?? 0;
    sumReceiveAmt += double.tryParse(item.comReceiveAmt ?? '0') ?? 0;
    sumUnpaidAmt += double.tryParse(item.comUnpaidAmt ?? '0') ?? 0;
    if ((item.comRemainingAmt ?? '').isNotEmpty &
        (item.comPayStatus == 'จ่ายแล้ว')) {
      lastNonEmptyRemaining = item.comRemainingAmt!;
    }
  }
  String formatDouble(double value) => value.toStringAsFixed(2);
  // Create a new record
  final combinedRecord = AgentCommisionHistoryDataModelStruct(
    leadId: "",
    contNo: "",
    comPayStatus: "รวม",
    comInstallmentNo: "",
    comPayAmt: formatDouble(sumPayAmt),
    comTax: formatDouble(sumTax),
    comReceiveAmt: formatDouble(sumReceiveAmt),
    comUnpaidAmt: formatDouble(sumUnpaidAmt),
    comRemainingAmt: lastNonEmptyRemaining,
    comDueDate: "",
    comPaymentDate: "",
  );

  // Add new combined record to the list
  final updatedList = List<AgentCommisionHistoryDataModelStruct>.from(listData)
    ..add(combinedRecord);

  return updatedList;
}
