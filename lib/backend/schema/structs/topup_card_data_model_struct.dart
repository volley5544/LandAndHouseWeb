// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TopupCardDataModelStruct extends FFFirebaseStruct {
  TopupCardDataModelStruct({
    String? contractName,
    String? branchCode,
    String? branchName,
    String? branchImage,
    String? dbName,
    String? contractNo,
    String? contractBankType,
    String? contractBankAccount,
    String? contractBankBrandname,
    String? contractDate,
    String? contractCloseDate,
    String? contractBranchCreatedName,
    String? loanTypeCode,
    String? loanTypeName,
    List<String>? insurances,
    String? dataDate,
    String? transno,
    int? requestTopupAmount,
    String? requestDate,
    String? requestStatus,
    ContractDetailsDataModelStruct? contractDetails,
    PaymentDetailsDataModelStruct? paymentDetails,
    BarcodeDetailsDataModelStruct? barcodeDetails,
    TopupDetailDataModelStruct? topupDetail,
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
        _contractDate = contractDate,
        _contractCloseDate = contractCloseDate,
        _contractBranchCreatedName = contractBranchCreatedName,
        _loanTypeCode = loanTypeCode,
        _loanTypeName = loanTypeName,
        _insurances = insurances,
        _dataDate = dataDate,
        _transno = transno,
        _requestTopupAmount = requestTopupAmount,
        _requestDate = requestDate,
        _requestStatus = requestStatus,
        _contractDetails = contractDetails,
        _paymentDetails = paymentDetails,
        _barcodeDetails = barcodeDetails,
        _topupDetail = topupDetail,
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

  // "insurances" field.
  List<String>? _insurances;
  List<String> get insurances => _insurances ?? const [];
  set insurances(List<String>? val) => _insurances = val;

  void updateInsurances(Function(List<String>) updateFn) {
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

  // "contract_details" field.
  ContractDetailsDataModelStruct? _contractDetails;
  ContractDetailsDataModelStruct get contractDetails =>
      _contractDetails ?? ContractDetailsDataModelStruct();
  set contractDetails(ContractDetailsDataModelStruct? val) =>
      _contractDetails = val;

  void updateContractDetails(
      Function(ContractDetailsDataModelStruct) updateFn) {
    updateFn(_contractDetails ??= ContractDetailsDataModelStruct());
  }

  bool hasContractDetails() => _contractDetails != null;

  // "payment_details" field.
  PaymentDetailsDataModelStruct? _paymentDetails;
  PaymentDetailsDataModelStruct get paymentDetails =>
      _paymentDetails ?? PaymentDetailsDataModelStruct();
  set paymentDetails(PaymentDetailsDataModelStruct? val) =>
      _paymentDetails = val;

  void updatePaymentDetails(Function(PaymentDetailsDataModelStruct) updateFn) {
    updateFn(_paymentDetails ??= PaymentDetailsDataModelStruct());
  }

  bool hasPaymentDetails() => _paymentDetails != null;

  // "barcode_details" field.
  BarcodeDetailsDataModelStruct? _barcodeDetails;
  BarcodeDetailsDataModelStruct get barcodeDetails =>
      _barcodeDetails ?? BarcodeDetailsDataModelStruct();
  set barcodeDetails(BarcodeDetailsDataModelStruct? val) =>
      _barcodeDetails = val;

  void updateBarcodeDetails(Function(BarcodeDetailsDataModelStruct) updateFn) {
    updateFn(_barcodeDetails ??= BarcodeDetailsDataModelStruct());
  }

  bool hasBarcodeDetails() => _barcodeDetails != null;

  // "topup_detail" field.
  TopupDetailDataModelStruct? _topupDetail;
  TopupDetailDataModelStruct get topupDetail =>
      _topupDetail ?? TopupDetailDataModelStruct();
  set topupDetail(TopupDetailDataModelStruct? val) => _topupDetail = val;

  void updateTopupDetail(Function(TopupDetailDataModelStruct) updateFn) {
    updateFn(_topupDetail ??= TopupDetailDataModelStruct());
  }

  bool hasTopupDetail() => _topupDetail != null;

  static TopupCardDataModelStruct fromMap(Map<String, dynamic> data) =>
      TopupCardDataModelStruct(
        contractName: data['contract_name'] as String?,
        branchCode: data['branch_code'] as String?,
        branchName: data['branch_name'] as String?,
        branchImage: data['branch_image'] as String?,
        dbName: data['db_name'] as String?,
        contractNo: data['contract_no'] as String?,
        contractBankType: data['contract_bank_type'] as String?,
        contractBankAccount: data['contract_bank_account'] as String?,
        contractBankBrandname: data['contract_bank_brandname'] as String?,
        contractDate: data['contract_date'] as String?,
        contractCloseDate: data['contract_close_date'] as String?,
        contractBranchCreatedName:
            data['contract_branch_created_name'] as String?,
        loanTypeCode: data['loan_type_code'] as String?,
        loanTypeName: data['loan_type_name'] as String?,
        insurances: getDataList(data['insurances']),
        dataDate: data['data_date'] as String?,
        transno: data['transno'] as String?,
        requestTopupAmount: castToType<int>(data['request_topup_amount']),
        requestDate: data['request_date'] as String?,
        requestStatus: data['request_status'] as String?,
        contractDetails:
            data['contract_details'] is ContractDetailsDataModelStruct
                ? data['contract_details']
                : ContractDetailsDataModelStruct.maybeFromMap(
                    data['contract_details']),
        paymentDetails: data['payment_details'] is PaymentDetailsDataModelStruct
            ? data['payment_details']
            : PaymentDetailsDataModelStruct.maybeFromMap(
                data['payment_details']),
        barcodeDetails: data['barcode_details'] is BarcodeDetailsDataModelStruct
            ? data['barcode_details']
            : BarcodeDetailsDataModelStruct.maybeFromMap(
                data['barcode_details']),
        topupDetail: data['topup_detail'] is TopupDetailDataModelStruct
            ? data['topup_detail']
            : TopupDetailDataModelStruct.maybeFromMap(data['topup_detail']),
      );

  static TopupCardDataModelStruct? maybeFromMap(dynamic data) => data is Map
      ? TopupCardDataModelStruct.fromMap(data.cast<String, dynamic>())
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
        'contract_date': _contractDate,
        'contract_close_date': _contractCloseDate,
        'contract_branch_created_name': _contractBranchCreatedName,
        'loan_type_code': _loanTypeCode,
        'loan_type_name': _loanTypeName,
        'insurances': _insurances,
        'data_date': _dataDate,
        'transno': _transno,
        'request_topup_amount': _requestTopupAmount,
        'request_date': _requestDate,
        'request_status': _requestStatus,
        'contract_details': _contractDetails?.toMap(),
        'payment_details': _paymentDetails?.toMap(),
        'barcode_details': _barcodeDetails?.toMap(),
        'topup_detail': _topupDetail?.toMap(),
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
        'insurances': serializeParam(
          _insurances,
          ParamType.String,
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
        'contract_details': serializeParam(
          _contractDetails,
          ParamType.DataStruct,
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
      }.withoutNulls;

  static TopupCardDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TopupCardDataModelStruct(
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
        insurances: deserializeParam<String>(
          data['insurances'],
          ParamType.String,
          true,
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
        contractDetails: deserializeStructParam(
          data['contract_details'],
          ParamType.DataStruct,
          false,
          structBuilder: ContractDetailsDataModelStruct.fromSerializableMap,
        ),
        paymentDetails: deserializeStructParam(
          data['payment_details'],
          ParamType.DataStruct,
          false,
          structBuilder: PaymentDetailsDataModelStruct.fromSerializableMap,
        ),
        barcodeDetails: deserializeStructParam(
          data['barcode_details'],
          ParamType.DataStruct,
          false,
          structBuilder: BarcodeDetailsDataModelStruct.fromSerializableMap,
        ),
        topupDetail: deserializeStructParam(
          data['topup_detail'],
          ParamType.DataStruct,
          false,
          structBuilder: TopupDetailDataModelStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'TopupCardDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TopupCardDataModelStruct &&
        contractName == other.contractName &&
        branchCode == other.branchCode &&
        branchName == other.branchName &&
        branchImage == other.branchImage &&
        dbName == other.dbName &&
        contractNo == other.contractNo &&
        contractBankType == other.contractBankType &&
        contractBankAccount == other.contractBankAccount &&
        contractBankBrandname == other.contractBankBrandname &&
        contractDate == other.contractDate &&
        contractCloseDate == other.contractCloseDate &&
        contractBranchCreatedName == other.contractBranchCreatedName &&
        loanTypeCode == other.loanTypeCode &&
        loanTypeName == other.loanTypeName &&
        listEquality.equals(insurances, other.insurances) &&
        dataDate == other.dataDate &&
        transno == other.transno &&
        requestTopupAmount == other.requestTopupAmount &&
        requestDate == other.requestDate &&
        requestStatus == other.requestStatus &&
        contractDetails == other.contractDetails &&
        paymentDetails == other.paymentDetails &&
        barcodeDetails == other.barcodeDetails &&
        topupDetail == other.topupDetail;
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
        contractDate,
        contractCloseDate,
        contractBranchCreatedName,
        loanTypeCode,
        loanTypeName,
        insurances,
        dataDate,
        transno,
        requestTopupAmount,
        requestDate,
        requestStatus,
        contractDetails,
        paymentDetails,
        barcodeDetails,
        topupDetail
      ]);
}

TopupCardDataModelStruct createTopupCardDataModelStruct({
  String? contractName,
  String? branchCode,
  String? branchName,
  String? branchImage,
  String? dbName,
  String? contractNo,
  String? contractBankType,
  String? contractBankAccount,
  String? contractBankBrandname,
  String? contractDate,
  String? contractCloseDate,
  String? contractBranchCreatedName,
  String? loanTypeCode,
  String? loanTypeName,
  String? dataDate,
  String? transno,
  int? requestTopupAmount,
  String? requestDate,
  String? requestStatus,
  ContractDetailsDataModelStruct? contractDetails,
  PaymentDetailsDataModelStruct? paymentDetails,
  BarcodeDetailsDataModelStruct? barcodeDetails,
  TopupDetailDataModelStruct? topupDetail,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TopupCardDataModelStruct(
      contractName: contractName,
      branchCode: branchCode,
      branchName: branchName,
      branchImage: branchImage,
      dbName: dbName,
      contractNo: contractNo,
      contractBankType: contractBankType,
      contractBankAccount: contractBankAccount,
      contractBankBrandname: contractBankBrandname,
      contractDate: contractDate,
      contractCloseDate: contractCloseDate,
      contractBranchCreatedName: contractBranchCreatedName,
      loanTypeCode: loanTypeCode,
      loanTypeName: loanTypeName,
      dataDate: dataDate,
      transno: transno,
      requestTopupAmount: requestTopupAmount,
      requestDate: requestDate,
      requestStatus: requestStatus,
      contractDetails: contractDetails ??
          (clearUnsetFields ? ContractDetailsDataModelStruct() : null),
      paymentDetails: paymentDetails ??
          (clearUnsetFields ? PaymentDetailsDataModelStruct() : null),
      barcodeDetails: barcodeDetails ??
          (clearUnsetFields ? BarcodeDetailsDataModelStruct() : null),
      topupDetail: topupDetail ??
          (clearUnsetFields ? TopupDetailDataModelStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TopupCardDataModelStruct? updateTopupCardDataModelStruct(
  TopupCardDataModelStruct? topupCardDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    topupCardDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTopupCardDataModelStructData(
  Map<String, dynamic> firestoreData,
  TopupCardDataModelStruct? topupCardDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (topupCardDataModel == null) {
    return;
  }
  if (topupCardDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && topupCardDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final topupCardDataModelData =
      getTopupCardDataModelFirestoreData(topupCardDataModel, forFieldValue);
  final nestedData =
      topupCardDataModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      topupCardDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTopupCardDataModelFirestoreData(
  TopupCardDataModelStruct? topupCardDataModel, [
  bool forFieldValue = false,
]) {
  if (topupCardDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(topupCardDataModel.toMap());

  // Handle nested data for "contract_details" field.
  addContractDetailsDataModelStructData(
    firestoreData,
    topupCardDataModel.hasContractDetails()
        ? topupCardDataModel.contractDetails
        : null,
    'contract_details',
    forFieldValue,
  );

  // Handle nested data for "payment_details" field.
  addPaymentDetailsDataModelStructData(
    firestoreData,
    topupCardDataModel.hasPaymentDetails()
        ? topupCardDataModel.paymentDetails
        : null,
    'payment_details',
    forFieldValue,
  );

  // Handle nested data for "barcode_details" field.
  addBarcodeDetailsDataModelStructData(
    firestoreData,
    topupCardDataModel.hasBarcodeDetails()
        ? topupCardDataModel.barcodeDetails
        : null,
    'barcode_details',
    forFieldValue,
  );

  // Handle nested data for "topup_detail" field.
  addTopupDetailDataModelStructData(
    firestoreData,
    topupCardDataModel.hasTopupDetail() ? topupCardDataModel.topupDetail : null,
    'topup_detail',
    forFieldValue,
  );

  // Add any Firestore field values
  topupCardDataModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTopupCardDataModelListFirestoreData(
  List<TopupCardDataModelStruct>? topupCardDataModels,
) =>
    topupCardDataModels
        ?.map((e) => getTopupCardDataModelFirestoreData(e, true))
        .toList() ??
    [];
