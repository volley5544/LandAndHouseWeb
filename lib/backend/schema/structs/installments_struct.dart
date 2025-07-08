// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class InstallmentsStruct extends FFFirebaseStruct {
  InstallmentsStruct({
    int? tenor,
    int? firstPeriodAmt,
    int? regularPeriodAmt,
    double? lastPeriodAmt,
    double? totalAmt,
    double? intAmt,
    double? lastPeriodPromo,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _tenor = tenor,
        _firstPeriodAmt = firstPeriodAmt,
        _regularPeriodAmt = regularPeriodAmt,
        _lastPeriodAmt = lastPeriodAmt,
        _totalAmt = totalAmt,
        _intAmt = intAmt,
        _lastPeriodPromo = lastPeriodPromo,
        super(firestoreUtilData);

  // "tenor" field.
  int? _tenor;
  int get tenor => _tenor ?? 0;
  set tenor(int? val) => _tenor = val;

  void incrementTenor(int amount) => tenor = tenor + amount;

  bool hasTenor() => _tenor != null;

  // "firstPeriodAmt" field.
  int? _firstPeriodAmt;
  int get firstPeriodAmt => _firstPeriodAmt ?? 0;
  set firstPeriodAmt(int? val) => _firstPeriodAmt = val;

  void incrementFirstPeriodAmt(int amount) =>
      firstPeriodAmt = firstPeriodAmt + amount;

  bool hasFirstPeriodAmt() => _firstPeriodAmt != null;

  // "regularPeriodAmt" field.
  int? _regularPeriodAmt;
  int get regularPeriodAmt => _regularPeriodAmt ?? 0;
  set regularPeriodAmt(int? val) => _regularPeriodAmt = val;

  void incrementRegularPeriodAmt(int amount) =>
      regularPeriodAmt = regularPeriodAmt + amount;

  bool hasRegularPeriodAmt() => _regularPeriodAmt != null;

  // "lastPeriodAmt" field.
  double? _lastPeriodAmt;
  double get lastPeriodAmt => _lastPeriodAmt ?? 0.0;
  set lastPeriodAmt(double? val) => _lastPeriodAmt = val;

  void incrementLastPeriodAmt(double amount) =>
      lastPeriodAmt = lastPeriodAmt + amount;

  bool hasLastPeriodAmt() => _lastPeriodAmt != null;

  // "totalAmt" field.
  double? _totalAmt;
  double get totalAmt => _totalAmt ?? 0.0;
  set totalAmt(double? val) => _totalAmt = val;

  void incrementTotalAmt(double amount) => totalAmt = totalAmt + amount;

  bool hasTotalAmt() => _totalAmt != null;

  // "intAmt" field.
  double? _intAmt;
  double get intAmt => _intAmt ?? 0.0;
  set intAmt(double? val) => _intAmt = val;

  void incrementIntAmt(double amount) => intAmt = intAmt + amount;

  bool hasIntAmt() => _intAmt != null;

  // "lastPeriodPromo" field.
  double? _lastPeriodPromo;
  double get lastPeriodPromo => _lastPeriodPromo ?? 0.0;
  set lastPeriodPromo(double? val) => _lastPeriodPromo = val;

  void incrementLastPeriodPromo(double amount) =>
      lastPeriodPromo = lastPeriodPromo + amount;

  bool hasLastPeriodPromo() => _lastPeriodPromo != null;

  static InstallmentsStruct fromMap(Map<String, dynamic> data) =>
      InstallmentsStruct(
        tenor: castToType<int>(data['tenor']),
        firstPeriodAmt: castToType<int>(data['firstPeriodAmt']),
        regularPeriodAmt: castToType<int>(data['regularPeriodAmt']),
        lastPeriodAmt: castToType<double>(data['lastPeriodAmt']),
        totalAmt: castToType<double>(data['totalAmt']),
        intAmt: castToType<double>(data['intAmt']),
        lastPeriodPromo: castToType<double>(data['lastPeriodPromo']),
      );

  static InstallmentsStruct? maybeFromMap(dynamic data) => data is Map
      ? InstallmentsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'tenor': _tenor,
        'firstPeriodAmt': _firstPeriodAmt,
        'regularPeriodAmt': _regularPeriodAmt,
        'lastPeriodAmt': _lastPeriodAmt,
        'totalAmt': _totalAmt,
        'intAmt': _intAmt,
        'lastPeriodPromo': _lastPeriodPromo,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'tenor': serializeParam(
          _tenor,
          ParamType.int,
        ),
        'firstPeriodAmt': serializeParam(
          _firstPeriodAmt,
          ParamType.int,
        ),
        'regularPeriodAmt': serializeParam(
          _regularPeriodAmt,
          ParamType.int,
        ),
        'lastPeriodAmt': serializeParam(
          _lastPeriodAmt,
          ParamType.double,
        ),
        'totalAmt': serializeParam(
          _totalAmt,
          ParamType.double,
        ),
        'intAmt': serializeParam(
          _intAmt,
          ParamType.double,
        ),
        'lastPeriodPromo': serializeParam(
          _lastPeriodPromo,
          ParamType.double,
        ),
      }.withoutNulls;

  static InstallmentsStruct fromSerializableMap(Map<String, dynamic> data) =>
      InstallmentsStruct(
        tenor: deserializeParam(
          data['tenor'],
          ParamType.int,
          false,
        ),
        firstPeriodAmt: deserializeParam(
          data['firstPeriodAmt'],
          ParamType.int,
          false,
        ),
        regularPeriodAmt: deserializeParam(
          data['regularPeriodAmt'],
          ParamType.int,
          false,
        ),
        lastPeriodAmt: deserializeParam(
          data['lastPeriodAmt'],
          ParamType.double,
          false,
        ),
        totalAmt: deserializeParam(
          data['totalAmt'],
          ParamType.double,
          false,
        ),
        intAmt: deserializeParam(
          data['intAmt'],
          ParamType.double,
          false,
        ),
        lastPeriodPromo: deserializeParam(
          data['lastPeriodPromo'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'InstallmentsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is InstallmentsStruct &&
        tenor == other.tenor &&
        firstPeriodAmt == other.firstPeriodAmt &&
        regularPeriodAmt == other.regularPeriodAmt &&
        lastPeriodAmt == other.lastPeriodAmt &&
        totalAmt == other.totalAmt &&
        intAmt == other.intAmt &&
        lastPeriodPromo == other.lastPeriodPromo;
  }

  @override
  int get hashCode => const ListEquality().hash([
        tenor,
        firstPeriodAmt,
        regularPeriodAmt,
        lastPeriodAmt,
        totalAmt,
        intAmt,
        lastPeriodPromo
      ]);
}

InstallmentsStruct createInstallmentsStruct({
  int? tenor,
  int? firstPeriodAmt,
  int? regularPeriodAmt,
  double? lastPeriodAmt,
  double? totalAmt,
  double? intAmt,
  double? lastPeriodPromo,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    InstallmentsStruct(
      tenor: tenor,
      firstPeriodAmt: firstPeriodAmt,
      regularPeriodAmt: regularPeriodAmt,
      lastPeriodAmt: lastPeriodAmt,
      totalAmt: totalAmt,
      intAmt: intAmt,
      lastPeriodPromo: lastPeriodPromo,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

InstallmentsStruct? updateInstallmentsStruct(
  InstallmentsStruct? installments, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    installments
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addInstallmentsStructData(
  Map<String, dynamic> firestoreData,
  InstallmentsStruct? installments,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (installments == null) {
    return;
  }
  if (installments.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && installments.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final installmentsData =
      getInstallmentsFirestoreData(installments, forFieldValue);
  final nestedData =
      installmentsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = installments.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getInstallmentsFirestoreData(
  InstallmentsStruct? installments, [
  bool forFieldValue = false,
]) {
  if (installments == null) {
    return {};
  }
  final firestoreData = mapToFirestore(installments.toMap());

  // Add any Firestore field values
  installments.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getInstallmentsListFirestoreData(
  List<InstallmentsStruct>? installmentss,
) =>
    installmentss?.map((e) => getInstallmentsFirestoreData(e, true)).toList() ??
    [];
