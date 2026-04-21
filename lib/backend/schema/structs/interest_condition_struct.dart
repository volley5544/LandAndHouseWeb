// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class InterestConditionStruct extends FFFirebaseStruct {
  InterestConditionStruct({
    String? operator,
    String? compareFields,
    String? interestRate,
    String? interestDesc,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _operator = operator,
        _compareFields = compareFields,
        _interestRate = interestRate,
        _interestDesc = interestDesc,
        super(firestoreUtilData);

  // "operator" field.
  String? _operator;
  String get operator => _operator ?? '';
  set operator(String? val) => _operator = val;

  bool hasOperator() => _operator != null;

  // "compare_fields" field.
  String? _compareFields;
  String get compareFields => _compareFields ?? '';
  set compareFields(String? val) => _compareFields = val;

  bool hasCompareFields() => _compareFields != null;

  // "interest_rate" field.
  String? _interestRate;
  String get interestRate => _interestRate ?? '';
  set interestRate(String? val) => _interestRate = val;

  bool hasInterestRate() => _interestRate != null;

  // "interest_desc" field.
  String? _interestDesc;
  String get interestDesc => _interestDesc ?? '';
  set interestDesc(String? val) => _interestDesc = val;

  bool hasInterestDesc() => _interestDesc != null;

  static InterestConditionStruct fromMap(Map<String, dynamic> data) =>
      InterestConditionStruct(
        operator: data['operator'] as String?,
        compareFields: data['compare_fields'] as String?,
        interestRate: data['interest_rate'] as String?,
        interestDesc: data['interest_desc'] as String?,
      );

  static InterestConditionStruct? maybeFromMap(dynamic data) => data is Map
      ? InterestConditionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'operator': _operator,
        'compare_fields': _compareFields,
        'interest_rate': _interestRate,
        'interest_desc': _interestDesc,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'operator': serializeParam(
          _operator,
          ParamType.String,
        ),
        'compare_fields': serializeParam(
          _compareFields,
          ParamType.String,
        ),
        'interest_rate': serializeParam(
          _interestRate,
          ParamType.String,
        ),
        'interest_desc': serializeParam(
          _interestDesc,
          ParamType.String,
        ),
      }.withoutNulls;

  static InterestConditionStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      InterestConditionStruct(
        operator: deserializeParam(
          data['operator'],
          ParamType.String,
          false,
        ),
        compareFields: deserializeParam(
          data['compare_fields'],
          ParamType.String,
          false,
        ),
        interestRate: deserializeParam(
          data['interest_rate'],
          ParamType.String,
          false,
        ),
        interestDesc: deserializeParam(
          data['interest_desc'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'InterestConditionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is InterestConditionStruct &&
        operator == other.operator &&
        compareFields == other.compareFields &&
        interestRate == other.interestRate &&
        interestDesc == other.interestDesc;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([operator, compareFields, interestRate, interestDesc]);
}

InterestConditionStruct createInterestConditionStruct({
  String? operator,
  String? compareFields,
  String? interestRate,
  String? interestDesc,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    InterestConditionStruct(
      operator: operator,
      compareFields: compareFields,
      interestRate: interestRate,
      interestDesc: interestDesc,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

InterestConditionStruct? updateInterestConditionStruct(
  InterestConditionStruct? interestCondition, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    interestCondition
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addInterestConditionStructData(
  Map<String, dynamic> firestoreData,
  InterestConditionStruct? interestCondition,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (interestCondition == null) {
    return;
  }
  if (interestCondition.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && interestCondition.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final interestConditionData =
      getInterestConditionFirestoreData(interestCondition, forFieldValue);
  final nestedData =
      interestConditionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = interestCondition.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getInterestConditionFirestoreData(
  InterestConditionStruct? interestCondition, [
  bool forFieldValue = false,
]) {
  if (interestCondition == null) {
    return {};
  }
  final firestoreData = mapToFirestore(interestCondition.toMap());

  // Add any Firestore field values
  mapToFirestore(interestCondition.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getInterestConditionListFirestoreData(
  List<InterestConditionStruct>? interestConditions,
) =>
    interestConditions
        ?.map((e) => getInterestConditionFirestoreData(e, true))
        .toList() ??
    [];
