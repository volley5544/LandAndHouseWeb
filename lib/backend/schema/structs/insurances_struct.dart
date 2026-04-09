// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class InsurancesStruct extends FFFirebaseStruct {
  InsurancesStruct({
    String? insCode,
    String? insName,
    String? effectiveDate,
    String? expiredDate,
    String? remark,
    String? insUrl,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _insCode = insCode,
        _insName = insName,
        _effectiveDate = effectiveDate,
        _expiredDate = expiredDate,
        _remark = remark,
        _insUrl = insUrl,
        super(firestoreUtilData);

  // "ins_code" field.
  String? _insCode;
  String get insCode => _insCode ?? '';
  set insCode(String? val) => _insCode = val;

  bool hasInsCode() => _insCode != null;

  // "ins_name" field.
  String? _insName;
  String get insName => _insName ?? '';
  set insName(String? val) => _insName = val;

  bool hasInsName() => _insName != null;

  // "effective_date" field.
  String? _effectiveDate;
  String get effectiveDate => _effectiveDate ?? '';
  set effectiveDate(String? val) => _effectiveDate = val;

  bool hasEffectiveDate() => _effectiveDate != null;

  // "expired_date" field.
  String? _expiredDate;
  String get expiredDate => _expiredDate ?? '';
  set expiredDate(String? val) => _expiredDate = val;

  bool hasExpiredDate() => _expiredDate != null;

  // "remark" field.
  String? _remark;
  String get remark => _remark ?? '';
  set remark(String? val) => _remark = val;

  bool hasRemark() => _remark != null;

  // "ins_url" field.
  String? _insUrl;
  String get insUrl => _insUrl ?? '';
  set insUrl(String? val) => _insUrl = val;

  bool hasInsUrl() => _insUrl != null;

  static InsurancesStruct fromMap(Map<String, dynamic> data) =>
      InsurancesStruct(
        insCode: data['ins_code'] as String?,
        insName: data['ins_name'] as String?,
        effectiveDate: data['effective_date'] as String?,
        expiredDate: data['expired_date'] as String?,
        remark: data['remark'] as String?,
        insUrl: data['ins_url'] as String?,
      );

  static InsurancesStruct? maybeFromMap(dynamic data) => data is Map
      ? InsurancesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'ins_code': _insCode,
        'ins_name': _insName,
        'effective_date': _effectiveDate,
        'expired_date': _expiredDate,
        'remark': _remark,
        'ins_url': _insUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ins_code': serializeParam(
          _insCode,
          ParamType.String,
        ),
        'ins_name': serializeParam(
          _insName,
          ParamType.String,
        ),
        'effective_date': serializeParam(
          _effectiveDate,
          ParamType.String,
        ),
        'expired_date': serializeParam(
          _expiredDate,
          ParamType.String,
        ),
        'remark': serializeParam(
          _remark,
          ParamType.String,
        ),
        'ins_url': serializeParam(
          _insUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static InsurancesStruct fromSerializableMap(Map<String, dynamic> data) =>
      InsurancesStruct(
        insCode: deserializeParam(
          data['ins_code'],
          ParamType.String,
          false,
        ),
        insName: deserializeParam(
          data['ins_name'],
          ParamType.String,
          false,
        ),
        effectiveDate: deserializeParam(
          data['effective_date'],
          ParamType.String,
          false,
        ),
        expiredDate: deserializeParam(
          data['expired_date'],
          ParamType.String,
          false,
        ),
        remark: deserializeParam(
          data['remark'],
          ParamType.String,
          false,
        ),
        insUrl: deserializeParam(
          data['ins_url'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'InsurancesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is InsurancesStruct &&
        insCode == other.insCode &&
        insName == other.insName &&
        effectiveDate == other.effectiveDate &&
        expiredDate == other.expiredDate &&
        remark == other.remark &&
        insUrl == other.insUrl;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([insCode, insName, effectiveDate, expiredDate, remark, insUrl]);
}

InsurancesStruct createInsurancesStruct({
  String? insCode,
  String? insName,
  String? effectiveDate,
  String? expiredDate,
  String? remark,
  String? insUrl,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    InsurancesStruct(
      insCode: insCode,
      insName: insName,
      effectiveDate: effectiveDate,
      expiredDate: expiredDate,
      remark: remark,
      insUrl: insUrl,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

InsurancesStruct? updateInsurancesStruct(
  InsurancesStruct? insurances, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    insurances
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addInsurancesStructData(
  Map<String, dynamic> firestoreData,
  InsurancesStruct? insurances,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (insurances == null) {
    return;
  }
  if (insurances.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && insurances.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final insurancesData = getInsurancesFirestoreData(insurances, forFieldValue);
  final nestedData = insurancesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = insurances.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getInsurancesFirestoreData(
  InsurancesStruct? insurances, [
  bool forFieldValue = false,
]) {
  if (insurances == null) {
    return {};
  }
  final firestoreData = mapToFirestore(insurances.toMap());

  // Add any Firestore field values
  mapToFirestore(insurances.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getInsurancesListFirestoreData(
  List<InsurancesStruct>? insurancess,
) =>
    insurancess?.map((e) => getInsurancesFirestoreData(e, true)).toList() ?? [];
