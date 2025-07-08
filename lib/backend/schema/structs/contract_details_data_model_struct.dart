// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ContractDetailsDataModelStruct extends FFFirebaseStruct {
  ContractDetailsDataModelStruct({
    int? closingBalance,
    String? comcode,
    String? branchCode,
    String? branchName,
    String? canTopup,
    String? collateralInformation,
    String? licensePlateProvince,
    String? licensePlateExpireDate,
    String? vehicleBrand,
    int? currentLtvAmount,
    int? creditLimit,
    int? financeAmount,
    int? osBalance,
    int? installmentAmount,
    int? currentDueAmount,
    String? currentDueDate,
    String? accountStatus,
    String? loanTypeCode,
    String? loanTypeName,
    String? loanTypeIcon,
    String? comcodeCode,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _closingBalance = closingBalance,
        _comcode = comcode,
        _branchCode = branchCode,
        _branchName = branchName,
        _canTopup = canTopup,
        _collateralInformation = collateralInformation,
        _licensePlateProvince = licensePlateProvince,
        _licensePlateExpireDate = licensePlateExpireDate,
        _vehicleBrand = vehicleBrand,
        _currentLtvAmount = currentLtvAmount,
        _creditLimit = creditLimit,
        _financeAmount = financeAmount,
        _osBalance = osBalance,
        _installmentAmount = installmentAmount,
        _currentDueAmount = currentDueAmount,
        _currentDueDate = currentDueDate,
        _accountStatus = accountStatus,
        _loanTypeCode = loanTypeCode,
        _loanTypeName = loanTypeName,
        _loanTypeIcon = loanTypeIcon,
        _comcodeCode = comcodeCode,
        super(firestoreUtilData);

  // "closing_balance" field.
  int? _closingBalance;
  int get closingBalance => _closingBalance ?? 0;
  set closingBalance(int? val) => _closingBalance = val;

  void incrementClosingBalance(int amount) =>
      closingBalance = closingBalance + amount;

  bool hasClosingBalance() => _closingBalance != null;

  // "comcode" field.
  String? _comcode;
  String get comcode => _comcode ?? '';
  set comcode(String? val) => _comcode = val;

  bool hasComcode() => _comcode != null;

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

  // "can_topup" field.
  String? _canTopup;
  String get canTopup => _canTopup ?? '';
  set canTopup(String? val) => _canTopup = val;

  bool hasCanTopup() => _canTopup != null;

  // "collateral_information" field.
  String? _collateralInformation;
  String get collateralInformation => _collateralInformation ?? '';
  set collateralInformation(String? val) => _collateralInformation = val;

  bool hasCollateralInformation() => _collateralInformation != null;

  // "license_plate_province" field.
  String? _licensePlateProvince;
  String get licensePlateProvince => _licensePlateProvince ?? '';
  set licensePlateProvince(String? val) => _licensePlateProvince = val;

  bool hasLicensePlateProvince() => _licensePlateProvince != null;

  // "license_plate_expire_date" field.
  String? _licensePlateExpireDate;
  String get licensePlateExpireDate => _licensePlateExpireDate ?? '';
  set licensePlateExpireDate(String? val) => _licensePlateExpireDate = val;

  bool hasLicensePlateExpireDate() => _licensePlateExpireDate != null;

  // "vehicle_brand" field.
  String? _vehicleBrand;
  String get vehicleBrand => _vehicleBrand ?? '';
  set vehicleBrand(String? val) => _vehicleBrand = val;

  bool hasVehicleBrand() => _vehicleBrand != null;

  // "current_ltv_amount" field.
  int? _currentLtvAmount;
  int get currentLtvAmount => _currentLtvAmount ?? 0;
  set currentLtvAmount(int? val) => _currentLtvAmount = val;

  void incrementCurrentLtvAmount(int amount) =>
      currentLtvAmount = currentLtvAmount + amount;

  bool hasCurrentLtvAmount() => _currentLtvAmount != null;

  // "credit_limit" field.
  int? _creditLimit;
  int get creditLimit => _creditLimit ?? 0;
  set creditLimit(int? val) => _creditLimit = val;

  void incrementCreditLimit(int amount) => creditLimit = creditLimit + amount;

  bool hasCreditLimit() => _creditLimit != null;

  // "finance_amount" field.
  int? _financeAmount;
  int get financeAmount => _financeAmount ?? 0;
  set financeAmount(int? val) => _financeAmount = val;

  void incrementFinanceAmount(int amount) =>
      financeAmount = financeAmount + amount;

  bool hasFinanceAmount() => _financeAmount != null;

  // "os_balance" field.
  int? _osBalance;
  int get osBalance => _osBalance ?? 0;
  set osBalance(int? val) => _osBalance = val;

  void incrementOsBalance(int amount) => osBalance = osBalance + amount;

  bool hasOsBalance() => _osBalance != null;

  // "installment_amount" field.
  int? _installmentAmount;
  int get installmentAmount => _installmentAmount ?? 0;
  set installmentAmount(int? val) => _installmentAmount = val;

  void incrementInstallmentAmount(int amount) =>
      installmentAmount = installmentAmount + amount;

  bool hasInstallmentAmount() => _installmentAmount != null;

  // "current_due_amount" field.
  int? _currentDueAmount;
  int get currentDueAmount => _currentDueAmount ?? 0;
  set currentDueAmount(int? val) => _currentDueAmount = val;

  void incrementCurrentDueAmount(int amount) =>
      currentDueAmount = currentDueAmount + amount;

  bool hasCurrentDueAmount() => _currentDueAmount != null;

  // "current_due_date" field.
  String? _currentDueDate;
  String get currentDueDate => _currentDueDate ?? '';
  set currentDueDate(String? val) => _currentDueDate = val;

  bool hasCurrentDueDate() => _currentDueDate != null;

  // "account_status" field.
  String? _accountStatus;
  String get accountStatus => _accountStatus ?? '';
  set accountStatus(String? val) => _accountStatus = val;

  bool hasAccountStatus() => _accountStatus != null;

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

  // "comcode_code" field.
  String? _comcodeCode;
  String get comcodeCode => _comcodeCode ?? '';
  set comcodeCode(String? val) => _comcodeCode = val;

  bool hasComcodeCode() => _comcodeCode != null;

  static ContractDetailsDataModelStruct fromMap(Map<String, dynamic> data) =>
      ContractDetailsDataModelStruct(
        closingBalance: castToType<int>(data['closing_balance']),
        comcode: data['comcode'] as String?,
        branchCode: data['branch_code'] as String?,
        branchName: data['branch_name'] as String?,
        canTopup: data['can_topup'] as String?,
        collateralInformation: data['collateral_information'] as String?,
        licensePlateProvince: data['license_plate_province'] as String?,
        licensePlateExpireDate: data['license_plate_expire_date'] as String?,
        vehicleBrand: data['vehicle_brand'] as String?,
        currentLtvAmount: castToType<int>(data['current_ltv_amount']),
        creditLimit: castToType<int>(data['credit_limit']),
        financeAmount: castToType<int>(data['finance_amount']),
        osBalance: castToType<int>(data['os_balance']),
        installmentAmount: castToType<int>(data['installment_amount']),
        currentDueAmount: castToType<int>(data['current_due_amount']),
        currentDueDate: data['current_due_date'] as String?,
        accountStatus: data['account_status'] as String?,
        loanTypeCode: data['loan_type_code'] as String?,
        loanTypeName: data['loan_type_name'] as String?,
        loanTypeIcon: data['loan_type_icon'] as String?,
        comcodeCode: data['comcode_code'] as String?,
      );

  static ContractDetailsDataModelStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? ContractDetailsDataModelStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'closing_balance': _closingBalance,
        'comcode': _comcode,
        'branch_code': _branchCode,
        'branch_name': _branchName,
        'can_topup': _canTopup,
        'collateral_information': _collateralInformation,
        'license_plate_province': _licensePlateProvince,
        'license_plate_expire_date': _licensePlateExpireDate,
        'vehicle_brand': _vehicleBrand,
        'current_ltv_amount': _currentLtvAmount,
        'credit_limit': _creditLimit,
        'finance_amount': _financeAmount,
        'os_balance': _osBalance,
        'installment_amount': _installmentAmount,
        'current_due_amount': _currentDueAmount,
        'current_due_date': _currentDueDate,
        'account_status': _accountStatus,
        'loan_type_code': _loanTypeCode,
        'loan_type_name': _loanTypeName,
        'loan_type_icon': _loanTypeIcon,
        'comcode_code': _comcodeCode,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'closing_balance': serializeParam(
          _closingBalance,
          ParamType.int,
        ),
        'comcode': serializeParam(
          _comcode,
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
        'can_topup': serializeParam(
          _canTopup,
          ParamType.String,
        ),
        'collateral_information': serializeParam(
          _collateralInformation,
          ParamType.String,
        ),
        'license_plate_province': serializeParam(
          _licensePlateProvince,
          ParamType.String,
        ),
        'license_plate_expire_date': serializeParam(
          _licensePlateExpireDate,
          ParamType.String,
        ),
        'vehicle_brand': serializeParam(
          _vehicleBrand,
          ParamType.String,
        ),
        'current_ltv_amount': serializeParam(
          _currentLtvAmount,
          ParamType.int,
        ),
        'credit_limit': serializeParam(
          _creditLimit,
          ParamType.int,
        ),
        'finance_amount': serializeParam(
          _financeAmount,
          ParamType.int,
        ),
        'os_balance': serializeParam(
          _osBalance,
          ParamType.int,
        ),
        'installment_amount': serializeParam(
          _installmentAmount,
          ParamType.int,
        ),
        'current_due_amount': serializeParam(
          _currentDueAmount,
          ParamType.int,
        ),
        'current_due_date': serializeParam(
          _currentDueDate,
          ParamType.String,
        ),
        'account_status': serializeParam(
          _accountStatus,
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
        'comcode_code': serializeParam(
          _comcodeCode,
          ParamType.String,
        ),
      }.withoutNulls;

  static ContractDetailsDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ContractDetailsDataModelStruct(
        closingBalance: deserializeParam(
          data['closing_balance'],
          ParamType.int,
          false,
        ),
        comcode: deserializeParam(
          data['comcode'],
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
        canTopup: deserializeParam(
          data['can_topup'],
          ParamType.String,
          false,
        ),
        collateralInformation: deserializeParam(
          data['collateral_information'],
          ParamType.String,
          false,
        ),
        licensePlateProvince: deserializeParam(
          data['license_plate_province'],
          ParamType.String,
          false,
        ),
        licensePlateExpireDate: deserializeParam(
          data['license_plate_expire_date'],
          ParamType.String,
          false,
        ),
        vehicleBrand: deserializeParam(
          data['vehicle_brand'],
          ParamType.String,
          false,
        ),
        currentLtvAmount: deserializeParam(
          data['current_ltv_amount'],
          ParamType.int,
          false,
        ),
        creditLimit: deserializeParam(
          data['credit_limit'],
          ParamType.int,
          false,
        ),
        financeAmount: deserializeParam(
          data['finance_amount'],
          ParamType.int,
          false,
        ),
        osBalance: deserializeParam(
          data['os_balance'],
          ParamType.int,
          false,
        ),
        installmentAmount: deserializeParam(
          data['installment_amount'],
          ParamType.int,
          false,
        ),
        currentDueAmount: deserializeParam(
          data['current_due_amount'],
          ParamType.int,
          false,
        ),
        currentDueDate: deserializeParam(
          data['current_due_date'],
          ParamType.String,
          false,
        ),
        accountStatus: deserializeParam(
          data['account_status'],
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
        comcodeCode: deserializeParam(
          data['comcode_code'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ContractDetailsDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ContractDetailsDataModelStruct &&
        closingBalance == other.closingBalance &&
        comcode == other.comcode &&
        branchCode == other.branchCode &&
        branchName == other.branchName &&
        canTopup == other.canTopup &&
        collateralInformation == other.collateralInformation &&
        licensePlateProvince == other.licensePlateProvince &&
        licensePlateExpireDate == other.licensePlateExpireDate &&
        vehicleBrand == other.vehicleBrand &&
        currentLtvAmount == other.currentLtvAmount &&
        creditLimit == other.creditLimit &&
        financeAmount == other.financeAmount &&
        osBalance == other.osBalance &&
        installmentAmount == other.installmentAmount &&
        currentDueAmount == other.currentDueAmount &&
        currentDueDate == other.currentDueDate &&
        accountStatus == other.accountStatus &&
        loanTypeCode == other.loanTypeCode &&
        loanTypeName == other.loanTypeName &&
        loanTypeIcon == other.loanTypeIcon &&
        comcodeCode == other.comcodeCode;
  }

  @override
  int get hashCode => const ListEquality().hash([
        closingBalance,
        comcode,
        branchCode,
        branchName,
        canTopup,
        collateralInformation,
        licensePlateProvince,
        licensePlateExpireDate,
        vehicleBrand,
        currentLtvAmount,
        creditLimit,
        financeAmount,
        osBalance,
        installmentAmount,
        currentDueAmount,
        currentDueDate,
        accountStatus,
        loanTypeCode,
        loanTypeName,
        loanTypeIcon,
        comcodeCode
      ]);
}

ContractDetailsDataModelStruct createContractDetailsDataModelStruct({
  int? closingBalance,
  String? comcode,
  String? branchCode,
  String? branchName,
  String? canTopup,
  String? collateralInformation,
  String? licensePlateProvince,
  String? licensePlateExpireDate,
  String? vehicleBrand,
  int? currentLtvAmount,
  int? creditLimit,
  int? financeAmount,
  int? osBalance,
  int? installmentAmount,
  int? currentDueAmount,
  String? currentDueDate,
  String? accountStatus,
  String? loanTypeCode,
  String? loanTypeName,
  String? loanTypeIcon,
  String? comcodeCode,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ContractDetailsDataModelStruct(
      closingBalance: closingBalance,
      comcode: comcode,
      branchCode: branchCode,
      branchName: branchName,
      canTopup: canTopup,
      collateralInformation: collateralInformation,
      licensePlateProvince: licensePlateProvince,
      licensePlateExpireDate: licensePlateExpireDate,
      vehicleBrand: vehicleBrand,
      currentLtvAmount: currentLtvAmount,
      creditLimit: creditLimit,
      financeAmount: financeAmount,
      osBalance: osBalance,
      installmentAmount: installmentAmount,
      currentDueAmount: currentDueAmount,
      currentDueDate: currentDueDate,
      accountStatus: accountStatus,
      loanTypeCode: loanTypeCode,
      loanTypeName: loanTypeName,
      loanTypeIcon: loanTypeIcon,
      comcodeCode: comcodeCode,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ContractDetailsDataModelStruct? updateContractDetailsDataModelStruct(
  ContractDetailsDataModelStruct? contractDetailsDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    contractDetailsDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addContractDetailsDataModelStructData(
  Map<String, dynamic> firestoreData,
  ContractDetailsDataModelStruct? contractDetailsDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (contractDetailsDataModel == null) {
    return;
  }
  if (contractDetailsDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      contractDetailsDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final contractDetailsDataModelData = getContractDetailsDataModelFirestoreData(
      contractDetailsDataModel, forFieldValue);
  final nestedData =
      contractDetailsDataModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      contractDetailsDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getContractDetailsDataModelFirestoreData(
  ContractDetailsDataModelStruct? contractDetailsDataModel, [
  bool forFieldValue = false,
]) {
  if (contractDetailsDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(contractDetailsDataModel.toMap());

  // Add any Firestore field values
  contractDetailsDataModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getContractDetailsDataModelListFirestoreData(
  List<ContractDetailsDataModelStruct>? contractDetailsDataModels,
) =>
    contractDetailsDataModels
        ?.map((e) => getContractDetailsDataModelFirestoreData(e, true))
        .toList() ??
    [];
