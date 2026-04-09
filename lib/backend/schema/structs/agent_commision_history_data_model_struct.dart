// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AgentCommisionHistoryDataModelStruct extends FFFirebaseStruct {
  AgentCommisionHistoryDataModelStruct({
    String? leadId,
    String? contNo,
    String? comPayStatus,
    String? comInstallmentNo,
    String? comPayAmt,
    String? comTax,
    String? comReceiveAmt,
    String? comUnpaidAmt,
    String? comRemainingAmt,
    String? comDueDate,
    String? comPaymentDate,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _leadId = leadId,
        _contNo = contNo,
        _comPayStatus = comPayStatus,
        _comInstallmentNo = comInstallmentNo,
        _comPayAmt = comPayAmt,
        _comTax = comTax,
        _comReceiveAmt = comReceiveAmt,
        _comUnpaidAmt = comUnpaidAmt,
        _comRemainingAmt = comRemainingAmt,
        _comDueDate = comDueDate,
        _comPaymentDate = comPaymentDate,
        super(firestoreUtilData);

  // "lead_id" field.
  String? _leadId;
  String get leadId => _leadId ?? '';
  set leadId(String? val) => _leadId = val;

  bool hasLeadId() => _leadId != null;

  // "cont_no" field.
  String? _contNo;
  String get contNo => _contNo ?? '';
  set contNo(String? val) => _contNo = val;

  bool hasContNo() => _contNo != null;

  // "com_pay_status" field.
  String? _comPayStatus;
  String get comPayStatus => _comPayStatus ?? '';
  set comPayStatus(String? val) => _comPayStatus = val;

  bool hasComPayStatus() => _comPayStatus != null;

  // "com_installment_no" field.
  String? _comInstallmentNo;
  String get comInstallmentNo => _comInstallmentNo ?? '';
  set comInstallmentNo(String? val) => _comInstallmentNo = val;

  bool hasComInstallmentNo() => _comInstallmentNo != null;

  // "com_pay_amt" field.
  String? _comPayAmt;
  String get comPayAmt => _comPayAmt ?? '';
  set comPayAmt(String? val) => _comPayAmt = val;

  bool hasComPayAmt() => _comPayAmt != null;

  // "com_tax" field.
  String? _comTax;
  String get comTax => _comTax ?? '';
  set comTax(String? val) => _comTax = val;

  bool hasComTax() => _comTax != null;

  // "com_receive_amt" field.
  String? _comReceiveAmt;
  String get comReceiveAmt => _comReceiveAmt ?? '';
  set comReceiveAmt(String? val) => _comReceiveAmt = val;

  bool hasComReceiveAmt() => _comReceiveAmt != null;

  // "com_unpaid_amt" field.
  String? _comUnpaidAmt;
  String get comUnpaidAmt => _comUnpaidAmt ?? '';
  set comUnpaidAmt(String? val) => _comUnpaidAmt = val;

  bool hasComUnpaidAmt() => _comUnpaidAmt != null;

  // "com_remaining_amt" field.
  String? _comRemainingAmt;
  String get comRemainingAmt => _comRemainingAmt ?? '';
  set comRemainingAmt(String? val) => _comRemainingAmt = val;

  bool hasComRemainingAmt() => _comRemainingAmt != null;

  // "com_due_date" field.
  String? _comDueDate;
  String get comDueDate => _comDueDate ?? '';
  set comDueDate(String? val) => _comDueDate = val;

  bool hasComDueDate() => _comDueDate != null;

  // "com_payment_date" field.
  String? _comPaymentDate;
  String get comPaymentDate => _comPaymentDate ?? '';
  set comPaymentDate(String? val) => _comPaymentDate = val;

  bool hasComPaymentDate() => _comPaymentDate != null;

  static AgentCommisionHistoryDataModelStruct fromMap(
          Map<String, dynamic> data) =>
      AgentCommisionHistoryDataModelStruct(
        leadId: data['lead_id'] as String?,
        contNo: data['cont_no'] as String?,
        comPayStatus: data['com_pay_status'] as String?,
        comInstallmentNo: data['com_installment_no'] as String?,
        comPayAmt: data['com_pay_amt'] as String?,
        comTax: data['com_tax'] as String?,
        comReceiveAmt: data['com_receive_amt'] as String?,
        comUnpaidAmt: data['com_unpaid_amt'] as String?,
        comRemainingAmt: data['com_remaining_amt'] as String?,
        comDueDate: data['com_due_date'] as String?,
        comPaymentDate: data['com_payment_date'] as String?,
      );

  static AgentCommisionHistoryDataModelStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? AgentCommisionHistoryDataModelStruct.fromMap(
              data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'lead_id': _leadId,
        'cont_no': _contNo,
        'com_pay_status': _comPayStatus,
        'com_installment_no': _comInstallmentNo,
        'com_pay_amt': _comPayAmt,
        'com_tax': _comTax,
        'com_receive_amt': _comReceiveAmt,
        'com_unpaid_amt': _comUnpaidAmt,
        'com_remaining_amt': _comRemainingAmt,
        'com_due_date': _comDueDate,
        'com_payment_date': _comPaymentDate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'lead_id': serializeParam(
          _leadId,
          ParamType.String,
        ),
        'cont_no': serializeParam(
          _contNo,
          ParamType.String,
        ),
        'com_pay_status': serializeParam(
          _comPayStatus,
          ParamType.String,
        ),
        'com_installment_no': serializeParam(
          _comInstallmentNo,
          ParamType.String,
        ),
        'com_pay_amt': serializeParam(
          _comPayAmt,
          ParamType.String,
        ),
        'com_tax': serializeParam(
          _comTax,
          ParamType.String,
        ),
        'com_receive_amt': serializeParam(
          _comReceiveAmt,
          ParamType.String,
        ),
        'com_unpaid_amt': serializeParam(
          _comUnpaidAmt,
          ParamType.String,
        ),
        'com_remaining_amt': serializeParam(
          _comRemainingAmt,
          ParamType.String,
        ),
        'com_due_date': serializeParam(
          _comDueDate,
          ParamType.String,
        ),
        'com_payment_date': serializeParam(
          _comPaymentDate,
          ParamType.String,
        ),
      }.withoutNulls;

  static AgentCommisionHistoryDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      AgentCommisionHistoryDataModelStruct(
        leadId: deserializeParam(
          data['lead_id'],
          ParamType.String,
          false,
        ),
        contNo: deserializeParam(
          data['cont_no'],
          ParamType.String,
          false,
        ),
        comPayStatus: deserializeParam(
          data['com_pay_status'],
          ParamType.String,
          false,
        ),
        comInstallmentNo: deserializeParam(
          data['com_installment_no'],
          ParamType.String,
          false,
        ),
        comPayAmt: deserializeParam(
          data['com_pay_amt'],
          ParamType.String,
          false,
        ),
        comTax: deserializeParam(
          data['com_tax'],
          ParamType.String,
          false,
        ),
        comReceiveAmt: deserializeParam(
          data['com_receive_amt'],
          ParamType.String,
          false,
        ),
        comUnpaidAmt: deserializeParam(
          data['com_unpaid_amt'],
          ParamType.String,
          false,
        ),
        comRemainingAmt: deserializeParam(
          data['com_remaining_amt'],
          ParamType.String,
          false,
        ),
        comDueDate: deserializeParam(
          data['com_due_date'],
          ParamType.String,
          false,
        ),
        comPaymentDate: deserializeParam(
          data['com_payment_date'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AgentCommisionHistoryDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AgentCommisionHistoryDataModelStruct &&
        leadId == other.leadId &&
        contNo == other.contNo &&
        comPayStatus == other.comPayStatus &&
        comInstallmentNo == other.comInstallmentNo &&
        comPayAmt == other.comPayAmt &&
        comTax == other.comTax &&
        comReceiveAmt == other.comReceiveAmt &&
        comUnpaidAmt == other.comUnpaidAmt &&
        comRemainingAmt == other.comRemainingAmt &&
        comDueDate == other.comDueDate &&
        comPaymentDate == other.comPaymentDate;
  }

  @override
  int get hashCode => const ListEquality().hash([
        leadId,
        contNo,
        comPayStatus,
        comInstallmentNo,
        comPayAmt,
        comTax,
        comReceiveAmt,
        comUnpaidAmt,
        comRemainingAmt,
        comDueDate,
        comPaymentDate
      ]);
}

AgentCommisionHistoryDataModelStruct
    createAgentCommisionHistoryDataModelStruct({
  String? leadId,
  String? contNo,
  String? comPayStatus,
  String? comInstallmentNo,
  String? comPayAmt,
  String? comTax,
  String? comReceiveAmt,
  String? comUnpaidAmt,
  String? comRemainingAmt,
  String? comDueDate,
  String? comPaymentDate,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
        AgentCommisionHistoryDataModelStruct(
          leadId: leadId,
          contNo: contNo,
          comPayStatus: comPayStatus,
          comInstallmentNo: comInstallmentNo,
          comPayAmt: comPayAmt,
          comTax: comTax,
          comReceiveAmt: comReceiveAmt,
          comUnpaidAmt: comUnpaidAmt,
          comRemainingAmt: comRemainingAmt,
          comDueDate: comDueDate,
          comPaymentDate: comPaymentDate,
          firestoreUtilData: FirestoreUtilData(
            clearUnsetFields: clearUnsetFields,
            create: create,
            delete: delete,
            fieldValues: fieldValues,
          ),
        );

AgentCommisionHistoryDataModelStruct?
    updateAgentCommisionHistoryDataModelStruct(
  AgentCommisionHistoryDataModelStruct? agentCommisionHistoryDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
        agentCommisionHistoryDataModel
          ?..firestoreUtilData = FirestoreUtilData(
            clearUnsetFields: clearUnsetFields,
            create: create,
          );

void addAgentCommisionHistoryDataModelStructData(
  Map<String, dynamic> firestoreData,
  AgentCommisionHistoryDataModelStruct? agentCommisionHistoryDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (agentCommisionHistoryDataModel == null) {
    return;
  }
  if (agentCommisionHistoryDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      agentCommisionHistoryDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final agentCommisionHistoryDataModelData =
      getAgentCommisionHistoryDataModelFirestoreData(
          agentCommisionHistoryDataModel, forFieldValue);
  final nestedData = agentCommisionHistoryDataModelData
      .map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      agentCommisionHistoryDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAgentCommisionHistoryDataModelFirestoreData(
  AgentCommisionHistoryDataModelStruct? agentCommisionHistoryDataModel, [
  bool forFieldValue = false,
]) {
  if (agentCommisionHistoryDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(agentCommisionHistoryDataModel.toMap());

  // Add any Firestore field values
  mapToFirestore(agentCommisionHistoryDataModel.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAgentCommisionHistoryDataModelListFirestoreData(
  List<AgentCommisionHistoryDataModelStruct>? agentCommisionHistoryDataModels,
) =>
    agentCommisionHistoryDataModels
        ?.map((e) => getAgentCommisionHistoryDataModelFirestoreData(e, true))
        .toList() ??
    [];
