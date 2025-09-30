// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class MasterAgentModelModelStruct extends FFFirebaseStruct {
  MasterAgentModelModelStruct({
    String? modelId,
    String? modelName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _modelId = modelId,
        _modelName = modelName,
        super(firestoreUtilData);

  // "model_id" field.
  String? _modelId;
  String get modelId => _modelId ?? '';
  set modelId(String? val) => _modelId = val;

  bool hasModelId() => _modelId != null;

  // "model_name" field.
  String? _modelName;
  String get modelName => _modelName ?? '';
  set modelName(String? val) => _modelName = val;

  bool hasModelName() => _modelName != null;

  static MasterAgentModelModelStruct fromMap(Map<String, dynamic> data) =>
      MasterAgentModelModelStruct(
        modelId: data['model_id'] as String?,
        modelName: data['model_name'] as String?,
      );

  static MasterAgentModelModelStruct? maybeFromMap(dynamic data) => data is Map
      ? MasterAgentModelModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'model_id': _modelId,
        'model_name': _modelName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'model_id': serializeParam(
          _modelId,
          ParamType.String,
        ),
        'model_name': serializeParam(
          _modelName,
          ParamType.String,
        ),
      }.withoutNulls;

  static MasterAgentModelModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      MasterAgentModelModelStruct(
        modelId: deserializeParam(
          data['model_id'],
          ParamType.String,
          false,
        ),
        modelName: deserializeParam(
          data['model_name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MasterAgentModelModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MasterAgentModelModelStruct &&
        modelId == other.modelId &&
        modelName == other.modelName;
  }

  @override
  int get hashCode => const ListEquality().hash([modelId, modelName]);
}

MasterAgentModelModelStruct createMasterAgentModelModelStruct({
  String? modelId,
  String? modelName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MasterAgentModelModelStruct(
      modelId: modelId,
      modelName: modelName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MasterAgentModelModelStruct? updateMasterAgentModelModelStruct(
  MasterAgentModelModelStruct? masterAgentModelModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    masterAgentModelModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMasterAgentModelModelStructData(
  Map<String, dynamic> firestoreData,
  MasterAgentModelModelStruct? masterAgentModelModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (masterAgentModelModel == null) {
    return;
  }
  if (masterAgentModelModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      masterAgentModelModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final masterAgentModelModelData = getMasterAgentModelModelFirestoreData(
      masterAgentModelModel, forFieldValue);
  final nestedData =
      masterAgentModelModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      masterAgentModelModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMasterAgentModelModelFirestoreData(
  MasterAgentModelModelStruct? masterAgentModelModel, [
  bool forFieldValue = false,
]) {
  if (masterAgentModelModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(masterAgentModelModel.toMap());

  // Add any Firestore field values
  masterAgentModelModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMasterAgentModelModelListFirestoreData(
  List<MasterAgentModelModelStruct>? masterAgentModelModels,
) =>
    masterAgentModelModels
        ?.map((e) => getMasterAgentModelModelFirestoreData(e, true))
        .toList() ??
    [];
