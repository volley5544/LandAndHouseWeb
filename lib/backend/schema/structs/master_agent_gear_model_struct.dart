// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class MasterAgentGearModelStruct extends FFFirebaseStruct {
  MasterAgentGearModelStruct({
    String? gearId,
    String? gearName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _gearId = gearId,
        _gearName = gearName,
        super(firestoreUtilData);

  // "gear_id" field.
  String? _gearId;
  String get gearId => _gearId ?? '';
  set gearId(String? val) => _gearId = val;

  bool hasGearId() => _gearId != null;

  // "gear_name" field.
  String? _gearName;
  String get gearName => _gearName ?? '';
  set gearName(String? val) => _gearName = val;

  bool hasGearName() => _gearName != null;

  static MasterAgentGearModelStruct fromMap(Map<String, dynamic> data) =>
      MasterAgentGearModelStruct(
        gearId: data['gear_id'] as String?,
        gearName: data['gear_name'] as String?,
      );

  static MasterAgentGearModelStruct? maybeFromMap(dynamic data) => data is Map
      ? MasterAgentGearModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'gear_id': _gearId,
        'gear_name': _gearName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'gear_id': serializeParam(
          _gearId,
          ParamType.String,
        ),
        'gear_name': serializeParam(
          _gearName,
          ParamType.String,
        ),
      }.withoutNulls;

  static MasterAgentGearModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      MasterAgentGearModelStruct(
        gearId: deserializeParam(
          data['gear_id'],
          ParamType.String,
          false,
        ),
        gearName: deserializeParam(
          data['gear_name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MasterAgentGearModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MasterAgentGearModelStruct &&
        gearId == other.gearId &&
        gearName == other.gearName;
  }

  @override
  int get hashCode => const ListEquality().hash([gearId, gearName]);
}

MasterAgentGearModelStruct createMasterAgentGearModelStruct({
  String? gearId,
  String? gearName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MasterAgentGearModelStruct(
      gearId: gearId,
      gearName: gearName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MasterAgentGearModelStruct? updateMasterAgentGearModelStruct(
  MasterAgentGearModelStruct? masterAgentGearModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    masterAgentGearModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMasterAgentGearModelStructData(
  Map<String, dynamic> firestoreData,
  MasterAgentGearModelStruct? masterAgentGearModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (masterAgentGearModel == null) {
    return;
  }
  if (masterAgentGearModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && masterAgentGearModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final masterAgentGearModelData =
      getMasterAgentGearModelFirestoreData(masterAgentGearModel, forFieldValue);
  final nestedData =
      masterAgentGearModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      masterAgentGearModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMasterAgentGearModelFirestoreData(
  MasterAgentGearModelStruct? masterAgentGearModel, [
  bool forFieldValue = false,
]) {
  if (masterAgentGearModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(masterAgentGearModel.toMap());

  // Add any Firestore field values
  masterAgentGearModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMasterAgentGearModelListFirestoreData(
  List<MasterAgentGearModelStruct>? masterAgentGearModels,
) =>
    masterAgentGearModels
        ?.map((e) => getMasterAgentGearModelFirestoreData(e, true))
        .toList() ??
    [];
