// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ChanodDataModelStruct extends FFFirebaseStruct {
  ChanodDataModelStruct({
    String? utmmap1,
    String? utmmap2,
    String? utmmap3,
    String? utmmap4,
    String? landNo,
    String? parcelType,
    String? chanodNo,
    String? surveyNo,
    double? landAreaOrg,
    int? landAreaAdj,
    String? changwatCode,
    String? changwatName,
    String? branchCode,
    String? branchName,
    String? amphurCode,
    String? amphurName,
    String? tumbonName,
    int? currEvaprice,
    int? totalEvaprice,
    int? ltv1,
    int? ltv1Amount,
    int? ltv2,
    int? ltv2Amount,
    int? ltv2waAmount,
    String? lat,
    String? long,
    String? locationUrl,
    String? utmmap,
    String? landAreaRai,
    String? landAreaNgan,
    String? landAreaWa,
    double? ltv1waAmount,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _utmmap1 = utmmap1,
        _utmmap2 = utmmap2,
        _utmmap3 = utmmap3,
        _utmmap4 = utmmap4,
        _landNo = landNo,
        _parcelType = parcelType,
        _chanodNo = chanodNo,
        _surveyNo = surveyNo,
        _landAreaOrg = landAreaOrg,
        _landAreaAdj = landAreaAdj,
        _changwatCode = changwatCode,
        _changwatName = changwatName,
        _branchCode = branchCode,
        _branchName = branchName,
        _amphurCode = amphurCode,
        _amphurName = amphurName,
        _tumbonName = tumbonName,
        _currEvaprice = currEvaprice,
        _totalEvaprice = totalEvaprice,
        _ltv1 = ltv1,
        _ltv1Amount = ltv1Amount,
        _ltv2 = ltv2,
        _ltv2Amount = ltv2Amount,
        _ltv2waAmount = ltv2waAmount,
        _lat = lat,
        _long = long,
        _locationUrl = locationUrl,
        _utmmap = utmmap,
        _landAreaRai = landAreaRai,
        _landAreaNgan = landAreaNgan,
        _landAreaWa = landAreaWa,
        _ltv1waAmount = ltv1waAmount,
        super(firestoreUtilData);

  // "UTMMAP1" field.
  String? _utmmap1;
  String get utmmap1 => _utmmap1 ?? '';
  set utmmap1(String? val) => _utmmap1 = val;

  bool hasUtmmap1() => _utmmap1 != null;

  // "UTMMAP2" field.
  String? _utmmap2;
  String get utmmap2 => _utmmap2 ?? '';
  set utmmap2(String? val) => _utmmap2 = val;

  bool hasUtmmap2() => _utmmap2 != null;

  // "UTMMAP3" field.
  String? _utmmap3;
  String get utmmap3 => _utmmap3 ?? '';
  set utmmap3(String? val) => _utmmap3 = val;

  bool hasUtmmap3() => _utmmap3 != null;

  // "UTMMAP4" field.
  String? _utmmap4;
  String get utmmap4 => _utmmap4 ?? '';
  set utmmap4(String? val) => _utmmap4 = val;

  bool hasUtmmap4() => _utmmap4 != null;

  // "LAND_NO" field.
  String? _landNo;
  String get landNo => _landNo ?? '';
  set landNo(String? val) => _landNo = val;

  bool hasLandNo() => _landNo != null;

  // "PARCEL_TYPE" field.
  String? _parcelType;
  String get parcelType => _parcelType ?? '';
  set parcelType(String? val) => _parcelType = val;

  bool hasParcelType() => _parcelType != null;

  // "CHANOD_NO" field.
  String? _chanodNo;
  String get chanodNo => _chanodNo ?? '';
  set chanodNo(String? val) => _chanodNo = val;

  bool hasChanodNo() => _chanodNo != null;

  // "SURVEY_NO" field.
  String? _surveyNo;
  String get surveyNo => _surveyNo ?? '';
  set surveyNo(String? val) => _surveyNo = val;

  bool hasSurveyNo() => _surveyNo != null;

  // "LAND_AREA_ORG" field.
  double? _landAreaOrg;
  double get landAreaOrg => _landAreaOrg ?? 0.0;
  set landAreaOrg(double? val) => _landAreaOrg = val;

  void incrementLandAreaOrg(double amount) =>
      landAreaOrg = landAreaOrg + amount;

  bool hasLandAreaOrg() => _landAreaOrg != null;

  // "LAND_AREA_ADJ" field.
  int? _landAreaAdj;
  int get landAreaAdj => _landAreaAdj ?? 0;
  set landAreaAdj(int? val) => _landAreaAdj = val;

  void incrementLandAreaAdj(int amount) => landAreaAdj = landAreaAdj + amount;

  bool hasLandAreaAdj() => _landAreaAdj != null;

  // "CHANGWAT_CODE" field.
  String? _changwatCode;
  String get changwatCode => _changwatCode ?? '';
  set changwatCode(String? val) => _changwatCode = val;

  bool hasChangwatCode() => _changwatCode != null;

  // "CHANGWAT_NAME" field.
  String? _changwatName;
  String get changwatName => _changwatName ?? '';
  set changwatName(String? val) => _changwatName = val;

  bool hasChangwatName() => _changwatName != null;

  // "BRANCH_CODE" field.
  String? _branchCode;
  String get branchCode => _branchCode ?? '';
  set branchCode(String? val) => _branchCode = val;

  bool hasBranchCode() => _branchCode != null;

  // "BRANCH_NAME" field.
  String? _branchName;
  String get branchName => _branchName ?? '';
  set branchName(String? val) => _branchName = val;

  bool hasBranchName() => _branchName != null;

  // "AMPHUR_CODE" field.
  String? _amphurCode;
  String get amphurCode => _amphurCode ?? '';
  set amphurCode(String? val) => _amphurCode = val;

  bool hasAmphurCode() => _amphurCode != null;

  // "AMPHUR_NAME" field.
  String? _amphurName;
  String get amphurName => _amphurName ?? '';
  set amphurName(String? val) => _amphurName = val;

  bool hasAmphurName() => _amphurName != null;

  // "TUMBON_NAME" field.
  String? _tumbonName;
  String get tumbonName => _tumbonName ?? '';
  set tumbonName(String? val) => _tumbonName = val;

  bool hasTumbonName() => _tumbonName != null;

  // "CURR_EVAPRICE" field.
  int? _currEvaprice;
  int get currEvaprice => _currEvaprice ?? 0;
  set currEvaprice(int? val) => _currEvaprice = val;

  void incrementCurrEvaprice(int amount) =>
      currEvaprice = currEvaprice + amount;

  bool hasCurrEvaprice() => _currEvaprice != null;

  // "TOTAL_EVAPRICE" field.
  int? _totalEvaprice;
  int get totalEvaprice => _totalEvaprice ?? 0;
  set totalEvaprice(int? val) => _totalEvaprice = val;

  void incrementTotalEvaprice(int amount) =>
      totalEvaprice = totalEvaprice + amount;

  bool hasTotalEvaprice() => _totalEvaprice != null;

  // "LTV1" field.
  int? _ltv1;
  int get ltv1 => _ltv1 ?? 0;
  set ltv1(int? val) => _ltv1 = val;

  void incrementLtv1(int amount) => ltv1 = ltv1 + amount;

  bool hasLtv1() => _ltv1 != null;

  // "LTV1_AMOUNT" field.
  int? _ltv1Amount;
  int get ltv1Amount => _ltv1Amount ?? 0;
  set ltv1Amount(int? val) => _ltv1Amount = val;

  void incrementLtv1Amount(int amount) => ltv1Amount = ltv1Amount + amount;

  bool hasLtv1Amount() => _ltv1Amount != null;

  // "LTV2" field.
  int? _ltv2;
  int get ltv2 => _ltv2 ?? 0;
  set ltv2(int? val) => _ltv2 = val;

  void incrementLtv2(int amount) => ltv2 = ltv2 + amount;

  bool hasLtv2() => _ltv2 != null;

  // "LTV2_AMOUNT" field.
  int? _ltv2Amount;
  int get ltv2Amount => _ltv2Amount ?? 0;
  set ltv2Amount(int? val) => _ltv2Amount = val;

  void incrementLtv2Amount(int amount) => ltv2Amount = ltv2Amount + amount;

  bool hasLtv2Amount() => _ltv2Amount != null;

  // "LTV2WA_AMOUNT" field.
  int? _ltv2waAmount;
  int get ltv2waAmount => _ltv2waAmount ?? 0;
  set ltv2waAmount(int? val) => _ltv2waAmount = val;

  void incrementLtv2waAmount(int amount) =>
      ltv2waAmount = ltv2waAmount + amount;

  bool hasLtv2waAmount() => _ltv2waAmount != null;

  // "LAT" field.
  String? _lat;
  String get lat => _lat ?? '';
  set lat(String? val) => _lat = val;

  bool hasLat() => _lat != null;

  // "LONG" field.
  String? _long;
  String get long => _long ?? '';
  set long(String? val) => _long = val;

  bool hasLong() => _long != null;

  // "LOCATION_URL" field.
  String? _locationUrl;
  String get locationUrl => _locationUrl ?? '';
  set locationUrl(String? val) => _locationUrl = val;

  bool hasLocationUrl() => _locationUrl != null;

  // "UTMMAP" field.
  String? _utmmap;
  String get utmmap => _utmmap ?? '';
  set utmmap(String? val) => _utmmap = val;

  bool hasUtmmap() => _utmmap != null;

  // "LAND_AREA_RAI" field.
  String? _landAreaRai;
  String get landAreaRai => _landAreaRai ?? '';
  set landAreaRai(String? val) => _landAreaRai = val;

  bool hasLandAreaRai() => _landAreaRai != null;

  // "LAND_AREA_NGAN" field.
  String? _landAreaNgan;
  String get landAreaNgan => _landAreaNgan ?? '';
  set landAreaNgan(String? val) => _landAreaNgan = val;

  bool hasLandAreaNgan() => _landAreaNgan != null;

  // "LAND_AREA_WA" field.
  String? _landAreaWa;
  String get landAreaWa => _landAreaWa ?? '';
  set landAreaWa(String? val) => _landAreaWa = val;

  bool hasLandAreaWa() => _landAreaWa != null;

  // "LTV1WA_AMOUNT" field.
  double? _ltv1waAmount;
  double get ltv1waAmount => _ltv1waAmount ?? 0.0;
  set ltv1waAmount(double? val) => _ltv1waAmount = val;

  void incrementLtv1waAmount(double amount) =>
      ltv1waAmount = ltv1waAmount + amount;

  bool hasLtv1waAmount() => _ltv1waAmount != null;

  static ChanodDataModelStruct fromMap(Map<String, dynamic> data) =>
      ChanodDataModelStruct(
        utmmap1: data['UTMMAP1'] as String?,
        utmmap2: data['UTMMAP2'] as String?,
        utmmap3: data['UTMMAP3'] as String?,
        utmmap4: data['UTMMAP4'] as String?,
        landNo: data['LAND_NO'] as String?,
        parcelType: data['PARCEL_TYPE'] as String?,
        chanodNo: data['CHANOD_NO'] as String?,
        surveyNo: data['SURVEY_NO'] as String?,
        landAreaOrg: castToType<double>(data['LAND_AREA_ORG']),
        landAreaAdj: castToType<int>(data['LAND_AREA_ADJ']),
        changwatCode: data['CHANGWAT_CODE'] as String?,
        changwatName: data['CHANGWAT_NAME'] as String?,
        branchCode: data['BRANCH_CODE'] as String?,
        branchName: data['BRANCH_NAME'] as String?,
        amphurCode: data['AMPHUR_CODE'] as String?,
        amphurName: data['AMPHUR_NAME'] as String?,
        tumbonName: data['TUMBON_NAME'] as String?,
        currEvaprice: castToType<int>(data['CURR_EVAPRICE']),
        totalEvaprice: castToType<int>(data['TOTAL_EVAPRICE']),
        ltv1: castToType<int>(data['LTV1']),
        ltv1Amount: castToType<int>(data['LTV1_AMOUNT']),
        ltv2: castToType<int>(data['LTV2']),
        ltv2Amount: castToType<int>(data['LTV2_AMOUNT']),
        ltv2waAmount: castToType<int>(data['LTV2WA_AMOUNT']),
        lat: data['LAT'] as String?,
        long: data['LONG'] as String?,
        locationUrl: data['LOCATION_URL'] as String?,
        utmmap: data['UTMMAP'] as String?,
        landAreaRai: data['LAND_AREA_RAI'] as String?,
        landAreaNgan: data['LAND_AREA_NGAN'] as String?,
        landAreaWa: data['LAND_AREA_WA'] as String?,
        ltv1waAmount: castToType<double>(data['LTV1WA_AMOUNT']),
      );

  static ChanodDataModelStruct? maybeFromMap(dynamic data) => data is Map
      ? ChanodDataModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'UTMMAP1': _utmmap1,
        'UTMMAP2': _utmmap2,
        'UTMMAP3': _utmmap3,
        'UTMMAP4': _utmmap4,
        'LAND_NO': _landNo,
        'PARCEL_TYPE': _parcelType,
        'CHANOD_NO': _chanodNo,
        'SURVEY_NO': _surveyNo,
        'LAND_AREA_ORG': _landAreaOrg,
        'LAND_AREA_ADJ': _landAreaAdj,
        'CHANGWAT_CODE': _changwatCode,
        'CHANGWAT_NAME': _changwatName,
        'BRANCH_CODE': _branchCode,
        'BRANCH_NAME': _branchName,
        'AMPHUR_CODE': _amphurCode,
        'AMPHUR_NAME': _amphurName,
        'TUMBON_NAME': _tumbonName,
        'CURR_EVAPRICE': _currEvaprice,
        'TOTAL_EVAPRICE': _totalEvaprice,
        'LTV1': _ltv1,
        'LTV1_AMOUNT': _ltv1Amount,
        'LTV2': _ltv2,
        'LTV2_AMOUNT': _ltv2Amount,
        'LTV2WA_AMOUNT': _ltv2waAmount,
        'LAT': _lat,
        'LONG': _long,
        'LOCATION_URL': _locationUrl,
        'UTMMAP': _utmmap,
        'LAND_AREA_RAI': _landAreaRai,
        'LAND_AREA_NGAN': _landAreaNgan,
        'LAND_AREA_WA': _landAreaWa,
        'LTV1WA_AMOUNT': _ltv1waAmount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'UTMMAP1': serializeParam(
          _utmmap1,
          ParamType.String,
        ),
        'UTMMAP2': serializeParam(
          _utmmap2,
          ParamType.String,
        ),
        'UTMMAP3': serializeParam(
          _utmmap3,
          ParamType.String,
        ),
        'UTMMAP4': serializeParam(
          _utmmap4,
          ParamType.String,
        ),
        'LAND_NO': serializeParam(
          _landNo,
          ParamType.String,
        ),
        'PARCEL_TYPE': serializeParam(
          _parcelType,
          ParamType.String,
        ),
        'CHANOD_NO': serializeParam(
          _chanodNo,
          ParamType.String,
        ),
        'SURVEY_NO': serializeParam(
          _surveyNo,
          ParamType.String,
        ),
        'LAND_AREA_ORG': serializeParam(
          _landAreaOrg,
          ParamType.double,
        ),
        'LAND_AREA_ADJ': serializeParam(
          _landAreaAdj,
          ParamType.int,
        ),
        'CHANGWAT_CODE': serializeParam(
          _changwatCode,
          ParamType.String,
        ),
        'CHANGWAT_NAME': serializeParam(
          _changwatName,
          ParamType.String,
        ),
        'BRANCH_CODE': serializeParam(
          _branchCode,
          ParamType.String,
        ),
        'BRANCH_NAME': serializeParam(
          _branchName,
          ParamType.String,
        ),
        'AMPHUR_CODE': serializeParam(
          _amphurCode,
          ParamType.String,
        ),
        'AMPHUR_NAME': serializeParam(
          _amphurName,
          ParamType.String,
        ),
        'TUMBON_NAME': serializeParam(
          _tumbonName,
          ParamType.String,
        ),
        'CURR_EVAPRICE': serializeParam(
          _currEvaprice,
          ParamType.int,
        ),
        'TOTAL_EVAPRICE': serializeParam(
          _totalEvaprice,
          ParamType.int,
        ),
        'LTV1': serializeParam(
          _ltv1,
          ParamType.int,
        ),
        'LTV1_AMOUNT': serializeParam(
          _ltv1Amount,
          ParamType.int,
        ),
        'LTV2': serializeParam(
          _ltv2,
          ParamType.int,
        ),
        'LTV2_AMOUNT': serializeParam(
          _ltv2Amount,
          ParamType.int,
        ),
        'LTV2WA_AMOUNT': serializeParam(
          _ltv2waAmount,
          ParamType.int,
        ),
        'LAT': serializeParam(
          _lat,
          ParamType.String,
        ),
        'LONG': serializeParam(
          _long,
          ParamType.String,
        ),
        'LOCATION_URL': serializeParam(
          _locationUrl,
          ParamType.String,
        ),
        'UTMMAP': serializeParam(
          _utmmap,
          ParamType.String,
        ),
        'LAND_AREA_RAI': serializeParam(
          _landAreaRai,
          ParamType.String,
        ),
        'LAND_AREA_NGAN': serializeParam(
          _landAreaNgan,
          ParamType.String,
        ),
        'LAND_AREA_WA': serializeParam(
          _landAreaWa,
          ParamType.String,
        ),
        'LTV1WA_AMOUNT': serializeParam(
          _ltv1waAmount,
          ParamType.double,
        ),
      }.withoutNulls;

  static ChanodDataModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChanodDataModelStruct(
        utmmap1: deserializeParam(
          data['UTMMAP1'],
          ParamType.String,
          false,
        ),
        utmmap2: deserializeParam(
          data['UTMMAP2'],
          ParamType.String,
          false,
        ),
        utmmap3: deserializeParam(
          data['UTMMAP3'],
          ParamType.String,
          false,
        ),
        utmmap4: deserializeParam(
          data['UTMMAP4'],
          ParamType.String,
          false,
        ),
        landNo: deserializeParam(
          data['LAND_NO'],
          ParamType.String,
          false,
        ),
        parcelType: deserializeParam(
          data['PARCEL_TYPE'],
          ParamType.String,
          false,
        ),
        chanodNo: deserializeParam(
          data['CHANOD_NO'],
          ParamType.String,
          false,
        ),
        surveyNo: deserializeParam(
          data['SURVEY_NO'],
          ParamType.String,
          false,
        ),
        landAreaOrg: deserializeParam(
          data['LAND_AREA_ORG'],
          ParamType.double,
          false,
        ),
        landAreaAdj: deserializeParam(
          data['LAND_AREA_ADJ'],
          ParamType.int,
          false,
        ),
        changwatCode: deserializeParam(
          data['CHANGWAT_CODE'],
          ParamType.String,
          false,
        ),
        changwatName: deserializeParam(
          data['CHANGWAT_NAME'],
          ParamType.String,
          false,
        ),
        branchCode: deserializeParam(
          data['BRANCH_CODE'],
          ParamType.String,
          false,
        ),
        branchName: deserializeParam(
          data['BRANCH_NAME'],
          ParamType.String,
          false,
        ),
        amphurCode: deserializeParam(
          data['AMPHUR_CODE'],
          ParamType.String,
          false,
        ),
        amphurName: deserializeParam(
          data['AMPHUR_NAME'],
          ParamType.String,
          false,
        ),
        tumbonName: deserializeParam(
          data['TUMBON_NAME'],
          ParamType.String,
          false,
        ),
        currEvaprice: deserializeParam(
          data['CURR_EVAPRICE'],
          ParamType.int,
          false,
        ),
        totalEvaprice: deserializeParam(
          data['TOTAL_EVAPRICE'],
          ParamType.int,
          false,
        ),
        ltv1: deserializeParam(
          data['LTV1'],
          ParamType.int,
          false,
        ),
        ltv1Amount: deserializeParam(
          data['LTV1_AMOUNT'],
          ParamType.int,
          false,
        ),
        ltv2: deserializeParam(
          data['LTV2'],
          ParamType.int,
          false,
        ),
        ltv2Amount: deserializeParam(
          data['LTV2_AMOUNT'],
          ParamType.int,
          false,
        ),
        ltv2waAmount: deserializeParam(
          data['LTV2WA_AMOUNT'],
          ParamType.int,
          false,
        ),
        lat: deserializeParam(
          data['LAT'],
          ParamType.String,
          false,
        ),
        long: deserializeParam(
          data['LONG'],
          ParamType.String,
          false,
        ),
        locationUrl: deserializeParam(
          data['LOCATION_URL'],
          ParamType.String,
          false,
        ),
        utmmap: deserializeParam(
          data['UTMMAP'],
          ParamType.String,
          false,
        ),
        landAreaRai: deserializeParam(
          data['LAND_AREA_RAI'],
          ParamType.String,
          false,
        ),
        landAreaNgan: deserializeParam(
          data['LAND_AREA_NGAN'],
          ParamType.String,
          false,
        ),
        landAreaWa: deserializeParam(
          data['LAND_AREA_WA'],
          ParamType.String,
          false,
        ),
        ltv1waAmount: deserializeParam(
          data['LTV1WA_AMOUNT'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'ChanodDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChanodDataModelStruct &&
        utmmap1 == other.utmmap1 &&
        utmmap2 == other.utmmap2 &&
        utmmap3 == other.utmmap3 &&
        utmmap4 == other.utmmap4 &&
        landNo == other.landNo &&
        parcelType == other.parcelType &&
        chanodNo == other.chanodNo &&
        surveyNo == other.surveyNo &&
        landAreaOrg == other.landAreaOrg &&
        landAreaAdj == other.landAreaAdj &&
        changwatCode == other.changwatCode &&
        changwatName == other.changwatName &&
        branchCode == other.branchCode &&
        branchName == other.branchName &&
        amphurCode == other.amphurCode &&
        amphurName == other.amphurName &&
        tumbonName == other.tumbonName &&
        currEvaprice == other.currEvaprice &&
        totalEvaprice == other.totalEvaprice &&
        ltv1 == other.ltv1 &&
        ltv1Amount == other.ltv1Amount &&
        ltv2 == other.ltv2 &&
        ltv2Amount == other.ltv2Amount &&
        ltv2waAmount == other.ltv2waAmount &&
        lat == other.lat &&
        long == other.long &&
        locationUrl == other.locationUrl &&
        utmmap == other.utmmap &&
        landAreaRai == other.landAreaRai &&
        landAreaNgan == other.landAreaNgan &&
        landAreaWa == other.landAreaWa &&
        ltv1waAmount == other.ltv1waAmount;
  }

  @override
  int get hashCode => const ListEquality().hash([
        utmmap1,
        utmmap2,
        utmmap3,
        utmmap4,
        landNo,
        parcelType,
        chanodNo,
        surveyNo,
        landAreaOrg,
        landAreaAdj,
        changwatCode,
        changwatName,
        branchCode,
        branchName,
        amphurCode,
        amphurName,
        tumbonName,
        currEvaprice,
        totalEvaprice,
        ltv1,
        ltv1Amount,
        ltv2,
        ltv2Amount,
        ltv2waAmount,
        lat,
        long,
        locationUrl,
        utmmap,
        landAreaRai,
        landAreaNgan,
        landAreaWa,
        ltv1waAmount
      ]);
}

ChanodDataModelStruct createChanodDataModelStruct({
  String? utmmap1,
  String? utmmap2,
  String? utmmap3,
  String? utmmap4,
  String? landNo,
  String? parcelType,
  String? chanodNo,
  String? surveyNo,
  double? landAreaOrg,
  int? landAreaAdj,
  String? changwatCode,
  String? changwatName,
  String? branchCode,
  String? branchName,
  String? amphurCode,
  String? amphurName,
  String? tumbonName,
  int? currEvaprice,
  int? totalEvaprice,
  int? ltv1,
  int? ltv1Amount,
  int? ltv2,
  int? ltv2Amount,
  int? ltv2waAmount,
  String? lat,
  String? long,
  String? locationUrl,
  String? utmmap,
  String? landAreaRai,
  String? landAreaNgan,
  String? landAreaWa,
  double? ltv1waAmount,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChanodDataModelStruct(
      utmmap1: utmmap1,
      utmmap2: utmmap2,
      utmmap3: utmmap3,
      utmmap4: utmmap4,
      landNo: landNo,
      parcelType: parcelType,
      chanodNo: chanodNo,
      surveyNo: surveyNo,
      landAreaOrg: landAreaOrg,
      landAreaAdj: landAreaAdj,
      changwatCode: changwatCode,
      changwatName: changwatName,
      branchCode: branchCode,
      branchName: branchName,
      amphurCode: amphurCode,
      amphurName: amphurName,
      tumbonName: tumbonName,
      currEvaprice: currEvaprice,
      totalEvaprice: totalEvaprice,
      ltv1: ltv1,
      ltv1Amount: ltv1Amount,
      ltv2: ltv2,
      ltv2Amount: ltv2Amount,
      ltv2waAmount: ltv2waAmount,
      lat: lat,
      long: long,
      locationUrl: locationUrl,
      utmmap: utmmap,
      landAreaRai: landAreaRai,
      landAreaNgan: landAreaNgan,
      landAreaWa: landAreaWa,
      ltv1waAmount: ltv1waAmount,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChanodDataModelStruct? updateChanodDataModelStruct(
  ChanodDataModelStruct? chanodDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    chanodDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChanodDataModelStructData(
  Map<String, dynamic> firestoreData,
  ChanodDataModelStruct? chanodDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chanodDataModel == null) {
    return;
  }
  if (chanodDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && chanodDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chanodDataModelData =
      getChanodDataModelFirestoreData(chanodDataModel, forFieldValue);
  final nestedData =
      chanodDataModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = chanodDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChanodDataModelFirestoreData(
  ChanodDataModelStruct? chanodDataModel, [
  bool forFieldValue = false,
]) {
  if (chanodDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(chanodDataModel.toMap());

  // Add any Firestore field values
  chanodDataModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChanodDataModelListFirestoreData(
  List<ChanodDataModelStruct>? chanodDataModels,
) =>
    chanodDataModels
        ?.map((e) => getChanodDataModelFirestoreData(e, true))
        .toList() ??
    [];
