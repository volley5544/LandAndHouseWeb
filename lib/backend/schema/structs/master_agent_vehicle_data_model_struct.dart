// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class MasterAgentVehicleDataModelStruct extends FFFirebaseStruct {
  MasterAgentVehicleDataModelStruct({
    String? vehicleId,
    String? vehicleCode,
    String? vehicleName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _vehicleId = vehicleId,
        _vehicleCode = vehicleCode,
        _vehicleName = vehicleName,
        super(firestoreUtilData);

  // "vehicle_id" field.
  String? _vehicleId;
  String get vehicleId => _vehicleId ?? '';
  set vehicleId(String? val) => _vehicleId = val;

  bool hasVehicleId() => _vehicleId != null;

  // "vehicle_code" field.
  String? _vehicleCode;
  String get vehicleCode => _vehicleCode ?? '';
  set vehicleCode(String? val) => _vehicleCode = val;

  bool hasVehicleCode() => _vehicleCode != null;

  // "vehicle_name" field.
  String? _vehicleName;
  String get vehicleName => _vehicleName ?? '';
  set vehicleName(String? val) => _vehicleName = val;

  bool hasVehicleName() => _vehicleName != null;

  static MasterAgentVehicleDataModelStruct fromMap(Map<String, dynamic> data) =>
      MasterAgentVehicleDataModelStruct(
        vehicleId: data['vehicle_id'] as String?,
        vehicleCode: data['vehicle_code'] as String?,
        vehicleName: data['vehicle_name'] as String?,
      );

  static MasterAgentVehicleDataModelStruct? maybeFromMap(dynamic data) => data
          is Map
      ? MasterAgentVehicleDataModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'vehicle_id': _vehicleId,
        'vehicle_code': _vehicleCode,
        'vehicle_name': _vehicleName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'vehicle_id': serializeParam(
          _vehicleId,
          ParamType.String,
        ),
        'vehicle_code': serializeParam(
          _vehicleCode,
          ParamType.String,
        ),
        'vehicle_name': serializeParam(
          _vehicleName,
          ParamType.String,
        ),
      }.withoutNulls;

  static MasterAgentVehicleDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      MasterAgentVehicleDataModelStruct(
        vehicleId: deserializeParam(
          data['vehicle_id'],
          ParamType.String,
          false,
        ),
        vehicleCode: deserializeParam(
          data['vehicle_code'],
          ParamType.String,
          false,
        ),
        vehicleName: deserializeParam(
          data['vehicle_name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MasterAgentVehicleDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MasterAgentVehicleDataModelStruct &&
        vehicleId == other.vehicleId &&
        vehicleCode == other.vehicleCode &&
        vehicleName == other.vehicleName;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([vehicleId, vehicleCode, vehicleName]);
}

MasterAgentVehicleDataModelStruct createMasterAgentVehicleDataModelStruct({
  String? vehicleId,
  String? vehicleCode,
  String? vehicleName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MasterAgentVehicleDataModelStruct(
      vehicleId: vehicleId,
      vehicleCode: vehicleCode,
      vehicleName: vehicleName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MasterAgentVehicleDataModelStruct? updateMasterAgentVehicleDataModelStruct(
  MasterAgentVehicleDataModelStruct? masterAgentVehicleDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    masterAgentVehicleDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMasterAgentVehicleDataModelStructData(
  Map<String, dynamic> firestoreData,
  MasterAgentVehicleDataModelStruct? masterAgentVehicleDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (masterAgentVehicleDataModel == null) {
    return;
  }
  if (masterAgentVehicleDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      masterAgentVehicleDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final masterAgentVehicleDataModelData =
      getMasterAgentVehicleDataModelFirestoreData(
          masterAgentVehicleDataModel, forFieldValue);
  final nestedData = masterAgentVehicleDataModelData
      .map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      masterAgentVehicleDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMasterAgentVehicleDataModelFirestoreData(
  MasterAgentVehicleDataModelStruct? masterAgentVehicleDataModel, [
  bool forFieldValue = false,
]) {
  if (masterAgentVehicleDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(masterAgentVehicleDataModel.toMap());

  // Add any Firestore field values
  mapToFirestore(masterAgentVehicleDataModel.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMasterAgentVehicleDataModelListFirestoreData(
  List<MasterAgentVehicleDataModelStruct>? masterAgentVehicleDataModels,
) =>
    masterAgentVehicleDataModels
        ?.map((e) => getMasterAgentVehicleDataModelFirestoreData(e, true))
        .toList() ??
    [];
