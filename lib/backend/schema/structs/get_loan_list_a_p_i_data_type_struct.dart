// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GetLoanListAPIDataTypeStruct extends FFFirebaseStruct {
  GetLoanListAPIDataTypeStruct({
    String? contractName,
    String? branchCode,
    String? branchName,
    String? branchImage,
    String? dbName,
    String? contractNo,
    String? contractBankType,
    String? contractBankAccount,
    String? contractBankBrandname,
    ContractDetailsStruct? contractDetails,
    String? contractDate,
    String? contractCloseDate,
    String? contractBranchCreatedName,
    String? loanTypeCode,
    String? loanTypeName,
    PaymentDetailsStruct? paymentDetails,
    BarcodeDetailsStruct? barcodeDetails,
    TopupDetailStruct? topupDetail,
    List<InsurancesStruct>? insurances,
    String? dataDate,
    String? transno,
    int? requestTopupAmount,
    String? requestDate,
    String? requestStatus,
    String? requestStatusCode,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _contractName = contractName,
        _branchCode = branchCode,
        _branchName = branchName,
        _branchImage = branchImage,
        _dbName = dbName,
        _contractNo = contractNo,
        _contractBankType = contractBankType,
        _contractBankAccount = contractBankAccount,
        _contractBankBrandname = contractBankBrandname,
        _contractDetails = contractDetails,
        _contractDate = contractDate,
        _contractCloseDate = contractCloseDate,
        _contractBranchCreatedName = contractBranchCreatedName,
        _loanTypeCode = loanTypeCode,
        _loanTypeName = loanTypeName,
        _paymentDetails = paymentDetails,
        _barcodeDetails = barcodeDetails,
        _topupDetail = topupDetail,
        _insurances = insurances,
        _dataDate = dataDate,
        _transno = transno,
        _requestTopupAmount = requestTopupAmount,
        _requestDate = requestDate,
        _requestStatus = requestStatus,
        _requestStatusCode = requestStatusCode,
        super(firestoreUtilData);

  // "contract_name" field.
  String? _contractName;
  String get contractName => _contractName ?? '';
  set contractName(String? val) => _contractName = val;

  bool hasContractName() => _contractName != null;

  // "branch_code" field.
  String? _branchCode;
  String get branchCode => _branchCode ?? '';
  set branchCode(String? val) => _branchCode = val;

  bool hasBranchCode() => _branchCode != null;

  // "branch_name" field.
  String? _branchName;
  String get branchName => _branchName ?? '';
  set branchName(String? val) => _branchName = val;

  bool hasBranchName() => _branchName != null;

  // "branch_image" field.
  String? _branchImage;
  String get branchImage => _branchImage ?? '';
  set branchImage(String? val) => _branchImage = val;

  bool hasBranchImage() => _branchImage != null;

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

  // "contract_bank_type" field.
  String? _contractBankType;
  String get contractBankType => _contractBankType ?? '';
  set contractBankType(String? val) => _contractBankType = val;

  bool hasContractBankType() => _contractBankType != null;

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

  // "contract_details" field.
  ContractDetailsStruct? _contractDetails;
  ContractDetailsStruct get contractDetails =>
      _contractDetails ?? ContractDetailsStruct();
  set contractDetails(ContractDetailsStruct? val) => _contractDetails = val;

  void updateContractDetails(Function(ContractDetailsStruct) updateFn) {
    updateFn(_contractDetails ??= ContractDetailsStruct());
  }

  bool hasContractDetails() => _contractDetails != null;

  // "contract_date" field.
  String? _contractDate;
  String get contractDate => _contractDate ?? '';
  set contractDate(String? val) => _contractDate = val;

  bool hasContractDate() => _contractDate != null;

  // "contract_close_date" field.
  String? _contractCloseDate;
  String get contractCloseDate => _contractCloseDate ?? '';
  set contractCloseDate(String? val) => _contractCloseDate = val;

  bool hasContractCloseDate() => _contractCloseDate != null;

  // "contract_branch_created_name" field.
  String? _contractBranchCreatedName;
  String get contractBranchCreatedName => _contractBranchCreatedName ?? '';
  set contractBranchCreatedName(String? val) =>
      _contractBranchCreatedName = val;

  bool hasContractBranchCreatedName() => _contractBranchCreatedName != null;

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

  // "payment_details" field.
  PaymentDetailsStruct? _paymentDetails;
  PaymentDetailsStruct get paymentDetails =>
      _paymentDetails ?? PaymentDetailsStruct();
  set paymentDetails(PaymentDetailsStruct? val) => _paymentDetails = val;

  void updatePaymentDetails(Function(PaymentDetailsStruct) updateFn) {
    updateFn(_paymentDetails ??= PaymentDetailsStruct());
  }

  bool hasPaymentDetails() => _paymentDetails != null;

  // "barcode_details" field.
  BarcodeDetailsStruct? _barcodeDetails;
  BarcodeDetailsStruct get barcodeDetails =>
      _barcodeDetails ?? BarcodeDetailsStruct();
  set barcodeDetails(BarcodeDetailsStruct? val) => _barcodeDetails = val;

  void updateBarcodeDetails(Function(BarcodeDetailsStruct) updateFn) {
    updateFn(_barcodeDetails ??= BarcodeDetailsStruct());
  }

  bool hasBarcodeDetails() => _barcodeDetails != null;

  // "topup_detail" field.
  TopupDetailStruct? _topupDetail;
  TopupDetailStruct get topupDetail => _topupDetail ?? TopupDetailStruct();
  set topupDetail(TopupDetailStruct? val) => _topupDetail = val;

  void updateTopupDetail(Function(TopupDetailStruct) updateFn) {
    updateFn(_topupDetail ??= TopupDetailStruct());
  }

  bool hasTopupDetail() => _topupDetail != null;

  // "insurances" field.
  List<InsurancesStruct>? _insurances;
  List<InsurancesStruct> get insurances => _insurances ?? const [];
  set insurances(List<InsurancesStruct>? val) => _insurances = val;

  void updateInsurances(Function(List<InsurancesStruct>) updateFn) {
    updateFn(_insurances ??= []);
  }

  bool hasInsurances() => _insurances != null;

  // "data_date" field.
  String? _dataDate;
  String get dataDate => _dataDate ?? '';
  set dataDate(String? val) => _dataDate = val;

  bool hasDataDate() => _dataDate != null;

  // "transno" field.
  String? _transno;
  String get transno => _transno ?? '';
  set transno(String? val) => _transno = val;

  bool hasTransno() => _transno != null;

  // "request_topup_amount" field.
  int? _requestTopupAmount;
  int get requestTopupAmount => _requestTopupAmount ?? 0;
  set requestTopupAmount(int? val) => _requestTopupAmount = val;

  void incrementRequestTopupAmount(int amount) =>
      requestTopupAmount = requestTopupAmount + amount;

  bool hasRequestTopupAmount() => _requestTopupAmount != null;

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

  // "request_status_code" field.
  String? _requestStatusCode;
  String get requestStatusCode => _requestStatusCode ?? '';
  set requestStatusCode(String? val) => _requestStatusCode = val;

  bool hasRequestStatusCode() => _requestStatusCode != null;

  static GetLoanListAPIDataTypeStruct fromMap(Map<String, dynamic> data) =>
      GetLoanListAPIDataTypeStruct(
        contractName: data['contract_name'] as String?,
        branchCode: data['branch_code'] as String?,
        branchName: data['branch_name'] as String?,
        branchImage: data['branch_image'] as String?,
        dbName: data['db_name'] as String?,
        contractNo: data['contract_no'] as String?,
        contractBankType: data['contract_bank_type'] as String?,
        contractBankAccount: data['contract_bank_account'] as String?,
        contractBankBrandname: data['contract_bank_brandname'] as String?,
        contractDetails: data['contract_details'] is ContractDetailsStruct
            ? data['contract_details']
            : ContractDetailsStruct.maybeFromMap(data['contract_details']),
        contractDate: data['contract_date'] as String?,
        contractCloseDate: data['contract_close_date'] as String?,
        contractBranchCreatedName:
            data['contract_branch_created_name'] as String?,
        loanTypeCode: data['loan_type_code'] as String?,
        loanTypeName: data['loan_type_name'] as String?,
        paymentDetails: data['payment_details'] is PaymentDetailsStruct
            ? data['payment_details']
            : PaymentDetailsStruct.maybeFromMap(data['payment_details']),
        barcodeDetails: data['barcode_details'] is BarcodeDetailsStruct
            ? data['barcode_details']
            : BarcodeDetailsStruct.maybeFromMap(data['barcode_details']),
        topupDetail: data['topup_detail'] is TopupDetailStruct
            ? data['topup_detail']
            : TopupDetailStruct.maybeFromMap(data['topup_detail']),
        insurances: getStructList(
          data['insurances'],
          InsurancesStruct.fromMap,
        ),
        dataDate: data['data_date'] as String?,
        transno: data['transno'] as String?,
        requestTopupAmount: castToType<int>(data['request_topup_amount']),
        requestDate: data['request_date'] as String?,
        requestStatus: data['request_status'] as String?,
        requestStatusCode: data['request_status_code'] as String?,
      );

  static GetLoanListAPIDataTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? GetLoanListAPIDataTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'contract_name': _contractName,
        'branch_code': _branchCode,
        'branch_name': _branchName,
        'branch_image': _branchImage,
        'db_name': _dbName,
        'contract_no': _contractNo,
        'contract_bank_type': _contractBankType,
        'contract_bank_account': _contractBankAccount,
        'contract_bank_brandname': _contractBankBrandname,
        'contract_details': _contractDetails?.toMap(),
        'contract_date': _contractDate,
        'contract_close_date': _contractCloseDate,
        'contract_branch_created_name': _contractBranchCreatedName,
        'loan_type_code': _loanTypeCode,
        'loan_type_name': _loanTypeName,
        'payment_details': _paymentDetails?.toMap(),
        'barcode_details': _barcodeDetails?.toMap(),
        'topup_detail': _topupDetail?.toMap(),
        'insurances': _insurances?.map((e) => e.toMap()).toList(),
        'data_date': _dataDate,
        'transno': _transno,
        'request_topup_amount': _requestTopupAmount,
        'request_date': _requestDate,
        'request_status': _requestStatus,
        'request_status_code': _requestStatusCode,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'contract_name': serializeParam(
          _contractName,
          ParamType.String,
        ),
        'branch_code': serializeParam(
          _branchCode,
          ParamType.String,
        ),
        'branch_name': serializeParam(
          _branchName,
          ParamType.String,
        ),
        'branch_image': serializeParam(
          _branchImage,
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
        'contract_bank_type': serializeParam(
          _contractBankType,
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
        'contract_details': serializeParam(
          _contractDetails,
          ParamType.DataStruct,
        ),
        'contract_date': serializeParam(
          _contractDate,
          ParamType.String,
        ),
        'contract_close_date': serializeParam(
          _contractCloseDate,
          ParamType.String,
        ),
        'contract_branch_created_name': serializeParam(
          _contractBranchCreatedName,
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
        'payment_details': serializeParam(
          _paymentDetails,
          ParamType.DataStruct,
        ),
        'barcode_details': serializeParam(
          _barcodeDetails,
          ParamType.DataStruct,
        ),
        'topup_detail': serializeParam(
          _topupDetail,
          ParamType.DataStruct,
        ),
        'insurances': serializeParam(
          _insurances,
          ParamType.DataStruct,
          isList: true,
        ),
        'data_date': serializeParam(
          _dataDate,
          ParamType.String,
        ),
        'transno': serializeParam(
          _transno,
          ParamType.String,
        ),
        'request_topup_amount': serializeParam(
          _requestTopupAmount,
          ParamType.int,
        ),
        'request_date': serializeParam(
          _requestDate,
          ParamType.String,
        ),
        'request_status': serializeParam(
          _requestStatus,
          ParamType.String,
        ),
        'request_status_code': serializeParam(
          _requestStatusCode,
          ParamType.String,
        ),
      }.withoutNulls;

  static GetLoanListAPIDataTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      GetLoanListAPIDataTypeStruct(
        contractName: deserializeParam(
          data['contract_name'],
          ParamType.String,
          false,
        ),
        branchCode: deserializeParam(
          data['branch_code'],
          ParamType.String,
          false,
        ),
        branchName: deserializeParam(
          data['branch_name'],
          ParamType.String,
          false,
        ),
        branchImage: deserializeParam(
          data['branch_image'],
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
        contractBankType: deserializeParam(
          data['contract_bank_type'],
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
        contractDetails: deserializeStructParam(
          data['contract_details'],
          ParamType.DataStruct,
          false,
          structBuilder: ContractDetailsStruct.fromSerializableMap,
        ),
        contractDate: deserializeParam(
          data['contract_date'],
          ParamType.String,
          false,
        ),
        contractCloseDate: deserializeParam(
          data['contract_close_date'],
          ParamType.String,
          false,
        ),
        contractBranchCreatedName: deserializeParam(
          data['contract_branch_created_name'],
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
        paymentDetails: deserializeStructParam(
          data['payment_details'],
          ParamType.DataStruct,
          false,
          structBuilder: PaymentDetailsStruct.fromSerializableMap,
        ),
        barcodeDetails: deserializeStructParam(
          data['barcode_details'],
          ParamType.DataStruct,
          false,
          structBuilder: BarcodeDetailsStruct.fromSerializableMap,
        ),
        topupDetail: deserializeStructParam(
          data['topup_detail'],
          ParamType.DataStruct,
          false,
          structBuilder: TopupDetailStruct.fromSerializableMap,
        ),
        insurances: deserializeStructParam<InsurancesStruct>(
          data['insurances'],
          ParamType.DataStruct,
          true,
          structBuilder: InsurancesStruct.fromSerializableMap,
        ),
        dataDate: deserializeParam(
          data['data_date'],
          ParamType.String,
          false,
        ),
        transno: deserializeParam(
          data['transno'],
          ParamType.String,
          false,
        ),
        requestTopupAmount: deserializeParam(
          data['request_topup_amount'],
          ParamType.int,
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
        requestStatusCode: deserializeParam(
          data['request_status_code'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'GetLoanListAPIDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is GetLoanListAPIDataTypeStruct &&
        contractName == other.contractName &&
        branchCode == other.branchCode &&
        branchName == other.branchName &&
        branchImage == other.branchImage &&
        dbName == other.dbName &&
        contractNo == other.contractNo &&
        contractBankType == other.contractBankType &&
        contractBankAccount == other.contractBankAccount &&
        contractBankBrandname == other.contractBankBrandname &&
        contractDetails == other.contractDetails &&
        contractDate == other.contractDate &&
        contractCloseDate == other.contractCloseDate &&
        contractBranchCreatedName == other.contractBranchCreatedName &&
        loanTypeCode == other.loanTypeCode &&
        loanTypeName == other.loanTypeName &&
        paymentDetails == other.paymentDetails &&
        barcodeDetails == other.barcodeDetails &&
        topupDetail == other.topupDetail &&
        listEquality.equals(insurances, other.insurances) &&
        dataDate == other.dataDate &&
        transno == other.transno &&
        requestTopupAmount == other.requestTopupAmount &&
        requestDate == other.requestDate &&
        requestStatus == other.requestStatus &&
        requestStatusCode == other.requestStatusCode;
  }

  @override
  int get hashCode => const ListEquality().hash([
        contractName,
        branchCode,
        branchName,
        branchImage,
        dbName,
        contractNo,
        contractBankType,
        contractBankAccount,
        contractBankBrandname,
        contractDetails,
        contractDate,
        contractCloseDate,
        contractBranchCreatedName,
        loanTypeCode,
        loanTypeName,
        paymentDetails,
        barcodeDetails,
        topupDetail,
        insurances,
        dataDate,
        transno,
        requestTopupAmount,
        requestDate,
        requestStatus,
        requestStatusCode
      ]);
}

GetLoanListAPIDataTypeStruct createGetLoanListAPIDataTypeStruct({
  String? contractName,
  String? branchCode,
  String? branchName,
  String? branchImage,
  String? dbName,
  String? contractNo,
  String? contractBankType,
  String? contractBankAccount,
  String? contractBankBrandname,
  ContractDetailsStruct? contractDetails,
  String? contractDate,
  String? contractCloseDate,
  String? contractBranchCreatedName,
  String? loanTypeCode,
  String? loanTypeName,
  PaymentDetailsStruct? paymentDetails,
  BarcodeDetailsStruct? barcodeDetails,
  TopupDetailStruct? topupDetail,
  String? dataDate,
  String? transno,
  int? requestTopupAmount,
  String? requestDate,
  String? requestStatus,
  String? requestStatusCode,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GetLoanListAPIDataTypeStruct(
      contractName: contractName,
      branchCode: branchCode,
      branchName: branchName,
      branchImage: branchImage,
      dbName: dbName,
      contractNo: contractNo,
      contractBankType: contractBankType,
      contractBankAccount: contractBankAccount,
      contractBankBrandname: contractBankBrandname,
      contractDetails: contractDetails ??
          (clearUnsetFields ? ContractDetailsStruct() : null),
      contractDate: contractDate,
      contractCloseDate: contractCloseDate,
      contractBranchCreatedName: contractBranchCreatedName,
      loanTypeCode: loanTypeCode,
      loanTypeName: loanTypeName,
      paymentDetails:
          paymentDetails ?? (clearUnsetFields ? PaymentDetailsStruct() : null),
      barcodeDetails:
          barcodeDetails ?? (clearUnsetFields ? BarcodeDetailsStruct() : null),
      topupDetail:
          topupDetail ?? (clearUnsetFields ? TopupDetailStruct() : null),
      dataDate: dataDate,
      transno: transno,
      requestTopupAmount: requestTopupAmount,
      requestDate: requestDate,
      requestStatus: requestStatus,
      requestStatusCode: requestStatusCode,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GetLoanListAPIDataTypeStruct? updateGetLoanListAPIDataTypeStruct(
  GetLoanListAPIDataTypeStruct? getLoanListAPIDataType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    getLoanListAPIDataType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGetLoanListAPIDataTypeStructData(
  Map<String, dynamic> firestoreData,
  GetLoanListAPIDataTypeStruct? getLoanListAPIDataType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (getLoanListAPIDataType == null) {
    return;
  }
  if (getLoanListAPIDataType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      getLoanListAPIDataType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final getLoanListAPIDataTypeData = getGetLoanListAPIDataTypeFirestoreData(
      getLoanListAPIDataType, forFieldValue);
  final nestedData =
      getLoanListAPIDataTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      getLoanListAPIDataType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGetLoanListAPIDataTypeFirestoreData(
  GetLoanListAPIDataTypeStruct? getLoanListAPIDataType, [
  bool forFieldValue = false,
]) {
  if (getLoanListAPIDataType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(getLoanListAPIDataType.toMap());

  // Handle nested data for "contract_details" field.
  addContractDetailsStructData(
    firestoreData,
    getLoanListAPIDataType.hasContractDetails()
        ? getLoanListAPIDataType.contractDetails
        : null,
    'contract_details',
    forFieldValue,
  );

  // Handle nested data for "payment_details" field.
  addPaymentDetailsStructData(
    firestoreData,
    getLoanListAPIDataType.hasPaymentDetails()
        ? getLoanListAPIDataType.paymentDetails
        : null,
    'payment_details',
    forFieldValue,
  );

  // Handle nested data for "barcode_details" field.
  addBarcodeDetailsStructData(
    firestoreData,
    getLoanListAPIDataType.hasBarcodeDetails()
        ? getLoanListAPIDataType.barcodeDetails
        : null,
    'barcode_details',
    forFieldValue,
  );

  // Handle nested data for "topup_detail" field.
  addTopupDetailStructData(
    firestoreData,
    getLoanListAPIDataType.hasTopupDetail()
        ? getLoanListAPIDataType.topupDetail
        : null,
    'topup_detail',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(getLoanListAPIDataType.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGetLoanListAPIDataTypeListFirestoreData(
  List<GetLoanListAPIDataTypeStruct>? getLoanListAPIDataTypes,
) =>
    getLoanListAPIDataTypes
        ?.map((e) => getGetLoanListAPIDataTypeFirestoreData(e, true))
        .toList() ??
    [];
