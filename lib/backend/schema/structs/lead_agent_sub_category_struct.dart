// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LeadAgentSubCategoryStruct extends FFFirebaseStruct {
  LeadAgentSubCategoryStruct({
    String? subject,
    int? totalSub,
    List<LeadAgentDataModelStruct>? items,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _subject = subject,
        _totalSub = totalSub,
        _items = items,
        super(firestoreUtilData);

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  set subject(String? val) => _subject = val;

  bool hasSubject() => _subject != null;

  // "total_sub" field.
  int? _totalSub;
  int get totalSub => _totalSub ?? 0;
  set totalSub(int? val) => _totalSub = val;

  void incrementTotalSub(int amount) => totalSub = totalSub + amount;

  bool hasTotalSub() => _totalSub != null;

  // "items" field.
  List<LeadAgentDataModelStruct>? _items;
  List<LeadAgentDataModelStruct> get items => _items ?? const [];
  set items(List<LeadAgentDataModelStruct>? val) => _items = val;

  void updateItems(Function(List<LeadAgentDataModelStruct>) updateFn) {
    updateFn(_items ??= []);
  }

  bool hasItems() => _items != null;

  static LeadAgentSubCategoryStruct fromMap(Map<String, dynamic> data) =>
      LeadAgentSubCategoryStruct(
        subject: data['subject'] as String?,
        totalSub: castToType<int>(data['total_sub']),
        items: getStructList(
          data['items'],
          LeadAgentDataModelStruct.fromMap,
        ),
      );

  static LeadAgentSubCategoryStruct? maybeFromMap(dynamic data) => data is Map
      ? LeadAgentSubCategoryStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'subject': _subject,
        'total_sub': _totalSub,
        'items': _items?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'subject': serializeParam(
          _subject,
          ParamType.String,
        ),
        'total_sub': serializeParam(
          _totalSub,
          ParamType.int,
        ),
        'items': serializeParam(
          _items,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static LeadAgentSubCategoryStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      LeadAgentSubCategoryStruct(
        subject: deserializeParam(
          data['subject'],
          ParamType.String,
          false,
        ),
        totalSub: deserializeParam(
          data['total_sub'],
          ParamType.int,
          false,
        ),
        items: deserializeStructParam<LeadAgentDataModelStruct>(
          data['items'],
          ParamType.DataStruct,
          true,
          structBuilder: LeadAgentDataModelStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'LeadAgentSubCategoryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is LeadAgentSubCategoryStruct &&
        subject == other.subject &&
        totalSub == other.totalSub &&
        listEquality.equals(items, other.items);
  }

  @override
  int get hashCode => const ListEquality().hash([subject, totalSub, items]);
}

LeadAgentSubCategoryStruct createLeadAgentSubCategoryStruct({
  String? subject,
  int? totalSub,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LeadAgentSubCategoryStruct(
      subject: subject,
      totalSub: totalSub,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LeadAgentSubCategoryStruct? updateLeadAgentSubCategoryStruct(
  LeadAgentSubCategoryStruct? leadAgentSubCategory, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    leadAgentSubCategory
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLeadAgentSubCategoryStructData(
  Map<String, dynamic> firestoreData,
  LeadAgentSubCategoryStruct? leadAgentSubCategory,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (leadAgentSubCategory == null) {
    return;
  }
  if (leadAgentSubCategory.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && leadAgentSubCategory.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final leadAgentSubCategoryData =
      getLeadAgentSubCategoryFirestoreData(leadAgentSubCategory, forFieldValue);
  final nestedData =
      leadAgentSubCategoryData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      leadAgentSubCategory.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLeadAgentSubCategoryFirestoreData(
  LeadAgentSubCategoryStruct? leadAgentSubCategory, [
  bool forFieldValue = false,
]) {
  if (leadAgentSubCategory == null) {
    return {};
  }
  final firestoreData = mapToFirestore(leadAgentSubCategory.toMap());

  // Add any Firestore field values
  leadAgentSubCategory.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLeadAgentSubCategoryListFirestoreData(
  List<LeadAgentSubCategoryStruct>? leadAgentSubCategorys,
) =>
    leadAgentSubCategorys
        ?.map((e) => getLeadAgentSubCategoryFirestoreData(e, true))
        .toList() ??
    [];
