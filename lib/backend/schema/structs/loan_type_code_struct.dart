// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LoanTypeCodeStruct extends FFFirebaseStruct {
  LoanTypeCodeStruct({
    List<String>? s14,
    List<String>? sdg,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _s14 = s14,
        _sdg = sdg,
        super(firestoreUtilData);

  // "S14" field.
  List<String>? _s14;
  List<String> get s14 => _s14 ?? const [];
  set s14(List<String>? val) => _s14 = val;

  void updateS14(Function(List<String>) updateFn) {
    updateFn(_s14 ??= []);
  }

  bool hasS14() => _s14 != null;

  // "SDG" field.
  List<String>? _sdg;
  List<String> get sdg => _sdg ?? const [];
  set sdg(List<String>? val) => _sdg = val;

  void updateSdg(Function(List<String>) updateFn) {
    updateFn(_sdg ??= []);
  }

  bool hasSdg() => _sdg != null;

  static LoanTypeCodeStruct fromMap(Map<String, dynamic> data) =>
      LoanTypeCodeStruct(
        s14: getDataList(data['S14']),
        sdg: getDataList(data['SDG']),
      );

  static LoanTypeCodeStruct? maybeFromMap(dynamic data) => data is Map
      ? LoanTypeCodeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'S14': _s14,
        'SDG': _sdg,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'S14': serializeParam(
          _s14,
          ParamType.String,
          isList: true,
        ),
        'SDG': serializeParam(
          _sdg,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static LoanTypeCodeStruct fromSerializableMap(Map<String, dynamic> data) =>
      LoanTypeCodeStruct(
        s14: deserializeParam<String>(
          data['S14'],
          ParamType.String,
          true,
        ),
        sdg: deserializeParam<String>(
          data['SDG'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'LoanTypeCodeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is LoanTypeCodeStruct &&
        listEquality.equals(s14, other.s14) &&
        listEquality.equals(sdg, other.sdg);
  }

  @override
  int get hashCode => const ListEquality().hash([s14, sdg]);
}

LoanTypeCodeStruct createLoanTypeCodeStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LoanTypeCodeStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LoanTypeCodeStruct? updateLoanTypeCodeStruct(
  LoanTypeCodeStruct? loanTypeCode, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    loanTypeCode
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLoanTypeCodeStructData(
  Map<String, dynamic> firestoreData,
  LoanTypeCodeStruct? loanTypeCode,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (loanTypeCode == null) {
    return;
  }
  if (loanTypeCode.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && loanTypeCode.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final loanTypeCodeData =
      getLoanTypeCodeFirestoreData(loanTypeCode, forFieldValue);
  final nestedData =
      loanTypeCodeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = loanTypeCode.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLoanTypeCodeFirestoreData(
  LoanTypeCodeStruct? loanTypeCode, [
  bool forFieldValue = false,
]) {
  if (loanTypeCode == null) {
    return {};
  }
  final firestoreData = mapToFirestore(loanTypeCode.toMap());

  // Add any Firestore field values
  loanTypeCode.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLoanTypeCodeListFirestoreData(
  List<LoanTypeCodeStruct>? loanTypeCodes,
) =>
    loanTypeCodes?.map((e) => getLoanTypeCodeFirestoreData(e, true)).toList() ??
    [];
