// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class MasterLoanTypeDataModelStruct extends FFFirebaseStruct {
  MasterLoanTypeDataModelStruct({
    String? loanTypeCode,
    String? loanTypeName,
    String? loanTypeId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _loanTypeCode = loanTypeCode,
        _loanTypeName = loanTypeName,
        _loanTypeId = loanTypeId,
        super(firestoreUtilData);

  // "loan_type_code" field.
  String? _loanTypeCode;
  String get loanTypeCode => _loanTypeCode ?? '';
  set loanTypeCode(String? val) => _loanTypeCode = val;

  bool hasLoanTypeCode() => _loanTypeCode != null;

  // "loan_type_name" field.
  String? _loanTypeName;
  String get loanTypeName => _loanTypeName ?? '';
  set loanTypeName(String? val) => _loanTypeName = val;

  bool hasLoanTypeName() => _loanTypeName != null;

  // "loan_type_id" field.
  String? _loanTypeId;
  String get loanTypeId => _loanTypeId ?? '';
  set loanTypeId(String? val) => _loanTypeId = val;

  bool hasLoanTypeId() => _loanTypeId != null;

  static MasterLoanTypeDataModelStruct fromMap(Map<String, dynamic> data) =>
      MasterLoanTypeDataModelStruct(
        loanTypeCode: data['loan_type_code'] as String?,
        loanTypeName: data['loan_type_name'] as String?,
        loanTypeId: data['loan_type_id'] as String?,
      );

  static MasterLoanTypeDataModelStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? MasterLoanTypeDataModelStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'loan_type_code': _loanTypeCode,
        'loan_type_name': _loanTypeName,
        'loan_type_id': _loanTypeId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'loan_type_code': serializeParam(
          _loanTypeCode,
          ParamType.String,
        ),
        'loan_type_name': serializeParam(
          _loanTypeName,
          ParamType.String,
        ),
        'loan_type_id': serializeParam(
          _loanTypeId,
          ParamType.String,
        ),
      }.withoutNulls;

  static MasterLoanTypeDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      MasterLoanTypeDataModelStruct(
        loanTypeCode: deserializeParam(
          data['loan_type_code'],
          ParamType.String,
          false,
        ),
        loanTypeName: deserializeParam(
          data['loan_type_name'],
          ParamType.String,
          false,
        ),
        loanTypeId: deserializeParam(
          data['loan_type_id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MasterLoanTypeDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MasterLoanTypeDataModelStruct &&
        loanTypeCode == other.loanTypeCode &&
        loanTypeName == other.loanTypeName &&
        loanTypeId == other.loanTypeId;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([loanTypeCode, loanTypeName, loanTypeId]);
}

MasterLoanTypeDataModelStruct createMasterLoanTypeDataModelStruct({
  String? loanTypeCode,
  String? loanTypeName,
  String? loanTypeId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MasterLoanTypeDataModelStruct(
      loanTypeCode: loanTypeCode,
      loanTypeName: loanTypeName,
      loanTypeId: loanTypeId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MasterLoanTypeDataModelStruct? updateMasterLoanTypeDataModelStruct(
  MasterLoanTypeDataModelStruct? masterLoanTypeDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    masterLoanTypeDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMasterLoanTypeDataModelStructData(
  Map<String, dynamic> firestoreData,
  MasterLoanTypeDataModelStruct? masterLoanTypeDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (masterLoanTypeDataModel == null) {
    return;
  }
  if (masterLoanTypeDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      masterLoanTypeDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final masterLoanTypeDataModelData = getMasterLoanTypeDataModelFirestoreData(
      masterLoanTypeDataModel, forFieldValue);
  final nestedData =
      masterLoanTypeDataModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      masterLoanTypeDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMasterLoanTypeDataModelFirestoreData(
  MasterLoanTypeDataModelStruct? masterLoanTypeDataModel, [
  bool forFieldValue = false,
]) {
  if (masterLoanTypeDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(masterLoanTypeDataModel.toMap());

  // Add any Firestore field values
  mapToFirestore(masterLoanTypeDataModel.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMasterLoanTypeDataModelListFirestoreData(
  List<MasterLoanTypeDataModelStruct>? masterLoanTypeDataModels,
) =>
    masterLoanTypeDataModels
        ?.map((e) => getMasterLoanTypeDataModelFirestoreData(e, true))
        .toList() ??
    [];
