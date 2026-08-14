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

dynamic generateListMapData() {
  dynamic dataOutput = [
    {
      "ins_code": "112",
      "ins_name": "ประกันคุ้มครองอุบัติเหตุกลุ่ม5544",
      "effective_date": "2025-06-28T00:00:00Z",
      "expired_date": "2026-06-28T00:00:00Z",
      "remark": "",
      "ins_url":
          "https://tpbonline.thaipaiboon.com/TPB_images/PA113P2_certificate/JPM680602017NF58X-CF425062975.pdf"
    },
    {
      "ins_code": "113",
      "ins_name": "ประกันคุ้มครองอุบัติเหตุกลุ่ม",
      "effective_date": "2025-06-28T00:00:00Z",
      "expired_date": "2026-06-28T00:00:00Z",
      "remark": "",
      "ins_url":
          "https://tpbonline.thaipaiboon.com/TPB_images/PA113P2_certificate/JPM680602017NF58X-CF425062975.pdf"
    }
  ];
  return dataOutput;
}
