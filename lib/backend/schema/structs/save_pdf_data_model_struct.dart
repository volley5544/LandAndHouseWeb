// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SavePdfDataModelStruct extends FFFirebaseStruct {
  SavePdfDataModelStruct({
    String? contractNo,
    String? dbName,
    String? contractDate,
    int? amount,
    String? from,
    String? contractBankAccount,
    String? contractBankBrandname,
    String? contractBankType,
    String? contractBankBranch,
    int? interestRate,
    int? installmentNumber,
    int? amountPerInstallment,
    String? startInstallmentDate,
    String? installmentDate,
    String? vehicleType,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _contractNo = contractNo,
        _dbName = dbName,
        _contractDate = contractDate,
        _amount = amount,
        _from = from,
        _contractBankAccount = contractBankAccount,
        _contractBankBrandname = contractBankBrandname,
        _contractBankType = contractBankType,
        _contractBankBranch = contractBankBranch,
        _interestRate = interestRate,
        _installmentNumber = installmentNumber,
        _amountPerInstallment = amountPerInstallment,
        _startInstallmentDate = startInstallmentDate,
        _installmentDate = installmentDate,
        _vehicleType = vehicleType,
        super(firestoreUtilData);

  // "contract_no" field.
  String? _contractNo;
  String get contractNo => _contractNo ?? '';
  set contractNo(String? val) => _contractNo = val;

  bool hasContractNo() => _contractNo != null;

  // "db_name" field.
  String? _dbName;
  String get dbName => _dbName ?? '';
  set dbName(String? val) => _dbName = val;

  bool hasDbName() => _dbName != null;

  // "contract_date" field.
  String? _contractDate;
  String get contractDate => _contractDate ?? '';
  set contractDate(String? val) => _contractDate = val;

  bool hasContractDate() => _contractDate != null;

  // "amount" field.
  int? _amount;
  int get amount => _amount ?? 0;
  set amount(int? val) => _amount = val;

  void incrementAmount(int amount) => amount = amount + amount;

  bool hasAmount() => _amount != null;

  // "from" field.
  String? _from;
  String get from => _from ?? '';
  set from(String? val) => _from = val;

  bool hasFrom() => _from != null;

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

  // "contract_bank_type" field.
  String? _contractBankType;
  String get contractBankType => _contractBankType ?? '';
  set contractBankType(String? val) => _contractBankType = val;

  bool hasContractBankType() => _contractBankType != null;

  // "contract_bank_branch" field.
  String? _contractBankBranch;
  String get contractBankBranch => _contractBankBranch ?? '';
  set contractBankBranch(String? val) => _contractBankBranch = val;

  bool hasContractBankBranch() => _contractBankBranch != null;

  // "interest_rate" field.
  int? _interestRate;
  int get interestRate => _interestRate ?? 0;
  set interestRate(int? val) => _interestRate = val;

  void incrementInterestRate(int amount) =>
      interestRate = interestRate + amount;

  bool hasInterestRate() => _interestRate != null;

  // "installment_number" field.
  int? _installmentNumber;
  int get installmentNumber => _installmentNumber ?? 0;
  set installmentNumber(int? val) => _installmentNumber = val;

  void incrementInstallmentNumber(int amount) =>
      installmentNumber = installmentNumber + amount;

  bool hasInstallmentNumber() => _installmentNumber != null;

  // "amount_per_installment" field.
  int? _amountPerInstallment;
  int get amountPerInstallment => _amountPerInstallment ?? 0;
  set amountPerInstallment(int? val) => _amountPerInstallment = val;

  void incrementAmountPerInstallment(int amount) =>
      amountPerInstallment = amountPerInstallment + amount;

  bool hasAmountPerInstallment() => _amountPerInstallment != null;

  // "start_installment_date" field.
  String? _startInstallmentDate;
  String get startInstallmentDate => _startInstallmentDate ?? '';
  set startInstallmentDate(String? val) => _startInstallmentDate = val;

  bool hasStartInstallmentDate() => _startInstallmentDate != null;

  // "installment_date" field.
  String? _installmentDate;
  String get installmentDate => _installmentDate ?? '';
  set installmentDate(String? val) => _installmentDate = val;

  bool hasInstallmentDate() => _installmentDate != null;

  // "vehicle_type" field.
  String? _vehicleType;
  String get vehicleType => _vehicleType ?? '';
  set vehicleType(String? val) => _vehicleType = val;

  bool hasVehicleType() => _vehicleType != null;

  static SavePdfDataModelStruct fromMap(Map<String, dynamic> data) =>
      SavePdfDataModelStruct(
        contractNo: data['contract_no'] as String?,
        dbName: data['db_name'] as String?,
        contractDate: data['contract_date'] as String?,
        amount: castToType<int>(data['amount']),
        from: data['from'] as String?,
        contractBankAccount: data['contract_bank_account'] as String?,
        contractBankBrandname: data['contract_bank_brandname'] as String?,
        contractBankType: data['contract_bank_type'] as String?,
        contractBankBranch: data['contract_bank_branch'] as String?,
        interestRate: castToType<int>(data['interest_rate']),
        installmentNumber: castToType<int>(data['installment_number']),
        amountPerInstallment: castToType<int>(data['amount_per_installment']),
        startInstallmentDate: data['start_installment_date'] as String?,
        installmentDate: data['installment_date'] as String?,
        vehicleType: data['vehicle_type'] as String?,
      );

  static SavePdfDataModelStruct? maybeFromMap(dynamic data) => data is Map
      ? SavePdfDataModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'contract_no': _contractNo,
        'db_name': _dbName,
        'contract_date': _contractDate,
        'amount': _amount,
        'from': _from,
        'contract_bank_account': _contractBankAccount,
        'contract_bank_brandname': _contractBankBrandname,
        'contract_bank_type': _contractBankType,
        'contract_bank_branch': _contractBankBranch,
        'interest_rate': _interestRate,
        'installment_number': _installmentNumber,
        'amount_per_installment': _amountPerInstallment,
        'start_installment_date': _startInstallmentDate,
        'installment_date': _installmentDate,
        'vehicle_type': _vehicleType,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'contract_no': serializeParam(
          _contractNo,
          ParamType.String,
        ),
        'db_name': serializeParam(
          _dbName,
          ParamType.String,
        ),
        'contract_date': serializeParam(
          _contractDate,
          ParamType.String,
        ),
        'amount': serializeParam(
          _amount,
          ParamType.int,
        ),
        'from': serializeParam(
          _from,
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
        'contract_bank_type': serializeParam(
          _contractBankType,
          ParamType.String,
        ),
        'contract_bank_branch': serializeParam(
          _contractBankBranch,
          ParamType.String,
        ),
        'interest_rate': serializeParam(
          _interestRate,
          ParamType.int,
        ),
        'installment_number': serializeParam(
          _installmentNumber,
          ParamType.int,
        ),
        'amount_per_installment': serializeParam(
          _amountPerInstallment,
          ParamType.int,
        ),
        'start_installment_date': serializeParam(
          _startInstallmentDate,
          ParamType.String,
        ),
        'installment_date': serializeParam(
          _installmentDate,
          ParamType.String,
        ),
        'vehicle_type': serializeParam(
          _vehicleType,
          ParamType.String,
        ),
      }.withoutNulls;

  static SavePdfDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SavePdfDataModelStruct(
        contractNo: deserializeParam(
          data['contract_no'],
          ParamType.String,
          false,
        ),
        dbName: deserializeParam(
          data['db_name'],
          ParamType.String,
          false,
        ),
        contractDate: deserializeParam(
          data['contract_date'],
          ParamType.String,
          false,
        ),
        amount: deserializeParam(
          data['amount'],
          ParamType.int,
          false,
        ),
        from: deserializeParam(
          data['from'],
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
        contractBankType: deserializeParam(
          data['contract_bank_type'],
          ParamType.String,
          false,
        ),
        contractBankBranch: deserializeParam(
          data['contract_bank_branch'],
          ParamType.String,
          false,
        ),
        interestRate: deserializeParam(
          data['interest_rate'],
          ParamType.int,
          false,
        ),
        installmentNumber: deserializeParam(
          data['installment_number'],
          ParamType.int,
          false,
        ),
        amountPerInstallment: deserializeParam(
          data['amount_per_installment'],
          ParamType.int,
          false,
        ),
        startInstallmentDate: deserializeParam(
          data['start_installment_date'],
          ParamType.String,
          false,
        ),
        installmentDate: deserializeParam(
          data['installment_date'],
          ParamType.String,
          false,
        ),
        vehicleType: deserializeParam(
          data['vehicle_type'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SavePdfDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SavePdfDataModelStruct &&
        contractNo == other.contractNo &&
        dbName == other.dbName &&
        contractDate == other.contractDate &&
        amount == other.amount &&
        from == other.from &&
        contractBankAccount == other.contractBankAccount &&
        contractBankBrandname == other.contractBankBrandname &&
        contractBankType == other.contractBankType &&
        contractBankBranch == other.contractBankBranch &&
        interestRate == other.interestRate &&
        installmentNumber == other.installmentNumber &&
        amountPerInstallment == other.amountPerInstallment &&
        startInstallmentDate == other.startInstallmentDate &&
        installmentDate == other.installmentDate &&
        vehicleType == other.vehicleType;
  }

  @override
  int get hashCode => const ListEquality().hash([
        contractNo,
        dbName,
        contractDate,
        amount,
        from,
        contractBankAccount,
        contractBankBrandname,
        contractBankType,
        contractBankBranch,
        interestRate,
        installmentNumber,
        amountPerInstallment,
        startInstallmentDate,
        installmentDate,
        vehicleType
      ]);
}

SavePdfDataModelStruct createSavePdfDataModelStruct({
  String? contractNo,
  String? dbName,
  String? contractDate,
  int? amount,
  String? from,
  String? contractBankAccount,
  String? contractBankBrandname,
  String? contractBankType,
  String? contractBankBranch,
  int? interestRate,
  int? installmentNumber,
  int? amountPerInstallment,
  String? startInstallmentDate,
  String? installmentDate,
  String? vehicleType,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SavePdfDataModelStruct(
      contractNo: contractNo,
      dbName: dbName,
      contractDate: contractDate,
      amount: amount,
      from: from,
      contractBankAccount: contractBankAccount,
      contractBankBrandname: contractBankBrandname,
      contractBankType: contractBankType,
      contractBankBranch: contractBankBranch,
      interestRate: interestRate,
      installmentNumber: installmentNumber,
      amountPerInstallment: amountPerInstallment,
      startInstallmentDate: startInstallmentDate,
      installmentDate: installmentDate,
      vehicleType: vehicleType,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SavePdfDataModelStruct? updateSavePdfDataModelStruct(
  SavePdfDataModelStruct? savePdfDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    savePdfDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSavePdfDataModelStructData(
  Map<String, dynamic> firestoreData,
  SavePdfDataModelStruct? savePdfDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (savePdfDataModel == null) {
    return;
  }
  if (savePdfDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && savePdfDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final savePdfDataModelData =
      getSavePdfDataModelFirestoreData(savePdfDataModel, forFieldValue);
  final nestedData =
      savePdfDataModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = savePdfDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSavePdfDataModelFirestoreData(
  SavePdfDataModelStruct? savePdfDataModel, [
  bool forFieldValue = false,
]) {
  if (savePdfDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(savePdfDataModel.toMap());

  // Add any Firestore field values
  savePdfDataModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSavePdfDataModelListFirestoreData(
  List<SavePdfDataModelStruct>? savePdfDataModels,
) =>
    savePdfDataModels
        ?.map((e) => getSavePdfDataModelFirestoreData(e, true))
        .toList() ??
    [];
