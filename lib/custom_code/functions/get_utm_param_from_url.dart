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

String? getUtmParamFromUrl(String? inputParam) {
  String? utmSource;
  String? utmMedium;
  String? utmCampaign;
  Uri uri = Uri.base;
  print(uri);

  // Extract query parameters
  utmSource = '${uri.queryParameters['utm_source']}' != 'null'
      ? '${uri.queryParameters['utm_source']}'
      : '${uri.queryParameters['utmSource']}';
  utmMedium = '${uri.queryParameters['utm_medium']}' != 'null'
      ? '${uri.queryParameters['utm_medium']}'
      : '${uri.queryParameters['utmMedium']}';
  utmCampaign = '${uri.queryParameters['utm_campaign']}' != 'null'
      ? '${uri.queryParameters['utm_campaign']}'
      : '${uri.queryParameters['utmCampaign']}';
  if ('${inputParam!}' == 'utm_source') {
    return '${utmSource!}';
  } else if ('${inputParam!}' == 'utm_medium') {
    return '${utmMedium!}';
  } else if ('${inputParam!}' == 'utm_campaign') {
    return '${utmCampaign!}';
  }

  print("utm_source: $utmSource");
  print("utm_medium: $utmMedium");
  print("utm_campaign: $utmCampaign");
  return '';
}
