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
    String? ocrUrlDev,
    String? ocrUrlProd,
    String? contractUrl,
    String? contractUrlDev,
    String? agentWebConfirmUrl,
    String? agentWebConfirmUrlUat,
    String? agentWebUrl,
    String? agentWebUrlUat,
    String? agentWebLeadUrl,
    String? agentWebLeadUrlUat,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _landHouseUrl = landHouseUrl,
        _landAndHouseAssign = landAndHouseAssign,
        _arunsawadApiUrlProd = arunsawadApiUrlProd,
        _tanjaiApiUrl = tanjaiApiUrl,
        _apiUrlDev = apiUrlDev,
        _apiUrlProd = apiUrlProd,
        _apiUrlLeadDev = apiUrlLeadDev,
        _apiUrlLeadProd = apiUrlLeadProd,
        _ocrUrlDev = ocrUrlDev,
        _ocrUrlProd = ocrUrlProd,
        _contractUrl = contractUrl,
        _contractUrlDev = contractUrlDev,
        _agentWebConfirmUrl = agentWebConfirmUrl,
        _agentWebConfirmUrlUat = agentWebConfirmUrlUat,
        _agentWebUrl = agentWebUrl,
        _agentWebUrlUat = agentWebUrlUat,
        _agentWebLeadUrl = agentWebLeadUrl,
        _agentWebLeadUrlUat = agentWebLeadUrlUat,
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

  // "ocr_url_dev" field.
  String? _ocrUrlDev;
  String get ocrUrlDev => _ocrUrlDev ?? '';
  set ocrUrlDev(String? val) => _ocrUrlDev = val;

  bool hasOcrUrlDev() => _ocrUrlDev != null;

  // "ocr_url_prod" field.
  String? _ocrUrlProd;
  String get ocrUrlProd => _ocrUrlProd ?? '';
  set ocrUrlProd(String? val) => _ocrUrlProd = val;

  bool hasOcrUrlProd() => _ocrUrlProd != null;

  // "contract_url" field.
  String? _contractUrl;
  String get contractUrl => _contractUrl ?? '';
  set contractUrl(String? val) => _contractUrl = val;

  bool hasContractUrl() => _contractUrl != null;

  // "contract_url_dev" field.
  String? _contractUrlDev;
  String get contractUrlDev => _contractUrlDev ?? '';
  set contractUrlDev(String? val) => _contractUrlDev = val;

  bool hasContractUrlDev() => _contractUrlDev != null;

  // "agent_web_confirm_url" field.
  String? _agentWebConfirmUrl;
  String get agentWebConfirmUrl => _agentWebConfirmUrl ?? '';
  set agentWebConfirmUrl(String? val) => _agentWebConfirmUrl = val;

  bool hasAgentWebConfirmUrl() => _agentWebConfirmUrl != null;

  // "agent_web_confirm_url_uat" field.
  String? _agentWebConfirmUrlUat;
  String get agentWebConfirmUrlUat => _agentWebConfirmUrlUat ?? '';
  set agentWebConfirmUrlUat(String? val) => _agentWebConfirmUrlUat = val;

  bool hasAgentWebConfirmUrlUat() => _agentWebConfirmUrlUat != null;

  // "agent_web_url" field.
  String? _agentWebUrl;
  String get agentWebUrl => _agentWebUrl ?? '';
  set agentWebUrl(String? val) => _agentWebUrl = val;

  bool hasAgentWebUrl() => _agentWebUrl != null;

  // "agent_web_url_uat" field.
  String? _agentWebUrlUat;
  String get agentWebUrlUat => _agentWebUrlUat ?? '';
  set agentWebUrlUat(String? val) => _agentWebUrlUat = val;

  bool hasAgentWebUrlUat() => _agentWebUrlUat != null;

  // "agent_web_lead_url" field.
  String? _agentWebLeadUrl;
  String get agentWebLeadUrl => _agentWebLeadUrl ?? '';
  set agentWebLeadUrl(String? val) => _agentWebLeadUrl = val;

  bool hasAgentWebLeadUrl() => _agentWebLeadUrl != null;

  // "agent_web_lead_url_uat" field.
  String? _agentWebLeadUrlUat;
  String get agentWebLeadUrlUat => _agentWebLeadUrlUat ?? '';
  set agentWebLeadUrlUat(String? val) => _agentWebLeadUrlUat = val;

  bool hasAgentWebLeadUrlUat() => _agentWebLeadUrlUat != null;

  static ApiUrlStruct fromMap(Map<String, dynamic> data) => ApiUrlStruct(
        landHouseUrl: data['land_house_url'] as String?,
        landAndHouseAssign: data['land_and_house_assign'] as String?,
        arunsawadApiUrlProd: data['arunsawad_api_url_prod'] as String?,
        tanjaiApiUrl: data['tanjai_api_url'] as String?,
        apiUrlDev: data['api_url_dev'] as String?,
        apiUrlProd: data['api_url_prod'] as String?,
        apiUrlLeadDev: data['api_url_lead_dev'] as String?,
        apiUrlLeadProd: data['api_url_lead_prod'] as String?,
        ocrUrlDev: data['ocr_url_dev'] as String?,
        ocrUrlProd: data['ocr_url_prod'] as String?,
        contractUrl: data['contract_url'] as String?,
        contractUrlDev: data['contract_url_dev'] as String?,
        agentWebConfirmUrl: data['agent_web_confirm_url'] as String?,
        agentWebConfirmUrlUat: data['agent_web_confirm_url_uat'] as String?,
        agentWebUrl: data['agent_web_url'] as String?,
        agentWebUrlUat: data['agent_web_url_uat'] as String?,
        agentWebLeadUrl: data['agent_web_lead_url'] as String?,
        agentWebLeadUrlUat: data['agent_web_lead_url_uat'] as String?,
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
        'ocr_url_dev': _ocrUrlDev,
        'ocr_url_prod': _ocrUrlProd,
        'contract_url': _contractUrl,
        'contract_url_dev': _contractUrlDev,
        'agent_web_confirm_url': _agentWebConfirmUrl,
        'agent_web_confirm_url_uat': _agentWebConfirmUrlUat,
        'agent_web_url': _agentWebUrl,
        'agent_web_url_uat': _agentWebUrlUat,
        'agent_web_lead_url': _agentWebLeadUrl,
        'agent_web_lead_url_uat': _agentWebLeadUrlUat,
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
        'ocr_url_dev': serializeParam(
          _ocrUrlDev,
          ParamType.String,
        ),
        'ocr_url_prod': serializeParam(
          _ocrUrlProd,
          ParamType.String,
        ),
        'contract_url': serializeParam(
          _contractUrl,
          ParamType.String,
        ),
        'contract_url_dev': serializeParam(
          _contractUrlDev,
          ParamType.String,
        ),
        'agent_web_confirm_url': serializeParam(
          _agentWebConfirmUrl,
          ParamType.String,
        ),
        'agent_web_confirm_url_uat': serializeParam(
          _agentWebConfirmUrlUat,
          ParamType.String,
        ),
        'agent_web_url': serializeParam(
          _agentWebUrl,
          ParamType.String,
        ),
        'agent_web_url_uat': serializeParam(
          _agentWebUrlUat,
          ParamType.String,
        ),
        'agent_web_lead_url': serializeParam(
          _agentWebLeadUrl,
          ParamType.String,
        ),
        'agent_web_lead_url_uat': serializeParam(
          _agentWebLeadUrlUat,
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
        ocrUrlDev: deserializeParam(
          data['ocr_url_dev'],
          ParamType.String,
          false,
        ),
        ocrUrlProd: deserializeParam(
          data['ocr_url_prod'],
          ParamType.String,
          false,
        ),
        contractUrl: deserializeParam(
          data['contract_url'],
          ParamType.String,
          false,
        ),
        contractUrlDev: deserializeParam(
          data['contract_url_dev'],
          ParamType.String,
          false,
        ),
        agentWebConfirmUrl: deserializeParam(
          data['agent_web_confirm_url'],
          ParamType.String,
          false,
        ),
        agentWebConfirmUrlUat: deserializeParam(
          data['agent_web_confirm_url_uat'],
          ParamType.String,
          false,
        ),
        agentWebUrl: deserializeParam(
          data['agent_web_url'],
          ParamType.String,
          false,
        ),
        agentWebUrlUat: deserializeParam(
          data['agent_web_url_uat'],
          ParamType.String,
          false,
        ),
        agentWebLeadUrl: deserializeParam(
          data['agent_web_lead_url'],
          ParamType.String,
          false,
        ),
        agentWebLeadUrlUat: deserializeParam(
          data['agent_web_lead_url_uat'],
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
        apiUrlLeadProd == other.apiUrlLeadProd &&
        ocrUrlDev == other.ocrUrlDev &&
        ocrUrlProd == other.ocrUrlProd &&
        contractUrl == other.contractUrl &&
        contractUrlDev == other.contractUrlDev &&
        agentWebConfirmUrl == other.agentWebConfirmUrl &&
        agentWebConfirmUrlUat == other.agentWebConfirmUrlUat &&
        agentWebUrl == other.agentWebUrl &&
        agentWebUrlUat == other.agentWebUrlUat &&
        agentWebLeadUrl == other.agentWebLeadUrl &&
        agentWebLeadUrlUat == other.agentWebLeadUrlUat;
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
        apiUrlLeadProd,
        ocrUrlDev,
        ocrUrlProd,
        contractUrl,
        contractUrlDev,
        agentWebConfirmUrl,
        agentWebConfirmUrlUat,
        agentWebUrl,
        agentWebUrlUat,
        agentWebLeadUrl,
        agentWebLeadUrlUat
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
  String? ocrUrlDev,
  String? ocrUrlProd,
  String? contractUrl,
  String? contractUrlDev,
  String? agentWebConfirmUrl,
  String? agentWebConfirmUrlUat,
  String? agentWebUrl,
  String? agentWebUrlUat,
  String? agentWebLeadUrl,
  String? agentWebLeadUrlUat,
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
      ocrUrlDev: ocrUrlDev,
      ocrUrlProd: ocrUrlProd,
      contractUrl: contractUrl,
      contractUrlDev: contractUrlDev,
      agentWebConfirmUrl: agentWebConfirmUrl,
      agentWebConfirmUrlUat: agentWebConfirmUrlUat,
      agentWebUrl: agentWebUrl,
      agentWebUrlUat: agentWebUrlUat,
      agentWebLeadUrl: agentWebLeadUrl,
      agentWebLeadUrlUat: agentWebLeadUrlUat,
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
