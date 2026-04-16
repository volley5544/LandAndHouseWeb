// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SolarSaveStep1Struct extends FFFirebaseStruct {
  SolarSaveStep1Struct({
    int? step,
    String? action,
    int? tempLeadId,
    PayloadStruct? payload,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _step = step,
        _action = action,
        _tempLeadId = tempLeadId,
        _payload = payload,
        super(firestoreUtilData);

  // "step" field.
  int? _step;
  int get step => _step ?? 0;
  set step(int? val) => _step = val;

  void incrementStep(int amount) => step = step + amount;

  bool hasStep() => _step != null;

  // "action" field.
  String? _action;
  String get action => _action ?? '';
  set action(String? val) => _action = val;

  bool hasAction() => _action != null;

  // "temp_lead_id" field.
  int? _tempLeadId;
  int get tempLeadId => _tempLeadId ?? 0;
  set tempLeadId(int? val) => _tempLeadId = val;

  void incrementTempLeadId(int amount) => tempLeadId = tempLeadId + amount;

  bool hasTempLeadId() => _tempLeadId != null;

  // "payload" field.
  PayloadStruct? _payload;
  PayloadStruct get payload => _payload ?? PayloadStruct();
  set payload(PayloadStruct? val) => _payload = val;

  void updatePayload(Function(PayloadStruct) updateFn) {
    updateFn(_payload ??= PayloadStruct());
  }

  bool hasPayload() => _payload != null;

  static SolarSaveStep1Struct fromMap(Map<String, dynamic> data) =>
      SolarSaveStep1Struct(
        step: castToType<int>(data['step']),
        action: data['action'] as String?,
        tempLeadId: castToType<int>(data['temp_lead_id']),
        payload: data['payload'] is PayloadStruct
            ? data['payload']
            : PayloadStruct.maybeFromMap(data['payload']),
      );

  static SolarSaveStep1Struct? maybeFromMap(dynamic data) => data is Map
      ? SolarSaveStep1Struct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'step': _step,
        'action': _action,
        'temp_lead_id': _tempLeadId,
        'payload': _payload?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'step': serializeParam(
          _step,
          ParamType.int,
        ),
        'action': serializeParam(
          _action,
          ParamType.String,
        ),
        'temp_lead_id': serializeParam(
          _tempLeadId,
          ParamType.int,
        ),
        'payload': serializeParam(
          _payload,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static SolarSaveStep1Struct fromSerializableMap(Map<String, dynamic> data) =>
      SolarSaveStep1Struct(
        step: deserializeParam(
          data['step'],
          ParamType.int,
          false,
        ),
        action: deserializeParam(
          data['action'],
          ParamType.String,
          false,
        ),
        tempLeadId: deserializeParam(
          data['temp_lead_id'],
          ParamType.int,
          false,
        ),
        payload: deserializeStructParam(
          data['payload'],
          ParamType.DataStruct,
          false,
          structBuilder: PayloadStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'SolarSaveStep1Struct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SolarSaveStep1Struct &&
        step == other.step &&
        action == other.action &&
        tempLeadId == other.tempLeadId &&
        payload == other.payload;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([step, action, tempLeadId, payload]);
}

SolarSaveStep1Struct createSolarSaveStep1Struct({
  int? step,
  String? action,
  int? tempLeadId,
  PayloadStruct? payload,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SolarSaveStep1Struct(
      step: step,
      action: action,
      tempLeadId: tempLeadId,
      payload: payload ?? (clearUnsetFields ? PayloadStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SolarSaveStep1Struct? updateSolarSaveStep1Struct(
  SolarSaveStep1Struct? solarSaveStep1, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    solarSaveStep1
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSolarSaveStep1StructData(
  Map<String, dynamic> firestoreData,
  SolarSaveStep1Struct? solarSaveStep1,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (solarSaveStep1 == null) {
    return;
  }
  if (solarSaveStep1.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && solarSaveStep1.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final solarSaveStep1Data =
      getSolarSaveStep1FirestoreData(solarSaveStep1, forFieldValue);
  final nestedData =
      solarSaveStep1Data.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = solarSaveStep1.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSolarSaveStep1FirestoreData(
  SolarSaveStep1Struct? solarSaveStep1, [
  bool forFieldValue = false,
]) {
  if (solarSaveStep1 == null) {
    return {};
  }
  final firestoreData = mapToFirestore(solarSaveStep1.toMap());

  // Handle nested data for "payload" field.
  addPayloadStructData(
    firestoreData,
    solarSaveStep1.hasPayload() ? solarSaveStep1.payload : null,
    'payload',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(solarSaveStep1.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSolarSaveStep1ListFirestoreData(
  List<SolarSaveStep1Struct>? solarSaveStep1s,
) =>
    solarSaveStep1s
        ?.map((e) => getSolarSaveStep1FirestoreData(e, true))
        .toList() ??
    [];
