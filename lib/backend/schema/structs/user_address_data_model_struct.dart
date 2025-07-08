// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class UserAddressDataModelStruct extends FFFirebaseStruct {
  UserAddressDataModelStruct({
    String? addressDetails,
    String? addressSubDistrict,
    String? addressDistrict,
    String? addressProvince,
    String? addressPostalCode,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _addressDetails = addressDetails,
        _addressSubDistrict = addressSubDistrict,
        _addressDistrict = addressDistrict,
        _addressProvince = addressProvince,
        _addressPostalCode = addressPostalCode,
        super(firestoreUtilData);

  // "address_details" field.
  String? _addressDetails;
  String get addressDetails => _addressDetails ?? '';
  set addressDetails(String? val) => _addressDetails = val;

  bool hasAddressDetails() => _addressDetails != null;

  // "address_sub_district" field.
  String? _addressSubDistrict;
  String get addressSubDistrict => _addressSubDistrict ?? '';
  set addressSubDistrict(String? val) => _addressSubDistrict = val;

  bool hasAddressSubDistrict() => _addressSubDistrict != null;

  // "address_district" field.
  String? _addressDistrict;
  String get addressDistrict => _addressDistrict ?? '';
  set addressDistrict(String? val) => _addressDistrict = val;

  bool hasAddressDistrict() => _addressDistrict != null;

  // "address_province" field.
  String? _addressProvince;
  String get addressProvince => _addressProvince ?? '';
  set addressProvince(String? val) => _addressProvince = val;

  bool hasAddressProvince() => _addressProvince != null;

  // "address_postal_code" field.
  String? _addressPostalCode;
  String get addressPostalCode => _addressPostalCode ?? '';
  set addressPostalCode(String? val) => _addressPostalCode = val;

  bool hasAddressPostalCode() => _addressPostalCode != null;

  static UserAddressDataModelStruct fromMap(Map<String, dynamic> data) =>
      UserAddressDataModelStruct(
        addressDetails: data['address_details'] as String?,
        addressSubDistrict: data['address_sub_district'] as String?,
        addressDistrict: data['address_district'] as String?,
        addressProvince: data['address_province'] as String?,
        addressPostalCode: data['address_postal_code'] as String?,
      );

  static UserAddressDataModelStruct? maybeFromMap(dynamic data) => data is Map
      ? UserAddressDataModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'address_details': _addressDetails,
        'address_sub_district': _addressSubDistrict,
        'address_district': _addressDistrict,
        'address_province': _addressProvince,
        'address_postal_code': _addressPostalCode,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'address_details': serializeParam(
          _addressDetails,
          ParamType.String,
        ),
        'address_sub_district': serializeParam(
          _addressSubDistrict,
          ParamType.String,
        ),
        'address_district': serializeParam(
          _addressDistrict,
          ParamType.String,
        ),
        'address_province': serializeParam(
          _addressProvince,
          ParamType.String,
        ),
        'address_postal_code': serializeParam(
          _addressPostalCode,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserAddressDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      UserAddressDataModelStruct(
        addressDetails: deserializeParam(
          data['address_details'],
          ParamType.String,
          false,
        ),
        addressSubDistrict: deserializeParam(
          data['address_sub_district'],
          ParamType.String,
          false,
        ),
        addressDistrict: deserializeParam(
          data['address_district'],
          ParamType.String,
          false,
        ),
        addressProvince: deserializeParam(
          data['address_province'],
          ParamType.String,
          false,
        ),
        addressPostalCode: deserializeParam(
          data['address_postal_code'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserAddressDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserAddressDataModelStruct &&
        addressDetails == other.addressDetails &&
        addressSubDistrict == other.addressSubDistrict &&
        addressDistrict == other.addressDistrict &&
        addressProvince == other.addressProvince &&
        addressPostalCode == other.addressPostalCode;
  }

  @override
  int get hashCode => const ListEquality().hash([
        addressDetails,
        addressSubDistrict,
        addressDistrict,
        addressProvince,
        addressPostalCode
      ]);
}

UserAddressDataModelStruct createUserAddressDataModelStruct({
  String? addressDetails,
  String? addressSubDistrict,
  String? addressDistrict,
  String? addressProvince,
  String? addressPostalCode,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserAddressDataModelStruct(
      addressDetails: addressDetails,
      addressSubDistrict: addressSubDistrict,
      addressDistrict: addressDistrict,
      addressProvince: addressProvince,
      addressPostalCode: addressPostalCode,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserAddressDataModelStruct? updateUserAddressDataModelStruct(
  UserAddressDataModelStruct? userAddressDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userAddressDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserAddressDataModelStructData(
  Map<String, dynamic> firestoreData,
  UserAddressDataModelStruct? userAddressDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userAddressDataModel == null) {
    return;
  }
  if (userAddressDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userAddressDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userAddressDataModelData =
      getUserAddressDataModelFirestoreData(userAddressDataModel, forFieldValue);
  final nestedData =
      userAddressDataModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      userAddressDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserAddressDataModelFirestoreData(
  UserAddressDataModelStruct? userAddressDataModel, [
  bool forFieldValue = false,
]) {
  if (userAddressDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userAddressDataModel.toMap());

  // Add any Firestore field values
  userAddressDataModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserAddressDataModelListFirestoreData(
  List<UserAddressDataModelStruct>? userAddressDataModels,
) =>
    userAddressDataModels
        ?.map((e) => getUserAddressDataModelFirestoreData(e, true))
        .toList() ??
    [];
