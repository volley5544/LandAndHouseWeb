// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LeadAgentMainCatagoryStruct extends FFFirebaseStruct {
  LeadAgentMainCatagoryStruct({
    String? category,
    int? total,
    List<LeadAgentSubCategoryStruct>? subCategory,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _category = category,
        _total = total,
        _subCategory = subCategory,
        super(firestoreUtilData);

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;

  bool hasCategory() => _category != null;

  // "total" field.
  int? _total;
  int get total => _total ?? 0;
  set total(int? val) => _total = val;

  void incrementTotal(int amount) => total = total + amount;

  bool hasTotal() => _total != null;

  // "sub_category" field.
  List<LeadAgentSubCategoryStruct>? _subCategory;
  List<LeadAgentSubCategoryStruct> get subCategory => _subCategory ?? const [];
  set subCategory(List<LeadAgentSubCategoryStruct>? val) => _subCategory = val;

  void updateSubCategory(Function(List<LeadAgentSubCategoryStruct>) updateFn) {
    updateFn(_subCategory ??= []);
  }

  bool hasSubCategory() => _subCategory != null;

  static LeadAgentMainCatagoryStruct fromMap(Map<String, dynamic> data) =>
      LeadAgentMainCatagoryStruct(
        category: data['category'] as String?,
        total: castToType<int>(data['total']),
        subCategory: getStructList(
          data['sub_category'],
          LeadAgentSubCategoryStruct.fromMap,
        ),
      );

  static LeadAgentMainCatagoryStruct? maybeFromMap(dynamic data) => data is Map
      ? LeadAgentMainCatagoryStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'category': _category,
        'total': _total,
        'sub_category': _subCategory?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'category': serializeParam(
          _category,
          ParamType.String,
        ),
        'total': serializeParam(
          _total,
          ParamType.int,
        ),
        'sub_category': serializeParam(
          _subCategory,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static LeadAgentMainCatagoryStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      LeadAgentMainCatagoryStruct(
        category: deserializeParam(
          data['category'],
          ParamType.String,
          false,
        ),
        total: deserializeParam(
          data['total'],
          ParamType.int,
          false,
        ),
        subCategory: deserializeStructParam<LeadAgentSubCategoryStruct>(
          data['sub_category'],
          ParamType.DataStruct,
          true,
          structBuilder: LeadAgentSubCategoryStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'LeadAgentMainCatagoryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is LeadAgentMainCatagoryStruct &&
        category == other.category &&
        total == other.total &&
        listEquality.equals(subCategory, other.subCategory);
  }

  @override
  int get hashCode => const ListEquality().hash([category, total, subCategory]);
}

LeadAgentMainCatagoryStruct createLeadAgentMainCatagoryStruct({
  String? category,
  int? total,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LeadAgentMainCatagoryStruct(
      category: category,
      total: total,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LeadAgentMainCatagoryStruct? updateLeadAgentMainCatagoryStruct(
  LeadAgentMainCatagoryStruct? leadAgentMainCatagory, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    leadAgentMainCatagory
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLeadAgentMainCatagoryStructData(
  Map<String, dynamic> firestoreData,
  LeadAgentMainCatagoryStruct? leadAgentMainCatagory,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (leadAgentMainCatagory == null) {
    return;
  }
  if (leadAgentMainCatagory.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      leadAgentMainCatagory.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final leadAgentMainCatagoryData = getLeadAgentMainCatagoryFirestoreData(
      leadAgentMainCatagory, forFieldValue);
  final nestedData =
      leadAgentMainCatagoryData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      leadAgentMainCatagory.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLeadAgentMainCatagoryFirestoreData(
  LeadAgentMainCatagoryStruct? leadAgentMainCatagory, [
  bool forFieldValue = false,
]) {
  if (leadAgentMainCatagory == null) {
    return {};
  }
  final firestoreData = mapToFirestore(leadAgentMainCatagory.toMap());

  // Add any Firestore field values
  mapToFirestore(leadAgentMainCatagory.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLeadAgentMainCatagoryListFirestoreData(
  List<LeadAgentMainCatagoryStruct>? leadAgentMainCatagorys,
) =>
    leadAgentMainCatagorys
        ?.map((e) => getLeadAgentMainCatagoryFirestoreData(e, true))
        .toList() ??
    [];
