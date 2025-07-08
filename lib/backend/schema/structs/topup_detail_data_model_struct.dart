// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TopupDetailDataModelStruct extends FFFirebaseStruct {
  TopupDetailDataModelStruct({
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

  static TopupDetailDataModelStruct fromMap(Map<String, dynamic> data) =>
      TopupDetailDataModelStruct(
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
      );

  static TopupDetailDataModelStruct? maybeFromMap(dynamic data) => data is Map
      ? TopupDetailDataModelStruct.fromMap(data.cast<String, dynamic>())
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
      }.withoutNulls;

  static TopupDetailDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TopupDetailDataModelStruct(
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
      );

  @override
  String toString() => 'TopupDetailDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TopupDetailDataModelStruct &&
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
        interestPaidFlag == other.interestPaidFlag;
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
        interestPaidFlag
      ]);
}

TopupDetailDataModelStruct createTopupDetailDataModelStruct({
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
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TopupDetailDataModelStruct(
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
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TopupDetailDataModelStruct? updateTopupDetailDataModelStruct(
  TopupDetailDataModelStruct? topupDetailDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    topupDetailDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTopupDetailDataModelStructData(
  Map<String, dynamic> firestoreData,
  TopupDetailDataModelStruct? topupDetailDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (topupDetailDataModel == null) {
    return;
  }
  if (topupDetailDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && topupDetailDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final topupDetailDataModelData =
      getTopupDetailDataModelFirestoreData(topupDetailDataModel, forFieldValue);
  final nestedData =
      topupDetailDataModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      topupDetailDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTopupDetailDataModelFirestoreData(
  TopupDetailDataModelStruct? topupDetailDataModel, [
  bool forFieldValue = false,
]) {
  if (topupDetailDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(topupDetailDataModel.toMap());

  // Add any Firestore field values
  topupDetailDataModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTopupDetailDataModelListFirestoreData(
  List<TopupDetailDataModelStruct>? topupDetailDataModels,
) =>
    topupDetailDataModels
        ?.map((e) => getTopupDetailDataModelFirestoreData(e, true))
        .toList() ??
    [];
