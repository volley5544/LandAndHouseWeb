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

List<TenorListDataModelStruct>? returnTenorList(dynamic insuranceInfoData) {
  List<TenorListDataModelStruct> outputList = [];
  Map<String, dynamic> mapData = insuranceInfoData as Map<String, dynamic>;

  print(mapData.keys);
  List<String> listName = mapData.keys.toList();
  print(listName);

  List<Map<String, dynamic>> listMap = [];

  for (int i = 0; i < listName.length; i++) {
    TenorListDataModelStruct tenorDataModel =
        mapData['${listName[i]}'] as TenorListDataModelStruct;
    outputList.add(tenorDataModel);
  }
  print(outputList);
  //print(listMap);

  // Map<String,dynamic> mapData = {
  //   "8": {
  //     "tenor": "8",
  //     "installment_first_due": "2312",
  //     "installment_last_due": "2316.23",
  //     "payment_first": "2312",
  //     "tenor_first_due": [
  //       "1",
  //       "2",
  //       "3"
  //     ],
  //     "tenor_first_due_default": [
  //       "2"
  //     ]
  //   },
  //   "10": {
  //     "tenor": "10",
  //     "installment_first_due": "1850",
  //     "installment_last_due": "1850.23",
  //     "payment_first": "1850",
  //     "tenor_first_due": [
  //       "1",
  //       "2",
  //       "3"
  //     ],
  //     "tenor_first_due_default": [
  //       "2"
  //     ]
  //   },
  //   "12": {
  //     "tenor": "12",
  //     "installment_first_due": "1541",
  //     "installment_last_due": "1549.23",
  //     "payment_first": "1541",
  //     "tenor_first_due": [
  //       "1",
  //       "2",
  //       "3"
  //     ],
  //     "tenor_first_due_default": [
  //       "3"
  //     ]
  //   }
  // };
  // print(mapData.keys);
  // List<String> listName = mapData.keys.toList();
  // print(listName);
  //
  // List<Map<String,dynamic>> listMap = [];
  //
  // for(int i = 0; i < listName.length; i++){
  //   Map<String,dynamic> tenorDataModel = mapData['${listName[i]}'];
  //   listMap.add(tenorDataModel);
  // }
  //
  // print(listMap);

  return outputList;
}
