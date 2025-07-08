// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TenorListDataModelStruct extends FFFirebaseStruct {
  TenorListDataModelStruct({
    String? tenor,
    String? installmentFirstDue,
    String? installmentLastDue,
    String? paymentFirst,
    List<String>? tenorFirstDue,
    List<String>? tenorFirstDueDefault,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _tenor = tenor,
        _installmentFirstDue = installmentFirstDue,
        _installmentLastDue = installmentLastDue,
        _paymentFirst = paymentFirst,
        _tenorFirstDue = tenorFirstDue,
        _tenorFirstDueDefault = tenorFirstDueDefault,
        super(firestoreUtilData);

  // "tenor" field.
  String? _tenor;
  String get tenor => _tenor ?? '';
  set tenor(String? val) => _tenor = val;

  bool hasTenor() => _tenor != null;

  // "installment_first_due" field.
  String? _installmentFirstDue;
  String get installmentFirstDue => _installmentFirstDue ?? '';
  set installmentFirstDue(String? val) => _installmentFirstDue = val;

  bool hasInstallmentFirstDue() => _installmentFirstDue != null;

  // "installment_last_due" field.
  String? _installmentLastDue;
  String get installmentLastDue => _installmentLastDue ?? '';
  set installmentLastDue(String? val) => _installmentLastDue = val;

  bool hasInstallmentLastDue() => _installmentLastDue != null;

  // "payment_first" field.
  String? _paymentFirst;
  String get paymentFirst => _paymentFirst ?? '';
  set paymentFirst(String? val) => _paymentFirst = val;

  bool hasPaymentFirst() => _paymentFirst != null;

  // "tenor_first_due" field.
  List<String>? _tenorFirstDue;
  List<String> get tenorFirstDue => _tenorFirstDue ?? const [];
  set tenorFirstDue(List<String>? val) => _tenorFirstDue = val;

  void updateTenorFirstDue(Function(List<String>) updateFn) {
    updateFn(_tenorFirstDue ??= []);
  }

  bool hasTenorFirstDue() => _tenorFirstDue != null;

  // "tenor_first_due_default" field.
  List<String>? _tenorFirstDueDefault;
  List<String> get tenorFirstDueDefault => _tenorFirstDueDefault ?? const [];
  set tenorFirstDueDefault(List<String>? val) => _tenorFirstDueDefault = val;

  void updateTenorFirstDueDefault(Function(List<String>) updateFn) {
    updateFn(_tenorFirstDueDefault ??= []);
  }

  bool hasTenorFirstDueDefault() => _tenorFirstDueDefault != null;

  static TenorListDataModelStruct fromMap(Map<String, dynamic> data) =>
      TenorListDataModelStruct(
        tenor: data['tenor'] as String?,
        installmentFirstDue: data['installment_first_due'] as String?,
        installmentLastDue: data['installment_last_due'] as String?,
        paymentFirst: data['payment_first'] as String?,
        tenorFirstDue: getDataList(data['tenor_first_due']),
        tenorFirstDueDefault: getDataList(data['tenor_first_due_default']),
      );

  static TenorListDataModelStruct? maybeFromMap(dynamic data) => data is Map
      ? TenorListDataModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'tenor': _tenor,
        'installment_first_due': _installmentFirstDue,
        'installment_last_due': _installmentLastDue,
        'payment_first': _paymentFirst,
        'tenor_first_due': _tenorFirstDue,
        'tenor_first_due_default': _tenorFirstDueDefault,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'tenor': serializeParam(
          _tenor,
          ParamType.String,
        ),
        'installment_first_due': serializeParam(
          _installmentFirstDue,
          ParamType.String,
        ),
        'installment_last_due': serializeParam(
          _installmentLastDue,
          ParamType.String,
        ),
        'payment_first': serializeParam(
          _paymentFirst,
          ParamType.String,
        ),
        'tenor_first_due': serializeParam(
          _tenorFirstDue,
          ParamType.String,
          isList: true,
        ),
        'tenor_first_due_default': serializeParam(
          _tenorFirstDueDefault,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static TenorListDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TenorListDataModelStruct(
        tenor: deserializeParam(
          data['tenor'],
          ParamType.String,
          false,
        ),
        installmentFirstDue: deserializeParam(
          data['installment_first_due'],
          ParamType.String,
          false,
        ),
        installmentLastDue: deserializeParam(
          data['installment_last_due'],
          ParamType.String,
          false,
        ),
        paymentFirst: deserializeParam(
          data['payment_first'],
          ParamType.String,
          false,
        ),
        tenorFirstDue: deserializeParam<String>(
          data['tenor_first_due'],
          ParamType.String,
          true,
        ),
        tenorFirstDueDefault: deserializeParam<String>(
          data['tenor_first_due_default'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'TenorListDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TenorListDataModelStruct &&
        tenor == other.tenor &&
        installmentFirstDue == other.installmentFirstDue &&
        installmentLastDue == other.installmentLastDue &&
        paymentFirst == other.paymentFirst &&
        listEquality.equals(tenorFirstDue, other.tenorFirstDue) &&
        listEquality.equals(tenorFirstDueDefault, other.tenorFirstDueDefault);
  }

  @override
  int get hashCode => const ListEquality().hash([
        tenor,
        installmentFirstDue,
        installmentLastDue,
        paymentFirst,
        tenorFirstDue,
        tenorFirstDueDefault
      ]);
}

TenorListDataModelStruct createTenorListDataModelStruct({
  String? tenor,
  String? installmentFirstDue,
  String? installmentLastDue,
  String? paymentFirst,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TenorListDataModelStruct(
      tenor: tenor,
      installmentFirstDue: installmentFirstDue,
      installmentLastDue: installmentLastDue,
      paymentFirst: paymentFirst,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TenorListDataModelStruct? updateTenorListDataModelStruct(
  TenorListDataModelStruct? tenorListDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    tenorListDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTenorListDataModelStructData(
  Map<String, dynamic> firestoreData,
  TenorListDataModelStruct? tenorListDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (tenorListDataModel == null) {
    return;
  }
  if (tenorListDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && tenorListDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final tenorListDataModelData =
      getTenorListDataModelFirestoreData(tenorListDataModel, forFieldValue);
  final nestedData =
      tenorListDataModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      tenorListDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTenorListDataModelFirestoreData(
  TenorListDataModelStruct? tenorListDataModel, [
  bool forFieldValue = false,
]) {
  if (tenorListDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(tenorListDataModel.toMap());

  // Add any Firestore field values
  tenorListDataModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTenorListDataModelListFirestoreData(
  List<TenorListDataModelStruct>? tenorListDataModels,
) =>
    tenorListDataModels
        ?.map((e) => getTenorListDataModelFirestoreData(e, true))
        .toList() ??
    [];
