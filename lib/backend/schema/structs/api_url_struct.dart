// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ApiUrlStruct extends FFFirebaseStruct {
  ApiUrlStruct({
    String? landHouseUrl,
    String? landAndHouseAssign,
    String? arunsawadApiUrlProd,
    String? tanjaiApiUrl,
    String? apiUrlDev,
    String? apiUrlProd,
    String? apiUrlLeadDev,
    String? apiUrlLeadProd,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _landHouseUrl = landHouseUrl,
        _landAndHouseAssign = landAndHouseAssign,
        _arunsawadApiUrlProd = arunsawadApiUrlProd,
        _tanjaiApiUrl = tanjaiApiUrl,
        _apiUrlDev = apiUrlDev,
        _apiUrlProd = apiUrlProd,
        _apiUrlLeadDev = apiUrlLeadDev,
        _apiUrlLeadProd = apiUrlLeadProd,
        super(firestoreUtilData);

  // "land_house_url" field.
  String? _landHouseUrl;
  String get landHouseUrl => _landHouseUrl ?? '';
  set landHouseUrl(String? val) => _landHouseUrl = val;

  bool hasLandHouseUrl() => _landHouseUrl != null;

  // "land_and_house_assign" field.
  String? _landAndHouseAssign;
  String get landAndHouseAssign => _landAndHouseAssign ?? '';
  set landAndHouseAssign(String? val) => _landAndHouseAssign = val;

  bool hasLandAndHouseAssign() => _landAndHouseAssign != null;

  // "arunsawad_api_url_prod" field.
  String? _arunsawadApiUrlProd;
  String get arunsawadApiUrlProd => _arunsawadApiUrlProd ?? '';
  set arunsawadApiUrlProd(String? val) => _arunsawadApiUrlProd = val;

  bool hasArunsawadApiUrlProd() => _arunsawadApiUrlProd != null;

  // "tanjai_api_url" field.
  String? _tanjaiApiUrl;
  String get tanjaiApiUrl => _tanjaiApiUrl ?? '';
  set tanjaiApiUrl(String? val) => _tanjaiApiUrl = val;

  bool hasTanjaiApiUrl() => _tanjaiApiUrl != null;

  // "api_url_dev" field.
  String? _apiUrlDev;
  String get apiUrlDev => _apiUrlDev ?? '';
  set apiUrlDev(String? val) => _apiUrlDev = val;

  bool hasApiUrlDev() => _apiUrlDev != null;

  // "api_url_prod" field.
  String? _apiUrlProd;
  String get apiUrlProd => _apiUrlProd ?? '';
  set apiUrlProd(String? val) => _apiUrlProd = val;

  bool hasApiUrlProd() => _apiUrlProd != null;

  // "api_url_lead_dev" field.
  String? _apiUrlLeadDev;
  String get apiUrlLeadDev => _apiUrlLeadDev ?? '';
  set apiUrlLeadDev(String? val) => _apiUrlLeadDev = val;

  bool hasApiUrlLeadDev() => _apiUrlLeadDev != null;

  // "api_url_lead_prod" field.
  String? _apiUrlLeadProd;
  String get apiUrlLeadProd => _apiUrlLeadProd ?? '';
  set apiUrlLeadProd(String? val) => _apiUrlLeadProd = val;

  bool hasApiUrlLeadProd() => _apiUrlLeadProd != null;

  static ApiUrlStruct fromMap(Map<String, dynamic> data) => ApiUrlStruct(
        landHouseUrl: data['land_house_url'] as String?,
        landAndHouseAssign: data['land_and_house_assign'] as String?,
        arunsawadApiUrlProd: data['arunsawad_api_url_prod'] as String?,
        tanjaiApiUrl: data['tanjai_api_url'] as String?,
        apiUrlDev: data['api_url_dev'] as String?,
        apiUrlProd: data['api_url_prod'] as String?,
        apiUrlLeadDev: data['api_url_lead_dev'] as String?,
        apiUrlLeadProd: data['api_url_lead_prod'] as String?,
      );

  static ApiUrlStruct? maybeFromMap(dynamic data) =>
      data is Map ? ApiUrlStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'land_house_url': _landHouseUrl,
        'land_and_house_assign': _landAndHouseAssign,
        'arunsawad_api_url_prod': _arunsawadApiUrlProd,
        'tanjai_api_url': _tanjaiApiUrl,
        'api_url_dev': _apiUrlDev,
        'api_url_prod': _apiUrlProd,
        'api_url_lead_dev': _apiUrlLeadDev,
        'api_url_lead_prod': _apiUrlLeadProd,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'land_house_url': serializeParam(
          _landHouseUrl,
          ParamType.String,
        ),
        'land_and_house_assign': serializeParam(
          _landAndHouseAssign,
          ParamType.String,
        ),
        'arunsawad_api_url_prod': serializeParam(
          _arunsawadApiUrlProd,
          ParamType.String,
        ),
        'tanjai_api_url': serializeParam(
          _tanjaiApiUrl,
          ParamType.String,
        ),
        'api_url_dev': serializeParam(
          _apiUrlDev,
          ParamType.String,
        ),
        'api_url_prod': serializeParam(
          _apiUrlProd,
          ParamType.String,
        ),
        'api_url_lead_dev': serializeParam(
          _apiUrlLeadDev,
          ParamType.String,
        ),
        'api_url_lead_prod': serializeParam(
          _apiUrlLeadProd,
          ParamType.String,
        ),
      }.withoutNulls;

  static ApiUrlStruct fromSerializableMap(Map<String, dynamic> data) =>
      ApiUrlStruct(
        landHouseUrl: deserializeParam(
          data['land_house_url'],
          ParamType.String,
          false,
        ),
        landAndHouseAssign: deserializeParam(
          data['land_and_house_assign'],
          ParamType.String,
          false,
        ),
        arunsawadApiUrlProd: deserializeParam(
          data['arunsawad_api_url_prod'],
          ParamType.String,
          false,
        ),
        tanjaiApiUrl: deserializeParam(
          data['tanjai_api_url'],
          ParamType.String,
          false,
        ),
        apiUrlDev: deserializeParam(
          data['api_url_dev'],
          ParamType.String,
          false,
        ),
        apiUrlProd: deserializeParam(
          data['api_url_prod'],
          ParamType.String,
          false,
        ),
        apiUrlLeadDev: deserializeParam(
          data['api_url_lead_dev'],
          ParamType.String,
          false,
        ),
        apiUrlLeadProd: deserializeParam(
          data['api_url_lead_prod'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ApiUrlStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ApiUrlStruct &&
        landHouseUrl == other.landHouseUrl &&
        landAndHouseAssign == other.landAndHouseAssign &&
        arunsawadApiUrlProd == other.arunsawadApiUrlProd &&
        tanjaiApiUrl == other.tanjaiApiUrl &&
        apiUrlDev == other.apiUrlDev &&
        apiUrlProd == other.apiUrlProd &&
        apiUrlLeadDev == other.apiUrlLeadDev &&
        apiUrlLeadProd == other.apiUrlLeadProd;
  }

  @override
  int get hashCode => const ListEquality().hash([
        landHouseUrl,
        landAndHouseAssign,
        arunsawadApiUrlProd,
        tanjaiApiUrl,
        apiUrlDev,
        apiUrlProd,
        apiUrlLeadDev,
        apiUrlLeadProd
      ]);
}

ApiUrlStruct createApiUrlStruct({
  String? landHouseUrl,
  String? landAndHouseAssign,
  String? arunsawadApiUrlProd,
  String? tanjaiApiUrl,
  String? apiUrlDev,
  String? apiUrlProd,
  String? apiUrlLeadDev,
  String? apiUrlLeadProd,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ApiUrlStruct(
      landHouseUrl: landHouseUrl,
      landAndHouseAssign: landAndHouseAssign,
      arunsawadApiUrlProd: arunsawadApiUrlProd,
      tanjaiApiUrl: tanjaiApiUrl,
      apiUrlDev: apiUrlDev,
      apiUrlProd: apiUrlProd,
      apiUrlLeadDev: apiUrlLeadDev,
      apiUrlLeadProd: apiUrlLeadProd,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ApiUrlStruct? updateApiUrlStruct(
  ApiUrlStruct? apiUrl, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    apiUrl
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addApiUrlStructData(
  Map<String, dynamic> firestoreData,
  ApiUrlStruct? apiUrl,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (apiUrl == null) {
    return;
  }
  if (apiUrl.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && apiUrl.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final apiUrlData = getApiUrlFirestoreData(apiUrl, forFieldValue);
  final nestedData = apiUrlData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = apiUrl.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getApiUrlFirestoreData(
  ApiUrlStruct? apiUrl, [
  bool forFieldValue = false,
]) {
  if (apiUrl == null) {
    return {};
  }
  final firestoreData = mapToFirestore(apiUrl.toMap());

  // Add any Firestore field values
  apiUrl.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getApiUrlListFirestoreData(
  List<ApiUrlStruct>? apiUrls,
) =>
    apiUrls?.map((e) => getApiUrlFirestoreData(e, true)).toList() ?? [];
