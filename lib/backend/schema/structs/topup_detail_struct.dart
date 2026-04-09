// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TopupDetailStruct extends FFFirebaseStruct {
  TopupDetailStruct({
    int? totalInstallmentAmount,
    String? canTopup,
    int? defaultTopupAmount,
    int? totalInstallmentNumber,
    int? currentLtvAmount,
    String? accountStatus,
    int? topupExtra,
    int? feeAmount,
    int? balanceReceivable,
    int? collectionFee,
    int? penaltyFee,
    int? yield,
    String? interestPaidFlag,
    String? canTopupMsg,
    int? maxTransferAmount,
    List<ProductsStruct>? products,
    double? defaultTransferAmount,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _totalInstallmentAmount = totalInstallmentAmount,
        _canTopup = canTopup,
        _defaultTopupAmount = defaultTopupAmount,
        _totalInstallmentNumber = totalInstallmentNumber,
        _currentLtvAmount = currentLtvAmount,
        _accountStatus = accountStatus,
        _topupExtra = topupExtra,
        _feeAmount = feeAmount,
        _balanceReceivable = balanceReceivable,
        _collectionFee = collectionFee,
        _penaltyFee = penaltyFee,
        _yield = yield,
        _interestPaidFlag = interestPaidFlag,
        _canTopupMsg = canTopupMsg,
        _maxTransferAmount = maxTransferAmount,
        _products = products,
        _defaultTransferAmount = defaultTransferAmount,
        super(firestoreUtilData);

  // "total_installment_amount" field.
  int? _totalInstallmentAmount;
  int get totalInstallmentAmount => _totalInstallmentAmount ?? 0;
  set totalInstallmentAmount(int? val) => _totalInstallmentAmount = val;

  void incrementTotalInstallmentAmount(int amount) =>
      totalInstallmentAmount = totalInstallmentAmount + amount;

  bool hasTotalInstallmentAmount() => _totalInstallmentAmount != null;

  // "can_topup" field.
  String? _canTopup;
  String get canTopup => _canTopup ?? '';
  set canTopup(String? val) => _canTopup = val;

  bool hasCanTopup() => _canTopup != null;

  // "default_topup_amount" field.
  int? _defaultTopupAmount;
  int get defaultTopupAmount => _defaultTopupAmount ?? 0;
  set defaultTopupAmount(int? val) => _defaultTopupAmount = val;

  void incrementDefaultTopupAmount(int amount) =>
      defaultTopupAmount = defaultTopupAmount + amount;

  bool hasDefaultTopupAmount() => _defaultTopupAmount != null;

  // "total_installment_number" field.
  int? _totalInstallmentNumber;
  int get totalInstallmentNumber => _totalInstallmentNumber ?? 0;
  set totalInstallmentNumber(int? val) => _totalInstallmentNumber = val;

  void incrementTotalInstallmentNumber(int amount) =>
      totalInstallmentNumber = totalInstallmentNumber + amount;

  bool hasTotalInstallmentNumber() => _totalInstallmentNumber != null;

  // "current_ltv_amount" field.
  int? _currentLtvAmount;
  int get currentLtvAmount => _currentLtvAmount ?? 0;
  set currentLtvAmount(int? val) => _currentLtvAmount = val;

  void incrementCurrentLtvAmount(int amount) =>
      currentLtvAmount = currentLtvAmount + amount;

  bool hasCurrentLtvAmount() => _currentLtvAmount != null;

  // "account_status" field.
  String? _accountStatus;
  String get accountStatus => _accountStatus ?? '';
  set accountStatus(String? val) => _accountStatus = val;

  bool hasAccountStatus() => _accountStatus != null;

  // "topup_extra" field.
  int? _topupExtra;
  int get topupExtra => _topupExtra ?? 0;
  set topupExtra(int? val) => _topupExtra = val;

  void incrementTopupExtra(int amount) => topupExtra = topupExtra + amount;

  bool hasTopupExtra() => _topupExtra != null;

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

  // "yield" field.
  int? _yield;
  int get yield => _yield ?? 0;
  set yield(int? val) => _yield = val;

  void incrementYield(int amount) => yield = yield + amount;

  bool hasYield() => _yield != null;

  // "interest_paid_flag" field.
  String? _interestPaidFlag;
  String get interestPaidFlag => _interestPaidFlag ?? '';
  set interestPaidFlag(String? val) => _interestPaidFlag = val;

  bool hasInterestPaidFlag() => _interestPaidFlag != null;

  // "can_topup_msg" field.
  String? _canTopupMsg;
  String get canTopupMsg => _canTopupMsg ?? '';
  set canTopupMsg(String? val) => _canTopupMsg = val;

  bool hasCanTopupMsg() => _canTopupMsg != null;

  // "max_transfer_amount" field.
  int? _maxTransferAmount;
  int get maxTransferAmount => _maxTransferAmount ?? 0;
  set maxTransferAmount(int? val) => _maxTransferAmount = val;

  void incrementMaxTransferAmount(int amount) =>
      maxTransferAmount = maxTransferAmount + amount;

  bool hasMaxTransferAmount() => _maxTransferAmount != null;

  // "products" field.
  List<ProductsStruct>? _products;
  List<ProductsStruct> get products => _products ?? const [];
  set products(List<ProductsStruct>? val) => _products = val;

  void updateProducts(Function(List<ProductsStruct>) updateFn) {
    updateFn(_products ??= []);
  }

  bool hasProducts() => _products != null;

  // "default_transfer_amount" field.
  double? _defaultTransferAmount;
  double get defaultTransferAmount => _defaultTransferAmount ?? 0.0;
  set defaultTransferAmount(double? val) => _defaultTransferAmount = val;

  void incrementDefaultTransferAmount(double amount) =>
      defaultTransferAmount = defaultTransferAmount + amount;

  bool hasDefaultTransferAmount() => _defaultTransferAmount != null;

  static TopupDetailStruct fromMap(Map<String, dynamic> data) =>
      TopupDetailStruct(
        totalInstallmentAmount:
            castToType<int>(data['total_installment_amount']),
        canTopup: data['can_topup'] as String?,
        defaultTopupAmount: castToType<int>(data['default_topup_amount']),
        totalInstallmentNumber:
            castToType<int>(data['total_installment_number']),
        currentLtvAmount: castToType<int>(data['current_ltv_amount']),
        accountStatus: data['account_status'] as String?,
        topupExtra: castToType<int>(data['topup_extra']),
        feeAmount: castToType<int>(data['fee_amount']),
        balanceReceivable: castToType<int>(data['balance_receivable']),
        collectionFee: castToType<int>(data['collection_fee']),
        penaltyFee: castToType<int>(data['penalty_fee']),
        yield: castToType<int>(data['yield']),
        interestPaidFlag: data['interest_paid_flag'] as String?,
        canTopupMsg: data['can_topup_msg'] as String?,
        maxTransferAmount: castToType<int>(data['max_transfer_amount']),
        products: getStructList(
          data['products'],
          ProductsStruct.fromMap,
        ),
        defaultTransferAmount:
            castToType<double>(data['default_transfer_amount']),
      );

  static TopupDetailStruct? maybeFromMap(dynamic data) => data is Map
      ? TopupDetailStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'total_installment_amount': _totalInstallmentAmount,
        'can_topup': _canTopup,
        'default_topup_amount': _defaultTopupAmount,
        'total_installment_number': _totalInstallmentNumber,
        'current_ltv_amount': _currentLtvAmount,
        'account_status': _accountStatus,
        'topup_extra': _topupExtra,
        'fee_amount': _feeAmount,
        'balance_receivable': _balanceReceivable,
        'collection_fee': _collectionFee,
        'penalty_fee': _penaltyFee,
        'yield': _yield,
        'interest_paid_flag': _interestPaidFlag,
        'can_topup_msg': _canTopupMsg,
        'max_transfer_amount': _maxTransferAmount,
        'products': _products?.map((e) => e.toMap()).toList(),
        'default_transfer_amount': _defaultTransferAmount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'total_installment_amount': serializeParam(
          _totalInstallmentAmount,
          ParamType.int,
        ),
        'can_topup': serializeParam(
          _canTopup,
          ParamType.String,
        ),
        'default_topup_amount': serializeParam(
          _defaultTopupAmount,
          ParamType.int,
        ),
        'total_installment_number': serializeParam(
          _totalInstallmentNumber,
          ParamType.int,
        ),
        'current_ltv_amount': serializeParam(
          _currentLtvAmount,
          ParamType.int,
        ),
        'account_status': serializeParam(
          _accountStatus,
          ParamType.String,
        ),
        'topup_extra': serializeParam(
          _topupExtra,
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
        'yield': serializeParam(
          _yield,
          ParamType.int,
        ),
        'interest_paid_flag': serializeParam(
          _interestPaidFlag,
          ParamType.String,
        ),
        'can_topup_msg': serializeParam(
          _canTopupMsg,
          ParamType.String,
        ),
        'max_transfer_amount': serializeParam(
          _maxTransferAmount,
          ParamType.int,
        ),
        'products': serializeParam(
          _products,
          ParamType.DataStruct,
          isList: true,
        ),
        'default_transfer_amount': serializeParam(
          _defaultTransferAmount,
          ParamType.double,
        ),
      }.withoutNulls;

  static TopupDetailStruct fromSerializableMap(Map<String, dynamic> data) =>
      TopupDetailStruct(
        totalInstallmentAmount: deserializeParam(
          data['total_installment_amount'],
          ParamType.int,
          false,
        ),
        canTopup: deserializeParam(
          data['can_topup'],
          ParamType.String,
          false,
        ),
        defaultTopupAmount: deserializeParam(
          data['default_topup_amount'],
          ParamType.int,
          false,
        ),
        totalInstallmentNumber: deserializeParam(
          data['total_installment_number'],
          ParamType.int,
          false,
        ),
        currentLtvAmount: deserializeParam(
          data['current_ltv_amount'],
          ParamType.int,
          false,
        ),
        accountStatus: deserializeParam(
          data['account_status'],
          ParamType.String,
          false,
        ),
        topupExtra: deserializeParam(
          data['topup_extra'],
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
        yield: deserializeParam(
          data['yield'],
          ParamType.int,
          false,
        ),
        interestPaidFlag: deserializeParam(
          data['interest_paid_flag'],
          ParamType.String,
          false,
        ),
        canTopupMsg: deserializeParam(
          data['can_topup_msg'],
          ParamType.String,
          false,
        ),
        maxTransferAmount: deserializeParam(
          data['max_transfer_amount'],
          ParamType.int,
          false,
        ),
        products: deserializeStructParam<ProductsStruct>(
          data['products'],
          ParamType.DataStruct,
          true,
          structBuilder: ProductsStruct.fromSerializableMap,
        ),
        defaultTransferAmount: deserializeParam(
          data['default_transfer_amount'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'TopupDetailStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TopupDetailStruct &&
        totalInstallmentAmount == other.totalInstallmentAmount &&
        canTopup == other.canTopup &&
        defaultTopupAmount == other.defaultTopupAmount &&
        totalInstallmentNumber == other.totalInstallmentNumber &&
        currentLtvAmount == other.currentLtvAmount &&
        accountStatus == other.accountStatus &&
        topupExtra == other.topupExtra &&
        feeAmount == other.feeAmount &&
        balanceReceivable == other.balanceReceivable &&
        collectionFee == other.collectionFee &&
        penaltyFee == other.penaltyFee &&
        yield == other.yield &&
        interestPaidFlag == other.interestPaidFlag &&
        canTopupMsg == other.canTopupMsg &&
        maxTransferAmount == other.maxTransferAmount &&
        listEquality.equals(products, other.products) &&
        defaultTransferAmount == other.defaultTransferAmount;
  }

  @override
  int get hashCode => const ListEquality().hash([
        totalInstallmentAmount,
        canTopup,
        defaultTopupAmount,
        totalInstallmentNumber,
        currentLtvAmount,
        accountStatus,
        topupExtra,
        feeAmount,
        balanceReceivable,
        collectionFee,
        penaltyFee,
        yield,
        interestPaidFlag,
        canTopupMsg,
        maxTransferAmount,
        products,
        defaultTransferAmount
      ]);
}

TopupDetailStruct createTopupDetailStruct({
  int? totalInstallmentAmount,
  String? canTopup,
  int? defaultTopupAmount,
  int? totalInstallmentNumber,
  int? currentLtvAmount,
  String? accountStatus,
  int? topupExtra,
  int? feeAmount,
  int? balanceReceivable,
  int? collectionFee,
  int? penaltyFee,
  int? yield,
  String? interestPaidFlag,
  String? canTopupMsg,
  int? maxTransferAmount,
  double? defaultTransferAmount,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TopupDetailStruct(
      totalInstallmentAmount: totalInstallmentAmount,
      canTopup: canTopup,
      defaultTopupAmount: defaultTopupAmount,
      totalInstallmentNumber: totalInstallmentNumber,
      currentLtvAmount: currentLtvAmount,
      accountStatus: accountStatus,
      topupExtra: topupExtra,
      feeAmount: feeAmount,
      balanceReceivable: balanceReceivable,
      collectionFee: collectionFee,
      penaltyFee: penaltyFee,
      yield: yield,
      interestPaidFlag: interestPaidFlag,
      canTopupMsg: canTopupMsg,
      maxTransferAmount: maxTransferAmount,
      defaultTransferAmount: defaultTransferAmount,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TopupDetailStruct? updateTopupDetailStruct(
  TopupDetailStruct? topupDetail, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    topupDetail
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTopupDetailStructData(
  Map<String, dynamic> firestoreData,
  TopupDetailStruct? topupDetail,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (topupDetail == null) {
    return;
  }
  if (topupDetail.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && topupDetail.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final topupDetailData =
      getTopupDetailFirestoreData(topupDetail, forFieldValue);
  final nestedData =
      topupDetailData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = topupDetail.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTopupDetailFirestoreData(
  TopupDetailStruct? topupDetail, [
  bool forFieldValue = false,
]) {
  if (topupDetail == null) {
    return {};
  }
  final firestoreData = mapToFirestore(topupDetail.toMap());

  // Add any Firestore field values
  mapToFirestore(topupDetail.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTopupDetailListFirestoreData(
  List<TopupDetailStruct>? topupDetails,
) =>
    topupDetails?.map((e) => getTopupDetailFirestoreData(e, true)).toList() ??
    [];
