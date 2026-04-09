// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserAllAddressDataModelStruct extends FFFirebaseStruct {
  UserAllAddressDataModelStruct({
    UserAddressDataModelStruct? currentAddress,
    UserAddressDataModelStruct? registrationAddress,
    UserAddressDataModelStruct? idCardAddress,
    UserAddressDataModelStruct? otherAddress,
    String? dataDate,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _currentAddress = currentAddress,
        _registrationAddress = registrationAddress,
        _idCardAddress = idCardAddress,
        _otherAddress = otherAddress,
        _dataDate = dataDate,
        super(firestoreUtilData);

  // "current_address" field.
  UserAddressDataModelStruct? _currentAddress;
  UserAddressDataModelStruct get currentAddress =>
      _currentAddress ?? UserAddressDataModelStruct();
  set currentAddress(UserAddressDataModelStruct? val) => _currentAddress = val;

  void updateCurrentAddress(Function(UserAddressDataModelStruct) updateFn) {
    updateFn(_currentAddress ??= UserAddressDataModelStruct());
  }

  bool hasCurrentAddress() => _currentAddress != null;

  // "registration_address" field.
  UserAddressDataModelStruct? _registrationAddress;
  UserAddressDataModelStruct get registrationAddress =>
      _registrationAddress ?? UserAddressDataModelStruct();
  set registrationAddress(UserAddressDataModelStruct? val) =>
      _registrationAddress = val;

  void updateRegistrationAddress(
      Function(UserAddressDataModelStruct) updateFn) {
    updateFn(_registrationAddress ??= UserAddressDataModelStruct());
  }

  bool hasRegistrationAddress() => _registrationAddress != null;

  // "id_card_address" field.
  UserAddressDataModelStruct? _idCardAddress;
  UserAddressDataModelStruct get idCardAddress =>
      _idCardAddress ?? UserAddressDataModelStruct();
  set idCardAddress(UserAddressDataModelStruct? val) => _idCardAddress = val;

  void updateIdCardAddress(Function(UserAddressDataModelStruct) updateFn) {
    updateFn(_idCardAddress ??= UserAddressDataModelStruct());
  }

  bool hasIdCardAddress() => _idCardAddress != null;

  // "other_address" field.
  UserAddressDataModelStruct? _otherAddress;
  UserAddressDataModelStruct get otherAddress =>
      _otherAddress ?? UserAddressDataModelStruct();
  set otherAddress(UserAddressDataModelStruct? val) => _otherAddress = val;

  void updateOtherAddress(Function(UserAddressDataModelStruct) updateFn) {
    updateFn(_otherAddress ??= UserAddressDataModelStruct());
  }

  bool hasOtherAddress() => _otherAddress != null;

  // "data_date" field.
  String? _dataDate;
  String get dataDate => _dataDate ?? '';
  set dataDate(String? val) => _dataDate = val;

  bool hasDataDate() => _dataDate != null;

  static UserAllAddressDataModelStruct fromMap(Map<String, dynamic> data) =>
      UserAllAddressDataModelStruct(
        currentAddress: data['current_address'] is UserAddressDataModelStruct
            ? data['current_address']
            : UserAddressDataModelStruct.maybeFromMap(data['current_address']),
        registrationAddress:
            data['registration_address'] is UserAddressDataModelStruct
                ? data['registration_address']
                : UserAddressDataModelStruct.maybeFromMap(
                    data['registration_address']),
        idCardAddress: data['id_card_address'] is UserAddressDataModelStruct
            ? data['id_card_address']
            : UserAddressDataModelStruct.maybeFromMap(data['id_card_address']),
        otherAddress: data['other_address'] is UserAddressDataModelStruct
            ? data['other_address']
            : UserAddressDataModelStruct.maybeFromMap(data['other_address']),
        dataDate: data['data_date'] as String?,
      );

  static UserAllAddressDataModelStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? UserAllAddressDataModelStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'current_address': _currentAddress?.toMap(),
        'registration_address': _registrationAddress?.toMap(),
        'id_card_address': _idCardAddress?.toMap(),
        'other_address': _otherAddress?.toMap(),
        'data_date': _dataDate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'current_address': serializeParam(
          _currentAddress,
          ParamType.DataStruct,
        ),
        'registration_address': serializeParam(
          _registrationAddress,
          ParamType.DataStruct,
        ),
        'id_card_address': serializeParam(
          _idCardAddress,
          ParamType.DataStruct,
        ),
        'other_address': serializeParam(
          _otherAddress,
          ParamType.DataStruct,
        ),
        'data_date': serializeParam(
          _dataDate,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserAllAddressDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      UserAllAddressDataModelStruct(
        currentAddress: deserializeStructParam(
          data['current_address'],
          ParamType.DataStruct,
          false,
          structBuilder: UserAddressDataModelStruct.fromSerializableMap,
        ),
        registrationAddress: deserializeStructParam(
          data['registration_address'],
          ParamType.DataStruct,
          false,
          structBuilder: UserAddressDataModelStruct.fromSerializableMap,
        ),
        idCardAddress: deserializeStructParam(
          data['id_card_address'],
          ParamType.DataStruct,
          false,
          structBuilder: UserAddressDataModelStruct.fromSerializableMap,
        ),
        otherAddress: deserializeStructParam(
          data['other_address'],
          ParamType.DataStruct,
          false,
          structBuilder: UserAddressDataModelStruct.fromSerializableMap,
        ),
        dataDate: deserializeParam(
          data['data_date'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserAllAddressDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserAllAddressDataModelStruct &&
        currentAddress == other.currentAddress &&
        registrationAddress == other.registrationAddress &&
        idCardAddress == other.idCardAddress &&
        otherAddress == other.otherAddress &&
        dataDate == other.dataDate;
  }

  @override
  int get hashCode => const ListEquality().hash([
        currentAddress,
        registrationAddress,
        idCardAddress,
        otherAddress,
        dataDate
      ]);
}

UserAllAddressDataModelStruct createUserAllAddressDataModelStruct({
  UserAddressDataModelStruct? currentAddress,
  UserAddressDataModelStruct? registrationAddress,
  UserAddressDataModelStruct? idCardAddress,
  UserAddressDataModelStruct? otherAddress,
  String? dataDate,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserAllAddressDataModelStruct(
      currentAddress: currentAddress ??
          (clearUnsetFields ? UserAddressDataModelStruct() : null),
      registrationAddress: registrationAddress ??
          (clearUnsetFields ? UserAddressDataModelStruct() : null),
      idCardAddress: idCardAddress ??
          (clearUnsetFields ? UserAddressDataModelStruct() : null),
      otherAddress: otherAddress ??
          (clearUnsetFields ? UserAddressDataModelStruct() : null),
      dataDate: dataDate,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserAllAddressDataModelStruct? updateUserAllAddressDataModelStruct(
  UserAllAddressDataModelStruct? userAllAddressDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userAllAddressDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserAllAddressDataModelStructData(
  Map<String, dynamic> firestoreData,
  UserAllAddressDataModelStruct? userAllAddressDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userAllAddressDataModel == null) {
    return;
  }
  if (userAllAddressDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      userAllAddressDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userAllAddressDataModelData = getUserAllAddressDataModelFirestoreData(
      userAllAddressDataModel, forFieldValue);
  final nestedData =
      userAllAddressDataModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      userAllAddressDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserAllAddressDataModelFirestoreData(
  UserAllAddressDataModelStruct? userAllAddressDataModel, [
  bool forFieldValue = false,
]) {
  if (userAllAddressDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userAllAddressDataModel.toMap());

  // Handle nested data for "current_address" field.
  addUserAddressDataModelStructData(
    firestoreData,
    userAllAddressDataModel.hasCurrentAddress()
        ? userAllAddressDataModel.currentAddress
        : null,
    'current_address',
    forFieldValue,
  );

  // Handle nested data for "registration_address" field.
  addUserAddressDataModelStructData(
    firestoreData,
    userAllAddressDataModel.hasRegistrationAddress()
        ? userAllAddressDataModel.registrationAddress
        : null,
    'registration_address',
    forFieldValue,
  );

  // Handle nested data for "id_card_address" field.
  addUserAddressDataModelStructData(
    firestoreData,
    userAllAddressDataModel.hasIdCardAddress()
        ? userAllAddressDataModel.idCardAddress
        : null,
    'id_card_address',
    forFieldValue,
  );

  // Handle nested data for "other_address" field.
  addUserAddressDataModelStructData(
    firestoreData,
    userAllAddressDataModel.hasOtherAddress()
        ? userAllAddressDataModel.otherAddress
        : null,
    'other_address',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(userAllAddressDataModel.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserAllAddressDataModelListFirestoreData(
  List<UserAllAddressDataModelStruct>? userAllAddressDataModels,
) =>
    userAllAddressDataModels
        ?.map((e) => getUserAllAddressDataModelFirestoreData(e, true))
        .toList() ??
    [];
