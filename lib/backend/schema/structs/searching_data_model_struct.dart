// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SearchingDataModelStruct extends FFFirebaseStruct {
  SearchingDataModelStruct({
    String? value,
    String? label,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _value = value,
        _label = label,
        super(firestoreUtilData);

  // "value" field.
  String? _value;
  String get value => _value ?? '';
  set value(String? val) => _value = val;

  bool hasValue() => _value != null;

  // "label" field.
  String? _label;
  String get label => _label ?? '';
  set label(String? val) => _label = val;

  bool hasLabel() => _label != null;

  static SearchingDataModelStruct fromMap(Map<String, dynamic> data) =>
      SearchingDataModelStruct(
        value: data['value'] as String?,
        label: data['label'] as String?,
      );

  static SearchingDataModelStruct? maybeFromMap(dynamic data) => data is Map
      ? SearchingDataModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'value': _value,
        'label': _label,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'value': serializeParam(
          _value,
          ParamType.String,
        ),
        'label': serializeParam(
          _label,
          ParamType.String,
        ),
      }.withoutNulls;

  static SearchingDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SearchingDataModelStruct(
        value: deserializeParam(
          data['value'],
          ParamType.String,
          false,
        ),
        label: deserializeParam(
          data['label'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SearchingDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SearchingDataModelStruct &&
        value == other.value &&
        label == other.label;
  }

  @override
  int get hashCode => const ListEquality().hash([value, label]);
}

SearchingDataModelStruct createSearchingDataModelStruct({
  String? value,
  String? label,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SearchingDataModelStruct(
      value: value,
      label: label,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SearchingDataModelStruct? updateSearchingDataModelStruct(
  SearchingDataModelStruct? searchingDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    searchingDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSearchingDataModelStructData(
  Map<String, dynamic> firestoreData,
  SearchingDataModelStruct? searchingDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (searchingDataModel == null) {
    return;
  }
  if (searchingDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && searchingDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final searchingDataModelData =
      getSearchingDataModelFirestoreData(searchingDataModel, forFieldValue);
  final nestedData =
      searchingDataModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      searchingDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSearchingDataModelFirestoreData(
  SearchingDataModelStruct? searchingDataModel, [
  bool forFieldValue = false,
]) {
  if (searchingDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(searchingDataModel.toMap());

  // Add any Firestore field values
  mapToFirestore(searchingDataModel.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSearchingDataModelListFirestoreData(
  List<SearchingDataModelStruct>? searchingDataModels,
) =>
    searchingDataModels
        ?.map((e) => getSearchingDataModelFirestoreData(e, true))
        .toList() ??
    [];
