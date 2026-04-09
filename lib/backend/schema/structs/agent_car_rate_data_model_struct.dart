// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AgentCarRateDataModelStruct extends FFFirebaseStruct {
  AgentCarRateDataModelStruct({
    String? sdate,
    String? firstDate,
    String? lastDate,
    String? dateDiff,
    String? rate,
    String? installment,
    String? totalInterest,
    String? totalAr,
    String? firstInstallment,
    String? lastInstallment,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _sdate = sdate,
        _firstDate = firstDate,
        _lastDate = lastDate,
        _dateDiff = dateDiff,
        _rate = rate,
        _installment = installment,
        _totalInterest = totalInterest,
        _totalAr = totalAr,
        _firstInstallment = firstInstallment,
        _lastInstallment = lastInstallment,
        super(firestoreUtilData);

  // "sdate" field.
  String? _sdate;
  String get sdate => _sdate ?? '';
  set sdate(String? val) => _sdate = val;

  bool hasSdate() => _sdate != null;

  // "first_date" field.
  String? _firstDate;
  String get firstDate => _firstDate ?? '';
  set firstDate(String? val) => _firstDate = val;

  bool hasFirstDate() => _firstDate != null;

  // "last_date" field.
  String? _lastDate;
  String get lastDate => _lastDate ?? '';
  set lastDate(String? val) => _lastDate = val;

  bool hasLastDate() => _lastDate != null;

  // "date_diff" field.
  String? _dateDiff;
  String get dateDiff => _dateDiff ?? '';
  set dateDiff(String? val) => _dateDiff = val;

  bool hasDateDiff() => _dateDiff != null;

  // "rate" field.
  String? _rate;
  String get rate => _rate ?? '';
  set rate(String? val) => _rate = val;

  bool hasRate() => _rate != null;

  // "installment" field.
  String? _installment;
  String get installment => _installment ?? '';
  set installment(String? val) => _installment = val;

  bool hasInstallment() => _installment != null;

  // "total_interest" field.
  String? _totalInterest;
  String get totalInterest => _totalInterest ?? '';
  set totalInterest(String? val) => _totalInterest = val;

  bool hasTotalInterest() => _totalInterest != null;

  // "total_ar" field.
  String? _totalAr;
  String get totalAr => _totalAr ?? '';
  set totalAr(String? val) => _totalAr = val;

  bool hasTotalAr() => _totalAr != null;

  // "first_installment" field.
  String? _firstInstallment;
  String get firstInstallment => _firstInstallment ?? '';
  set firstInstallment(String? val) => _firstInstallment = val;

  bool hasFirstInstallment() => _firstInstallment != null;

  // "last_installment" field.
  String? _lastInstallment;
  String get lastInstallment => _lastInstallment ?? '';
  set lastInstallment(String? val) => _lastInstallment = val;

  bool hasLastInstallment() => _lastInstallment != null;

  static AgentCarRateDataModelStruct fromMap(Map<String, dynamic> data) =>
      AgentCarRateDataModelStruct(
        sdate: data['sdate'] as String?,
        firstDate: data['first_date'] as String?,
        lastDate: data['last_date'] as String?,
        dateDiff: data['date_diff'] as String?,
        rate: data['rate'] as String?,
        installment: data['installment'] as String?,
        totalInterest: data['total_interest'] as String?,
        totalAr: data['total_ar'] as String?,
        firstInstallment: data['first_installment'] as String?,
        lastInstallment: data['last_installment'] as String?,
      );

  static AgentCarRateDataModelStruct? maybeFromMap(dynamic data) => data is Map
      ? AgentCarRateDataModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'sdate': _sdate,
        'first_date': _firstDate,
        'last_date': _lastDate,
        'date_diff': _dateDiff,
        'rate': _rate,
        'installment': _installment,
        'total_interest': _totalInterest,
        'total_ar': _totalAr,
        'first_installment': _firstInstallment,
        'last_installment': _lastInstallment,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'sdate': serializeParam(
          _sdate,
          ParamType.String,
        ),
        'first_date': serializeParam(
          _firstDate,
          ParamType.String,
        ),
        'last_date': serializeParam(
          _lastDate,
          ParamType.String,
        ),
        'date_diff': serializeParam(
          _dateDiff,
          ParamType.String,
        ),
        'rate': serializeParam(
          _rate,
          ParamType.String,
        ),
        'installment': serializeParam(
          _installment,
          ParamType.String,
        ),
        'total_interest': serializeParam(
          _totalInterest,
          ParamType.String,
        ),
        'total_ar': serializeParam(
          _totalAr,
          ParamType.String,
        ),
        'first_installment': serializeParam(
          _firstInstallment,
          ParamType.String,
        ),
        'last_installment': serializeParam(
          _lastInstallment,
          ParamType.String,
        ),
      }.withoutNulls;

  static AgentCarRateDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      AgentCarRateDataModelStruct(
        sdate: deserializeParam(
          data['sdate'],
          ParamType.String,
          false,
        ),
        firstDate: deserializeParam(
          data['first_date'],
          ParamType.String,
          false,
        ),
        lastDate: deserializeParam(
          data['last_date'],
          ParamType.String,
          false,
        ),
        dateDiff: deserializeParam(
          data['date_diff'],
          ParamType.String,
          false,
        ),
        rate: deserializeParam(
          data['rate'],
          ParamType.String,
          false,
        ),
        installment: deserializeParam(
          data['installment'],
          ParamType.String,
          false,
        ),
        totalInterest: deserializeParam(
          data['total_interest'],
          ParamType.String,
          false,
        ),
        totalAr: deserializeParam(
          data['total_ar'],
          ParamType.String,
          false,
        ),
        firstInstallment: deserializeParam(
          data['first_installment'],
          ParamType.String,
          false,
        ),
        lastInstallment: deserializeParam(
          data['last_installment'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AgentCarRateDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AgentCarRateDataModelStruct &&
        sdate == other.sdate &&
        firstDate == other.firstDate &&
        lastDate == other.lastDate &&
        dateDiff == other.dateDiff &&
        rate == other.rate &&
        installment == other.installment &&
        totalInterest == other.totalInterest &&
        totalAr == other.totalAr &&
        firstInstallment == other.firstInstallment &&
        lastInstallment == other.lastInstallment;
  }

  @override
  int get hashCode => const ListEquality().hash([
        sdate,
        firstDate,
        lastDate,
        dateDiff,
        rate,
        installment,
        totalInterest,
        totalAr,
        firstInstallment,
        lastInstallment
      ]);
}

AgentCarRateDataModelStruct createAgentCarRateDataModelStruct({
  String? sdate,
  String? firstDate,
  String? lastDate,
  String? dateDiff,
  String? rate,
  String? installment,
  String? totalInterest,
  String? totalAr,
  String? firstInstallment,
  String? lastInstallment,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AgentCarRateDataModelStruct(
      sdate: sdate,
      firstDate: firstDate,
      lastDate: lastDate,
      dateDiff: dateDiff,
      rate: rate,
      installment: installment,
      totalInterest: totalInterest,
      totalAr: totalAr,
      firstInstallment: firstInstallment,
      lastInstallment: lastInstallment,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AgentCarRateDataModelStruct? updateAgentCarRateDataModelStruct(
  AgentCarRateDataModelStruct? agentCarRateDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    agentCarRateDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAgentCarRateDataModelStructData(
  Map<String, dynamic> firestoreData,
  AgentCarRateDataModelStruct? agentCarRateDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (agentCarRateDataModel == null) {
    return;
  }
  if (agentCarRateDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      agentCarRateDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final agentCarRateDataModelData = getAgentCarRateDataModelFirestoreData(
      agentCarRateDataModel, forFieldValue);
  final nestedData =
      agentCarRateDataModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      agentCarRateDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAgentCarRateDataModelFirestoreData(
  AgentCarRateDataModelStruct? agentCarRateDataModel, [
  bool forFieldValue = false,
]) {
  if (agentCarRateDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(agentCarRateDataModel.toMap());

  // Add any Firestore field values
  mapToFirestore(agentCarRateDataModel.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAgentCarRateDataModelListFirestoreData(
  List<AgentCarRateDataModelStruct>? agentCarRateDataModels,
) =>
    agentCarRateDataModels
        ?.map((e) => getAgentCarRateDataModelFirestoreData(e, true))
        .toList() ??
    [];
