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

String? returnBankName(String? bankShortName) {
  switch (bankShortName!) {
    case 'BBL':
      return 'ธนาคารกรุงเทพ';
    case 'TTB':
      return 'ธนาคารทีเอ็มบีธนชาต';
    case 'LHB':
      return 'ธนาคารแลนด์ แอนด์ เฮ้าส์';
    case 'SCBT':
      return 'ธนาคารสแตนดาร์ดชาร์เตอร์ด (ไทย)';
    case 'IBANK':
      return 'ธนาคารอิสลามแห่งประเทศไทย';
    case 'GHB':
      return 'ธนาคารอาคารสงเคราะห์';
    case 'GSB':
      return 'ธนาคารออมสิน';
    case 'EXIM':
      return 'ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย';
    case 'BAAC':
      return 'ธนาคารเพื่อการเกษตรและสหกรณ์การเกษตร';
    case 'KTB':
      return 'ธนาคารกรุงไทย';
    case 'UOB':
      return 'ธนาคารยูโอบี';
    case 'TBANK':
      return 'ธนาคารธนชาต';
    case 'SCB':
      return 'ธนาคารไทยพาณิชย์';
    case 'TISCO':
      return 'ธนาคารทิสโก้';
    case 'CIMB':
      return 'ธนาคารซีไอเอ็มบีไทย';
    case 'KK':
      return 'ธนาคารเกียรตินาคิน';
    case 'KBANK':
      return 'ธนาคารกสิกรไทย';
    case 'BAY':
      return 'ธนาคารกรุงศรีอยุธยา';
    case 'TMB':
      return 'ธนาคารทหารไทย';
    case 'TNC':
      return 'ธนาคารธนชาต';
    default:
      return bankShortName!;
  }
}
