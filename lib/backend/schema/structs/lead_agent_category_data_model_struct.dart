// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LeadAgentCategoryDataModelStruct extends FFFirebaseStruct {
  LeadAgentCategoryDataModelStruct({
    String? titleName,
    String? total,
    List<LeadAgentSubCategoryDataModelStruct>? subTitle,
    String? icon,
    String? color,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _titleName = titleName,
        _total = total,
        _subTitle = subTitle,
        _icon = icon,
        _color = color,
        super(firestoreUtilData);

  // "title_name" field.
  String? _titleName;
  String get titleName => _titleName ?? '';
  set titleName(String? val) => _titleName = val;

  bool hasTitleName() => _titleName != null;

  // "total" field.
  String? _total;
  String get total => _total ?? '';
  set total(String? val) => _total = val;

  bool hasTotal() => _total != null;

  // "sub_title" field.
  List<LeadAgentSubCategoryDataModelStruct>? _subTitle;
  List<LeadAgentSubCategoryDataModelStruct> get subTitle =>
      _subTitle ?? const [];
  set subTitle(List<LeadAgentSubCategoryDataModelStruct>? val) =>
      _subTitle = val;

  void updateSubTitle(
      Function(List<LeadAgentSubCategoryDataModelStruct>) updateFn) {
    updateFn(_subTitle ??= []);
  }

  bool hasSubTitle() => _subTitle != null;

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  set icon(String? val) => _icon = val;

  bool hasIcon() => _icon != null;

  // "color" field.
  String? _color;
  String get color => _color ?? '';
  set color(String? val) => _color = val;

  bool hasColor() => _color != null;

  static LeadAgentCategoryDataModelStruct fromMap(Map<String, dynamic> data) =>
      LeadAgentCategoryDataModelStruct(
        titleName: data['title_name'] as String?,
        total: data['total'] as String?,
        subTitle: getStructList(
          data['sub_title'],
          LeadAgentSubCategoryDataModelStruct.fromMap,
        ),
        icon: data['icon'] as String?,
        color: data['color'] as String?,
      );

  static LeadAgentCategoryDataModelStruct? maybeFromMap(dynamic data) => data
          is Map
      ? LeadAgentCategoryDataModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title_name': _titleName,
        'total': _total,
        'sub_title': _subTitle?.map((e) => e.toMap()).toList(),
        'icon': _icon,
        'color': _color,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title_name': serializeParam(
          _titleName,
          ParamType.String,
        ),
        'total': serializeParam(
          _total,
          ParamType.String,
        ),
        'sub_title': serializeParam(
          _subTitle,
          ParamType.DataStruct,
          isList: true,
        ),
        'icon': serializeParam(
          _icon,
          ParamType.String,
        ),
        'color': serializeParam(
          _color,
          ParamType.String,
        ),
      }.withoutNulls;

  static LeadAgentCategoryDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      LeadAgentCategoryDataModelStruct(
        titleName: deserializeParam(
          data['title_name'],
          ParamType.String,
          false,
        ),
        total: deserializeParam(
          data['total'],
          ParamType.String,
          false,
        ),
        subTitle: deserializeStructParam<LeadAgentSubCategoryDataModelStruct>(
          data['sub_title'],
          ParamType.DataStruct,
          true,
          structBuilder:
              LeadAgentSubCategoryDataModelStruct.fromSerializableMap,
        ),
        icon: deserializeParam(
          data['icon'],
          ParamType.String,
          false,
        ),
        color: deserializeParam(
          data['color'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LeadAgentCategoryDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is LeadAgentCategoryDataModelStruct &&
        titleName == other.titleName &&
        total == other.total &&
        listEquality.equals(subTitle, other.subTitle) &&
        icon == other.icon &&
        color == other.color;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([titleName, total, subTitle, icon, color]);
}

LeadAgentCategoryDataModelStruct createLeadAgentCategoryDataModelStruct({
  String? titleName,
  String? total,
  String? icon,
  String? color,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LeadAgentCategoryDataModelStruct(
      titleName: titleName,
      total: total,
      icon: icon,
      color: color,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LeadAgentCategoryDataModelStruct? updateLeadAgentCategoryDataModelStruct(
  LeadAgentCategoryDataModelStruct? leadAgentCategoryDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    leadAgentCategoryDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLeadAgentCategoryDataModelStructData(
  Map<String, dynamic> firestoreData,
  LeadAgentCategoryDataModelStruct? leadAgentCategoryDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (leadAgentCategoryDataModel == null) {
    return;
  }
  if (leadAgentCategoryDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      leadAgentCategoryDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final leadAgentCategoryDataModelData =
      getLeadAgentCategoryDataModelFirestoreData(
          leadAgentCategoryDataModel, forFieldValue);
  final nestedData = leadAgentCategoryDataModelData
      .map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      leadAgentCategoryDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLeadAgentCategoryDataModelFirestoreData(
  LeadAgentCategoryDataModelStruct? leadAgentCategoryDataModel, [
  bool forFieldValue = false,
]) {
  if (leadAgentCategoryDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(leadAgentCategoryDataModel.toMap());

  // Add any Firestore field values
  leadAgentCategoryDataModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLeadAgentCategoryDataModelListFirestoreData(
  List<LeadAgentCategoryDataModelStruct>? leadAgentCategoryDataModels,
) =>
    leadAgentCategoryDataModels
        ?.map((e) => getLeadAgentCategoryDataModelFirestoreData(e, true))
        .toList() ??
    [];
