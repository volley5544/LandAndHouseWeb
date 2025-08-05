// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GetTopupDataAPIDataTypeStruct extends FFFirebaseStruct {
  GetTopupDataAPIDataTypeStruct({
    String? code,
    String? message,
    String? dbName,
    String? contractNo,
    ContractDetailsStruct? contractDetails,
    CarDetailsStruct? carDetails,
    String? firstDueDate,
    int? dueDay,
    String? contractDate,
    int? defaultTopupAmount,
    int? installmentNumber,
    int? installmentAmount,
    int? minAmountWithRate,
    int? maxTopupAmount,
    double? interestRate,
    int? transferAmount,
    int? osBalance,
    String? dataDate,
    String? packageId,
    String? lifeInsureAmt,
    int? minTopupAmount,
    int? topupExtra,
    int? topupActual,
    int? feeAmount,
    int? balanceReceivable,
    int? collectionFee,
    int? penaltyFee,
    double? overdueAmount,
    String? overdueFrom,
    String? overdueTo,
    String? interestPaidFlag,
    int? yield,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _code = code,
        _message = message,
        _dbName = dbName,
        _contractNo = contractNo,
        _contractDetails = contractDetails,
        _carDetails = carDetails,
        _firstDueDate = firstDueDate,
        _dueDay = dueDay,
        _contractDate = contractDate,
        _defaultTopupAmount = defaultTopupAmount,
        _installmentNumber = installmentNumber,
        _installmentAmount = installmentAmount,
        _minAmountWithRate = minAmountWithRate,
        _maxTopupAmount = maxTopupAmount,
        _interestRate = interestRate,
        _transferAmount = transferAmount,
        _osBalance = osBalance,
        _dataDate = dataDate,
        _packageId = packageId,
        _lifeInsureAmt = lifeInsureAmt,
        _minTopupAmount = minTopupAmount,
        _topupExtra = topupExtra,
        _topupActual = topupActual,
        _feeAmount = feeAmount,
        _balanceReceivable = balanceReceivable,
        _collectionFee = collectionFee,
        _penaltyFee = penaltyFee,
        _overdueAmount = overdueAmount,
        _overdueFrom = overdueFrom,
        _overdueTo = overdueTo,
        _interestPaidFlag = interestPaidFlag,
        _yield = yield,
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

  // "db_name" field.
  String? _dbName;
  String get dbName => _dbName ?? '';
  set dbName(String? val) => _dbName = val;

  bool hasDbName() => _dbName != null;

  // "contract_no" field.
  String? _contractNo;
  String get contractNo => _contractNo ?? '';
  set contractNo(String? val) => _contractNo = val;

  bool hasContractNo() => _contractNo != null;

  // "contract_details" field.
  ContractDetailsStruct? _contractDetails;
  ContractDetailsStruct get contractDetails =>
      _contractDetails ?? ContractDetailsStruct();
  set contractDetails(ContractDetailsStruct? val) => _contractDetails = val;

  void updateContractDetails(Function(ContractDetailsStruct) updateFn) {
    updateFn(_contractDetails ??= ContractDetailsStruct());
  }

  bool hasContractDetails() => _contractDetails != null;

  // "car_details" field.
  CarDetailsStruct? _carDetails;
  CarDetailsStruct get carDetails => _carDetails ?? CarDetailsStruct();
  set carDetails(CarDetailsStruct? val) => _carDetails = val;

  void updateCarDetails(Function(CarDetailsStruct) updateFn) {
    updateFn(_carDetails ??= CarDetailsStruct());
  }

  bool hasCarDetails() => _carDetails != null;

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

  // "contract_date" field.
  String? _contractDate;
  String get contractDate => _contractDate ?? '';
  set contractDate(String? val) => _contractDate = val;

  bool hasContractDate() => _contractDate != null;

  // "default_topup_amount" field.
  int? _defaultTopupAmount;
  int get defaultTopupAmount => _defaultTopupAmount ?? 0;
  set defaultTopupAmount(int? val) => _defaultTopupAmount = val;

  void incrementDefaultTopupAmount(int amount) =>
      defaultTopupAmount = defaultTopupAmount + amount;

  bool hasDefaultTopupAmount() => _defaultTopupAmount != null;

  // "installment_number" field.
  int? _installmentNumber;
  int get installmentNumber => _installmentNumber ?? 0;
  set installmentNumber(int? val) => _installmentNumber = val;

  void incrementInstallmentNumber(int amount) =>
      installmentNumber = installmentNumber + amount;

  bool hasInstallmentNumber() => _installmentNumber != null;

  // "installment_amount" field.
  int? _installmentAmount;
  int get installmentAmount => _installmentAmount ?? 0;
  set installmentAmount(int? val) => _installmentAmount = val;

  void incrementInstallmentAmount(int amount) =>
      installmentAmount = installmentAmount + amount;

  bool hasInstallmentAmount() => _installmentAmount != null;

  // "min_amount_with_rate" field.
  int? _minAmountWithRate;
  int get minAmountWithRate => _minAmountWithRate ?? 0;
  set minAmountWithRate(int? val) => _minAmountWithRate = val;

  void incrementMinAmountWithRate(int amount) =>
      minAmountWithRate = minAmountWithRate + amount;

  bool hasMinAmountWithRate() => _minAmountWithRate != null;

  // "max_topup_amount" field.
  int? _maxTopupAmount;
  int get maxTopupAmount => _maxTopupAmount ?? 0;
  set maxTopupAmount(int? val) => _maxTopupAmount = val;

  void incrementMaxTopupAmount(int amount) =>
      maxTopupAmount = maxTopupAmount + amount;

  bool hasMaxTopupAmount() => _maxTopupAmount != null;

  // "interest_rate" field.
  double? _interestRate;
  double get interestRate => _interestRate ?? 0.0;
  set interestRate(double? val) => _interestRate = val;

  void incrementInterestRate(double amount) =>
      interestRate = interestRate + amount;

  bool hasInterestRate() => _interestRate != null;

  // "transfer_amount" field.
  int? _transferAmount;
  int get transferAmount => _transferAmount ?? 0;
  set transferAmount(int? val) => _transferAmount = val;

  void incrementTransferAmount(int amount) =>
      transferAmount = transferAmount + amount;

  bool hasTransferAmount() => _transferAmount != null;

  // "os_balance" field.
  int? _osBalance;
  int get osBalance => _osBalance ?? 0;
  set osBalance(int? val) => _osBalance = val;

  void incrementOsBalance(int amount) => osBalance = osBalance + amount;

  bool hasOsBalance() => _osBalance != null;

  // "data_date" field.
  String? _dataDate;
  String get dataDate => _dataDate ?? '';
  set dataDate(String? val) => _dataDate = val;

  bool hasDataDate() => _dataDate != null;

  // "package_id" field.
  String? _packageId;
  String get packageId => _packageId ?? '';
  set packageId(String? val) => _packageId = val;

  bool hasPackageId() => _packageId != null;

  // "life_insure_amt" field.
  String? _lifeInsureAmt;
  String get lifeInsureAmt => _lifeInsureAmt ?? '';
  set lifeInsureAmt(String? val) => _lifeInsureAmt = val;

  bool hasLifeInsureAmt() => _lifeInsureAmt != null;

  // "min_topup_amount" field.
  int? _minTopupAmount;
  int get minTopupAmount => _minTopupAmount ?? 0;
  set minTopupAmount(int? val) => _minTopupAmount = val;

  void incrementMinTopupAmount(int amount) =>
      minTopupAmount = minTopupAmount + amount;

  bool hasMinTopupAmount() => _minTopupAmount != null;

  // "topup_extra" field.
  int? _topupExtra;
  int get topupExtra => _topupExtra ?? 0;
  set topupExtra(int? val) => _topupExtra = val;

  void incrementTopupExtra(int amount) => topupExtra = topupExtra + amount;

  bool hasTopupExtra() => _topupExtra != null;

  // "topup_actual" field.
  int? _topupActual;
  int get topupActual => _topupActual ?? 0;
  set topupActual(int? val) => _topupActual = val;

  void incrementTopupActual(int amount) => topupActual = topupActual + amount;

  bool hasTopupActual() => _topupActual != null;

  // "fee_amount" field.
  int? _feeAmount;
  int get feeAmount => _feeAmount ?? 0;
  set feeAmount(int? val) => _feeAmount = val;

  void incrementFeeAmount(int amount) => feeAmount = feeAmount + amount;

  bool hasFeeAmount() => _feeAmount != null;

  // "balance_receivable" field.
  int? _balanceReceivable;
  int get balanceReceivable => _balanceReceivable ?? 0;
  set balanceReceivable(int? val) => _balanceReceivable = val;

  void incrementBalanceReceivable(int amount) =>
      balanceReceivable = balanceReceivable + amount;

  bool hasBalanceReceivable() => _balanceReceivable != null;

  // "collection_fee" field.
  int? _collectionFee;
  int get collectionFee => _collectionFee ?? 0;
  set collectionFee(int? val) => _collectionFee = val;

  void incrementCollectionFee(int amount) =>
      collectionFee = collectionFee + amount;

  bool hasCollectionFee() => _collectionFee != null;

  // "penalty_fee" field.
  int? _penaltyFee;
  int get penaltyFee => _penaltyFee ?? 0;
  set penaltyFee(int? val) => _penaltyFee = val;

  void incrementPenaltyFee(int amount) => penaltyFee = penaltyFee + amount;

  bool hasPenaltyFee() => _penaltyFee != null;

  // "overdue_amount" field.
  double? _overdueAmount;
  double get overdueAmount => _overdueAmount ?? 0.0;
  set overdueAmount(double? val) => _overdueAmount = val;

  void incrementOverdueAmount(double amount) =>
      overdueAmount = overdueAmount + amount;

  bool hasOverdueAmount() => _overdueAmount != null;

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

  // "interest_paid_flag" field.
  String? _interestPaidFlag;
  String get interestPaidFlag => _interestPaidFlag ?? '';
  set interestPaidFlag(String? val) => _interestPaidFlag = val;

  bool hasInterestPaidFlag() => _interestPaidFlag != null;

  // "yield" field.
  int? _yield;
  int get yield => _yield ?? 0;
  set yield(int? val) => _yield = val;

  void incrementYield(int amount) => yield = yield + amount;

  bool hasYield() => _yield != null;

  static GetTopupDataAPIDataTypeStruct fromMap(Map<String, dynamic> data) =>
      GetTopupDataAPIDataTypeStruct(
        code: data['code'] as String?,
        message: data['message'] as String?,
        dbName: data['db_name'] as String?,
        contractNo: data['contract_no'] as String?,
        contractDetails: data['contract_details'] is ContractDetailsStruct
            ? data['contract_details']
            : ContractDetailsStruct.maybeFromMap(data['contract_details']),
        carDetails: data['car_details'] is CarDetailsStruct
            ? data['car_details']
            : CarDetailsStruct.maybeFromMap(data['car_details']),
        firstDueDate: data['first_due_date'] as String?,
        dueDay: castToType<int>(data['due_day']),
        contractDate: data['contract_date'] as String?,
        defaultTopupAmount: castToType<int>(data['default_topup_amount']),
        installmentNumber: castToType<int>(data['installment_number']),
        installmentAmount: castToType<int>(data['installment_amount']),
        minAmountWithRate: castToType<int>(data['min_amount_with_rate']),
        maxTopupAmount: castToType<int>(data['max_topup_amount']),
        interestRate: castToType<double>(data['interest_rate']),
        transferAmount: castToType<int>(data['transfer_amount']),
        osBalance: castToType<int>(data['os_balance']),
        dataDate: data['data_date'] as String?,
        packageId: data['package_id'] as String?,
        lifeInsureAmt: data['life_insure_amt'] as String?,
        minTopupAmount: castToType<int>(data['min_topup_amount']),
        topupExtra: castToType<int>(data['topup_extra']),
        topupActual: castToType<int>(data['topup_actual']),
        feeAmount: castToType<int>(data['fee_amount']),
        balanceReceivable: castToType<int>(data['balance_receivable']),
        collectionFee: castToType<int>(data['collection_fee']),
        penaltyFee: castToType<int>(data['penalty_fee']),
        overdueAmount: castToType<double>(data['overdue_amount']),
        overdueFrom: data['overdue_from'] as String?,
        overdueTo: data['overdue_to'] as String?,
        interestPaidFlag: data['interest_paid_flag'] as String?,
        yield: castToType<int>(data['yield']),
      );

  static GetTopupDataAPIDataTypeStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? GetTopupDataAPIDataTypeStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'code': _code,
        'message': _message,
        'db_name': _dbName,
        'contract_no': _contractNo,
        'contract_details': _contractDetails?.toMap(),
        'car_details': _carDetails?.toMap(),
        'first_due_date': _firstDueDate,
        'due_day': _dueDay,
        'contract_date': _contractDate,
        'default_topup_amount': _defaultTopupAmount,
        'installment_number': _installmentNumber,
        'installment_amount': _installmentAmount,
        'min_amount_with_rate': _minAmountWithRate,
        'max_topup_amount': _maxTopupAmount,
        'interest_rate': _interestRate,
        'transfer_amount': _transferAmount,
        'os_balance': _osBalance,
        'data_date': _dataDate,
        'package_id': _packageId,
        'life_insure_amt': _lifeInsureAmt,
        'min_topup_amount': _minTopupAmount,
        'topup_extra': _topupExtra,
        'topup_actual': _topupActual,
        'fee_amount': _feeAmount,
        'balance_receivable': _balanceReceivable,
        'collection_fee': _collectionFee,
        'penalty_fee': _penaltyFee,
        'overdue_amount': _overdueAmount,
        'overdue_from': _overdueFrom,
        'overdue_to': _overdueTo,
        'interest_paid_flag': _interestPaidFlag,
        'yield': _yield,
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
        'db_name': serializeParam(
          _dbName,
          ParamType.String,
        ),
        'contract_no': serializeParam(
          _contractNo,
          ParamType.String,
        ),
        'contract_details': serializeParam(
          _contractDetails,
          ParamType.DataStruct,
        ),
        'car_details': serializeParam(
          _carDetails,
          ParamType.DataStruct,
        ),
        'first_due_date': serializeParam(
          _firstDueDate,
          ParamType.String,
        ),
        'due_day': serializeParam(
          _dueDay,
          ParamType.int,
        ),
        'contract_date': serializeParam(
          _contractDate,
          ParamType.String,
        ),
        'default_topup_amount': serializeParam(
          _defaultTopupAmount,
          ParamType.int,
        ),
        'installment_number': serializeParam(
          _installmentNumber,
          ParamType.int,
        ),
        'installment_amount': serializeParam(
          _installmentAmount,
          ParamType.int,
        ),
        'min_amount_with_rate': serializeParam(
          _minAmountWithRate,
          ParamType.int,
        ),
        'max_topup_amount': serializeParam(
          _maxTopupAmount,
          ParamType.int,
        ),
        'interest_rate': serializeParam(
          _interestRate,
          ParamType.double,
        ),
        'transfer_amount': serializeParam(
          _transferAmount,
          ParamType.int,
        ),
        'os_balance': serializeParam(
          _osBalance,
          ParamType.int,
        ),
        'data_date': serializeParam(
          _dataDate,
          ParamType.String,
        ),
        'package_id': serializeParam(
          _packageId,
          ParamType.String,
        ),
        'life_insure_amt': serializeParam(
          _lifeInsureAmt,
          ParamType.String,
        ),
        'min_topup_amount': serializeParam(
          _minTopupAmount,
          ParamType.int,
        ),
        'topup_extra': serializeParam(
          _topupExtra,
          ParamType.int,
        ),
        'topup_actual': serializeParam(
          _topupActual,
          ParamType.int,
        ),
        'fee_amount': serializeParam(
          _feeAmount,
          ParamType.int,
        ),
        'balance_receivable': serializeParam(
          _balanceReceivable,
          ParamType.int,
        ),
        'collection_fee': serializeParam(
          _collectionFee,
          ParamType.int,
        ),
        'penalty_fee': serializeParam(
          _penaltyFee,
          ParamType.int,
        ),
        'overdue_amount': serializeParam(
          _overdueAmount,
          ParamType.double,
        ),
        'overdue_from': serializeParam(
          _overdueFrom,
          ParamType.String,
        ),
        'overdue_to': serializeParam(
          _overdueTo,
          ParamType.String,
        ),
        'interest_paid_flag': serializeParam(
          _interestPaidFlag,
          ParamType.String,
        ),
        'yield': serializeParam(
          _yield,
          ParamType.int,
        ),
      }.withoutNulls;

  static GetTopupDataAPIDataTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      GetTopupDataAPIDataTypeStruct(
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
        dbName: deserializeParam(
          data['db_name'],
          ParamType.String,
          false,
        ),
        contractNo: deserializeParam(
          data['contract_no'],
          ParamType.String,
          false,
        ),
        contractDetails: deserializeStructParam(
          data['contract_details'],
          ParamType.DataStruct,
          false,
          structBuilder: ContractDetailsStruct.fromSerializableMap,
        ),
        carDetails: deserializeStructParam(
          data['car_details'],
          ParamType.DataStruct,
          false,
          structBuilder: CarDetailsStruct.fromSerializableMap,
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
        contractDate: deserializeParam(
          data['contract_date'],
          ParamType.String,
          false,
        ),
        defaultTopupAmount: deserializeParam(
          data['default_topup_amount'],
          ParamType.int,
          false,
        ),
        installmentNumber: deserializeParam(
          data['installment_number'],
          ParamType.int,
          false,
        ),
        installmentAmount: deserializeParam(
          data['installment_amount'],
          ParamType.int,
          false,
        ),
        minAmountWithRate: deserializeParam(
          data['min_amount_with_rate'],
          ParamType.int,
          false,
        ),
        maxTopupAmount: deserializeParam(
          data['max_topup_amount'],
          ParamType.int,
          false,
        ),
        interestRate: deserializeParam(
          data['interest_rate'],
          ParamType.double,
          false,
        ),
        transferAmount: deserializeParam(
          data['transfer_amount'],
          ParamType.int,
          false,
        ),
        osBalance: deserializeParam(
          data['os_balance'],
          ParamType.int,
          false,
        ),
        dataDate: deserializeParam(
          data['data_date'],
          ParamType.String,
          false,
        ),
        packageId: deserializeParam(
          data['package_id'],
          ParamType.String,
          false,
        ),
        lifeInsureAmt: deserializeParam(
          data['life_insure_amt'],
          ParamType.String,
          false,
        ),
        minTopupAmount: deserializeParam(
          data['min_topup_amount'],
          ParamType.int,
          false,
        ),
        topupExtra: deserializeParam(
          data['topup_extra'],
          ParamType.int,
          false,
        ),
        topupActual: deserializeParam(
          data['topup_actual'],
          ParamType.int,
          false,
        ),
        feeAmount: deserializeParam(
          data['fee_amount'],
          ParamType.int,
          false,
        ),
        balanceReceivable: deserializeParam(
          data['balance_receivable'],
          ParamType.int,
          false,
        ),
        collectionFee: deserializeParam(
          data['collection_fee'],
          ParamType.int,
          false,
        ),
        penaltyFee: deserializeParam(
          data['penalty_fee'],
          ParamType.int,
          false,
        ),
        overdueAmount: deserializeParam(
          data['overdue_amount'],
          ParamType.double,
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
        interestPaidFlag: deserializeParam(
          data['interest_paid_flag'],
          ParamType.String,
          false,
        ),
        yield: deserializeParam(
          data['yield'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'GetTopupDataAPIDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GetTopupDataAPIDataTypeStruct &&
        code == other.code &&
        message == other.message &&
        dbName == other.dbName &&
        contractNo == other.contractNo &&
        contractDetails == other.contractDetails &&
        carDetails == other.carDetails &&
        firstDueDate == other.firstDueDate &&
        dueDay == other.dueDay &&
        contractDate == other.contractDate &&
        defaultTopupAmount == other.defaultTopupAmount &&
        installmentNumber == other.installmentNumber &&
        installmentAmount == other.installmentAmount &&
        minAmountWithRate == other.minAmountWithRate &&
        maxTopupAmount == other.maxTopupAmount &&
        interestRate == other.interestRate &&
        transferAmount == other.transferAmount &&
        osBalance == other.osBalance &&
        dataDate == other.dataDate &&
        packageId == other.packageId &&
        lifeInsureAmt == other.lifeInsureAmt &&
        minTopupAmount == other.minTopupAmount &&
        topupExtra == other.topupExtra &&
        topupActual == other.topupActual &&
        feeAmount == other.feeAmount &&
        balanceReceivable == other.balanceReceivable &&
        collectionFee == other.collectionFee &&
        penaltyFee == other.penaltyFee &&
        overdueAmount == other.overdueAmount &&
        overdueFrom == other.overdueFrom &&
        overdueTo == other.overdueTo &&
        interestPaidFlag == other.interestPaidFlag &&
        yield == other.yield;
  }

  @override
  int get hashCode => const ListEquality().hash([
        code,
        message,
        dbName,
        contractNo,
        contractDetails,
        carDetails,
        firstDueDate,
        dueDay,
        contractDate,
        defaultTopupAmount,
        installmentNumber,
        installmentAmount,
        minAmountWithRate,
        maxTopupAmount,
        interestRate,
        transferAmount,
        osBalance,
        dataDate,
        packageId,
        lifeInsureAmt,
        minTopupAmount,
        topupExtra,
        topupActual,
        feeAmount,
        balanceReceivable,
        collectionFee,
        penaltyFee,
        overdueAmount,
        overdueFrom,
        overdueTo,
        interestPaidFlag,
        yield
      ]);
}

GetTopupDataAPIDataTypeStruct createGetTopupDataAPIDataTypeStruct({
  String? code,
  String? message,
  String? dbName,
  String? contractNo,
  ContractDetailsStruct? contractDetails,
  CarDetailsStruct? carDetails,
  String? firstDueDate,
  int? dueDay,
  String? contractDate,
  int? defaultTopupAmount,
  int? installmentNumber,
  int? installmentAmount,
  int? minAmountWithRate,
  int? maxTopupAmount,
  double? interestRate,
  int? transferAmount,
  int? osBalance,
  String? dataDate,
  String? packageId,
  String? lifeInsureAmt,
  int? minTopupAmount,
  int? topupExtra,
  int? topupActual,
  int? feeAmount,
  int? balanceReceivable,
  int? collectionFee,
  int? penaltyFee,
  double? overdueAmount,
  String? overdueFrom,
  String? overdueTo,
  String? interestPaidFlag,
  int? yield,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GetTopupDataAPIDataTypeStruct(
      code: code,
      message: message,
      dbName: dbName,
      contractNo: contractNo,
      contractDetails: contractDetails ??
          (clearUnsetFields ? ContractDetailsStruct() : null),
      carDetails: carDetails ?? (clearUnsetFields ? CarDetailsStruct() : null),
      firstDueDate: firstDueDate,
      dueDay: dueDay,
      contractDate: contractDate,
      defaultTopupAmount: defaultTopupAmount,
      installmentNumber: installmentNumber,
      installmentAmount: installmentAmount,
      minAmountWithRate: minAmountWithRate,
      maxTopupAmount: maxTopupAmount,
      interestRate: interestRate,
      transferAmount: transferAmount,
      osBalance: osBalance,
      dataDate: dataDate,
      packageId: packageId,
      lifeInsureAmt: lifeInsureAmt,
      minTopupAmount: minTopupAmount,
      topupExtra: topupExtra,
      topupActual: topupActual,
      feeAmount: feeAmount,
      balanceReceivable: balanceReceivable,
      collectionFee: collectionFee,
      penaltyFee: penaltyFee,
      overdueAmount: overdueAmount,
      overdueFrom: overdueFrom,
      overdueTo: overdueTo,
      interestPaidFlag: interestPaidFlag,
      yield: yield,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GetTopupDataAPIDataTypeStruct? updateGetTopupDataAPIDataTypeStruct(
  GetTopupDataAPIDataTypeStruct? getTopupDataAPIDataType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    getTopupDataAPIDataType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGetTopupDataAPIDataTypeStructData(
  Map<String, dynamic> firestoreData,
  GetTopupDataAPIDataTypeStruct? getTopupDataAPIDataType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (getTopupDataAPIDataType == null) {
    return;
  }
  if (getTopupDataAPIDataType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      getTopupDataAPIDataType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final getTopupDataAPIDataTypeData = getGetTopupDataAPIDataTypeFirestoreData(
      getTopupDataAPIDataType, forFieldValue);
  final nestedData =
      getTopupDataAPIDataTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      getTopupDataAPIDataType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGetTopupDataAPIDataTypeFirestoreData(
  GetTopupDataAPIDataTypeStruct? getTopupDataAPIDataType, [
  bool forFieldValue = false,
]) {
  if (getTopupDataAPIDataType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(getTopupDataAPIDataType.toMap());

  // Handle nested data for "contract_details" field.
  addContractDetailsStructData(
    firestoreData,
    getTopupDataAPIDataType.hasContractDetails()
        ? getTopupDataAPIDataType.contractDetails
        : null,
    'contract_details',
    forFieldValue,
  );

  // Handle nested data for "car_details" field.
  addCarDetailsStructData(
    firestoreData,
    getTopupDataAPIDataType.hasCarDetails()
        ? getTopupDataAPIDataType.carDetails
        : null,
    'car_details',
    forFieldValue,
  );

  // Add any Firestore field values
  getTopupDataAPIDataType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGetTopupDataAPIDataTypeListFirestoreData(
  List<GetTopupDataAPIDataTypeStruct>? getTopupDataAPIDataTypes,
) =>
    getTopupDataAPIDataTypes
        ?.map((e) => getGetTopupDataAPIDataTypeFirestoreData(e, true))
        .toList() ??
    [];
