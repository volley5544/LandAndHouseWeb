// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MCInterestRateDataModelStruct extends FFFirebaseStruct {
  MCInterestRateDataModelStruct({
    String? loanAmountDefault,
    String? interestRateDefault,
    String? ltvLoanAmountMin,
    String? ltvLoanAmountMax,
    List<InterestConditionStruct>? interestCondition,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _loanAmountDefault = loanAmountDefault,
        _interestRateDefault = interestRateDefault,
        _ltvLoanAmountMin = ltvLoanAmountMin,
        _ltvLoanAmountMax = ltvLoanAmountMax,
        _interestCondition = interestCondition,
        super(firestoreUtilData);

  // "loan_amount_default" field.
  String? _loanAmountDefault;
  String get loanAmountDefault => _loanAmountDefault ?? '';
  set loanAmountDefault(String? val) => _loanAmountDefault = val;

  bool hasLoanAmountDefault() => _loanAmountDefault != null;

  // "interest_rate_default" field.
  String? _interestRateDefault;
  String get interestRateDefault => _interestRateDefault ?? '';
  set interestRateDefault(String? val) => _interestRateDefault = val;

  bool hasInterestRateDefault() => _interestRateDefault != null;

  // "ltv_loan_amount_min" field.
  String? _ltvLoanAmountMin;
  String get ltvLoanAmountMin => _ltvLoanAmountMin ?? '';
  set ltvLoanAmountMin(String? val) => _ltvLoanAmountMin = val;

  bool hasLtvLoanAmountMin() => _ltvLoanAmountMin != null;

  // "ltv_loan_amount_max" field.
  String? _ltvLoanAmountMax;
  String get ltvLoanAmountMax => _ltvLoanAmountMax ?? '';
  set ltvLoanAmountMax(String? val) => _ltvLoanAmountMax = val;

  bool hasLtvLoanAmountMax() => _ltvLoanAmountMax != null;

  // "interest_condition" field.
  List<InterestConditionStruct>? _interestCondition;
  List<InterestConditionStruct> get interestCondition =>
      _interestCondition ?? const [];
  set interestCondition(List<InterestConditionStruct>? val) =>
      _interestCondition = val;

  void updateInterestCondition(
      Function(List<InterestConditionStruct>) updateFn) {
    updateFn(_interestCondition ??= []);
  }

  bool hasInterestCondition() => _interestCondition != null;

  static MCInterestRateDataModelStruct fromMap(Map<String, dynamic> data) =>
      MCInterestRateDataModelStruct(
        loanAmountDefault: data['loan_amount_default'] as String?,
        interestRateDefault: data['interest_rate_default'] as String?,
        ltvLoanAmountMin: data['ltv_loan_amount_min'] as String?,
        ltvLoanAmountMax: data['ltv_loan_amount_max'] as String?,
        interestCondition: getStructList(
          data['interest_condition'],
          InterestConditionStruct.fromMap,
        ),
      );

  static MCInterestRateDataModelStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? MCInterestRateDataModelStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'loan_amount_default': _loanAmountDefault,
        'interest_rate_default': _interestRateDefault,
        'ltv_loan_amount_min': _ltvLoanAmountMin,
        'ltv_loan_amount_max': _ltvLoanAmountMax,
        'interest_condition':
            _interestCondition?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'loan_amount_default': serializeParam(
          _loanAmountDefault,
          ParamType.String,
        ),
        'interest_rate_default': serializeParam(
          _interestRateDefault,
          ParamType.String,
        ),
        'ltv_loan_amount_min': serializeParam(
          _ltvLoanAmountMin,
          ParamType.String,
        ),
        'ltv_loan_amount_max': serializeParam(
          _ltvLoanAmountMax,
          ParamType.String,
        ),
        'interest_condition': serializeParam(
          _interestCondition,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static MCInterestRateDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      MCInterestRateDataModelStruct(
        loanAmountDefault: deserializeParam(
          data['loan_amount_default'],
          ParamType.String,
          false,
        ),
        interestRateDefault: deserializeParam(
          data['interest_rate_default'],
          ParamType.String,
          false,
        ),
        ltvLoanAmountMin: deserializeParam(
          data['ltv_loan_amount_min'],
          ParamType.String,
          false,
        ),
        ltvLoanAmountMax: deserializeParam(
          data['ltv_loan_amount_max'],
          ParamType.String,
          false,
        ),
        interestCondition: deserializeStructParam<InterestConditionStruct>(
          data['interest_condition'],
          ParamType.DataStruct,
          true,
          structBuilder: InterestConditionStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'MCInterestRateDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MCInterestRateDataModelStruct &&
        loanAmountDefault == other.loanAmountDefault &&
        interestRateDefault == other.interestRateDefault &&
        ltvLoanAmountMin == other.ltvLoanAmountMin &&
        ltvLoanAmountMax == other.ltvLoanAmountMax &&
        listEquality.equals(interestCondition, other.interestCondition);
  }

  @override
  int get hashCode => const ListEquality().hash([
        loanAmountDefault,
        interestRateDefault,
        ltvLoanAmountMin,
        ltvLoanAmountMax,
        interestCondition
      ]);
}

MCInterestRateDataModelStruct createMCInterestRateDataModelStruct({
  String? loanAmountDefault,
  String? interestRateDefault,
  String? ltvLoanAmountMin,
  String? ltvLoanAmountMax,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MCInterestRateDataModelStruct(
      loanAmountDefault: loanAmountDefault,
      interestRateDefault: interestRateDefault,
      ltvLoanAmountMin: ltvLoanAmountMin,
      ltvLoanAmountMax: ltvLoanAmountMax,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MCInterestRateDataModelStruct? updateMCInterestRateDataModelStruct(
  MCInterestRateDataModelStruct? mCInterestRateDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    mCInterestRateDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMCInterestRateDataModelStructData(
  Map<String, dynamic> firestoreData,
  MCInterestRateDataModelStruct? mCInterestRateDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (mCInterestRateDataModel == null) {
    return;
  }
  if (mCInterestRateDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      mCInterestRateDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final mCInterestRateDataModelData = getMCInterestRateDataModelFirestoreData(
      mCInterestRateDataModel, forFieldValue);
  final nestedData =
      mCInterestRateDataModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      mCInterestRateDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMCInterestRateDataModelFirestoreData(
  MCInterestRateDataModelStruct? mCInterestRateDataModel, [
  bool forFieldValue = false,
]) {
  if (mCInterestRateDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(mCInterestRateDataModel.toMap());

  // Add any Firestore field values
  mapToFirestore(mCInterestRateDataModel.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMCInterestRateDataModelListFirestoreData(
  List<MCInterestRateDataModelStruct>? mCInterestRateDataModels,
) =>
    mCInterestRateDataModels
        ?.map((e) => getMCInterestRateDataModelFirestoreData(e, true))
        .toList() ??
    [];
