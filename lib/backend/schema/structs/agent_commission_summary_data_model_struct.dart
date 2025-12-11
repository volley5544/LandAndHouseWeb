// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AgentCommissionSummaryDataModelStruct extends FFFirebaseStruct {
  AgentCommissionSummaryDataModelStruct({
    String? totalContract,
    String? totalComPayAmt,
    String? totalComWaitingPayAmt,
    String? totalComWaitingApproveAmt,
    String? totalComNextPayAmt,
    String? totalComReceivedAmt,
    String? totalComDueAmt,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _totalContract = totalContract,
        _totalComPayAmt = totalComPayAmt,
        _totalComWaitingPayAmt = totalComWaitingPayAmt,
        _totalComWaitingApproveAmt = totalComWaitingApproveAmt,
        _totalComNextPayAmt = totalComNextPayAmt,
        _totalComReceivedAmt = totalComReceivedAmt,
        _totalComDueAmt = totalComDueAmt,
        super(firestoreUtilData);

  // "total_contract" field.
  String? _totalContract;
  String get totalContract => _totalContract ?? '';
  set totalContract(String? val) => _totalContract = val;

  bool hasTotalContract() => _totalContract != null;

  // "total_com_pay_amt" field.
  String? _totalComPayAmt;
  String get totalComPayAmt => _totalComPayAmt ?? '';
  set totalComPayAmt(String? val) => _totalComPayAmt = val;

  bool hasTotalComPayAmt() => _totalComPayAmt != null;

  // "total_com_waiting_pay_amt" field.
  String? _totalComWaitingPayAmt;
  String get totalComWaitingPayAmt => _totalComWaitingPayAmt ?? '';
  set totalComWaitingPayAmt(String? val) => _totalComWaitingPayAmt = val;

  bool hasTotalComWaitingPayAmt() => _totalComWaitingPayAmt != null;

  // "total_com_waiting_approve_amt" field.
  String? _totalComWaitingApproveAmt;
  String get totalComWaitingApproveAmt => _totalComWaitingApproveAmt ?? '';
  set totalComWaitingApproveAmt(String? val) =>
      _totalComWaitingApproveAmt = val;

  bool hasTotalComWaitingApproveAmt() => _totalComWaitingApproveAmt != null;

  // "total_com_next_pay_amt" field.
  String? _totalComNextPayAmt;
  String get totalComNextPayAmt => _totalComNextPayAmt ?? '';
  set totalComNextPayAmt(String? val) => _totalComNextPayAmt = val;

  bool hasTotalComNextPayAmt() => _totalComNextPayAmt != null;

  // "total_com_received_amt" field.
  String? _totalComReceivedAmt;
  String get totalComReceivedAmt => _totalComReceivedAmt ?? '';
  set totalComReceivedAmt(String? val) => _totalComReceivedAmt = val;

  bool hasTotalComReceivedAmt() => _totalComReceivedAmt != null;

  // "total_com_due_amt" field.
  String? _totalComDueAmt;
  String get totalComDueAmt => _totalComDueAmt ?? '';
  set totalComDueAmt(String? val) => _totalComDueAmt = val;

  bool hasTotalComDueAmt() => _totalComDueAmt != null;

  static AgentCommissionSummaryDataModelStruct fromMap(
          Map<String, dynamic> data) =>
      AgentCommissionSummaryDataModelStruct(
        totalContract: data['total_contract'] as String?,
        totalComPayAmt: data['total_com_pay_amt'] as String?,
        totalComWaitingPayAmt: data['total_com_waiting_pay_amt'] as String?,
        totalComWaitingApproveAmt:
            data['total_com_waiting_approve_amt'] as String?,
        totalComNextPayAmt: data['total_com_next_pay_amt'] as String?,
        totalComReceivedAmt: data['total_com_received_amt'] as String?,
        totalComDueAmt: data['total_com_due_amt'] as String?,
      );

  static AgentCommissionSummaryDataModelStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? AgentCommissionSummaryDataModelStruct.fromMap(
              data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'total_contract': _totalContract,
        'total_com_pay_amt': _totalComPayAmt,
        'total_com_waiting_pay_amt': _totalComWaitingPayAmt,
        'total_com_waiting_approve_amt': _totalComWaitingApproveAmt,
        'total_com_next_pay_amt': _totalComNextPayAmt,
        'total_com_received_amt': _totalComReceivedAmt,
        'total_com_due_amt': _totalComDueAmt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'total_contract': serializeParam(
          _totalContract,
          ParamType.String,
        ),
        'total_com_pay_amt': serializeParam(
          _totalComPayAmt,
          ParamType.String,
        ),
        'total_com_waiting_pay_amt': serializeParam(
          _totalComWaitingPayAmt,
          ParamType.String,
        ),
        'total_com_waiting_approve_amt': serializeParam(
          _totalComWaitingApproveAmt,
          ParamType.String,
        ),
        'total_com_next_pay_amt': serializeParam(
          _totalComNextPayAmt,
          ParamType.String,
        ),
        'total_com_received_amt': serializeParam(
          _totalComReceivedAmt,
          ParamType.String,
        ),
        'total_com_due_amt': serializeParam(
          _totalComDueAmt,
          ParamType.String,
        ),
      }.withoutNulls;

  static AgentCommissionSummaryDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      AgentCommissionSummaryDataModelStruct(
        totalContract: deserializeParam(
          data['total_contract'],
          ParamType.String,
          false,
        ),
        totalComPayAmt: deserializeParam(
          data['total_com_pay_amt'],
          ParamType.String,
          false,
        ),
        totalComWaitingPayAmt: deserializeParam(
          data['total_com_waiting_pay_amt'],
          ParamType.String,
          false,
        ),
        totalComWaitingApproveAmt: deserializeParam(
          data['total_com_waiting_approve_amt'],
          ParamType.String,
          false,
        ),
        totalComNextPayAmt: deserializeParam(
          data['total_com_next_pay_amt'],
          ParamType.String,
          false,
        ),
        totalComReceivedAmt: deserializeParam(
          data['total_com_received_amt'],
          ParamType.String,
          false,
        ),
        totalComDueAmt: deserializeParam(
          data['total_com_due_amt'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AgentCommissionSummaryDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AgentCommissionSummaryDataModelStruct &&
        totalContract == other.totalContract &&
        totalComPayAmt == other.totalComPayAmt &&
        totalComWaitingPayAmt == other.totalComWaitingPayAmt &&
        totalComWaitingApproveAmt == other.totalComWaitingApproveAmt &&
        totalComNextPayAmt == other.totalComNextPayAmt &&
        totalComReceivedAmt == other.totalComReceivedAmt &&
        totalComDueAmt == other.totalComDueAmt;
  }

  @override
  int get hashCode => const ListEquality().hash([
        totalContract,
        totalComPayAmt,
        totalComWaitingPayAmt,
        totalComWaitingApproveAmt,
        totalComNextPayAmt,
        totalComReceivedAmt,
        totalComDueAmt
      ]);
}

AgentCommissionSummaryDataModelStruct
    createAgentCommissionSummaryDataModelStruct({
  String? totalContract,
  String? totalComPayAmt,
  String? totalComWaitingPayAmt,
  String? totalComWaitingApproveAmt,
  String? totalComNextPayAmt,
  String? totalComReceivedAmt,
  String? totalComDueAmt,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
        AgentCommissionSummaryDataModelStruct(
          totalContract: totalContract,
          totalComPayAmt: totalComPayAmt,
          totalComWaitingPayAmt: totalComWaitingPayAmt,
          totalComWaitingApproveAmt: totalComWaitingApproveAmt,
          totalComNextPayAmt: totalComNextPayAmt,
          totalComReceivedAmt: totalComReceivedAmt,
          totalComDueAmt: totalComDueAmt,
          firestoreUtilData: FirestoreUtilData(
            clearUnsetFields: clearUnsetFields,
            create: create,
            delete: delete,
            fieldValues: fieldValues,
          ),
        );

AgentCommissionSummaryDataModelStruct?
    updateAgentCommissionSummaryDataModelStruct(
  AgentCommissionSummaryDataModelStruct? agentCommissionSummaryDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
        agentCommissionSummaryDataModel
          ?..firestoreUtilData = FirestoreUtilData(
            clearUnsetFields: clearUnsetFields,
            create: create,
          );

void addAgentCommissionSummaryDataModelStructData(
  Map<String, dynamic> firestoreData,
  AgentCommissionSummaryDataModelStruct? agentCommissionSummaryDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (agentCommissionSummaryDataModel == null) {
    return;
  }
  if (agentCommissionSummaryDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      agentCommissionSummaryDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final agentCommissionSummaryDataModelData =
      getAgentCommissionSummaryDataModelFirestoreData(
          agentCommissionSummaryDataModel, forFieldValue);
  final nestedData = agentCommissionSummaryDataModelData
      .map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      agentCommissionSummaryDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAgentCommissionSummaryDataModelFirestoreData(
  AgentCommissionSummaryDataModelStruct? agentCommissionSummaryDataModel, [
  bool forFieldValue = false,
]) {
  if (agentCommissionSummaryDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(agentCommissionSummaryDataModel.toMap());

  // Add any Firestore field values
  agentCommissionSummaryDataModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAgentCommissionSummaryDataModelListFirestoreData(
  List<AgentCommissionSummaryDataModelStruct>? agentCommissionSummaryDataModels,
) =>
    agentCommissionSummaryDataModels
        ?.map((e) => getAgentCommissionSummaryDataModelFirestoreData(e, true))
        .toList() ??
    [];
