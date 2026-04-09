// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TopupStatusModelStruct extends FFFirebaseStruct {
  TopupStatusModelStruct({
    String? code,
    String? message,
    String? contractName,
    String? contractNo,
    String? contractBankAccount,
    String? contractBankBrandname,
    String? loanTypeCode,
    String? loanTypeName,
    String? loanTypeIcon,
    String? requestDate,
    String? requestStatus,
    String? collateralInformation,
    int? amount,
    int? amountPerInstallment,
    int? installmentNumber,
    double? totalAmountWithRate,
    double? interestRate,
    String? topupRequestFile,
    String? topupArgeementFile,
    String? topupReceiptFile,
    int? actualReceiveAmount,
    String? branchImage,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _code = code,
        _message = message,
        _contractName = contractName,
        _contractNo = contractNo,
        _contractBankAccount = contractBankAccount,
        _contractBankBrandname = contractBankBrandname,
        _loanTypeCode = loanTypeCode,
        _loanTypeName = loanTypeName,
        _loanTypeIcon = loanTypeIcon,
        _requestDate = requestDate,
        _requestStatus = requestStatus,
        _collateralInformation = collateralInformation,
        _amount = amount,
        _amountPerInstallment = amountPerInstallment,
        _installmentNumber = installmentNumber,
        _totalAmountWithRate = totalAmountWithRate,
        _interestRate = interestRate,
        _topupRequestFile = topupRequestFile,
        _topupArgeementFile = topupArgeementFile,
        _topupReceiptFile = topupReceiptFile,
        _actualReceiveAmount = actualReceiveAmount,
        _branchImage = branchImage,
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

  // "contract_name" field.
  String? _contractName;
  String get contractName => _contractName ?? '';
  set contractName(String? val) => _contractName = val;

  bool hasContractName() => _contractName != null;

  // "contract_no" field.
  String? _contractNo;
  String get contractNo => _contractNo ?? '';
  set contractNo(String? val) => _contractNo = val;

  bool hasContractNo() => _contractNo != null;

  // "contract_bank_account" field.
  String? _contractBankAccount;
  String get contractBankAccount => _contractBankAccount ?? '';
  set contractBankAccount(String? val) => _contractBankAccount = val;

  bool hasContractBankAccount() => _contractBankAccount != null;

  // "contract_bank_brandname" field.
  String? _contractBankBrandname;
  String get contractBankBrandname => _contractBankBrandname ?? '';
  set contractBankBrandname(String? val) => _contractBankBrandname = val;

  bool hasContractBankBrandname() => _contractBankBrandname != null;

  // "loan_type_code" field.
  String? _loanTypeCode;
  String get loanTypeCode => _loanTypeCode ?? '';
  set loanTypeCode(String? val) => _loanTypeCode = val;

  bool hasLoanTypeCode() => _loanTypeCode != null;

  // "loan_type_name" field.
  String? _loanTypeName;
  String get loanTypeName => _loanTypeName ?? '';
  set loanTypeName(String? val) => _loanTypeName = val;

  bool hasLoanTypeName() => _loanTypeName != null;

  // "loan_type_icon" field.
  String? _loanTypeIcon;
  String get loanTypeIcon => _loanTypeIcon ?? '';
  set loanTypeIcon(String? val) => _loanTypeIcon = val;

  bool hasLoanTypeIcon() => _loanTypeIcon != null;

  // "request_date" field.
  String? _requestDate;
  String get requestDate => _requestDate ?? '';
  set requestDate(String? val) => _requestDate = val;

  bool hasRequestDate() => _requestDate != null;

  // "request_status" field.
  String? _requestStatus;
  String get requestStatus => _requestStatus ?? '';
  set requestStatus(String? val) => _requestStatus = val;

  bool hasRequestStatus() => _requestStatus != null;

  // "collateral_information" field.
  String? _collateralInformation;
  String get collateralInformation => _collateralInformation ?? '';
  set collateralInformation(String? val) => _collateralInformation = val;

  bool hasCollateralInformation() => _collateralInformation != null;

  // "amount" field.
  int? _amount;
  int get amount => _amount ?? 0;
  set amount(int? val) => _amount = val;

  void incrementAmount(int amount) => amount = amount + amount;

  bool hasAmount() => _amount != null;

  // "amount_per_installment" field.
  int? _amountPerInstallment;
  int get amountPerInstallment => _amountPerInstallment ?? 0;
  set amountPerInstallment(int? val) => _amountPerInstallment = val;

  void incrementAmountPerInstallment(int amount) =>
      amountPerInstallment = amountPerInstallment + amount;

  bool hasAmountPerInstallment() => _amountPerInstallment != null;

  // "installment_number" field.
  int? _installmentNumber;
  int get installmentNumber => _installmentNumber ?? 0;
  set installmentNumber(int? val) => _installmentNumber = val;

  void incrementInstallmentNumber(int amount) =>
      installmentNumber = installmentNumber + amount;

  bool hasInstallmentNumber() => _installmentNumber != null;

  // "total_amount_with_rate" field.
  double? _totalAmountWithRate;
  double get totalAmountWithRate => _totalAmountWithRate ?? 0.0;
  set totalAmountWithRate(double? val) => _totalAmountWithRate = val;

  void incrementTotalAmountWithRate(double amount) =>
      totalAmountWithRate = totalAmountWithRate + amount;

  bool hasTotalAmountWithRate() => _totalAmountWithRate != null;

  // "interest_rate" field.
  double? _interestRate;
  double get interestRate => _interestRate ?? 0.0;
  set interestRate(double? val) => _interestRate = val;

  void incrementInterestRate(double amount) =>
      interestRate = interestRate + amount;

  bool hasInterestRate() => _interestRate != null;

  // "topup_request_file" field.
  String? _topupRequestFile;
  String get topupRequestFile => _topupRequestFile ?? '';
  set topupRequestFile(String? val) => _topupRequestFile = val;

  bool hasTopupRequestFile() => _topupRequestFile != null;

  // "topup_argeement_file" field.
  String? _topupArgeementFile;
  String get topupArgeementFile => _topupArgeementFile ?? '';
  set topupArgeementFile(String? val) => _topupArgeementFile = val;

  bool hasTopupArgeementFile() => _topupArgeementFile != null;

  // "topup_receipt_file" field.
  String? _topupReceiptFile;
  String get topupReceiptFile => _topupReceiptFile ?? '';
  set topupReceiptFile(String? val) => _topupReceiptFile = val;

  bool hasTopupReceiptFile() => _topupReceiptFile != null;

  // "actual_receive_amount" field.
  int? _actualReceiveAmount;
  int get actualReceiveAmount => _actualReceiveAmount ?? 0;
  set actualReceiveAmount(int? val) => _actualReceiveAmount = val;

  void incrementActualReceiveAmount(int amount) =>
      actualReceiveAmount = actualReceiveAmount + amount;

  bool hasActualReceiveAmount() => _actualReceiveAmount != null;

  // "branch_image" field.
  String? _branchImage;
  String get branchImage => _branchImage ?? '';
  set branchImage(String? val) => _branchImage = val;

  bool hasBranchImage() => _branchImage != null;

  static TopupStatusModelStruct fromMap(Map<String, dynamic> data) =>
      TopupStatusModelStruct(
        code: data['code'] as String?,
        message: data['message'] as String?,
        contractName: data['contract_name'] as String?,
        contractNo: data['contract_no'] as String?,
        contractBankAccount: data['contract_bank_account'] as String?,
        contractBankBrandname: data['contract_bank_brandname'] as String?,
        loanTypeCode: data['loan_type_code'] as String?,
        loanTypeName: data['loan_type_name'] as String?,
        loanTypeIcon: data['loan_type_icon'] as String?,
        requestDate: data['request_date'] as String?,
        requestStatus: data['request_status'] as String?,
        collateralInformation: data['collateral_information'] as String?,
        amount: castToType<int>(data['amount']),
        amountPerInstallment: castToType<int>(data['amount_per_installment']),
        installmentNumber: castToType<int>(data['installment_number']),
        totalAmountWithRate: castToType<double>(data['total_amount_with_rate']),
        interestRate: castToType<double>(data['interest_rate']),
        topupRequestFile: data['topup_request_file'] as String?,
        topupArgeementFile: data['topup_argeement_file'] as String?,
        topupReceiptFile: data['topup_receipt_file'] as String?,
        actualReceiveAmount: castToType<int>(data['actual_receive_amount']),
        branchImage: data['branch_image'] as String?,
      );

  static TopupStatusModelStruct? maybeFromMap(dynamic data) => data is Map
      ? TopupStatusModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'code': _code,
        'message': _message,
        'contract_name': _contractName,
        'contract_no': _contractNo,
        'contract_bank_account': _contractBankAccount,
        'contract_bank_brandname': _contractBankBrandname,
        'loan_type_code': _loanTypeCode,
        'loan_type_name': _loanTypeName,
        'loan_type_icon': _loanTypeIcon,
        'request_date': _requestDate,
        'request_status': _requestStatus,
        'collateral_information': _collateralInformation,
        'amount': _amount,
        'amount_per_installment': _amountPerInstallment,
        'installment_number': _installmentNumber,
        'total_amount_with_rate': _totalAmountWithRate,
        'interest_rate': _interestRate,
        'topup_request_file': _topupRequestFile,
        'topup_argeement_file': _topupArgeementFile,
        'topup_receipt_file': _topupReceiptFile,
        'actual_receive_amount': _actualReceiveAmount,
        'branch_image': _branchImage,
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
        'contract_name': serializeParam(
          _contractName,
          ParamType.String,
        ),
        'contract_no': serializeParam(
          _contractNo,
          ParamType.String,
        ),
        'contract_bank_account': serializeParam(
          _contractBankAccount,
          ParamType.String,
        ),
        'contract_bank_brandname': serializeParam(
          _contractBankBrandname,
          ParamType.String,
        ),
        'loan_type_code': serializeParam(
          _loanTypeCode,
          ParamType.String,
        ),
        'loan_type_name': serializeParam(
          _loanTypeName,
          ParamType.String,
        ),
        'loan_type_icon': serializeParam(
          _loanTypeIcon,
          ParamType.String,
        ),
        'request_date': serializeParam(
          _requestDate,
          ParamType.String,
        ),
        'request_status': serializeParam(
          _requestStatus,
          ParamType.String,
        ),
        'collateral_information': serializeParam(
          _collateralInformation,
          ParamType.String,
        ),
        'amount': serializeParam(
          _amount,
          ParamType.int,
        ),
        'amount_per_installment': serializeParam(
          _amountPerInstallment,
          ParamType.int,
        ),
        'installment_number': serializeParam(
          _installmentNumber,
          ParamType.int,
        ),
        'total_amount_with_rate': serializeParam(
          _totalAmountWithRate,
          ParamType.double,
        ),
        'interest_rate': serializeParam(
          _interestRate,
          ParamType.double,
        ),
        'topup_request_file': serializeParam(
          _topupRequestFile,
          ParamType.String,
        ),
        'topup_argeement_file': serializeParam(
          _topupArgeementFile,
          ParamType.String,
        ),
        'topup_receipt_file': serializeParam(
          _topupReceiptFile,
          ParamType.String,
        ),
        'actual_receive_amount': serializeParam(
          _actualReceiveAmount,
          ParamType.int,
        ),
        'branch_image': serializeParam(
          _branchImage,
          ParamType.String,
        ),
      }.withoutNulls;

  static TopupStatusModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TopupStatusModelStruct(
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
        contractName: deserializeParam(
          data['contract_name'],
          ParamType.String,
          false,
        ),
        contractNo: deserializeParam(
          data['contract_no'],
          ParamType.String,
          false,
        ),
        contractBankAccount: deserializeParam(
          data['contract_bank_account'],
          ParamType.String,
          false,
        ),
        contractBankBrandname: deserializeParam(
          data['contract_bank_brandname'],
          ParamType.String,
          false,
        ),
        loanTypeCode: deserializeParam(
          data['loan_type_code'],
          ParamType.String,
          false,
        ),
        loanTypeName: deserializeParam(
          data['loan_type_name'],
          ParamType.String,
          false,
        ),
        loanTypeIcon: deserializeParam(
          data['loan_type_icon'],
          ParamType.String,
          false,
        ),
        requestDate: deserializeParam(
          data['request_date'],
          ParamType.String,
          false,
        ),
        requestStatus: deserializeParam(
          data['request_status'],
          ParamType.String,
          false,
        ),
        collateralInformation: deserializeParam(
          data['collateral_information'],
          ParamType.String,
          false,
        ),
        amount: deserializeParam(
          data['amount'],
          ParamType.int,
          false,
        ),
        amountPerInstallment: deserializeParam(
          data['amount_per_installment'],
          ParamType.int,
          false,
        ),
        installmentNumber: deserializeParam(
          data['installment_number'],
          ParamType.int,
          false,
        ),
        totalAmountWithRate: deserializeParam(
          data['total_amount_with_rate'],
          ParamType.double,
          false,
        ),
        interestRate: deserializeParam(
          data['interest_rate'],
          ParamType.double,
          false,
        ),
        topupRequestFile: deserializeParam(
          data['topup_request_file'],
          ParamType.String,
          false,
        ),
        topupArgeementFile: deserializeParam(
          data['topup_argeement_file'],
          ParamType.String,
          false,
        ),
        topupReceiptFile: deserializeParam(
          data['topup_receipt_file'],
          ParamType.String,
          false,
        ),
        actualReceiveAmount: deserializeParam(
          data['actual_receive_amount'],
          ParamType.int,
          false,
        ),
        branchImage: deserializeParam(
          data['branch_image'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TopupStatusModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TopupStatusModelStruct &&
        code == other.code &&
        message == other.message &&
        contractName == other.contractName &&
        contractNo == other.contractNo &&
        contractBankAccount == other.contractBankAccount &&
        contractBankBrandname == other.contractBankBrandname &&
        loanTypeCode == other.loanTypeCode &&
        loanTypeName == other.loanTypeName &&
        loanTypeIcon == other.loanTypeIcon &&
        requestDate == other.requestDate &&
        requestStatus == other.requestStatus &&
        collateralInformation == other.collateralInformation &&
        amount == other.amount &&
        amountPerInstallment == other.amountPerInstallment &&
        installmentNumber == other.installmentNumber &&
        totalAmountWithRate == other.totalAmountWithRate &&
        interestRate == other.interestRate &&
        topupRequestFile == other.topupRequestFile &&
        topupArgeementFile == other.topupArgeementFile &&
        topupReceiptFile == other.topupReceiptFile &&
        actualReceiveAmount == other.actualReceiveAmount &&
        branchImage == other.branchImage;
  }

  @override
  int get hashCode => const ListEquality().hash([
        code,
        message,
        contractName,
        contractNo,
        contractBankAccount,
        contractBankBrandname,
        loanTypeCode,
        loanTypeName,
        loanTypeIcon,
        requestDate,
        requestStatus,
        collateralInformation,
        amount,
        amountPerInstallment,
        installmentNumber,
        totalAmountWithRate,
        interestRate,
        topupRequestFile,
        topupArgeementFile,
        topupReceiptFile,
        actualReceiveAmount,
        branchImage
      ]);
}

TopupStatusModelStruct createTopupStatusModelStruct({
  String? code,
  String? message,
  String? contractName,
  String? contractNo,
  String? contractBankAccount,
  String? contractBankBrandname,
  String? loanTypeCode,
  String? loanTypeName,
  String? loanTypeIcon,
  String? requestDate,
  String? requestStatus,
  String? collateralInformation,
  int? amount,
  int? amountPerInstallment,
  int? installmentNumber,
  double? totalAmountWithRate,
  double? interestRate,
  String? topupRequestFile,
  String? topupArgeementFile,
  String? topupReceiptFile,
  int? actualReceiveAmount,
  String? branchImage,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TopupStatusModelStruct(
      code: code,
      message: message,
      contractName: contractName,
      contractNo: contractNo,
      contractBankAccount: contractBankAccount,
      contractBankBrandname: contractBankBrandname,
      loanTypeCode: loanTypeCode,
      loanTypeName: loanTypeName,
      loanTypeIcon: loanTypeIcon,
      requestDate: requestDate,
      requestStatus: requestStatus,
      collateralInformation: collateralInformation,
      amount: amount,
      amountPerInstallment: amountPerInstallment,
      installmentNumber: installmentNumber,
      totalAmountWithRate: totalAmountWithRate,
      interestRate: interestRate,
      topupRequestFile: topupRequestFile,
      topupArgeementFile: topupArgeementFile,
      topupReceiptFile: topupReceiptFile,
      actualReceiveAmount: actualReceiveAmount,
      branchImage: branchImage,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TopupStatusModelStruct? updateTopupStatusModelStruct(
  TopupStatusModelStruct? topupStatusModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    topupStatusModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTopupStatusModelStructData(
  Map<String, dynamic> firestoreData,
  TopupStatusModelStruct? topupStatusModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (topupStatusModel == null) {
    return;
  }
  if (topupStatusModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && topupStatusModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final topupStatusModelData =
      getTopupStatusModelFirestoreData(topupStatusModel, forFieldValue);
  final nestedData =
      topupStatusModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = topupStatusModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTopupStatusModelFirestoreData(
  TopupStatusModelStruct? topupStatusModel, [
  bool forFieldValue = false,
]) {
  if (topupStatusModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(topupStatusModel.toMap());

  // Add any Firestore field values
  mapToFirestore(topupStatusModel.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTopupStatusModelListFirestoreData(
  List<TopupStatusModelStruct>? topupStatusModels,
) =>
    topupStatusModels
        ?.map((e) => getTopupStatusModelFirestoreData(e, true))
        .toList() ??
    [];
