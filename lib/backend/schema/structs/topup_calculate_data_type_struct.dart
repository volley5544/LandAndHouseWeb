// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TopupCalculateDataTypeStruct extends FFFirebaseStruct {
  TopupCalculateDataTypeStruct({
    String? code,
    String? message,
    String? transNo,
    String? contractNo,
    String? firstDueDate,
    int? dueDay,
    int? amount,
    double? interestRate,
    int? topupFeeAmount,
    int? feeAmount,
    List<InstallmentsStruct>? installments,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _code = code,
        _message = message,
        _transNo = transNo,
        _contractNo = contractNo,
        _firstDueDate = firstDueDate,
        _dueDay = dueDay,
        _amount = amount,
        _interestRate = interestRate,
        _topupFeeAmount = topupFeeAmount,
        _feeAmount = feeAmount,
        _installments = installments,
        super(firestoreUtilData);

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  set code(String? val) => _code = val;

  bool hasCode() => _code != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  set message(String? val) => _message = val;

  bool hasMessage() => _message != null;

  // "trans_no" field.
  String? _transNo;
  String get transNo => _transNo ?? '';
  set transNo(String? val) => _transNo = val;

  bool hasTransNo() => _transNo != null;

  // "contract_no" field.
  String? _contractNo;
  String get contractNo => _contractNo ?? '';
  set contractNo(String? val) => _contractNo = val;

  bool hasContractNo() => _contractNo != null;

  // "first_due_date" field.
  String? _firstDueDate;
  String get firstDueDate => _firstDueDate ?? '';
  set firstDueDate(String? val) => _firstDueDate = val;

  bool hasFirstDueDate() => _firstDueDate != null;

  // "due_day" field.
  int? _dueDay;
  int get dueDay => _dueDay ?? 0;
  set dueDay(int? val) => _dueDay = val;

  void incrementDueDay(int amount) => dueDay = dueDay + amount;

  bool hasDueDay() => _dueDay != null;

  // "amount" field.
  int? _amount;
  int get amount => _amount ?? 0;
  set amount(int? val) => _amount = val;

  void incrementAmount(int amount) => amount = amount + amount;

  bool hasAmount() => _amount != null;

  // "interest_rate" field.
  double? _interestRate;
  double get interestRate => _interestRate ?? 0.0;
  set interestRate(double? val) => _interestRate = val;

  void incrementInterestRate(double amount) =>
      interestRate = interestRate + amount;

  bool hasInterestRate() => _interestRate != null;

  // "topup_fee_amount" field.
  int? _topupFeeAmount;
  int get topupFeeAmount => _topupFeeAmount ?? 0;
  set topupFeeAmount(int? val) => _topupFeeAmount = val;

  void incrementTopupFeeAmount(int amount) =>
      topupFeeAmount = topupFeeAmount + amount;

  bool hasTopupFeeAmount() => _topupFeeAmount != null;

  // "fee_amount" field.
  int? _feeAmount;
  int get feeAmount => _feeAmount ?? 0;
  set feeAmount(int? val) => _feeAmount = val;

  void incrementFeeAmount(int amount) => feeAmount = feeAmount + amount;

  bool hasFeeAmount() => _feeAmount != null;

  // "installments" field.
  List<InstallmentsStruct>? _installments;
  List<InstallmentsStruct> get installments => _installments ?? const [];
  set installments(List<InstallmentsStruct>? val) => _installments = val;

  void updateInstallments(Function(List<InstallmentsStruct>) updateFn) {
    updateFn(_installments ??= []);
  }

  bool hasInstallments() => _installments != null;

  static TopupCalculateDataTypeStruct fromMap(Map<String, dynamic> data) =>
      TopupCalculateDataTypeStruct(
        code: data['code'] as String?,
        message: data['message'] as String?,
        transNo: data['trans_no'] as String?,
        contractNo: data['contract_no'] as String?,
        firstDueDate: data['first_due_date'] as String?,
        dueDay: castToType<int>(data['due_day']),
        amount: castToType<int>(data['amount']),
        interestRate: castToType<double>(data['interest_rate']),
        topupFeeAmount: castToType<int>(data['topup_fee_amount']),
        feeAmount: castToType<int>(data['fee_amount']),
        installments: getStructList(
          data['installments'],
          InstallmentsStruct.fromMap,
        ),
      );

  static TopupCalculateDataTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? TopupCalculateDataTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'code': _code,
        'message': _message,
        'trans_no': _transNo,
        'contract_no': _contractNo,
        'first_due_date': _firstDueDate,
        'due_day': _dueDay,
        'amount': _amount,
        'interest_rate': _interestRate,
        'topup_fee_amount': _topupFeeAmount,
        'fee_amount': _feeAmount,
        'installments': _installments?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'code': serializeParam(
          _code,
          ParamType.String,
        ),
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
        'trans_no': serializeParam(
          _transNo,
          ParamType.String,
        ),
        'contract_no': serializeParam(
          _contractNo,
          ParamType.String,
        ),
        'first_due_date': serializeParam(
          _firstDueDate,
          ParamType.String,
        ),
        'due_day': serializeParam(
          _dueDay,
          ParamType.int,
        ),
        'amount': serializeParam(
          _amount,
          ParamType.int,
        ),
        'interest_rate': serializeParam(
          _interestRate,
          ParamType.double,
        ),
        'topup_fee_amount': serializeParam(
          _topupFeeAmount,
          ParamType.int,
        ),
        'fee_amount': serializeParam(
          _feeAmount,
          ParamType.int,
        ),
        'installments': serializeParam(
          _installments,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static TopupCalculateDataTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TopupCalculateDataTypeStruct(
        code: deserializeParam(
          data['code'],
          ParamType.String,
          false,
        ),
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
        transNo: deserializeParam(
          data['trans_no'],
          ParamType.String,
          false,
        ),
        contractNo: deserializeParam(
          data['contract_no'],
          ParamType.String,
          false,
        ),
        firstDueDate: deserializeParam(
          data['first_due_date'],
          ParamType.String,
          false,
        ),
        dueDay: deserializeParam(
          data['due_day'],
          ParamType.int,
          false,
        ),
        amount: deserializeParam(
          data['amount'],
          ParamType.int,
          false,
        ),
        interestRate: deserializeParam(
          data['interest_rate'],
          ParamType.double,
          false,
        ),
        topupFeeAmount: deserializeParam(
          data['topup_fee_amount'],
          ParamType.int,
          false,
        ),
        feeAmount: deserializeParam(
          data['fee_amount'],
          ParamType.int,
          false,
        ),
        installments: deserializeStructParam<InstallmentsStruct>(
          data['installments'],
          ParamType.DataStruct,
          true,
          structBuilder: InstallmentsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'TopupCalculateDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TopupCalculateDataTypeStruct &&
        code == other.code &&
        message == other.message &&
        transNo == other.transNo &&
        contractNo == other.contractNo &&
        firstDueDate == other.firstDueDate &&
        dueDay == other.dueDay &&
        amount == other.amount &&
        interestRate == other.interestRate &&
        topupFeeAmount == other.topupFeeAmount &&
        feeAmount == other.feeAmount &&
        listEquality.equals(installments, other.installments);
  }

  @override
  int get hashCode => const ListEquality().hash([
        code,
        message,
        transNo,
        contractNo,
        firstDueDate,
        dueDay,
        amount,
        interestRate,
        topupFeeAmount,
        feeAmount,
        installments
      ]);
}

TopupCalculateDataTypeStruct createTopupCalculateDataTypeStruct({
  String? code,
  String? message,
  String? transNo,
  String? contractNo,
  String? firstDueDate,
  int? dueDay,
  int? amount,
  double? interestRate,
  int? topupFeeAmount,
  int? feeAmount,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TopupCalculateDataTypeStruct(
      code: code,
      message: message,
      transNo: transNo,
      contractNo: contractNo,
      firstDueDate: firstDueDate,
      dueDay: dueDay,
      amount: amount,
      interestRate: interestRate,
      topupFeeAmount: topupFeeAmount,
      feeAmount: feeAmount,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TopupCalculateDataTypeStruct? updateTopupCalculateDataTypeStruct(
  TopupCalculateDataTypeStruct? topupCalculateDataType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    topupCalculateDataType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTopupCalculateDataTypeStructData(
  Map<String, dynamic> firestoreData,
  TopupCalculateDataTypeStruct? topupCalculateDataType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (topupCalculateDataType == null) {
    return;
  }
  if (topupCalculateDataType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      topupCalculateDataType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final topupCalculateDataTypeData = getTopupCalculateDataTypeFirestoreData(
      topupCalculateDataType, forFieldValue);
  final nestedData =
      topupCalculateDataTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      topupCalculateDataType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTopupCalculateDataTypeFirestoreData(
  TopupCalculateDataTypeStruct? topupCalculateDataType, [
  bool forFieldValue = false,
]) {
  if (topupCalculateDataType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(topupCalculateDataType.toMap());

  // Add any Firestore field values
  topupCalculateDataType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTopupCalculateDataTypeListFirestoreData(
  List<TopupCalculateDataTypeStruct>? topupCalculateDataTypes,
) =>
    topupCalculateDataTypes
        ?.map((e) => getTopupCalculateDataTypeFirestoreData(e, true))
        .toList() ??
    [];
