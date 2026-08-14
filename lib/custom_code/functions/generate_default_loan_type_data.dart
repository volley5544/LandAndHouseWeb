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

List<MasterLoanTypeDataModelStruct>? generateDefaultLoanTypeData() {
  List<MasterLoanTypeDataModelStruct> outputList = [];

  MasterLoanTypeDataModelStruct loanType1 = MasterLoanTypeDataModelStruct(
      loanTypeId: '1',
      loanTypeCode: 'H',
      loanTypeName: 'ที่ดินพร้อมสิ่งปลูกสร้าง');
  MasterLoanTypeDataModelStruct loanType2 = MasterLoanTypeDataModelStruct(
      loanTypeId: '2', loanTypeCode: 'L', loanTypeName: 'ที่ดินเปล่า');
  MasterLoanTypeDataModelStruct loanType3 = MasterLoanTypeDataModelStruct(
      loanTypeId: '3', loanTypeCode: 'M', loanTypeName: 'รถมอเตอร์ไซค์');
  MasterLoanTypeDataModelStruct loanType4 = MasterLoanTypeDataModelStruct(
      loanTypeId: '4', loanTypeCode: 'C', loanTypeName: 'รถเก๋ง');
  MasterLoanTypeDataModelStruct loanType5 = MasterLoanTypeDataModelStruct(
      loanTypeId: '5', loanTypeCode: 'CA', loanTypeName: 'รถกระบะ (ตอนเดียว)');
  MasterLoanTypeDataModelStruct loanType6 = MasterLoanTypeDataModelStruct(
      loanTypeId: '6', loanTypeCode: 'CB', loanTypeName: 'รถกระบะ (แคป)');
  MasterLoanTypeDataModelStruct loanType7 = MasterLoanTypeDataModelStruct(
      loanTypeId: '7', loanTypeCode: 'CC', loanTypeName: 'รถกระบะ (4 ประตู)');
  MasterLoanTypeDataModelStruct loanType8 = MasterLoanTypeDataModelStruct(
      loanTypeId: '8', loanTypeCode: 'V', loanTypeName: 'รถตู้');
  MasterLoanTypeDataModelStruct loanType9 = MasterLoanTypeDataModelStruct(
      loanTypeId: '9', loanTypeCode: 'TA', loanTypeName: 'รถบรรทุก(4 ล้อ)');
  MasterLoanTypeDataModelStruct loanType10 = MasterLoanTypeDataModelStruct(
      loanTypeId: '10', loanTypeCode: 'TB', loanTypeName: 'รถบรรทุก(6 ล้อ)');
  MasterLoanTypeDataModelStruct loanType11 = MasterLoanTypeDataModelStruct(
      loanTypeId: '11', loanTypeCode: 'TC', loanTypeName: 'รถบรรทุก(10 ล้อ)');
  MasterLoanTypeDataModelStruct loanType12 = MasterLoanTypeDataModelStruct(
      loanTypeId: '12', loanTypeCode: 'TD', loanTypeName: 'รถบรรทุก(12 ล้อ)');

  outputList.addAll([
    loanType1,
    loanType2,
    loanType3,
    loanType4,
    loanType5,
    loanType6,
    loanType7,
    loanType8,
    loanType9,
    loanType10,
    loanType11,
    loanType12
  ]);

  return outputList;
}
