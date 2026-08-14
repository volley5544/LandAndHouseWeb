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

List<LeadAgentMainCatagoryStruct>? updateLeadMainData(
  List<LeadAgentMainCatagoryStruct>? mainLeadData,
  LeadAgentDataModelStruct? selectedLead,
  String? paymentMethodNew,
  String? comEstimateAmt,
  String? comEstimateVat,
  String? comEstimateNet,
) {
  print('woqiejoiqwjkopasd');

  List<LeadAgentMainCatagoryStruct> dataOutput = mainLeadData!;

  List<LeadAgentSubCategoryStruct> subCategoryNew = dataOutput[dataOutput
                  .map((data) => data.category)
                  .toList()
                  .toList()
                  .indexOf(selectedLead!.leadStatus) !=
              -1
          ? dataOutput
              .map((data) => data.category)
              .toList()
              .toList()
              .indexOf(selectedLead!.leadStatus) // เคสลูกค้าใหม่
          : dataOutput![dataOutput
                          .map((data) => data.category)
                          .toList()
                          .toList()
                          .indexOf('ปิดการขาย')]
                      .subCategory
                      .map((sub) => sub.subject)
                      .toList()
                      .toList()
                      .indexOf(selectedLead!.leadStatus) !=
                  -1
              ? dataOutput
                  .map((data) => data.category)
                  .toList()
                  .toList()
                  .indexOf('ปิดการขาย')
              : dataOutput
                  .map((data) => data.category)
                  .toList()
                  .toList()
                  .indexOf('อยู่ระหว่างดำเนินการ')]
      .subCategory;

  print('donesub');

  List<LeadAgentDataModelStruct> leadListNew = subCategoryNew[
          selectedLead!.leadStatus == 'ลูกค้าใหม่'
              ? 0
              : subCategoryNew
                  .map((items) => items.subject)
                  .toList()
                  .toList()
                  .indexOf(selectedLead.leadStatus)]
      .items;

  print('donelead');
// update payment method
  dataOutput[dataOutput
                  .map((data) => data.category)
                  .toList()
                  .toList()
                  .indexOf(selectedLead!.leadStatus) !=
              -1
          ? dataOutput
              .map((data) => data.category)
              .toList()
              .toList()
              .indexOf(selectedLead!.leadStatus)
          : dataOutput![dataOutput
                          .map((data) => data.category)
                          .toList()
                          .toList()
                          .indexOf('ปิดการขาย')]
                      .subCategory
                      .map((sub) => sub.subject)
                      .toList()
                      .toList()
                      .indexOf(selectedLead!.leadStatus) !=
                  -1
              ? dataOutput
                  .map((data) => data.category)
                  .toList()
                  .toList()
                  .indexOf('ปิดการขาย')
              : dataOutput
                  .map((data) => data.category)
                  .toList()
                  .toList()
                  .indexOf('อยู่ระหว่างดำเนินการ')]
      .subCategory[selectedLead!.leadStatus == 'ลูกค้าใหม่'
          ? 0
          : subCategoryNew
              .map((items) => items.subject)
              .toList()
              .toList()
              .indexOf(selectedLead.leadStatus)]
      .items[leadListNew
          .map((lead) => lead.id)
          .toList()
          .toList()
          .indexOf(selectedLead!.id)]
      .paymentMethod = '${paymentMethodNew!}';

  //update com_estimate_amt
  dataOutput[dataOutput
                  .map((data) => data.category)
                  .toList()
                  .toList()
                  .indexOf(selectedLead!.leadStatus) !=
              -1
          ? dataOutput
              .map((data) => data.category)
              .toList()
              .toList()
              .indexOf(selectedLead!.leadStatus)
          : dataOutput![dataOutput
                          .map((data) => data.category)
                          .toList()
                          .toList()
                          .indexOf('ปิดการขาย')]
                      .subCategory
                      .map((sub) => sub.subject)
                      .toList()
                      .toList()
                      .indexOf(selectedLead!.leadStatus) !=
                  -1
              ? dataOutput
                  .map((data) => data.category)
                  .toList()
                  .toList()
                  .indexOf('ปิดการขาย')
              : dataOutput
                  .map((data) => data.category)
                  .toList()
                  .toList()
                  .indexOf('อยู่ระหว่างดำเนินการ')]
      .subCategory[selectedLead!.leadStatus == 'ลูกค้าใหม่'
          ? 0
          : subCategoryNew
              .map((items) => items.subject)
              .toList()
              .toList()
              .indexOf(selectedLead.leadStatus)]
      .items[leadListNew
          .map((lead) => lead.id)
          .toList()
          .toList()
          .indexOf(selectedLead!.id)]
      .comEstimateAmt = '${comEstimateAmt!}';

//update com_estimate_vat_amt
  dataOutput[dataOutput
                  .map((data) => data.category)
                  .toList()
                  .toList()
                  .indexOf(selectedLead!.leadStatus) !=
              -1
          ? dataOutput
              .map((data) => data.category)
              .toList()
              .toList()
              .indexOf(selectedLead!.leadStatus)
          : dataOutput![dataOutput
                          .map((data) => data.category)
                          .toList()
                          .toList()
                          .indexOf('ปิดการขาย')]
                      .subCategory
                      .map((sub) => sub.subject)
                      .toList()
                      .toList()
                      .indexOf(selectedLead!.leadStatus) !=
                  -1
              ? dataOutput
                  .map((data) => data.category)
                  .toList()
                  .toList()
                  .indexOf('ปิดการขาย')
              : dataOutput
                  .map((data) => data.category)
                  .toList()
                  .toList()
                  .indexOf('อยู่ระหว่างดำเนินการ')]
      .subCategory[selectedLead!.leadStatus == 'ลูกค้าใหม่'
          ? 0
          : subCategoryNew
              .map((items) => items.subject)
              .toList()
              .toList()
              .indexOf(selectedLead.leadStatus)]
      .items[leadListNew
          .map((lead) => lead.id)
          .toList()
          .toList()
          .indexOf(selectedLead!.id)]
      .comEstimateNetAmt = '${comEstimateVat!}';

  //update com_estimate_net_amt
  dataOutput[dataOutput
                  .map((data) => data.category)
                  .toList()
                  .toList()
                  .indexOf(selectedLead!.leadStatus) !=
              -1
          ? dataOutput
              .map((data) => data.category)
              .toList()
              .toList()
              .indexOf(selectedLead!.leadStatus)
          : dataOutput![dataOutput
                          .map((data) => data.category)
                          .toList()
                          .toList()
                          .indexOf('ปิดการขาย')]
                      .subCategory
                      .map((sub) => sub.subject)
                      .toList()
                      .toList()
                      .indexOf(selectedLead!.leadStatus) !=
                  -1
              ? dataOutput
                  .map((data) => data.category)
                  .toList()
                  .toList()
                  .indexOf('ปิดการขาย')
              : dataOutput
                  .map((data) => data.category)
                  .toList()
                  .toList()
                  .indexOf('อยู่ระหว่างดำเนินการ')]
      .subCategory[selectedLead!.leadStatus == 'ลูกค้าใหม่'
          ? 0
          : subCategoryNew
              .map((items) => items.subject)
              .toList()
              .toList()
              .indexOf(selectedLead.leadStatus)]
      .items[leadListNew
          .map((lead) => lead.id)
          .toList()
          .toList()
          .indexOf(selectedLead!.id)]
      .comEstimateNetAmt = '${comEstimateNet!}';

  print('doneupdate');

  // dataOutput[dataOutput.indexOf(dataOutput.map((data) =>
  //     data.category.indexOf(
  //         data.category.indexOf(selectedLead!.leadStatus) != -1
  //             ? selectedLead!.leadStatus
  //             : 'ปิดการขาย'
  //     )
  // ))].subCategory[
  // selectedLead!.leadStatus == 'ลูกค้าใหม่' || selectedLead!.leadStatus == 'อยู่ระหว่างติดต่อลูกค้า'
  //     ? 0
  //     : subCategoryNew.indexOf(subCategoryNew.map((items) =>
  //     items.subject.indexOf(selectedLead.leadStatus)
  // ))
  // ].items[
  // leadListNew.indexOf(leadListNew.map((lead) =>
  //       lead.id.indexOf(selectedLead.id)
  //   ,))
  // ].paymentMethod = '${paymentMethodNew!}';

  return dataOutput!;
}
