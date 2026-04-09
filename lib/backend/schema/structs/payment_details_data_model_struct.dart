// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PaymentDetailsDataModelStruct extends FFFirebaseStruct {
  PaymentDetailsDataModelStruct({
    int? installmentAmount,
    int? overdueAmount,
    int? currentDueAmount,
    int? currentInstallmentNumber,
    int? totalInstallmentNumber,
    String? currentDueDate,
    int? totalPaidAmount,
    int? osBalance,
    int? overdueDays,
    int? overdueTerms,
    String? overdueFrom,
    String? overdueTo,
    String? latestPaidDate,
    String? currentDateTime,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _installmentAmount = installmentAmount,
        _overdueAmount = overdueAmount,
        _currentDueAmount = currentDueAmount,
        _currentInstallmentNumber = currentInstallmentNumber,
        _totalInstallmentNumber = totalInstallmentNumber,
        _currentDueDate = currentDueDate,
        _totalPaidAmount = totalPaidAmount,
        _osBalance = osBalance,
        _overdueDays = overdueDays,
        _overdueTerms = overdueTerms,
        _overdueFrom = overdueFrom,
        _overdueTo = overdueTo,
        _latestPaidDate = latestPaidDate,
        _currentDateTime = currentDateTime,
        super(firestoreUtilData);

  // "installment_amount" field.
  int? _installmentAmount;
  int get installmentAmount => _installmentAmount ?? 0;
  set installmentAmount(int? val) => _installmentAmount = val;

  void incrementInstallmentAmount(int amount) =>
      installmentAmount = installmentAmount + amount;

  bool hasInstallmentAmount() => _installmentAmount != null;

  // "overdue_amount" field.
  int? _overdueAmount;
  int get overdueAmount => _overdueAmount ?? 0;
  set overdueAmount(int? val) => _overdueAmount = val;

  void incrementOverdueAmount(int amount) =>
      overdueAmount = overdueAmount + amount;

  bool hasOverdueAmount() => _overdueAmount != null;

  // "current_due_amount" field.
  int? _currentDueAmount;
  int get currentDueAmount => _currentDueAmount ?? 0;
  set currentDueAmount(int? val) => _currentDueAmount = val;

  void incrementCurrentDueAmount(int amount) =>
      currentDueAmount = currentDueAmount + amount;

  bool hasCurrentDueAmount() => _currentDueAmount != null;

  // "current_installment_number" field.
  int? _currentInstallmentNumber;
  int get currentInstallmentNumber => _currentInstallmentNumber ?? 0;
  set currentInstallmentNumber(int? val) => _currentInstallmentNumber = val;

  void incrementCurrentInstallmentNumber(int amount) =>
      currentInstallmentNumber = currentInstallmentNumber + amount;

  bool hasCurrentInstallmentNumber() => _currentInstallmentNumber != null;

  // "total_installment_number" field.
  int? _totalInstallmentNumber;
  int get totalInstallmentNumber => _totalInstallmentNumber ?? 0;
  set totalInstallmentNumber(int? val) => _totalInstallmentNumber = val;

  void incrementTotalInstallmentNumber(int amount) =>
      totalInstallmentNumber = totalInstallmentNumber + amount;

  bool hasTotalInstallmentNumber() => _totalInstallmentNumber != null;

  // "current_due_date" field.
  String? _currentDueDate;
  String get currentDueDate => _currentDueDate ?? '';
  set currentDueDate(String? val) => _currentDueDate = val;

  bool hasCurrentDueDate() => _currentDueDate != null;

  // "total_paid_amount" field.
  int? _totalPaidAmount;
  int get totalPaidAmount => _totalPaidAmount ?? 0;
  set totalPaidAmount(int? val) => _totalPaidAmount = val;

  void incrementTotalPaidAmount(int amount) =>
      totalPaidAmount = totalPaidAmount + amount;

  bool hasTotalPaidAmount() => _totalPaidAmount != null;

  // "os_balance" field.
  int? _osBalance;
  int get osBalance => _osBalance ?? 0;
  set osBalance(int? val) => _osBalance = val;

  void incrementOsBalance(int amount) => osBalance = osBalance + amount;

  bool hasOsBalance() => _osBalance != null;

  // "overdue_days" field.
  int? _overdueDays;
  int get overdueDays => _overdueDays ?? 0;
  set overdueDays(int? val) => _overdueDays = val;

  void incrementOverdueDays(int amount) => overdueDays = overdueDays + amount;

  bool hasOverdueDays() => _overdueDays != null;

  // "overdue_terms" field.
  int? _overdueTerms;
  int get overdueTerms => _overdueTerms ?? 0;
  set overdueTerms(int? val) => _overdueTerms = val;

  void incrementOverdueTerms(int amount) =>
      overdueTerms = overdueTerms + amount;

  bool hasOverdueTerms() => _overdueTerms != null;

  // "overdue_from" field.
  String? _overdueFrom;
  String get overdueFrom => _overdueFrom ?? '';
  set overdueFrom(String? val) => _overdueFrom = val;

  bool hasOverdueFrom() => _overdueFrom != null;

  // "overdue_to" field.
  String? _overdueTo;
  String get overdueTo => _overdueTo ?? '';
  set overdueTo(String? val) => _overdueTo = val;

  bool hasOverdueTo() => _overdueTo != null;

  // "latest_paid_date" field.
  String? _latestPaidDate;
  String get latestPaidDate => _latestPaidDate ?? '';
  set latestPaidDate(String? val) => _latestPaidDate = val;

  bool hasLatestPaidDate() => _latestPaidDate != null;

  // "current_date_time" field.
  String? _currentDateTime;
  String get currentDateTime => _currentDateTime ?? '';
  set currentDateTime(String? val) => _currentDateTime = val;

  bool hasCurrentDateTime() => _currentDateTime != null;

  static PaymentDetailsDataModelStruct fromMap(Map<String, dynamic> data) =>
      PaymentDetailsDataModelStruct(
        installmentAmount: castToType<int>(data['installment_amount']),
        overdueAmount: castToType<int>(data['overdue_amount']),
        currentDueAmount: castToType<int>(data['current_due_amount']),
        currentInstallmentNumber:
            castToType<int>(data['current_installment_number']),
        totalInstallmentNumber:
            castToType<int>(data['total_installment_number']),
        currentDueDate: data['current_due_date'] as String?,
        totalPaidAmount: castToType<int>(data['total_paid_amount']),
        osBalance: castToType<int>(data['os_balance']),
        overdueDays: castToType<int>(data['overdue_days']),
        overdueTerms: castToType<int>(data['overdue_terms']),
        overdueFrom: data['overdue_from'] as String?,
        overdueTo: data['overdue_to'] as String?,
        latestPaidDate: data['latest_paid_date'] as String?,
        currentDateTime: data['current_date_time'] as String?,
      );

  static PaymentDetailsDataModelStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? PaymentDetailsDataModelStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'installment_amount': _installmentAmount,
        'overdue_amount': _overdueAmount,
        'current_due_amount': _currentDueAmount,
        'current_installment_number': _currentInstallmentNumber,
        'total_installment_number': _totalInstallmentNumber,
        'current_due_date': _currentDueDate,
        'total_paid_amount': _totalPaidAmount,
        'os_balance': _osBalance,
        'overdue_days': _overdueDays,
        'overdue_terms': _overdueTerms,
        'overdue_from': _overdueFrom,
        'overdue_to': _overdueTo,
        'latest_paid_date': _latestPaidDate,
        'current_date_time': _currentDateTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'installment_amount': serializeParam(
          _installmentAmount,
          ParamType.int,
        ),
        'overdue_amount': serializeParam(
          _overdueAmount,
          ParamType.int,
        ),
        'current_due_amount': serializeParam(
          _currentDueAmount,
          ParamType.int,
        ),
        'current_installment_number': serializeParam(
          _currentInstallmentNumber,
          ParamType.int,
        ),
        'total_installment_number': serializeParam(
          _totalInstallmentNumber,
          ParamType.int,
        ),
        'current_due_date': serializeParam(
          _currentDueDate,
          ParamType.String,
        ),
        'total_paid_amount': serializeParam(
          _totalPaidAmount,
          ParamType.int,
        ),
        'os_balance': serializeParam(
          _osBalance,
          ParamType.int,
        ),
        'overdue_days': serializeParam(
          _overdueDays,
          ParamType.int,
        ),
        'overdue_terms': serializeParam(
          _overdueTerms,
          ParamType.int,
        ),
        'overdue_from': serializeParam(
          _overdueFrom,
          ParamType.String,
        ),
        'overdue_to': serializeParam(
          _overdueTo,
          ParamType.String,
        ),
        'latest_paid_date': serializeParam(
          _latestPaidDate,
          ParamType.String,
        ),
        'current_date_time': serializeParam(
          _currentDateTime,
          ParamType.String,
        ),
      }.withoutNulls;

  static PaymentDetailsDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PaymentDetailsDataModelStruct(
        installmentAmount: deserializeParam(
          data['installment_amount'],
          ParamType.int,
          false,
        ),
        overdueAmount: deserializeParam(
          data['overdue_amount'],
          ParamType.int,
          false,
        ),
        currentDueAmount: deserializeParam(
          data['current_due_amount'],
          ParamType.int,
          false,
        ),
        currentInstallmentNumber: deserializeParam(
          data['current_installment_number'],
          ParamType.int,
          false,
        ),
        totalInstallmentNumber: deserializeParam(
          data['total_installment_number'],
          ParamType.int,
          false,
        ),
        currentDueDate: deserializeParam(
          data['current_due_date'],
          ParamType.String,
          false,
        ),
        totalPaidAmount: deserializeParam(
          data['total_paid_amount'],
          ParamType.int,
          false,
        ),
        osBalance: deserializeParam(
          data['os_balance'],
          ParamType.int,
          false,
        ),
        overdueDays: deserializeParam(
          data['overdue_days'],
          ParamType.int,
          false,
        ),
        overdueTerms: deserializeParam(
          data['overdue_terms'],
          ParamType.int,
          false,
        ),
        overdueFrom: deserializeParam(
          data['overdue_from'],
          ParamType.String,
          false,
        ),
        overdueTo: deserializeParam(
          data['overdue_to'],
          ParamType.String,
          false,
        ),
        latestPaidDate: deserializeParam(
          data['latest_paid_date'],
          ParamType.String,
          false,
        ),
        currentDateTime: deserializeParam(
          data['current_date_time'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PaymentDetailsDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PaymentDetailsDataModelStruct &&
        installmentAmount == other.installmentAmount &&
        overdueAmount == other.overdueAmount &&
        currentDueAmount == other.currentDueAmount &&
        currentInstallmentNumber == other.currentInstallmentNumber &&
        totalInstallmentNumber == other.totalInstallmentNumber &&
        currentDueDate == other.currentDueDate &&
        totalPaidAmount == other.totalPaidAmount &&
        osBalance == other.osBalance &&
        overdueDays == other.overdueDays &&
        overdueTerms == other.overdueTerms &&
        overdueFrom == other.overdueFrom &&
        overdueTo == other.overdueTo &&
        latestPaidDate == other.latestPaidDate &&
        currentDateTime == other.currentDateTime;
  }

  @override
  int get hashCode => const ListEquality().hash([
        installmentAmount,
        overdueAmount,
        currentDueAmount,
        currentInstallmentNumber,
        totalInstallmentNumber,
        currentDueDate,
        totalPaidAmount,
        osBalance,
        overdueDays,
        overdueTerms,
        overdueFrom,
        overdueTo,
        latestPaidDate,
        currentDateTime
      ]);
}

PaymentDetailsDataModelStruct createPaymentDetailsDataModelStruct({
  int? installmentAmount,
  int? overdueAmount,
  int? currentDueAmount,
  int? currentInstallmentNumber,
  int? totalInstallmentNumber,
  String? currentDueDate,
  int? totalPaidAmount,
  int? osBalance,
  int? overdueDays,
  int? overdueTerms,
  String? overdueFrom,
  String? overdueTo,
  String? latestPaidDate,
  String? currentDateTime,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PaymentDetailsDataModelStruct(
      installmentAmount: installmentAmount,
      overdueAmount: overdueAmount,
      currentDueAmount: currentDueAmount,
      currentInstallmentNumber: currentInstallmentNumber,
      totalInstallmentNumber: totalInstallmentNumber,
      currentDueDate: currentDueDate,
      totalPaidAmount: totalPaidAmount,
      osBalance: osBalance,
      overdueDays: overdueDays,
      overdueTerms: overdueTerms,
      overdueFrom: overdueFrom,
      overdueTo: overdueTo,
      latestPaidDate: latestPaidDate,
      currentDateTime: currentDateTime,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PaymentDetailsDataModelStruct? updatePaymentDetailsDataModelStruct(
  PaymentDetailsDataModelStruct? paymentDetailsDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    paymentDetailsDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPaymentDetailsDataModelStructData(
  Map<String, dynamic> firestoreData,
  PaymentDetailsDataModelStruct? paymentDetailsDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (paymentDetailsDataModel == null) {
    return;
  }
  if (paymentDetailsDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      paymentDetailsDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final paymentDetailsDataModelData = getPaymentDetailsDataModelFirestoreData(
      paymentDetailsDataModel, forFieldValue);
  final nestedData =
      paymentDetailsDataModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      paymentDetailsDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPaymentDetailsDataModelFirestoreData(
  PaymentDetailsDataModelStruct? paymentDetailsDataModel, [
  bool forFieldValue = false,
]) {
  if (paymentDetailsDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(paymentDetailsDataModel.toMap());

  // Add any Firestore field values
  mapToFirestore(paymentDetailsDataModel.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPaymentDetailsDataModelListFirestoreData(
  List<PaymentDetailsDataModelStruct>? paymentDetailsDataModels,
) =>
    paymentDetailsDataModels
        ?.map((e) => getPaymentDetailsDataModelFirestoreData(e, true))
        .toList() ??
    [];
