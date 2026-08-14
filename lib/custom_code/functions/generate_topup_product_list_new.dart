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

List<ProductsStruct>? generateTopupProductListNew(
  List<ProductsStruct>? productData1,
  String? defaultTopupAmount,
) {
  List<ProductsStruct> productOutput = [];
  if (productData1!.length > 0) {
    productOutput = productData1!;
  }

  ProductsStruct topupOther = ProductsStruct(
      productPrice: double.parse(defaultTopupAmount!).toInt(),
      productCode: 'OTR001',
      productName: 'อื่นๆ',
      productDescription: '');

  productOutput.add(topupOther);
//
  return productOutput;
}
