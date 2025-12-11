// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class LeadAgentStateDataModelStruct extends FFFirebaseStruct {
  LeadAgentStateDataModelStruct({
    String? name,
    bool? active,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _active = active,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  set active(bool? val) => _active = val;

  bool hasActive() => _active != null;

  static LeadAgentStateDataModelStruct fromMap(Map<String, dynamic> data) =>
      LeadAgentStateDataModelStruct(
        name: data['name'] as String?,
        active: data['active'] as bool?,
      );

  static LeadAgentStateDataModelStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? LeadAgentStateDataModelStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'active': _active,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'active': serializeParam(
          _active,
          ParamType.bool,
        ),
      }.withoutNulls;

  static LeadAgentStateDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      LeadAgentStateDataModelStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        active: deserializeParam(
          data['active'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'LeadAgentStateDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LeadAgentStateDataModelStruct &&
        name == other.name &&
        active == other.active;
  }

  @override
  int get hashCode => const ListEquality().hash([name, active]);
}

LeadAgentStateDataModelStruct createLeadAgentStateDataModelStruct({
  String? name,
  bool? active,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LeadAgentStateDataModelStruct(
      name: name,
      active: active,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LeadAgentStateDataModelStruct? updateLeadAgentStateDataModelStruct(
  LeadAgentStateDataModelStruct? leadAgentStateDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    leadAgentStateDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLeadAgentStateDataModelStructData(
  Map<String, dynamic> firestoreData,
  LeadAgentStateDataModelStruct? leadAgentStateDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (leadAgentStateDataModel == null) {
    return;
  }
  if (leadAgentStateDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      leadAgentStateDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final leadAgentStateDataModelData = getLeadAgentStateDataModelFirestoreData(
      leadAgentStateDataModel, forFieldValue);
  final nestedData =
      leadAgentStateDataModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      leadAgentStateDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLeadAgentStateDataModelFirestoreData(
  LeadAgentStateDataModelStruct? leadAgentStateDataModel, [
  bool forFieldValue = false,
]) {
  if (leadAgentStateDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(leadAgentStateDataModel.toMap());

  // Add any Firestore field values
  leadAgentStateDataModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLeadAgentStateDataModelListFirestoreData(
  List<LeadAgentStateDataModelStruct>? leadAgentStateDataModels,
) =>
    leadAgentStateDataModels
        ?.map((e) => getLeadAgentStateDataModelFirestoreData(e, true))
        .toList() ??
    [];
