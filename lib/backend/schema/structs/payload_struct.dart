// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PayloadStruct extends FFFirebaseStruct {
  PayloadStruct({
    String? product,
    String? leadGroup,
    String? sourceBy,
    String? channel,
    String? subProduct,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? consentFlag,
    List<ConsentStruct>? consent,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _product = product,
        _leadGroup = leadGroup,
        _sourceBy = sourceBy,
        _channel = channel,
        _subProduct = subProduct,
        _firstName = firstName,
        _lastName = lastName,
        _phoneNumber = phoneNumber,
        _consentFlag = consentFlag,
        _consent = consent,
        super(firestoreUtilData);

  // "product" field.
  String? _product;
  String get product => _product ?? '';
  set product(String? val) => _product = val;

  bool hasProduct() => _product != null;

  // "lead_group" field.
  String? _leadGroup;
  String get leadGroup => _leadGroup ?? '';
  set leadGroup(String? val) => _leadGroup = val;

  bool hasLeadGroup() => _leadGroup != null;

  // "source_by" field.
  String? _sourceBy;
  String get sourceBy => _sourceBy ?? '';
  set sourceBy(String? val) => _sourceBy = val;

  bool hasSourceBy() => _sourceBy != null;

  // "channel" field.
  String? _channel;
  String get channel => _channel ?? '';
  set channel(String? val) => _channel = val;

  bool hasChannel() => _channel != null;

  // "sub_product" field.
  String? _subProduct;
  String get subProduct => _subProduct ?? '';
  set subProduct(String? val) => _subProduct = val;

  bool hasSubProduct() => _subProduct != null;

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

  // "consent_flag" field.
  String? _consentFlag;
  String get consentFlag => _consentFlag ?? '';
  set consentFlag(String? val) => _consentFlag = val;

  bool hasConsentFlag() => _consentFlag != null;

  // "consent" field.
  List<ConsentStruct>? _consent;
  List<ConsentStruct> get consent => _consent ?? const [];
  set consent(List<ConsentStruct>? val) => _consent = val;

  void updateConsent(Function(List<ConsentStruct>) updateFn) {
    updateFn(_consent ??= []);
  }

  bool hasConsent() => _consent != null;

  static PayloadStruct fromMap(Map<String, dynamic> data) => PayloadStruct(
        product: data['product'] as String?,
        leadGroup: data['lead_group'] as String?,
        sourceBy: data['source_by'] as String?,
        channel: data['channel'] as String?,
        subProduct: data['sub_product'] as String?,
        firstName: data['first_name'] as String?,
        lastName: data['last_name'] as String?,
        phoneNumber: data['phone_number'] as String?,
        consentFlag: data['consent_flag'] as String?,
        consent: getStructList(
          data['consent'],
          ConsentStruct.fromMap,
        ),
      );

  static PayloadStruct? maybeFromMap(dynamic data) =>
      data is Map ? PayloadStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'product': _product,
        'lead_group': _leadGroup,
        'source_by': _sourceBy,
        'channel': _channel,
        'sub_product': _subProduct,
        'first_name': _firstName,
        'last_name': _lastName,
        'phone_number': _phoneNumber,
        'consent_flag': _consentFlag,
        'consent': _consent?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'product': serializeParam(
          _product,
          ParamType.String,
        ),
        'lead_group': serializeParam(
          _leadGroup,
          ParamType.String,
        ),
        'source_by': serializeParam(
          _sourceBy,
          ParamType.String,
        ),
        'channel': serializeParam(
          _channel,
          ParamType.String,
        ),
        'sub_product': serializeParam(
          _subProduct,
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
        'consent_flag': serializeParam(
          _consentFlag,
          ParamType.String,
        ),
        'consent': serializeParam(
          _consent,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static PayloadStruct fromSerializableMap(Map<String, dynamic> data) =>
      PayloadStruct(
        product: deserializeParam(
          data['product'],
          ParamType.String,
          false,
        ),
        leadGroup: deserializeParam(
          data['lead_group'],
          ParamType.String,
          false,
        ),
        sourceBy: deserializeParam(
          data['source_by'],
          ParamType.String,
          false,
        ),
        channel: deserializeParam(
          data['channel'],
          ParamType.String,
          false,
        ),
        subProduct: deserializeParam(
          data['sub_product'],
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
        consentFlag: deserializeParam(
          data['consent_flag'],
          ParamType.String,
          false,
        ),
        consent: deserializeStructParam<ConsentStruct>(
          data['consent'],
          ParamType.DataStruct,
          true,
          structBuilder: ConsentStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'PayloadStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PayloadStruct &&
        product == other.product &&
        leadGroup == other.leadGroup &&
        sourceBy == other.sourceBy &&
        channel == other.channel &&
        subProduct == other.subProduct &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        phoneNumber == other.phoneNumber &&
        consentFlag == other.consentFlag &&
        listEquality.equals(consent, other.consent);
  }

  @override
  int get hashCode => const ListEquality().hash([
        product,
        leadGroup,
        sourceBy,
        channel,
        subProduct,
        firstName,
        lastName,
        phoneNumber,
        consentFlag,
        consent
      ]);
}

PayloadStruct createPayloadStruct({
  String? product,
  String? leadGroup,
  String? sourceBy,
  String? channel,
  String? subProduct,
  String? firstName,
  String? lastName,
  String? phoneNumber,
  String? consentFlag,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PayloadStruct(
      product: product,
      leadGroup: leadGroup,
      sourceBy: sourceBy,
      channel: channel,
      subProduct: subProduct,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      consentFlag: consentFlag,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PayloadStruct? updatePayloadStruct(
  PayloadStruct? payload, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    payload
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPayloadStructData(
  Map<String, dynamic> firestoreData,
  PayloadStruct? payload,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (payload == null) {
    return;
  }
  if (payload.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && payload.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final payloadData = getPayloadFirestoreData(payload, forFieldValue);
  final nestedData = payloadData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = payload.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPayloadFirestoreData(
  PayloadStruct? payload, [
  bool forFieldValue = false,
]) {
  if (payload == null) {
    return {};
  }
  final firestoreData = mapToFirestore(payload.toMap());

  // Add any Firestore field values
  mapToFirestore(payload.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPayloadListFirestoreData(
  List<PayloadStruct>? payloads,
) =>
    payloads?.map((e) => getPayloadFirestoreData(e, true)).toList() ?? [];
