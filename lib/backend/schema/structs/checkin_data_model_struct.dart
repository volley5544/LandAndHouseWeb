// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CheckinDataModelStruct extends FFFirebaseStruct {
  CheckinDataModelStruct({
    String? time,
    int? count,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _time = time,
        _count = count,
        super(firestoreUtilData);

  // "time" field.
  String? _time;
  String get time => _time ?? '';
  set time(String? val) => _time = val;

  bool hasTime() => _time != null;

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  set count(int? val) => _count = val;

  void incrementCount(int amount) => count = count + amount;

  bool hasCount() => _count != null;

  static CheckinDataModelStruct fromMap(Map<String, dynamic> data) =>
      CheckinDataModelStruct(
        time: data['time'] as String?,
        count: castToType<int>(data['count']),
      );

  static CheckinDataModelStruct? maybeFromMap(dynamic data) => data is Map
      ? CheckinDataModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'time': _time,
        'count': _count,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'time': serializeParam(
          _time,
          ParamType.String,
        ),
        'count': serializeParam(
          _count,
          ParamType.int,
        ),
      }.withoutNulls;

  static CheckinDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CheckinDataModelStruct(
        time: deserializeParam(
          data['time'],
          ParamType.String,
          false,
        ),
        count: deserializeParam(
          data['count'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'CheckinDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CheckinDataModelStruct &&
        time == other.time &&
        count == other.count;
  }

  @override
  int get hashCode => const ListEquality().hash([time, count]);
}

CheckinDataModelStruct createCheckinDataModelStruct({
  String? time,
  int? count,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CheckinDataModelStruct(
      time: time,
      count: count,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CheckinDataModelStruct? updateCheckinDataModelStruct(
  CheckinDataModelStruct? checkinDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    checkinDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCheckinDataModelStructData(
  Map<String, dynamic> firestoreData,
  CheckinDataModelStruct? checkinDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (checkinDataModel == null) {
    return;
  }
  if (checkinDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && checkinDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final checkinDataModelData =
      getCheckinDataModelFirestoreData(checkinDataModel, forFieldValue);
  final nestedData =
      checkinDataModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = checkinDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCheckinDataModelFirestoreData(
  CheckinDataModelStruct? checkinDataModel, [
  bool forFieldValue = false,
]) {
  if (checkinDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(checkinDataModel.toMap());

  // Add any Firestore field values
  checkinDataModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCheckinDataModelListFirestoreData(
  List<CheckinDataModelStruct>? checkinDataModels,
) =>
    checkinDataModels
        ?.map((e) => getCheckinDataModelFirestoreData(e, true))
        .toList() ??
    [];
