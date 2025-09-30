// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class MasterAgentBrandModelStruct extends FFFirebaseStruct {
  MasterAgentBrandModelStruct({
    String? brandId,
    String? brandName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _brandId = brandId,
        _brandName = brandName,
        super(firestoreUtilData);

  // "brand_id" field.
  String? _brandId;
  String get brandId => _brandId ?? '';
  set brandId(String? val) => _brandId = val;

  bool hasBrandId() => _brandId != null;

  // "brand_name" field.
  String? _brandName;
  String get brandName => _brandName ?? '';
  set brandName(String? val) => _brandName = val;

  bool hasBrandName() => _brandName != null;

  static MasterAgentBrandModelStruct fromMap(Map<String, dynamic> data) =>
      MasterAgentBrandModelStruct(
        brandId: data['brand_id'] as String?,
        brandName: data['brand_name'] as String?,
      );

  static MasterAgentBrandModelStruct? maybeFromMap(dynamic data) => data is Map
      ? MasterAgentBrandModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'brand_id': _brandId,
        'brand_name': _brandName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'brand_id': serializeParam(
          _brandId,
          ParamType.String,
        ),
        'brand_name': serializeParam(
          _brandName,
          ParamType.String,
        ),
      }.withoutNulls;

  static MasterAgentBrandModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      MasterAgentBrandModelStruct(
        brandId: deserializeParam(
          data['brand_id'],
          ParamType.String,
          false,
        ),
        brandName: deserializeParam(
          data['brand_name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MasterAgentBrandModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MasterAgentBrandModelStruct &&
        brandId == other.brandId &&
        brandName == other.brandName;
  }

  @override
  int get hashCode => const ListEquality().hash([brandId, brandName]);
}

MasterAgentBrandModelStruct createMasterAgentBrandModelStruct({
  String? brandId,
  String? brandName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MasterAgentBrandModelStruct(
      brandId: brandId,
      brandName: brandName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MasterAgentBrandModelStruct? updateMasterAgentBrandModelStruct(
  MasterAgentBrandModelStruct? masterAgentBrandModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    masterAgentBrandModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMasterAgentBrandModelStructData(
  Map<String, dynamic> firestoreData,
  MasterAgentBrandModelStruct? masterAgentBrandModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (masterAgentBrandModel == null) {
    return;
  }
  if (masterAgentBrandModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      masterAgentBrandModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final masterAgentBrandModelData = getMasterAgentBrandModelFirestoreData(
      masterAgentBrandModel, forFieldValue);
  final nestedData =
      masterAgentBrandModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      masterAgentBrandModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMasterAgentBrandModelFirestoreData(
  MasterAgentBrandModelStruct? masterAgentBrandModel, [
  bool forFieldValue = false,
]) {
  if (masterAgentBrandModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(masterAgentBrandModel.toMap());

  // Add any Firestore field values
  masterAgentBrandModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMasterAgentBrandModelListFirestoreData(
  List<MasterAgentBrandModelStruct>? masterAgentBrandModels,
) =>
    masterAgentBrandModels
        ?.map((e) => getMasterAgentBrandModelFirestoreData(e, true))
        .toList() ??
    [];
