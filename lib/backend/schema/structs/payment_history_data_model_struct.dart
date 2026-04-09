// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PaymentHistoryDataModelStruct extends FFFirebaseStruct {
  PaymentHistoryDataModelStruct({
    String? firstName,
    String? lastName,
    String? comReceiveAmt,
    String? comPaymentDate,
    String? leadContractId,
    String? agentCode,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _firstName = firstName,
        _lastName = lastName,
        _comReceiveAmt = comReceiveAmt,
        _comPaymentDate = comPaymentDate,
        _leadContractId = leadContractId,
        _agentCode = agentCode,
        super(firestoreUtilData);

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

  // "com_receive_amt" field.
  String? _comReceiveAmt;
  String get comReceiveAmt => _comReceiveAmt ?? '';
  set comReceiveAmt(String? val) => _comReceiveAmt = val;

  bool hasComReceiveAmt() => _comReceiveAmt != null;

  // "com_payment_date" field.
  String? _comPaymentDate;
  String get comPaymentDate => _comPaymentDate ?? '';
  set comPaymentDate(String? val) => _comPaymentDate = val;

  bool hasComPaymentDate() => _comPaymentDate != null;

  // "lead_contract_id" field.
  String? _leadContractId;
  String get leadContractId => _leadContractId ?? '';
  set leadContractId(String? val) => _leadContractId = val;

  bool hasLeadContractId() => _leadContractId != null;

  // "agent_code" field.
  String? _agentCode;
  String get agentCode => _agentCode ?? '';
  set agentCode(String? val) => _agentCode = val;

  bool hasAgentCode() => _agentCode != null;

  static PaymentHistoryDataModelStruct fromMap(Map<String, dynamic> data) =>
      PaymentHistoryDataModelStruct(
        firstName: data['first_name'] as String?,
        lastName: data['last_name'] as String?,
        comReceiveAmt: data['com_receive_amt'] as String?,
        comPaymentDate: data['com_payment_date'] as String?,
        leadContractId: data['lead_contract_id'] as String?,
        agentCode: data['agent_code'] as String?,
      );

  static PaymentHistoryDataModelStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? PaymentHistoryDataModelStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'first_name': _firstName,
        'last_name': _lastName,
        'com_receive_amt': _comReceiveAmt,
        'com_payment_date': _comPaymentDate,
        'lead_contract_id': _leadContractId,
        'agent_code': _agentCode,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'first_name': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'last_name': serializeParam(
          _lastName,
          ParamType.String,
        ),
        'com_receive_amt': serializeParam(
          _comReceiveAmt,
          ParamType.String,
        ),
        'com_payment_date': serializeParam(
          _comPaymentDate,
          ParamType.String,
        ),
        'lead_contract_id': serializeParam(
          _leadContractId,
          ParamType.String,
        ),
        'agent_code': serializeParam(
          _agentCode,
          ParamType.String,
        ),
      }.withoutNulls;

  static PaymentHistoryDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PaymentHistoryDataModelStruct(
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
        comReceiveAmt: deserializeParam(
          data['com_receive_amt'],
          ParamType.String,
          false,
        ),
        comPaymentDate: deserializeParam(
          data['com_payment_date'],
          ParamType.String,
          false,
        ),
        leadContractId: deserializeParam(
          data['lead_contract_id'],
          ParamType.String,
          false,
        ),
        agentCode: deserializeParam(
          data['agent_code'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PaymentHistoryDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PaymentHistoryDataModelStruct &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        comReceiveAmt == other.comReceiveAmt &&
        comPaymentDate == other.comPaymentDate &&
        leadContractId == other.leadContractId &&
        agentCode == other.agentCode;
  }

  @override
  int get hashCode => const ListEquality().hash([
        firstName,
        lastName,
        comReceiveAmt,
        comPaymentDate,
        leadContractId,
        agentCode
      ]);
}

PaymentHistoryDataModelStruct createPaymentHistoryDataModelStruct({
  String? firstName,
  String? lastName,
  String? comReceiveAmt,
  String? comPaymentDate,
  String? leadContractId,
  String? agentCode,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PaymentHistoryDataModelStruct(
      firstName: firstName,
      lastName: lastName,
      comReceiveAmt: comReceiveAmt,
      comPaymentDate: comPaymentDate,
      leadContractId: leadContractId,
      agentCode: agentCode,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PaymentHistoryDataModelStruct? updatePaymentHistoryDataModelStruct(
  PaymentHistoryDataModelStruct? paymentHistoryDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    paymentHistoryDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPaymentHistoryDataModelStructData(
  Map<String, dynamic> firestoreData,
  PaymentHistoryDataModelStruct? paymentHistoryDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (paymentHistoryDataModel == null) {
    return;
  }
  if (paymentHistoryDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      paymentHistoryDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final paymentHistoryDataModelData = getPaymentHistoryDataModelFirestoreData(
      paymentHistoryDataModel, forFieldValue);
  final nestedData =
      paymentHistoryDataModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      paymentHistoryDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPaymentHistoryDataModelFirestoreData(
  PaymentHistoryDataModelStruct? paymentHistoryDataModel, [
  bool forFieldValue = false,
]) {
  if (paymentHistoryDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(paymentHistoryDataModel.toMap());

  // Add any Firestore field values
  mapToFirestore(paymentHistoryDataModel.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPaymentHistoryDataModelListFirestoreData(
  List<PaymentHistoryDataModelStruct>? paymentHistoryDataModels,
) =>
    paymentHistoryDataModels
        ?.map((e) => getPaymentHistoryDataModelFirestoreData(e, true))
        .toList() ??
    [];
