// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class MasterAgentCCModelStruct extends FFFirebaseStruct {
  MasterAgentCCModelStruct({
    String? ccId,
    String? ccName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _ccId = ccId,
        _ccName = ccName,
        super(firestoreUtilData);

  // "cc_id" field.
  String? _ccId;
  String get ccId => _ccId ?? '';
  set ccId(String? val) => _ccId = val;

  bool hasCcId() => _ccId != null;

  // "cc_name" field.
  String? _ccName;
  String get ccName => _ccName ?? '';
  set ccName(String? val) => _ccName = val;

  bool hasCcName() => _ccName != null;

  static MasterAgentCCModelStruct fromMap(Map<String, dynamic> data) =>
      MasterAgentCCModelStruct(
        ccId: data['cc_id'] as String?,
        ccName: data['cc_name'] as String?,
      );

  static MasterAgentCCModelStruct? maybeFromMap(dynamic data) => data is Map
      ? MasterAgentCCModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'cc_id': _ccId,
        'cc_name': _ccName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'cc_id': serializeParam(
          _ccId,
          ParamType.String,
        ),
        'cc_name': serializeParam(
          _ccName,
          ParamType.String,
        ),
      }.withoutNulls;

  static MasterAgentCCModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      MasterAgentCCModelStruct(
        ccId: deserializeParam(
          data['cc_id'],
          ParamType.String,
          false,
        ),
        ccName: deserializeParam(
          data['cc_name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MasterAgentCCModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MasterAgentCCModelStruct &&
        ccId == other.ccId &&
        ccName == other.ccName;
  }

  @override
  int get hashCode => const ListEquality().hash([ccId, ccName]);
}

MasterAgentCCModelStruct createMasterAgentCCModelStruct({
  String? ccId,
  String? ccName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MasterAgentCCModelStruct(
      ccId: ccId,
      ccName: ccName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MasterAgentCCModelStruct? updateMasterAgentCCModelStruct(
  MasterAgentCCModelStruct? masterAgentCCModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    masterAgentCCModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMasterAgentCCModelStructData(
  Map<String, dynamic> firestoreData,
  MasterAgentCCModelStruct? masterAgentCCModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (masterAgentCCModel == null) {
    return;
  }
  if (masterAgentCCModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && masterAgentCCModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final masterAgentCCModelData =
      getMasterAgentCCModelFirestoreData(masterAgentCCModel, forFieldValue);
  final nestedData =
      masterAgentCCModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      masterAgentCCModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMasterAgentCCModelFirestoreData(
  MasterAgentCCModelStruct? masterAgentCCModel, [
  bool forFieldValue = false,
]) {
  if (masterAgentCCModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(masterAgentCCModel.toMap());

  // Add any Firestore field values
  masterAgentCCModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMasterAgentCCModelListFirestoreData(
  List<MasterAgentCCModelStruct>? masterAgentCCModels,
) =>
    masterAgentCCModels
        ?.map((e) => getMasterAgentCCModelFirestoreData(e, true))
        .toList() ??
    [];
