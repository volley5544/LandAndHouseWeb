// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ConsentStruct extends FFFirebaseStruct {
  ConsentStruct({
    String? consentFlag,
    String? consentDate,
    String? consentType,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _consentFlag = consentFlag,
        _consentDate = consentDate,
        _consentType = consentType,
        super(firestoreUtilData);

  // "consent_flag" field.
  String? _consentFlag;
  String get consentFlag => _consentFlag ?? '';
  set consentFlag(String? val) => _consentFlag = val;

  bool hasConsentFlag() => _consentFlag != null;

  // "consent_date" field.
  String? _consentDate;
  String get consentDate => _consentDate ?? '';
  set consentDate(String? val) => _consentDate = val;

  bool hasConsentDate() => _consentDate != null;

  // "consent_type" field.
  String? _consentType;
  String get consentType => _consentType ?? '';
  set consentType(String? val) => _consentType = val;

  bool hasConsentType() => _consentType != null;

  static ConsentStruct fromMap(Map<String, dynamic> data) => ConsentStruct(
        consentFlag: data['consent_flag'] as String?,
        consentDate: data['consent_date'] as String?,
        consentType: data['consent_type'] as String?,
      );

  static ConsentStruct? maybeFromMap(dynamic data) =>
      data is Map ? ConsentStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'consent_flag': _consentFlag,
        'consent_date': _consentDate,
        'consent_type': _consentType,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'consent_flag': serializeParam(
          _consentFlag,
          ParamType.String,
        ),
        'consent_date': serializeParam(
          _consentDate,
          ParamType.String,
        ),
        'consent_type': serializeParam(
          _consentType,
          ParamType.String,
        ),
      }.withoutNulls;

  static ConsentStruct fromSerializableMap(Map<String, dynamic> data) =>
      ConsentStruct(
        consentFlag: deserializeParam(
          data['consent_flag'],
          ParamType.String,
          false,
        ),
        consentDate: deserializeParam(
          data['consent_date'],
          ParamType.String,
          false,
        ),
        consentType: deserializeParam(
          data['consent_type'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ConsentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ConsentStruct &&
        consentFlag == other.consentFlag &&
        consentDate == other.consentDate &&
        consentType == other.consentType;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([consentFlag, consentDate, consentType]);
}

ConsentStruct createConsentStruct({
  String? consentFlag,
  String? consentDate,
  String? consentType,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ConsentStruct(
      consentFlag: consentFlag,
      consentDate: consentDate,
      consentType: consentType,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ConsentStruct? updateConsentStruct(
  ConsentStruct? consent, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    consent
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addConsentStructData(
  Map<String, dynamic> firestoreData,
  ConsentStruct? consent,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (consent == null) {
    return;
  }
  if (consent.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && consent.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final consentData = getConsentFirestoreData(consent, forFieldValue);
  final nestedData = consentData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = consent.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getConsentFirestoreData(
  ConsentStruct? consent, [
  bool forFieldValue = false,
]) {
  if (consent == null) {
    return {};
  }
  final firestoreData = mapToFirestore(consent.toMap());

  // Add any Firestore field values
  mapToFirestore(consent.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getConsentListFirestoreData(
  List<ConsentStruct>? consents,
) =>
    consents?.map((e) => getConsentFirestoreData(e, true)).toList() ?? [];
