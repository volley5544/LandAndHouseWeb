// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ComcodeConfigModelStruct extends FFFirebaseStruct {
  ComcodeConfigModelStruct({
    List<String>? checkContractDate,
    List<String>? exceptionContract,
    LoanTypeCodeStruct? loanTypeCode,
    List<bool>? thisComcodeIsContract,
    String? contractDefaultDate,
    List<String>? comcode,
    List<String>? exceptionContractComcode,
    List<String>? buttonName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _checkContractDate = checkContractDate,
        _exceptionContract = exceptionContract,
        _loanTypeCode = loanTypeCode,
        _thisComcodeIsContract = thisComcodeIsContract,
        _contractDefaultDate = contractDefaultDate,
        _comcode = comcode,
        _exceptionContractComcode = exceptionContractComcode,
        _buttonName = buttonName,
        super(firestoreUtilData);

  // "check_contract_date" field.
  List<String>? _checkContractDate;
  List<String> get checkContractDate => _checkContractDate ?? const [];
  set checkContractDate(List<String>? val) => _checkContractDate = val;

  void updateCheckContractDate(Function(List<String>) updateFn) {
    updateFn(_checkContractDate ??= []);
  }

  bool hasCheckContractDate() => _checkContractDate != null;

  // "exception_contract" field.
  List<String>? _exceptionContract;
  List<String> get exceptionContract => _exceptionContract ?? const [];
  set exceptionContract(List<String>? val) => _exceptionContract = val;

  void updateExceptionContract(Function(List<String>) updateFn) {
    updateFn(_exceptionContract ??= []);
  }

  bool hasExceptionContract() => _exceptionContract != null;

  // "loan_type_code" field.
  LoanTypeCodeStruct? _loanTypeCode;
  LoanTypeCodeStruct get loanTypeCode => _loanTypeCode ?? LoanTypeCodeStruct();
  set loanTypeCode(LoanTypeCodeStruct? val) => _loanTypeCode = val;

  void updateLoanTypeCode(Function(LoanTypeCodeStruct) updateFn) {
    updateFn(_loanTypeCode ??= LoanTypeCodeStruct());
  }

  bool hasLoanTypeCode() => _loanTypeCode != null;

  // "this_comcode_is_contract" field.
  List<bool>? _thisComcodeIsContract;
  List<bool> get thisComcodeIsContract => _thisComcodeIsContract ?? const [];
  set thisComcodeIsContract(List<bool>? val) => _thisComcodeIsContract = val;

  void updateThisComcodeIsContract(Function(List<bool>) updateFn) {
    updateFn(_thisComcodeIsContract ??= []);
  }

  bool hasThisComcodeIsContract() => _thisComcodeIsContract != null;

  // "contract_default_date" field.
  String? _contractDefaultDate;
  String get contractDefaultDate => _contractDefaultDate ?? '';
  set contractDefaultDate(String? val) => _contractDefaultDate = val;

  bool hasContractDefaultDate() => _contractDefaultDate != null;

  // "comcode" field.
  List<String>? _comcode;
  List<String> get comcode => _comcode ?? const [];
  set comcode(List<String>? val) => _comcode = val;

  void updateComcode(Function(List<String>) updateFn) {
    updateFn(_comcode ??= []);
  }

  bool hasComcode() => _comcode != null;

  // "exception_contract_comcode" field.
  List<String>? _exceptionContractComcode;
  List<String> get exceptionContractComcode =>
      _exceptionContractComcode ?? const [];
  set exceptionContractComcode(List<String>? val) =>
      _exceptionContractComcode = val;

  void updateExceptionContractComcode(Function(List<String>) updateFn) {
    updateFn(_exceptionContractComcode ??= []);
  }

  bool hasExceptionContractComcode() => _exceptionContractComcode != null;

  // "button_name" field.
  List<String>? _buttonName;
  List<String> get buttonName => _buttonName ?? const [];
  set buttonName(List<String>? val) => _buttonName = val;

  void updateButtonName(Function(List<String>) updateFn) {
    updateFn(_buttonName ??= []);
  }

  bool hasButtonName() => _buttonName != null;

  static ComcodeConfigModelStruct fromMap(Map<String, dynamic> data) =>
      ComcodeConfigModelStruct(
        checkContractDate: getDataList(data['check_contract_date']),
        exceptionContract: getDataList(data['exception_contract']),
        loanTypeCode: data['loan_type_code'] is LoanTypeCodeStruct
            ? data['loan_type_code']
            : LoanTypeCodeStruct.maybeFromMap(data['loan_type_code']),
        thisComcodeIsContract: getDataList(data['this_comcode_is_contract']),
        contractDefaultDate: data['contract_default_date'] as String?,
        comcode: getDataList(data['comcode']),
        exceptionContractComcode:
            getDataList(data['exception_contract_comcode']),
        buttonName: getDataList(data['button_name']),
      );

  static ComcodeConfigModelStruct? maybeFromMap(dynamic data) => data is Map
      ? ComcodeConfigModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'check_contract_date': _checkContractDate,
        'exception_contract': _exceptionContract,
        'loan_type_code': _loanTypeCode?.toMap(),
        'this_comcode_is_contract': _thisComcodeIsContract,
        'contract_default_date': _contractDefaultDate,
        'comcode': _comcode,
        'exception_contract_comcode': _exceptionContractComcode,
        'button_name': _buttonName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'check_contract_date': serializeParam(
          _checkContractDate,
          ParamType.String,
          isList: true,
        ),
        'exception_contract': serializeParam(
          _exceptionContract,
          ParamType.String,
          isList: true,
        ),
        'loan_type_code': serializeParam(
          _loanTypeCode,
          ParamType.DataStruct,
        ),
        'this_comcode_is_contract': serializeParam(
          _thisComcodeIsContract,
          ParamType.bool,
          isList: true,
        ),
        'contract_default_date': serializeParam(
          _contractDefaultDate,
          ParamType.String,
        ),
        'comcode': serializeParam(
          _comcode,
          ParamType.String,
          isList: true,
        ),
        'exception_contract_comcode': serializeParam(
          _exceptionContractComcode,
          ParamType.String,
          isList: true,
        ),
        'button_name': serializeParam(
          _buttonName,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static ComcodeConfigModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ComcodeConfigModelStruct(
        checkContractDate: deserializeParam<String>(
          data['check_contract_date'],
          ParamType.String,
          true,
        ),
        exceptionContract: deserializeParam<String>(
          data['exception_contract'],
          ParamType.String,
          true,
        ),
        loanTypeCode: deserializeStructParam(
          data['loan_type_code'],
          ParamType.DataStruct,
          false,
          structBuilder: LoanTypeCodeStruct.fromSerializableMap,
        ),
        thisComcodeIsContract: deserializeParam<bool>(
          data['this_comcode_is_contract'],
          ParamType.bool,
          true,
        ),
        contractDefaultDate: deserializeParam(
          data['contract_default_date'],
          ParamType.String,
          false,
        ),
        comcode: deserializeParam<String>(
          data['comcode'],
          ParamType.String,
          true,
        ),
        exceptionContractComcode: deserializeParam<String>(
          data['exception_contract_comcode'],
          ParamType.String,
          true,
        ),
        buttonName: deserializeParam<String>(
          data['button_name'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'ComcodeConfigModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ComcodeConfigModelStruct &&
        listEquality.equals(checkContractDate, other.checkContractDate) &&
        listEquality.equals(exceptionContract, other.exceptionContract) &&
        loanTypeCode == other.loanTypeCode &&
        listEquality.equals(
            thisComcodeIsContract, other.thisComcodeIsContract) &&
        contractDefaultDate == other.contractDefaultDate &&
        listEquality.equals(comcode, other.comcode) &&
        listEquality.equals(
            exceptionContractComcode, other.exceptionContractComcode) &&
        listEquality.equals(buttonName, other.buttonName);
  }

  @override
  int get hashCode => const ListEquality().hash([
        checkContractDate,
        exceptionContract,
        loanTypeCode,
        thisComcodeIsContract,
        contractDefaultDate,
        comcode,
        exceptionContractComcode,
        buttonName
      ]);
}

ComcodeConfigModelStruct createComcodeConfigModelStruct({
  LoanTypeCodeStruct? loanTypeCode,
  String? contractDefaultDate,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ComcodeConfigModelStruct(
      loanTypeCode:
          loanTypeCode ?? (clearUnsetFields ? LoanTypeCodeStruct() : null),
      contractDefaultDate: contractDefaultDate,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ComcodeConfigModelStruct? updateComcodeConfigModelStruct(
  ComcodeConfigModelStruct? comcodeConfigModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    comcodeConfigModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addComcodeConfigModelStructData(
  Map<String, dynamic> firestoreData,
  ComcodeConfigModelStruct? comcodeConfigModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (comcodeConfigModel == null) {
    return;
  }
  if (comcodeConfigModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && comcodeConfigModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final comcodeConfigModelData =
      getComcodeConfigModelFirestoreData(comcodeConfigModel, forFieldValue);
  final nestedData =
      comcodeConfigModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      comcodeConfigModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getComcodeConfigModelFirestoreData(
  ComcodeConfigModelStruct? comcodeConfigModel, [
  bool forFieldValue = false,
]) {
  if (comcodeConfigModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(comcodeConfigModel.toMap());

  // Handle nested data for "loan_type_code" field.
  addLoanTypeCodeStructData(
    firestoreData,
    comcodeConfigModel.hasLoanTypeCode()
        ? comcodeConfigModel.loanTypeCode
        : null,
    'loan_type_code',
    forFieldValue,
  );

  // Add any Firestore field values
  comcodeConfigModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getComcodeConfigModelListFirestoreData(
  List<ComcodeConfigModelStruct>? comcodeConfigModels,
) =>
    comcodeConfigModels
        ?.map((e) => getComcodeConfigModelFirestoreData(e, true))
        .toList() ??
    [];
