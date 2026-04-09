// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class LeadAgentSubCategoryDataModelStruct extends FFFirebaseStruct {
  LeadAgentSubCategoryDataModelStruct({
    String? subTitle,
    String? total,
    String? color,
    String? icon,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _subTitle = subTitle,
        _total = total,
        _color = color,
        _icon = icon,
        super(firestoreUtilData);

  // "sub_title" field.
  String? _subTitle;
  String get subTitle => _subTitle ?? '';
  set subTitle(String? val) => _subTitle = val;

  bool hasSubTitle() => _subTitle != null;

  // "total" field.
  String? _total;
  String get total => _total ?? '';
  set total(String? val) => _total = val;

  bool hasTotal() => _total != null;

  // "color" field.
  String? _color;
  String get color => _color ?? '';
  set color(String? val) => _color = val;

  bool hasColor() => _color != null;

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  set icon(String? val) => _icon = val;

  bool hasIcon() => _icon != null;

  static LeadAgentSubCategoryDataModelStruct fromMap(
          Map<String, dynamic> data) =>
      LeadAgentSubCategoryDataModelStruct(
        subTitle: data['sub_title'] as String?,
        total: data['total'] as String?,
        color: data['color'] as String?,
        icon: data['icon'] as String?,
      );

  static LeadAgentSubCategoryDataModelStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? LeadAgentSubCategoryDataModelStruct.fromMap(
              data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'sub_title': _subTitle,
        'total': _total,
        'color': _color,
        'icon': _icon,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'sub_title': serializeParam(
          _subTitle,
          ParamType.String,
        ),
        'total': serializeParam(
          _total,
          ParamType.String,
        ),
        'color': serializeParam(
          _color,
          ParamType.String,
        ),
        'icon': serializeParam(
          _icon,
          ParamType.String,
        ),
      }.withoutNulls;

  static LeadAgentSubCategoryDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      LeadAgentSubCategoryDataModelStruct(
        subTitle: deserializeParam(
          data['sub_title'],
          ParamType.String,
          false,
        ),
        total: deserializeParam(
          data['total'],
          ParamType.String,
          false,
        ),
        color: deserializeParam(
          data['color'],
          ParamType.String,
          false,
        ),
        icon: deserializeParam(
          data['icon'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LeadAgentSubCategoryDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LeadAgentSubCategoryDataModelStruct &&
        subTitle == other.subTitle &&
        total == other.total &&
        color == other.color &&
        icon == other.icon;
  }

  @override
  int get hashCode => const ListEquality().hash([subTitle, total, color, icon]);
}

LeadAgentSubCategoryDataModelStruct createLeadAgentSubCategoryDataModelStruct({
  String? subTitle,
  String? total,
  String? color,
  String? icon,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LeadAgentSubCategoryDataModelStruct(
      subTitle: subTitle,
      total: total,
      color: color,
      icon: icon,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LeadAgentSubCategoryDataModelStruct? updateLeadAgentSubCategoryDataModelStruct(
  LeadAgentSubCategoryDataModelStruct? leadAgentSubCategoryDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    leadAgentSubCategoryDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLeadAgentSubCategoryDataModelStructData(
  Map<String, dynamic> firestoreData,
  LeadAgentSubCategoryDataModelStruct? leadAgentSubCategoryDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (leadAgentSubCategoryDataModel == null) {
    return;
  }
  if (leadAgentSubCategoryDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      leadAgentSubCategoryDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final leadAgentSubCategoryDataModelData =
      getLeadAgentSubCategoryDataModelFirestoreData(
          leadAgentSubCategoryDataModel, forFieldValue);
  final nestedData = leadAgentSubCategoryDataModelData
      .map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      leadAgentSubCategoryDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLeadAgentSubCategoryDataModelFirestoreData(
  LeadAgentSubCategoryDataModelStruct? leadAgentSubCategoryDataModel, [
  bool forFieldValue = false,
]) {
  if (leadAgentSubCategoryDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(leadAgentSubCategoryDataModel.toMap());

  // Add any Firestore field values
  mapToFirestore(leadAgentSubCategoryDataModel.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLeadAgentSubCategoryDataModelListFirestoreData(
  List<LeadAgentSubCategoryDataModelStruct>? leadAgentSubCategoryDataModels,
) =>
    leadAgentSubCategoryDataModels
        ?.map((e) => getLeadAgentSubCategoryDataModelFirestoreData(e, true))
        .toList() ??
    [];
