// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CustomerDetailStruct extends FFFirebaseStruct {
  CustomerDetailStruct({
    String? thaiId,
    String? title,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? dob,
    String? email,
    String? hashThaiId,
    String? consentDate,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _thaiId = thaiId,
        _title = title,
        _firstName = firstName,
        _lastName = lastName,
        _phoneNumber = phoneNumber,
        _dob = dob,
        _email = email,
        _hashThaiId = hashThaiId,
        _consentDate = consentDate,
        super(firestoreUtilData);

  // "thai_id" field.
  String? _thaiId;
  String get thaiId => _thaiId ?? '';
  set thaiId(String? val) => _thaiId = val;

  bool hasThaiId() => _thaiId != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? val) => _firstName = val;

  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  set lastName(String? val) => _lastName = val;

  bool hasLastName() => _lastName != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;

  bool hasPhoneNumber() => _phoneNumber != null;

  // "dob" field.
  String? _dob;
  String get dob => _dob ?? '';
  set dob(String? val) => _dob = val;

  bool hasDob() => _dob != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "hash_thai_id" field.
  String? _hashThaiId;
  String get hashThaiId => _hashThaiId ?? '';
  set hashThaiId(String? val) => _hashThaiId = val;

  bool hasHashThaiId() => _hashThaiId != null;

  // "consent_date" field.
  String? _consentDate;
  String get consentDate => _consentDate ?? '';
  set consentDate(String? val) => _consentDate = val;

  bool hasConsentDate() => _consentDate != null;

  static CustomerDetailStruct fromMap(Map<String, dynamic> data) =>
      CustomerDetailStruct(
        thaiId: data['thai_id'] as String?,
        title: data['title'] as String?,
        firstName: data['first_name'] as String?,
        lastName: data['last_name'] as String?,
        phoneNumber: data['phone_number'] as String?,
        dob: data['dob'] as String?,
        email: data['email'] as String?,
        hashThaiId: data['hash_thai_id'] as String?,
        consentDate: data['consent_date'] as String?,
      );

  static CustomerDetailStruct? maybeFromMap(dynamic data) => data is Map
      ? CustomerDetailStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'thai_id': _thaiId,
        'title': _title,
        'first_name': _firstName,
        'last_name': _lastName,
        'phone_number': _phoneNumber,
        'dob': _dob,
        'email': _email,
        'hash_thai_id': _hashThaiId,
        'consent_date': _consentDate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'thai_id': serializeParam(
          _thaiId,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'first_name': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'last_name': serializeParam(
          _lastName,
          ParamType.String,
        ),
        'phone_number': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
        'dob': serializeParam(
          _dob,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'hash_thai_id': serializeParam(
          _hashThaiId,
          ParamType.String,
        ),
        'consent_date': serializeParam(
          _consentDate,
          ParamType.String,
        ),
      }.withoutNulls;

  static CustomerDetailStruct fromSerializableMap(Map<String, dynamic> data) =>
      CustomerDetailStruct(
        thaiId: deserializeParam(
          data['thai_id'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        firstName: deserializeParam(
          data['first_name'],
          ParamType.String,
          false,
        ),
        lastName: deserializeParam(
          data['last_name'],
          ParamType.String,
          false,
        ),
        phoneNumber: deserializeParam(
          data['phone_number'],
          ParamType.String,
          false,
        ),
        dob: deserializeParam(
          data['dob'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        hashThaiId: deserializeParam(
          data['hash_thai_id'],
          ParamType.String,
          false,
        ),
        consentDate: deserializeParam(
          data['consent_date'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CustomerDetailStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CustomerDetailStruct &&
        thaiId == other.thaiId &&
        title == other.title &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        phoneNumber == other.phoneNumber &&
        dob == other.dob &&
        email == other.email &&
        hashThaiId == other.hashThaiId &&
        consentDate == other.consentDate;
  }

  @override
  int get hashCode => const ListEquality().hash([
        thaiId,
        title,
        firstName,
        lastName,
        phoneNumber,
        dob,
        email,
        hashThaiId,
        consentDate
      ]);
}

CustomerDetailStruct createCustomerDetailStruct({
  String? thaiId,
  String? title,
  String? firstName,
  String? lastName,
  String? phoneNumber,
  String? dob,
  String? email,
  String? hashThaiId,
  String? consentDate,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CustomerDetailStruct(
      thaiId: thaiId,
      title: title,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      dob: dob,
      email: email,
      hashThaiId: hashThaiId,
      consentDate: consentDate,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CustomerDetailStruct? updateCustomerDetailStruct(
  CustomerDetailStruct? customerDetail, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    customerDetail
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCustomerDetailStructData(
  Map<String, dynamic> firestoreData,
  CustomerDetailStruct? customerDetail,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (customerDetail == null) {
    return;
  }
  if (customerDetail.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && customerDetail.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final customerDetailData =
      getCustomerDetailFirestoreData(customerDetail, forFieldValue);
  final nestedData =
      customerDetailData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = customerDetail.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCustomerDetailFirestoreData(
  CustomerDetailStruct? customerDetail, [
  bool forFieldValue = false,
]) {
  if (customerDetail == null) {
    return {};
  }
  final firestoreData = mapToFirestore(customerDetail.toMap());

  // Add any Firestore field values
  customerDetail.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCustomerDetailListFirestoreData(
  List<CustomerDetailStruct>? customerDetails,
) =>
    customerDetails
        ?.map((e) => getCustomerDetailFirestoreData(e, true))
        .toList() ??
    [];
