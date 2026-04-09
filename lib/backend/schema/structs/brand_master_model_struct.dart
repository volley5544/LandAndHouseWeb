// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class BrandMasterModelStruct extends FFFirebaseStruct {
  BrandMasterModelStruct({
    String? brandId,
    String? name,
    String? type,
    String? carGroup,
    String? vehicleGroup,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _brandId = brandId,
        _name = name,
        _type = type,
        _carGroup = carGroup,
        _vehicleGroup = vehicleGroup,
        super(firestoreUtilData);

  // "brand_id" field.
  String? _brandId;
  String get brandId => _brandId ?? '';
  set brandId(String? val) => _brandId = val;

  bool hasBrandId() => _brandId != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "car_group" field.
  String? _carGroup;
  String get carGroup => _carGroup ?? '';
  set carGroup(String? val) => _carGroup = val;

  bool hasCarGroup() => _carGroup != null;

  // "vehicle_group" field.
  String? _vehicleGroup;
  String get vehicleGroup => _vehicleGroup ?? '';
  set vehicleGroup(String? val) => _vehicleGroup = val;

  bool hasVehicleGroup() => _vehicleGroup != null;

  static BrandMasterModelStruct fromMap(Map<String, dynamic> data) =>
      BrandMasterModelStruct(
        brandId: data['brand_id'] as String?,
        name: data['name'] as String?,
        type: data['type'] as String?,
        carGroup: data['car_group'] as String?,
        vehicleGroup: data['vehicle_group'] as String?,
      );

  static BrandMasterModelStruct? maybeFromMap(dynamic data) => data is Map
      ? BrandMasterModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'brand_id': _brandId,
        'name': _name,
        'type': _type,
        'car_group': _carGroup,
        'vehicle_group': _vehicleGroup,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'brand_id': serializeParam(
          _brandId,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'car_group': serializeParam(
          _carGroup,
          ParamType.String,
        ),
        'vehicle_group': serializeParam(
          _vehicleGroup,
          ParamType.String,
        ),
      }.withoutNulls;

  static BrandMasterModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      BrandMasterModelStruct(
        brandId: deserializeParam(
          data['brand_id'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        carGroup: deserializeParam(
          data['car_group'],
          ParamType.String,
          false,
        ),
        vehicleGroup: deserializeParam(
          data['vehicle_group'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'BrandMasterModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BrandMasterModelStruct &&
        brandId == other.brandId &&
        name == other.name &&
        type == other.type &&
        carGroup == other.carGroup &&
        vehicleGroup == other.vehicleGroup;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([brandId, name, type, carGroup, vehicleGroup]);
}

BrandMasterModelStruct createBrandMasterModelStruct({
  String? brandId,
  String? name,
  String? type,
  String? carGroup,
  String? vehicleGroup,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BrandMasterModelStruct(
      brandId: brandId,
      name: name,
      type: type,
      carGroup: carGroup,
      vehicleGroup: vehicleGroup,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BrandMasterModelStruct? updateBrandMasterModelStruct(
  BrandMasterModelStruct? brandMasterModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    brandMasterModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBrandMasterModelStructData(
  Map<String, dynamic> firestoreData,
  BrandMasterModelStruct? brandMasterModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (brandMasterModel == null) {
    return;
  }
  if (brandMasterModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && brandMasterModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final brandMasterModelData =
      getBrandMasterModelFirestoreData(brandMasterModel, forFieldValue);
  final nestedData =
      brandMasterModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = brandMasterModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBrandMasterModelFirestoreData(
  BrandMasterModelStruct? brandMasterModel, [
  bool forFieldValue = false,
]) {
  if (brandMasterModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(brandMasterModel.toMap());

  // Add any Firestore field values
  mapToFirestore(brandMasterModel.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBrandMasterModelListFirestoreData(
  List<BrandMasterModelStruct>? brandMasterModels,
) =>
    brandMasterModels
        ?.map((e) => getBrandMasterModelFirestoreData(e, true))
        .toList() ??
    [];
