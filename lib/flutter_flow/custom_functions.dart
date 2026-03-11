import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/custom_auth/auth_util.dart';

int? findIndexInList(
  List<String>? dataList,
  String? searchInput,
) {
  // Find the index of an item
  int index = dataList!.indexOf(searchInput!);

  return index;
}

bool? validatePasswordSeparate(
  String? input,
  String? sub,
) {
  final hasLowercase = RegExp(r'[a-z]').hasMatch(input!);
  final hasUppercase = RegExp(r'[A-Z]').hasMatch(input!);
  final hasNumber = RegExp(r'[0-9]').hasMatch(input!);
  final hasSpecial =
      RegExp(r'[!@#\$%\^&\*\(\)_+\-=\[\]{};:"\\|,.<>\/?]').hasMatch(input!);
  final sixCharacter = input.length >= 6;
  switch (sub) {
    case 'lower':
      return hasLowercase;
    case 'upper':
      return hasUppercase;
    case 'special':
      return hasSpecial;
    case 'length':
      return sixCharacter;
    case 'number':
      return hasNumber;
    case 'all':
      return hasLowercase &&
          hasUppercase &&
          hasSpecial &&
          sixCharacter &&
          hasNumber;
    default:
      return false;
  }
}

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

List<LeadAgentDataModelStruct>? returnLeadAgentItemEmptyList() {
  List<LeadAgentDataModelStruct> outputList = [];

  return outputList;
}

List<InstallmentsStruct> reversedListInstallment(
    List<InstallmentsStruct> listInstallment) {
  List<InstallmentsStruct> reversedList = listInstallment.reversed.toList();

  // Return the reversed list
  return reversedList;
}

String? addDashPhoneNumber(String? input) {
  if (input == null || input.isEmpty) {
    return 'หมายเลขโทรศัพท์ไม่ถูกต้อง';
  }

  // กรองเฉพาะตัวเลข
  String phoneNumber = input.replaceAll(RegExp(r'[^0-9]'), '');

  // ตรวจสอบว่าเบอร์โทรศัพท์มีตัวหน้าสุดเป็นเลข 0 หรือไม่
  if (phoneNumber.isNotEmpty && phoneNumber[0] != '0') {
    return 'หมายเลขโทรศัพท์ไม่ถูกต้อง (ตัวแรกต้องเป็นเลข 0)';
  }
  // หากหมายเลขถูกต้อง และมีความยาว 10 ตัว
  else if (phoneNumber.length == 10) {
    return phoneNumber[0] +
        phoneNumber[1] +
        phoneNumber[2] +
        '-' +
        phoneNumber[3] +
        phoneNumber[4] +
        phoneNumber[5] +
        '-' +
        phoneNumber[6] +
        phoneNumber[7] +
        phoneNumber[8] +
        phoneNumber[9];
  }
  // หากมีความยาว 9 ตัว
  else if (phoneNumber.length == 9) {
    return phoneNumber[0] +
        phoneNumber[1] +
        '-' +
        phoneNumber[2] +
        phoneNumber[3] +
        phoneNumber[4] +
        '-' +
        phoneNumber[5] +
        phoneNumber[6] +
        phoneNumber[7] +
        phoneNumber[8];
  }
  // หากมีความยาว 4 ตัว
  else if (phoneNumber.length == 4) {
    return phoneNumber[0] + phoneNumber[1] + phoneNumber[2] + phoneNumber[3];
  }
  // หากไม่ตรงตามเงื่อนไขใดๆ
  else {
    return 'หมายเลขโทรศัพท์ไม่ถูกต้อง';
  }
}

bool? checkPhoneNumberCharCopy(String? text) {
  bool isPhoneNumber = false;

  if ((text!.length == 10) && (text![0] == "0")) {
    isPhoneNumber = true;
  }
  return isPhoneNumber;
}

bool? containString(
  String? searchWord,
  String? containWord,
) {
  // Check if the string contains a substring
  bool isContains = containWord!.contains(searchWord!);

  return isContains;
}

String? removeCommaFromNumText(String? numberText) {
  String result = numberText!.replaceAll(RegExp('[^A-Za-z0-9.]'), '');

  if (double.tryParse(result!) == null) {
    return '0.00';
  }

  return result;
}

String? returnNumberWithCommaFullNumber(
  String? number,
  String? defaultValue,
) {
  if (number == '' || number == 'null' || double.tryParse(number!) == null) {
    if (double.tryParse(defaultValue!) == null) {
      return '0';
    } else {
      RegExp reg1 = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
      String Function(Match) mathFunc1 = (Match match) => '${match[1]},';

      String result1 =
          '${double.parse(defaultValue!)}'.replaceAllMapped(reg1, mathFunc1);

      return result1!.split('.').first;
    }
  }

  RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  String Function(Match) mathFunc = (Match match) => '${match[1]},';

  String result = '${double.parse(number!)}'.replaceAllMapped(reg, mathFunc);

  return result!.split('.').first;

  // if (number == null || number.trim().isEmpty || number == 'null') {
  //return '0.00';
  //}

  // แปลง String เป็น Double และจัดการกรณีแปลงไม่สำเร็จ
  // double parsedNumber = double.tryParse(number) ?? 0.0;

  // RegExp สำหรับใส่จุลภาค
  //RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  //String Function(Match) mathFunc = (Match match) => '${match[1]},';

  // แปลงเป็น String พร้อม .00 และใส่จุลภาค
  // String formattedNumber = parsedNumber
  //    .toStringAsFixed(2) // แสดงทศนิยม 2 ตำแหน่ง
  //  .replaceFirst(RegExp(r'\.'), '#') // ป้องกัน . กระทบ regex
  //.replaceAllMapped(reg, mathFunc) // ใส่จุลภาค
  //.replaceFirst('#', '.'); // คืนจุดทศนิยมกลับมา

  //return formattedNumber;
}

String? formatPhoneNumber(String? input) {
  if (input == null || input.isEmpty) {
    return 'หมายเลขโทรศัพท์ไม่ถูกต้อง';
  }

  // กรองเฉพาะตัวเลข
  String phoneNumber = input.replaceAll(RegExp(r'[^0-9]'), '');

  // ตรวจสอบว่าเบอร์โทรศัพท์มีตัวหน้าสุดเป็นเลข 0 หรือไม่
  if (phoneNumber.isNotEmpty && phoneNumber[0] != '0') {
    return 'หมายเลขโทรศัพท์ไม่ถูกต้อง (ตัวแรกต้องเป็นเลข 0)';
  }
  // หากหมายเลขถูกต้อง และมีความยาว 10 ตัว
  else if (phoneNumber.length == 10) {
    return phoneNumber[0] +
        phoneNumber[1] +
        'X' +
        '-' +
        'X' +
        'X' +
        'X' +
        '-' +
        'X' +
        phoneNumber[7] +
        phoneNumber[8] +
        phoneNumber[9];
  }
  // หากมีความยาว 9 ตัว
  else if (phoneNumber.length == 9) {
    return phoneNumber[0] +
        phoneNumber[1] +
        '-' +
        'X' +
        'X' +
        'X' +
        '-' +
        'X' +
        phoneNumber[6] +
        phoneNumber[7] +
        phoneNumber[8];
  }
  // หากมีความยาว 4 ตัว
  else if (phoneNumber.length == 4) {
    return phoneNumber[0] + 'X' + 'X' + phoneNumber[3];
  }
  // หากไม่ตรงตามเงื่อนไขใดๆ
  else {
    return 'หมายเลขโทรศัพท์ไม่ถูกต้อง';
  }
}

bool? checkRawang(String? input) {
  // ฟังก์ชันตรวจสอบเลขโรมัน
  bool isValidRoman(String roman) {
    // กำหนดรูปแบบที่ถูกต้องของเลขโรมัน (จาก I ถึง IV)
    RegExp romanPattern = RegExp(r'^(I|II|III|IV)$');
    return romanPattern.hasMatch(roman);
  }

  // Regular expression แก้ไขตามเงื่อนไขใหม่
  RegExp pattern =
      RegExp(r'^\d{4} ([IVXLCDM]{1,3}) \d{4} ([0-5][0-9]|6[0-4])$');

  // ตรวจสอบว่า input ตรงกับรูปแบบที่กำหนดหรือไม่
  if (input != null && pattern.hasMatch(input)) {
    // หากตรงกับ pattern จะแยกเลขโรมันออกมา
    var romanMatch = pattern.firstMatch(input); // ใช้ input ที่มาจากภายนอก
    String roman = romanMatch?.group(1) ?? ''; // เอาค่าเลขโรมัน

    // ตรวจสอบว่าเลขโรมันถูกต้องหรือไม่
    if (isValidRoman(roman)) {
      return true; // หากเลขโรมันถูกต้อง
    } else {
      return false; // หากเลขโรมันไม่ถูกต้อง
    }
  } else {
    return false; // หาก input ไม่ตรงกับ pattern หรือเป็น null
  }
}

String? rawangFormattedFunction(String? rawangText) {
  String rawang = rawangText!.replaceAll(' ', '');
  rawang = rawang.replaceAll('-', '');
  String outputRawang = '';
  if (rawang!.length == 11) {
    outputRawang =
        '${rawang!.substring(0, 4)} ${rawang!.substring(4, 5)} ${rawang!.substring(5, 9)} ${rawang!.substring(9, 11)}';
  } else if (rawang!.length == 12) {
    outputRawang =
        '${rawang!.substring(0, 4)} ${rawang!.substring(4, 6)} ${rawang!.substring(6, 10)} ${rawang!.substring(10, 12)}';
  } else if (rawang!.length == 13) {
    outputRawang =
        '${rawang!.substring(0, 4)} ${rawang!.substring(4, 7)} ${rawang!.substring(7, 11)} ${rawang!.substring(11, 13)}';
  } else if (rawang!.length > 13) {
    outputRawang =
        '${rawang!.substring(0, 4)} ${rawang!.substring(4, 7)} ${rawang!.substring(7, 11)} ${rawang!.substring(11, 13)}';
  } else {
    outputRawang = rawang!;
  }

  return outputRawang;
}

String? replaceSpaceInText(String? textInput) {
  return textInput!.replaceAll(' ', '');
}

DateTime? parseStringDateToDateTime(String? stringDate) {
  return DateTime.parse(stringDate!);
}

String? checkUserName(String? name) {
  if (name == null || name.length <= 2) {
    return name; // ถ้าชื่อเป็น null หรือมีความยาวน้อยกว่าหรือเท่ากับ 2 ตัวอักษร ให้คืนค่าชื่อเดิม
  } else {
    return name.substring(0, 2) +
        'x' * math.min(name.length - 2, 5); // ใช้ 'x' แต่ไม่เกิน 5 ตัว
  }
}

String? censorName(
  String? name,
  int? showLength,
) {
  if (name == null || name.length <= showLength!) {
    return name; // ถ้าชื่อเป็น null หรือมีความยาวน้อยกว่าหรือเท่ากับ 2 ตัวอักษร ให้คืนค่าชื่อเดิม
  } else {
    return name.substring(0, showLength!) +
        'x' *
            math.min(name.length - showLength!, 5); // ใช้ 'x' แต่ไม่เกิน 5 ตัว
  }
}

List<bool>? setSelectedData(
  int? listLength,
  int? index,
) {
  List<bool> statuses = List.filled(listLength!, false);

  statuses[index!] = true; // เปลี่ยนตำแหน่งที่ 6 (index 5) ให้เป็น true
  //print(statuses);  // แสดงผลใหม่หลังจากการเปลี่ยนค่า
  return statuses;
}

List<bool>? generateFalseListByNumItem(int? listLength) {
  List<bool> statuses = List.filled(listLength!, false);

  //print(statuses);  // แสดงผลใหม่หลังจากการเปลี่ยนค่า
  return statuses;
}

List<int>? getTrueIndexes(List<bool>? statuses) {
  if (statuses == null) {
    return []; // หาก statuses เป็น null ให้คืนลิสต์ว่าง
  }

  List<int> trueIndexes = [];

  for (int i = 0; i < statuses.length; i++) {
    if (statuses[i]) {
      trueIndexes.add(i); // ถ้ามีค่า true ให้เก็บตำแหน่งไว้
    }
  }

  return trueIndexes; // ส่งคืนตำแหน่งที่ค่าเป็น true
}

List<ChanodData3Struct> reversedList(List<ChanodData3Struct> list1) {
  // Reverse the list
  List<ChanodData3Struct> reversedList = list1.reversed.toList();

  // Print the reversed list (optional, for debugging)
  print('Reversed List: $reversedList');

  // Return the reversed list
  return reversedList;
}

List<AssignLeadMCDataModelStruct> reversedListLeadMC(
    List<AssignLeadMCDataModelStruct> list1) {
  // Reverse the list
  List<AssignLeadMCDataModelStruct> reversedList = list1.reversed.toList();

  // Print the reversed list (optional, for debugging)
  print('Reversed List: $reversedList');

  // Return the reversed list
  return reversedList;
}

String? returnNumberWithComma2Decimal(String? number) {
  if (number! == '' ||
      number! == null ||
      number!.trim().isEmpty ||
      number! == 'null' ||
      double.tryParse(number!) == null) {
    return '0.00';
  }

  // แปลง String เป็น Double และจัดการกรณีแปลงไม่สำเร็จ
  double parsedNumber = double.tryParse(number) ?? 0.0;

  // RegExp สำหรับใส่จุลภาค
  RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  String Function(Match) mathFunc = (Match match) => '${match[1]},';

  // แปลงเป็น String พร้อม .00 และใส่จุลภาค
  String formattedNumber = parsedNumber
      .toStringAsFixed(2) // แสดงทศนิยม 2 ตำแหน่ง
      .replaceFirst(RegExp(r'\.'), '#') // ป้องกัน . กระทบ regex
      .replaceAllMapped(reg, mathFunc) // ใส่จุลภาค
      .replaceFirst('#', '.'); // คืนจุดทศนิยมกลับมา

  return formattedNumber;
}

bool? checkPhoneNumberChar(String? text) {
  bool isPhoneNumber = false;

  if ((text!.length == 9 || text!.length == 10) && (text![0] == "0")) {
    isPhoneNumber = true;
  }
  return isPhoneNumber;
}

String? replaceEnterInStringText(String? inputString) {
  String output = inputString!.replaceAll('\n', '');
  return output;
}

String? removeDash(String? input) {
  String output = input!.replaceAll('-', '');

  return output;
}

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

List<bool>? createFalseList(String? listLength) {
  if (listLength == null) return null;

  int? length = int.tryParse(listLength);
  if (length == null || length < 0) return null;

  List<bool> falseList = List.filled(length, false);
  return falseList;
}

String? stringToImgPath(String? input) {
  return input!;
}

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

int? findTrueInBoolList(List<bool>? boolList) {
  int index = boolList!.indexOf(true);

  return index;
}

int? roundDownInput(String? input) {
  if (int.tryParse(input!) == null) {
    return 0;
  }

  int rounded = (int.parse(input!) ~/ 100) * 100;
  return rounded;
}

String? genQRCodePayment(
  String? suffix,
  String? ref1,
  String? ref2,
  String? amount,
  String? taxId,
) {
  double originalValue = double.parse(amount!);

  // Step 2: Perform the Multiplication
  double multipliedValue = originalValue * 100;

  // Step 3: Format the Result with 2 decimal places
  String amount100 = multipliedValue.toString();
  String data = '''
|$taxId$suffix
$ref1
$ref2
$amount100
''';
  return data;
}

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

String? parseDateTimeToString(String? dateTime) {
  if (DateTime.tryParse('${dateTime!}') == null ||
      dateTime! == '' ||
      dateTime! == 'null') {
    return '';
  }

  DateTime date = DateTime.parse(dateTime!)
      .toLocal(); // Adjust for local timezone if needed
  int buddhistYear = date!.year + 543;
  String day = date.day.toString().padLeft(2, '0');
  String month = date.month.toString().padLeft(2, '0');

  return '$day/$month/$buddhistYear';
}

String? getLatLngStringFromDevice(
  LatLng? currentLo,
  String? data,
) {
  if (data == "lat") {
    return "${currentLo!.latitude}";
  } else {
    return "${currentLo!.longitude}";
  }
}

bool? isCurrentDateBeforeDateInput(
  String? dateInput,
  String? dateTimeNow,
) {
  if (dateInput == 'null') {
    return false;
  }
  DateTime latestDate = DateTime.parse(dateInput!);

  // Get the current date
  DateTime now = DateTime.parse(dateTimeNow!);

  // Compare just the date (without time)
  DateTime currentDateOnly = DateTime(now.year, now.month, now.day);
  DateTime latestDateOnly =
      DateTime(latestDate.year, latestDate.month, latestDate.day);

  // Return true if current date is before latest date
  return currentDateOnly.isBefore(latestDateOnly);
}

String? formatToThaiDate(String? isoDate) {
  if (DateTime.tryParse('${isoDate!}') == null ||
      isoDate! == '' ||
      isoDate! == 'null') {
    return '';
  }

  DateTime date = DateTime.parse(isoDate!);
  int thaiYear = date.year + 543;
  String formattedDate = "${date.day.toString().padLeft(2, '0')}/"
      "${date.month.toString().padLeft(2, '0')}/"
      "$thaiYear";
  return formattedDate;
}

String? maskPhone(String? phoneNumber) {
  if (phoneNumber!.length != 10)
    return phoneNumber; // simple check for Thai phone number length

  String result =
      '${phoneNumber.substring(0, 3)}-XXX-${phoneNumber.substring(6)}';

  return result;
}

String? showDateBE(String? inputDateStr) {
  if (DateTime.tryParse('${inputDateStr!}') == null ||
      inputDateStr! == '' ||
      inputDateStr! == 'null') {
    return '';
  }

  final datetimeFormatDate = DateFormat('dd/MM/y');
  String datetimeDate =
      datetimeFormatDate.format(DateTime.parse(inputDateStr!));
  print(datetimeDate);

  List<String> splitDate = datetimeDate.split('/');
  print(splitDate);
  String dateBE =
      '${splitDate[0]}/${splitDate[1]}/${int.parse(splitDate[2]) + 543}';
  print(dateBE);
  return dateBE;
}

bool? checkIsIntValue(String? value) {
  bool isInt = false;
  if (int.tryParse(value!) != null) {
    isInt = true;
  }

  return isInt;
}

bool? checkIdCard(String? idCard) {
  // Check if the ID card has the correct length (13 characters)
  if (idCard!.length != 13) {
    return false;
  }

  // Check if all characters are digits
  if (!RegExp(r'^\d{13}$').hasMatch(idCard)) {
    return false;
  }

  // Calculate and validate the checksum digit
  int sum = 0;
  for (int i = 0; i < 12; i++) {
    int digit = int.parse(idCard[i]);
    sum += digit * (13 - i);
  }

  int checksum = (11 - (sum % 11)) % 10;
  int lastDigit = int.parse(idCard[12]);

  return checksum == lastDigit;
}

String? formatToThaiDateWithMonth(
  String? dateInput,
  bool? timeFormat,
) {
  DateTime dateTime = DateFormat("dd-MM-yyyy HH:mm").parse(dateInput!);

  // Thai short month names
  List<String> thaiMonths = [
    '',
    'ม.ค.',
    'ก.พ.',
    'มี.ค.',
    'เม.ย.',
    'พ.ค.',
    'มิ.ย.',
    'ก.ค.',
    'ส.ค.',
    'ก.ย.',
    'ต.ค.',
    'พ.ย.',
    'ธ.ค.'
  ];

  // Get Thai Buddhist Era year (year + 543)
  int buddhistYear = dateTime.year + 543;

  // Use only last 2 digits of Buddhist year
  String yearShort = buddhistYear.toString().substring(2);

  // Get date parts
  int day = dateTime.day;
  String monthName = thaiMonths[dateTime.month];
  String time = DateFormat('HH:mm').format(dateTime);

  // Build final string
  if (timeFormat!) {
    return '$day $monthName $yearShort $time น.';
  } else {
    return '$day $monthName $yearShort';
  }
}

String? returnThaiDateFormat(String? dateInput) {
  if (dateInput! == 'null' || dateInput! == '') {
    return '';
  }

  String month = 'month';
  List<String> dateSplit = dateInput!.split('-');
  String dateFormatted = '${dateSplit[2]}-${dateSplit[1]}-${dateSplit[0]}';
  String thaiYear = (int.parse(dateSplit[2]) + 543).toString();

  if (DateFormat('MMMM').format(DateTime.parse(dateFormatted)) == 'January') {
    month = 'ม.ค.';
  } else if (DateFormat('MMMM').format(DateTime.parse(dateFormatted)) ==
      'February') {
    month = 'ก.พ.';
  } else if (DateFormat('MMMM').format(DateTime.parse(dateFormatted)) ==
      'March') {
    month = 'มี.ค.';
  } else if (DateFormat('MMMM').format(DateTime.parse(dateFormatted)) ==
      'April') {
    month = 'เม.ย.';
  } else if (DateFormat('MMMM').format(DateTime.parse(dateFormatted)) ==
      'May') {
    month = 'พ.ค.';
  } else if (DateFormat('MMMM').format(DateTime.parse(dateFormatted)) ==
      'June') {
    month = 'มิ.ย.';
  } else if (DateFormat('MMMM').format(DateTime.parse(dateFormatted)) ==
      'July') {
    month = 'ก.ค.';
  } else if (DateFormat('MMMM').format(DateTime.parse(dateFormatted)) ==
      'August') {
    month = 'ส.ค.';
  } else if (DateFormat('MMMM').format(DateTime.parse(dateFormatted)) ==
      'September') {
    month = 'ก.ย.';
  } else if (DateFormat('MMMM').format(DateTime.parse(dateFormatted)) ==
      'October') {
    month = 'ต.ค.';
  } else if (DateFormat('MMMM').format(DateTime.parse(dateFormatted)) ==
      'November') {
    month = 'พ.ย.';
  } else if (DateFormat('MMMM').format(DateTime.parse(dateFormatted)) ==
      'December') {
    month = 'ธ.ค.';
  }

  return DateFormat(
    'dd $month ${thaiYear[2]}${thaiYear[3]}',
  ).format(DateTime.parse(dateFormatted));
}

String? returnThaiDateFromNormalFormat(String? dateInput) {
  if (dateInput! == 'null' ||
      dateInput! == '' ||
      DateTime.parse('${dateInput!}') == null) {
    return '';
  }

  String formattedDate =
      DateFormat('yyyy-MM-dd').format(DateTime.parse('${dateInput!}'));

  String month = 'month';
  List<String> dateSplit = formattedDate!.split('-');
  String dateFormatted = '${dateSplit[0]}-${dateSplit[1]}-${dateSplit[2]}';
  String thaiYear = (int.parse(dateSplit[0]) + 543).toString();

  if (DateFormat('MMMM').format(DateTime.parse(dateFormatted)) == 'January') {
    month = 'ม.ค.';
  } else if (DateFormat('MMMM').format(DateTime.parse(dateFormatted)) ==
      'February') {
    month = 'ก.พ.';
  } else if (DateFormat('MMMM').format(DateTime.parse(dateFormatted)) ==
      'March') {
    month = 'มี.ค.';
  } else if (DateFormat('MMMM').format(DateTime.parse(dateFormatted)) ==
      'April') {
    month = 'เม.ย.';
  } else if (DateFormat('MMMM').format(DateTime.parse(dateFormatted)) ==
      'May') {
    month = 'พ.ค.';
  } else if (DateFormat('MMMM').format(DateTime.parse(dateFormatted)) ==
      'June') {
    month = 'มิ.ย.';
  } else if (DateFormat('MMMM').format(DateTime.parse(dateFormatted)) ==
      'July') {
    month = 'ก.ค.';
  } else if (DateFormat('MMMM').format(DateTime.parse(dateFormatted)) ==
      'August') {
    month = 'ส.ค.';
  } else if (DateFormat('MMMM').format(DateTime.parse(dateFormatted)) ==
      'September') {
    month = 'ก.ย.';
  } else if (DateFormat('MMMM').format(DateTime.parse(dateFormatted)) ==
      'October') {
    month = 'ต.ค.';
  } else if (DateFormat('MMMM').format(DateTime.parse(dateFormatted)) ==
      'November') {
    month = 'พ.ย.';
  } else if (DateFormat('MMMM').format(DateTime.parse(dateFormatted)) ==
      'December') {
    month = 'ธ.ค.';
  }

  return DateFormat(
    'dd $month ${thaiYear[2]}${thaiYear[3]}',
  ).format(DateTime.parse(dateFormatted));
}

bool? checkPaymentFieldValue(
  String? paymentTextField,
  String? osBalance,
) {
  return double.parse(paymentTextField!) <= double.parse(osBalance!)
      ? true
      : false;
}

String? getDataFromMapJson(
  dynamic jsonDataInput,
  String? fieldName,
) {
  Map<String, dynamic> mapDataInput = jsonDataInput!;
  dynamic jsonOutput = mapDataInput[fieldName!];
  return jsonOutput;
}

dynamic getJsonDataFromMapJson(
  dynamic jsonDataInput,
  String? fieldName,
) {
  Map<String, dynamic> mapDataInput = jsonDataInput!;
  dynamic jsonOutput = mapDataInput[fieldName!];
  return jsonOutput;
}

List<String>? getDataListFromMapJson(
  dynamic jsonDataInput,
  String? fieldName,
) {
  Map<String, dynamic> mapDataInput = jsonDataInput!;
  dynamic listOutput = mapDataInput[fieldName!];
  List<String> listOutput1 = listOutput.cast<String>();
  return listOutput1;
}

List<bool>? getDataListBoolFromMapJson(
  dynamic jsonDataInput,
  String? fieldName,
) {
  Map<String, dynamic> mapDataInput = jsonDataInput!;
  dynamic listOutput = mapDataInput[fieldName!];
  List<bool> listOutput1 = listOutput.cast<bool>();
  return listOutput1;
}

bool? checkContractException(
  List<String>? exceptionContractList,
  List<String>? exceptionContractComcodeList,
  String? contNo,
  String? comcode,
) {
  for (int i = 0; i < exceptionContractList!.length; i++) {
    if (exceptionContractList![i] == contNo! &&
        exceptionContractComcodeList![i] == comcode!) {
      return true;
    }
  }
  return false;
}

String? imagePathToString(String? imagePath) {
  return '${imagePath!}';
}

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

String? showThaiIdNumberForm(String? thaiId) {
  return '${thaiId![0]}-${thaiId![1]}${thaiId![2]}${thaiId![3]}${thaiId![4]}-${thaiId![5]}${thaiId![6]}${thaiId![7]}${thaiId![8]}${thaiId![9]}-${thaiId![10]}${thaiId![11]}-${thaiId![12]}';
}

List<LeadAgentSubCategoryStruct>? returnLeadAgentSubCatagoryEmptyList() {
  List<LeadAgentSubCategoryStruct> outputList = [];

  return outputList;
}

List<LeadAgentDataModelStruct>? combineLeadAgentDataModelList(
  List<LeadAgentDataModelStruct>? list1,
  List<LeadAgentDataModelStruct>? list2,
  List<LeadAgentDataModelStruct>? list3,
) {
  print('before combine');

  List<LeadAgentDataModelStruct> outputList = list1! + list2! + list3!;
  print('after combine');
  print('list1 : ${list1!.length}');
  print('list2 : ${list2!.length}');
  print('list3 : ${list3!.length}');
  print('listCombined : ${outputList.length}');

  return outputList;
}

String? combineStringFromList(List<String>? inputList) {
  String output = '';

  for (int i = 0; i < inputList!.length; i++) {
    output = output + inputList![i];
  }

  return output;
}

List<String>? createUniqueValueList(List<String>? inputList) {
  List<String> outputList = inputList!.toSet().toList();

  return outputList;
}

int? getIndexInIntList(
  List<int>? inputList,
  int? value,
) {
  return inputList!.indexOf(value!);
}

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

List<String>? generateListYear(
  int? start,
  int? end,
) {
  List<String> yearList = [];

  for (int year = start!; year >= end!; year--) {
    yearList.add(year.toString());
  }

  return yearList;
}

List<ProductsStruct>? generateTopupProductList(
  List<ProductsStruct>? productData,
  String? defaultTopupAmount,
) {
  List<ProductsStruct> topupMoney = [
    ProductsStruct(
        productPrice: double.parse(defaultTopupAmount!).toInt(),
        productCode: '5544',
        productName: 'รับวงเงินออนไลน์เพิ่ม',
        productDescription: 'โอนเงินเข้าบัญชีธนาคารภายใน 1 วัน')
  ];

  List<ProductsStruct> productOutput = topupMoney + productData!;

  return productOutput;
}

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

List<PaymentHistoryMonthDataModelStruct>? returnEmptyPaymentHistoryList() {
  List<PaymentHistoryMonthDataModelStruct> outputList = [];
  return outputList;
}

String? removeDoubleCoot(String? inputText) {
  String output = inputText!.replaceAll('"', '');
  return output;
}

String? substringText(
  String? input,
  int? startCharacterIndex,
  int? endCharacterIndex,
) {
  return '${input!.substring(startCharacterIndex!, endCharacterIndex!)}';
}

int? returnStringLength(String? input) {
  return input!.length;
}

bool? validatePassword(String? input) {
  final hasLowercase = RegExp(r'[a-z]').hasMatch(input!);
  final hasUppercase = RegExp(r'[A-Z]').hasMatch(input!);
  final hasNumber = RegExp(r'[0-9]').hasMatch(input!);
  final hasSpecial =
      RegExp(r'[!@#\$%\^&\*\(\)_+\-=\[\]{};:"\\|,.<>\/?]').hasMatch(input!);
  final sixCharacter = input.length >= 6;
  return hasLowercase && hasUppercase && hasSpecial && sixCharacter;
}

String? secondsToMinutes(int? totalSeconds) {
  final minutes = totalSeconds! ~/ 60;
  final seconds = totalSeconds! % 60;

  final minutesStr = minutes.toString().padLeft(2, '0');
  final secondsStr = seconds.toString().padLeft(2, '0');

  return '$minutesStr:$secondsStr';
}

DateTime? currentDate18YearsAgo(DateTime? currentDate) {
  DateTime eighteenYearsAgo =
      DateTime(currentDate!.year - 18, currentDate!.month, currentDate!.day);

  return eighteenYearsAgo;
}

String? returnTextValueInList(List<String>? inputList) {
  String output = '';

  for (int i = 0; i < inputList!.length; i++) {
    output = output + inputList![i];
  }

  return output;
}
