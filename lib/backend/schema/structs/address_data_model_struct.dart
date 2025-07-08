// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AddressDataModelStruct extends FFFirebaseStruct {
  AddressDataModelStruct({
    String? provinceId,
    String? provinceName,
    String? districtName,
    String? subdistrictName,
    String? zipCode,
    String? keyword,
    int? districtId,
    int? subdistrictId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _provinceId = provinceId,
        _provinceName = provinceName,
        _districtName = districtName,
        _subdistrictName = subdistrictName,
        _zipCode = zipCode,
        _keyword = keyword,
        _districtId = districtId,
        _subdistrictId = subdistrictId,
        super(firestoreUtilData);

  // "province_id" field.
  String? _provinceId;
  String get provinceId => _provinceId ?? '';
  set provinceId(String? val) => _provinceId = val;

  bool hasProvinceId() => _provinceId != null;

  // "province_name" field.
  String? _provinceName;
  String get provinceName => _provinceName ?? '';
  set provinceName(String? val) => _provinceName = val;

  bool hasProvinceName() => _provinceName != null;

  // "district_name" field.
  String? _districtName;
  String get districtName => _districtName ?? '';
  set districtName(String? val) => _districtName = val;

  bool hasDistrictName() => _districtName != null;

  // "subdistrict_name" field.
  String? _subdistrictName;
  String get subdistrictName => _subdistrictName ?? '';
  set subdistrictName(String? val) => _subdistrictName = val;

  bool hasSubdistrictName() => _subdistrictName != null;

  // "zip_code" field.
  String? _zipCode;
  String get zipCode => _zipCode ?? '';
  set zipCode(String? val) => _zipCode = val;

  bool hasZipCode() => _zipCode != null;

  // "keyword" field.
  String? _keyword;
  String get keyword => _keyword ?? '';
  set keyword(String? val) => _keyword = val;

  bool hasKeyword() => _keyword != null;

  // "district_id" field.
  int? _districtId;
  int get districtId => _districtId ?? 0;
  set districtId(int? val) => _districtId = val;

  void incrementDistrictId(int amount) => districtId = districtId + amount;

  bool hasDistrictId() => _districtId != null;

  // "subdistrict_id" field.
  int? _subdistrictId;
  int get subdistrictId => _subdistrictId ?? 0;
  set subdistrictId(int? val) => _subdistrictId = val;

  void incrementSubdistrictId(int amount) =>
      subdistrictId = subdistrictId + amount;

  bool hasSubdistrictId() => _subdistrictId != null;

  static AddressDataModelStruct fromMap(Map<String, dynamic> data) =>
      AddressDataModelStruct(
        provinceId: data['province_id'] as String?,
        provinceName: data['province_name'] as String?,
        districtName: data['district_name'] as String?,
        subdistrictName: data['subdistrict_name'] as String?,
        zipCode: data['zip_code'] as String?,
        keyword: data['keyword'] as String?,
        districtId: castToType<int>(data['district_id']),
        subdistrictId: castToType<int>(data['subdistrict_id']),
      );

  static AddressDataModelStruct? maybeFromMap(dynamic data) => data is Map
      ? AddressDataModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'province_id': _provinceId,
        'province_name': _provinceName,
        'district_name': _districtName,
        'subdistrict_name': _subdistrictName,
        'zip_code': _zipCode,
        'keyword': _keyword,
        'district_id': _districtId,
        'subdistrict_id': _subdistrictId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'province_id': serializeParam(
          _provinceId,
          ParamType.String,
        ),
        'province_name': serializeParam(
          _provinceName,
          ParamType.String,
        ),
        'district_name': serializeParam(
          _districtName,
          ParamType.String,
        ),
        'subdistrict_name': serializeParam(
          _subdistrictName,
          ParamType.String,
        ),
        'zip_code': serializeParam(
          _zipCode,
          ParamType.String,
        ),
        'keyword': serializeParam(
          _keyword,
          ParamType.String,
        ),
        'district_id': serializeParam(
          _districtId,
          ParamType.int,
        ),
        'subdistrict_id': serializeParam(
          _subdistrictId,
          ParamType.int,
        ),
      }.withoutNulls;

  static AddressDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      AddressDataModelStruct(
        provinceId: deserializeParam(
          data['province_id'],
          ParamType.String,
          false,
        ),
        provinceName: deserializeParam(
          data['province_name'],
          ParamType.String,
          false,
        ),
        districtName: deserializeParam(
          data['district_name'],
          ParamType.String,
          false,
        ),
        subdistrictName: deserializeParam(
          data['subdistrict_name'],
          ParamType.String,
          false,
        ),
        zipCode: deserializeParam(
          data['zip_code'],
          ParamType.String,
          false,
        ),
        keyword: deserializeParam(
          data['keyword'],
          ParamType.String,
          false,
        ),
        districtId: deserializeParam(
          data['district_id'],
          ParamType.int,
          false,
        ),
        subdistrictId: deserializeParam(
          data['subdistrict_id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'AddressDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AddressDataModelStruct &&
        provinceId == other.provinceId &&
        provinceName == other.provinceName &&
        districtName == other.districtName &&
        subdistrictName == other.subdistrictName &&
        zipCode == other.zipCode &&
        keyword == other.keyword &&
        districtId == other.districtId &&
        subdistrictId == other.subdistrictId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        provinceId,
        provinceName,
        districtName,
        subdistrictName,
        zipCode,
        keyword,
        districtId,
        subdistrictId
      ]);
}

AddressDataModelStruct createAddressDataModelStruct({
  String? provinceId,
  String? provinceName,
  String? districtName,
  String? subdistrictName,
  String? zipCode,
  String? keyword,
  int? districtId,
  int? subdistrictId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AddressDataModelStruct(
      provinceId: provinceId,
      provinceName: provinceName,
      districtName: districtName,
      subdistrictName: subdistrictName,
      zipCode: zipCode,
      keyword: keyword,
      districtId: districtId,
      subdistrictId: subdistrictId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AddressDataModelStruct? updateAddressDataModelStruct(
  AddressDataModelStruct? addressDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    addressDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAddressDataModelStructData(
  Map<String, dynamic> firestoreData,
  AddressDataModelStruct? addressDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (addressDataModel == null) {
    return;
  }
  if (addressDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && addressDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final addressDataModelData =
      getAddressDataModelFirestoreData(addressDataModel, forFieldValue);
  final nestedData =
      addressDataModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = addressDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAddressDataModelFirestoreData(
  AddressDataModelStruct? addressDataModel, [
  bool forFieldValue = false,
]) {
  if (addressDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(addressDataModel.toMap());

  // Add any Firestore field values
  addressDataModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAddressDataModelListFirestoreData(
  List<AddressDataModelStruct>? addressDataModels,
) =>
    addressDataModels
        ?.map((e) => getAddressDataModelFirestoreData(e, true))
        .toList() ??
    [];
