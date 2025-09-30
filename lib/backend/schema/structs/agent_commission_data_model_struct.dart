// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AgentCommissionDataModelStruct extends FFFirebaseStruct {
  AgentCommissionDataModelStruct({
    AgentCommissionSummaryDataModelStruct? summary,
    List<AgentCommissionLeadDataModelStruct>? details,
    String? dataDate,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _summary = summary,
        _details = details,
        _dataDate = dataDate,
        super(firestoreUtilData);

  // "summary" field.
  AgentCommissionSummaryDataModelStruct? _summary;
  AgentCommissionSummaryDataModelStruct get summary =>
      _summary ?? AgentCommissionSummaryDataModelStruct();
  set summary(AgentCommissionSummaryDataModelStruct? val) => _summary = val;

  void updateSummary(Function(AgentCommissionSummaryDataModelStruct) updateFn) {
    updateFn(_summary ??= AgentCommissionSummaryDataModelStruct());
  }

  bool hasSummary() => _summary != null;

  // "details" field.
  List<AgentCommissionLeadDataModelStruct>? _details;
  List<AgentCommissionLeadDataModelStruct> get details => _details ?? const [];
  set details(List<AgentCommissionLeadDataModelStruct>? val) => _details = val;

  void updateDetails(
      Function(List<AgentCommissionLeadDataModelStruct>) updateFn) {
    updateFn(_details ??= []);
  }

  bool hasDetails() => _details != null;

  // "data_date" field.
  String? _dataDate;
  String get dataDate => _dataDate ?? '';
  set dataDate(String? val) => _dataDate = val;

  bool hasDataDate() => _dataDate != null;

  static AgentCommissionDataModelStruct fromMap(Map<String, dynamic> data) =>
      AgentCommissionDataModelStruct(
        summary: data['summary'] is AgentCommissionSummaryDataModelStruct
            ? data['summary']
            : AgentCommissionSummaryDataModelStruct.maybeFromMap(
                data['summary']),
        details: getStructList(
          data['details'],
          AgentCommissionLeadDataModelStruct.fromMap,
        ),
        dataDate: data['data_date'] as String?,
      );

  static AgentCommissionDataModelStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? AgentCommissionDataModelStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'summary': _summary?.toMap(),
        'details': _details?.map((e) => e.toMap()).toList(),
        'data_date': _dataDate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'summary': serializeParam(
          _summary,
          ParamType.DataStruct,
        ),
        'details': serializeParam(
          _details,
          ParamType.DataStruct,
          isList: true,
        ),
        'data_date': serializeParam(
          _dataDate,
          ParamType.String,
        ),
      }.withoutNulls;

  static AgentCommissionDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      AgentCommissionDataModelStruct(
        summary: deserializeStructParam(
          data['summary'],
          ParamType.DataStruct,
          false,
          structBuilder:
              AgentCommissionSummaryDataModelStruct.fromSerializableMap,
        ),
        details: deserializeStructParam<AgentCommissionLeadDataModelStruct>(
          data['details'],
          ParamType.DataStruct,
          true,
          structBuilder: AgentCommissionLeadDataModelStruct.fromSerializableMap,
        ),
        dataDate: deserializeParam(
          data['data_date'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AgentCommissionDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is AgentCommissionDataModelStruct &&
        summary == other.summary &&
        listEquality.equals(details, other.details) &&
        dataDate == other.dataDate;
  }

  @override
  int get hashCode => const ListEquality().hash([summary, details, dataDate]);
}

AgentCommissionDataModelStruct createAgentCommissionDataModelStruct({
  AgentCommissionSummaryDataModelStruct? summary,
  String? dataDate,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AgentCommissionDataModelStruct(
      summary: summary ??
          (clearUnsetFields ? AgentCommissionSummaryDataModelStruct() : null),
      dataDate: dataDate,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AgentCommissionDataModelStruct? updateAgentCommissionDataModelStruct(
  AgentCommissionDataModelStruct? agentCommissionDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    agentCommissionDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAgentCommissionDataModelStructData(
  Map<String, dynamic> firestoreData,
  AgentCommissionDataModelStruct? agentCommissionDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (agentCommissionDataModel == null) {
    return;
  }
  if (agentCommissionDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      agentCommissionDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final agentCommissionDataModelData = getAgentCommissionDataModelFirestoreData(
      agentCommissionDataModel, forFieldValue);
  final nestedData =
      agentCommissionDataModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      agentCommissionDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAgentCommissionDataModelFirestoreData(
  AgentCommissionDataModelStruct? agentCommissionDataModel, [
  bool forFieldValue = false,
]) {
  if (agentCommissionDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(agentCommissionDataModel.toMap());

  // Handle nested data for "summary" field.
  addAgentCommissionSummaryDataModelStructData(
    firestoreData,
    agentCommissionDataModel.hasSummary()
        ? agentCommissionDataModel.summary
        : null,
    'summary',
    forFieldValue,
  );

  // Add any Firestore field values
  agentCommissionDataModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAgentCommissionDataModelListFirestoreData(
  List<AgentCommissionDataModelStruct>? agentCommissionDataModels,
) =>
    agentCommissionDataModels
        ?.map((e) => getAgentCommissionDataModelFirestoreData(e, true))
        .toList() ??
    [];
