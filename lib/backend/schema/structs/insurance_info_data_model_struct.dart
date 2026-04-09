// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InsuranceInfoDataModelStruct extends FFFirebaseStruct {
  InsuranceInfoDataModelStruct({
    String? branch,
    String? branchCodeRequest,
    String? branchNameRequest,
    String? quotationId,
    String? applicationNo,
    String? fullName,
    String? firstNameTh,
    String? lastNameTh,
    String? carRegistration,
    String? installmentFirstDue,
    String? installmentFirstDueName,
    String? tenorFirstDue,
    String? tenor,
    String? color,
    String? coverTypeName,
    String? actTotal,
    String? actTotalName,
    String? netPremiumTotal,
    String? netPremiumTotalName,
    String? insurerId,
    String? insurerCode,
    String? insurerCode2,
    String? insurerName,
    String? insurerLogo,
    List<TenorListDataModelStruct>? tenorList,
    String? garageTypeName,
    String? amountExcludeName,
    String? amountName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _branch = branch,
        _branchCodeRequest = branchCodeRequest,
        _branchNameRequest = branchNameRequest,
        _quotationId = quotationId,
        _applicationNo = applicationNo,
        _fullName = fullName,
        _firstNameTh = firstNameTh,
        _lastNameTh = lastNameTh,
        _carRegistration = carRegistration,
        _installmentFirstDue = installmentFirstDue,
        _installmentFirstDueName = installmentFirstDueName,
        _tenorFirstDue = tenorFirstDue,
        _tenor = tenor,
        _color = color,
        _coverTypeName = coverTypeName,
        _actTotal = actTotal,
        _actTotalName = actTotalName,
        _netPremiumTotal = netPremiumTotal,
        _netPremiumTotalName = netPremiumTotalName,
        _insurerId = insurerId,
        _insurerCode = insurerCode,
        _insurerCode2 = insurerCode2,
        _insurerName = insurerName,
        _insurerLogo = insurerLogo,
        _tenorList = tenorList,
        _garageTypeName = garageTypeName,
        _amountExcludeName = amountExcludeName,
        _amountName = amountName,
        super(firestoreUtilData);

  // "branch" field.
  String? _branch;
  String get branch => _branch ?? '';
  set branch(String? val) => _branch = val;

  bool hasBranch() => _branch != null;

  // "branch_code_request" field.
  String? _branchCodeRequest;
  String get branchCodeRequest => _branchCodeRequest ?? '';
  set branchCodeRequest(String? val) => _branchCodeRequest = val;

  bool hasBranchCodeRequest() => _branchCodeRequest != null;

  // "branch_name_request" field.
  String? _branchNameRequest;
  String get branchNameRequest => _branchNameRequest ?? '';
  set branchNameRequest(String? val) => _branchNameRequest = val;

  bool hasBranchNameRequest() => _branchNameRequest != null;

  // "quotation_id" field.
  String? _quotationId;
  String get quotationId => _quotationId ?? '';
  set quotationId(String? val) => _quotationId = val;

  bool hasQuotationId() => _quotationId != null;

  // "application_no" field.
  String? _applicationNo;
  String get applicationNo => _applicationNo ?? '';
  set applicationNo(String? val) => _applicationNo = val;

  bool hasApplicationNo() => _applicationNo != null;

  // "full_name" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  set fullName(String? val) => _fullName = val;

  bool hasFullName() => _fullName != null;

  // "first_name_th" field.
  String? _firstNameTh;
  String get firstNameTh => _firstNameTh ?? '';
  set firstNameTh(String? val) => _firstNameTh = val;

  bool hasFirstNameTh() => _firstNameTh != null;

  // "last_name_th" field.
  String? _lastNameTh;
  String get lastNameTh => _lastNameTh ?? '';
  set lastNameTh(String? val) => _lastNameTh = val;

  bool hasLastNameTh() => _lastNameTh != null;

  // "car_registration" field.
  String? _carRegistration;
  String get carRegistration => _carRegistration ?? '';
  set carRegistration(String? val) => _carRegistration = val;

  bool hasCarRegistration() => _carRegistration != null;

  // "installment_first_due" field.
  String? _installmentFirstDue;
  String get installmentFirstDue => _installmentFirstDue ?? '';
  set installmentFirstDue(String? val) => _installmentFirstDue = val;

  bool hasInstallmentFirstDue() => _installmentFirstDue != null;

  // "installment_first_due_name" field.
  String? _installmentFirstDueName;
  String get installmentFirstDueName => _installmentFirstDueName ?? '';
  set installmentFirstDueName(String? val) => _installmentFirstDueName = val;

  bool hasInstallmentFirstDueName() => _installmentFirstDueName != null;

  // "tenor_first_due" field.
  String? _tenorFirstDue;
  String get tenorFirstDue => _tenorFirstDue ?? '';
  set tenorFirstDue(String? val) => _tenorFirstDue = val;

  bool hasTenorFirstDue() => _tenorFirstDue != null;

  // "tenor" field.
  String? _tenor;
  String get tenor => _tenor ?? '';
  set tenor(String? val) => _tenor = val;

  bool hasTenor() => _tenor != null;

  // "color" field.
  String? _color;
  String get color => _color ?? '';
  set color(String? val) => _color = val;

  bool hasColor() => _color != null;

  // "cover_type_name" field.
  String? _coverTypeName;
  String get coverTypeName => _coverTypeName ?? '';
  set coverTypeName(String? val) => _coverTypeName = val;

  bool hasCoverTypeName() => _coverTypeName != null;

  // "act_total" field.
  String? _actTotal;
  String get actTotal => _actTotal ?? '';
  set actTotal(String? val) => _actTotal = val;

  bool hasActTotal() => _actTotal != null;

  // "act_total_name" field.
  String? _actTotalName;
  String get actTotalName => _actTotalName ?? '';
  set actTotalName(String? val) => _actTotalName = val;

  bool hasActTotalName() => _actTotalName != null;

  // "net_premium_total" field.
  String? _netPremiumTotal;
  String get netPremiumTotal => _netPremiumTotal ?? '';
  set netPremiumTotal(String? val) => _netPremiumTotal = val;

  bool hasNetPremiumTotal() => _netPremiumTotal != null;

  // "net_premium_total_name" field.
  String? _netPremiumTotalName;
  String get netPremiumTotalName => _netPremiumTotalName ?? '';
  set netPremiumTotalName(String? val) => _netPremiumTotalName = val;

  bool hasNetPremiumTotalName() => _netPremiumTotalName != null;

  // "insurer_id" field.
  String? _insurerId;
  String get insurerId => _insurerId ?? '';
  set insurerId(String? val) => _insurerId = val;

  bool hasInsurerId() => _insurerId != null;

  // "insurer_code" field.
  String? _insurerCode;
  String get insurerCode => _insurerCode ?? '';
  set insurerCode(String? val) => _insurerCode = val;

  bool hasInsurerCode() => _insurerCode != null;

  // "insurer_code2" field.
  String? _insurerCode2;
  String get insurerCode2 => _insurerCode2 ?? '';
  set insurerCode2(String? val) => _insurerCode2 = val;

  bool hasInsurerCode2() => _insurerCode2 != null;

  // "insurer_name" field.
  String? _insurerName;
  String get insurerName => _insurerName ?? '';
  set insurerName(String? val) => _insurerName = val;

  bool hasInsurerName() => _insurerName != null;

  // "insurer_logo" field.
  String? _insurerLogo;
  String get insurerLogo => _insurerLogo ?? '';
  set insurerLogo(String? val) => _insurerLogo = val;

  bool hasInsurerLogo() => _insurerLogo != null;

  // "tenor_list" field.
  List<TenorListDataModelStruct>? _tenorList;
  List<TenorListDataModelStruct> get tenorList => _tenorList ?? const [];
  set tenorList(List<TenorListDataModelStruct>? val) => _tenorList = val;

  void updateTenorList(Function(List<TenorListDataModelStruct>) updateFn) {
    updateFn(_tenorList ??= []);
  }

  bool hasTenorList() => _tenorList != null;

  // "garage_type_name" field.
  String? _garageTypeName;
  String get garageTypeName => _garageTypeName ?? '';
  set garageTypeName(String? val) => _garageTypeName = val;

  bool hasGarageTypeName() => _garageTypeName != null;

  // "amount_exclude_name" field.
  String? _amountExcludeName;
  String get amountExcludeName => _amountExcludeName ?? '';
  set amountExcludeName(String? val) => _amountExcludeName = val;

  bool hasAmountExcludeName() => _amountExcludeName != null;

  // "amount_name" field.
  String? _amountName;
  String get amountName => _amountName ?? '';
  set amountName(String? val) => _amountName = val;

  bool hasAmountName() => _amountName != null;

  static InsuranceInfoDataModelStruct fromMap(Map<String, dynamic> data) =>
      InsuranceInfoDataModelStruct(
        branch: data['branch'] as String?,
        branchCodeRequest: data['branch_code_request'] as String?,
        branchNameRequest: data['branch_name_request'] as String?,
        quotationId: data['quotation_id'] as String?,
        applicationNo: data['application_no'] as String?,
        fullName: data['full_name'] as String?,
        firstNameTh: data['first_name_th'] as String?,
        lastNameTh: data['last_name_th'] as String?,
        carRegistration: data['car_registration'] as String?,
        installmentFirstDue: data['installment_first_due'] as String?,
        installmentFirstDueName: data['installment_first_due_name'] as String?,
        tenorFirstDue: data['tenor_first_due'] as String?,
        tenor: data['tenor'] as String?,
        color: data['color'] as String?,
        coverTypeName: data['cover_type_name'] as String?,
        actTotal: data['act_total'] as String?,
        actTotalName: data['act_total_name'] as String?,
        netPremiumTotal: data['net_premium_total'] as String?,
        netPremiumTotalName: data['net_premium_total_name'] as String?,
        insurerId: data['insurer_id'] as String?,
        insurerCode: data['insurer_code'] as String?,
        insurerCode2: data['insurer_code2'] as String?,
        insurerName: data['insurer_name'] as String?,
        insurerLogo: data['insurer_logo'] as String?,
        tenorList: getStructList(
          data['tenor_list'],
          TenorListDataModelStruct.fromMap,
        ),
        garageTypeName: data['garage_type_name'] as String?,
        amountExcludeName: data['amount_exclude_name'] as String?,
        amountName: data['amount_name'] as String?,
      );

  static InsuranceInfoDataModelStruct? maybeFromMap(dynamic data) => data is Map
      ? InsuranceInfoDataModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'branch': _branch,
        'branch_code_request': _branchCodeRequest,
        'branch_name_request': _branchNameRequest,
        'quotation_id': _quotationId,
        'application_no': _applicationNo,
        'full_name': _fullName,
        'first_name_th': _firstNameTh,
        'last_name_th': _lastNameTh,
        'car_registration': _carRegistration,
        'installment_first_due': _installmentFirstDue,
        'installment_first_due_name': _installmentFirstDueName,
        'tenor_first_due': _tenorFirstDue,
        'tenor': _tenor,
        'color': _color,
        'cover_type_name': _coverTypeName,
        'act_total': _actTotal,
        'act_total_name': _actTotalName,
        'net_premium_total': _netPremiumTotal,
        'net_premium_total_name': _netPremiumTotalName,
        'insurer_id': _insurerId,
        'insurer_code': _insurerCode,
        'insurer_code2': _insurerCode2,
        'insurer_name': _insurerName,
        'insurer_logo': _insurerLogo,
        'tenor_list': _tenorList?.map((e) => e.toMap()).toList(),
        'garage_type_name': _garageTypeName,
        'amount_exclude_name': _amountExcludeName,
        'amount_name': _amountName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'branch': serializeParam(
          _branch,
          ParamType.String,
        ),
        'branch_code_request': serializeParam(
          _branchCodeRequest,
          ParamType.String,
        ),
        'branch_name_request': serializeParam(
          _branchNameRequest,
          ParamType.String,
        ),
        'quotation_id': serializeParam(
          _quotationId,
          ParamType.String,
        ),
        'application_no': serializeParam(
          _applicationNo,
          ParamType.String,
        ),
        'full_name': serializeParam(
          _fullName,
          ParamType.String,
        ),
        'first_name_th': serializeParam(
          _firstNameTh,
          ParamType.String,
        ),
        'last_name_th': serializeParam(
          _lastNameTh,
          ParamType.String,
        ),
        'car_registration': serializeParam(
          _carRegistration,
          ParamType.String,
        ),
        'installment_first_due': serializeParam(
          _installmentFirstDue,
          ParamType.String,
        ),
        'installment_first_due_name': serializeParam(
          _installmentFirstDueName,
          ParamType.String,
        ),
        'tenor_first_due': serializeParam(
          _tenorFirstDue,
          ParamType.String,
        ),
        'tenor': serializeParam(
          _tenor,
          ParamType.String,
        ),
        'color': serializeParam(
          _color,
          ParamType.String,
        ),
        'cover_type_name': serializeParam(
          _coverTypeName,
          ParamType.String,
        ),
        'act_total': serializeParam(
          _actTotal,
          ParamType.String,
        ),
        'act_total_name': serializeParam(
          _actTotalName,
          ParamType.String,
        ),
        'net_premium_total': serializeParam(
          _netPremiumTotal,
          ParamType.String,
        ),
        'net_premium_total_name': serializeParam(
          _netPremiumTotalName,
          ParamType.String,
        ),
        'insurer_id': serializeParam(
          _insurerId,
          ParamType.String,
        ),
        'insurer_code': serializeParam(
          _insurerCode,
          ParamType.String,
        ),
        'insurer_code2': serializeParam(
          _insurerCode2,
          ParamType.String,
        ),
        'insurer_name': serializeParam(
          _insurerName,
          ParamType.String,
        ),
        'insurer_logo': serializeParam(
          _insurerLogo,
          ParamType.String,
        ),
        'tenor_list': serializeParam(
          _tenorList,
          ParamType.DataStruct,
          isList: true,
        ),
        'garage_type_name': serializeParam(
          _garageTypeName,
          ParamType.String,
        ),
        'amount_exclude_name': serializeParam(
          _amountExcludeName,
          ParamType.String,
        ),
        'amount_name': serializeParam(
          _amountName,
          ParamType.String,
        ),
      }.withoutNulls;

  static InsuranceInfoDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      InsuranceInfoDataModelStruct(
        branch: deserializeParam(
          data['branch'],
          ParamType.String,
          false,
        ),
        branchCodeRequest: deserializeParam(
          data['branch_code_request'],
          ParamType.String,
          false,
        ),
        branchNameRequest: deserializeParam(
          data['branch_name_request'],
          ParamType.String,
          false,
        ),
        quotationId: deserializeParam(
          data['quotation_id'],
          ParamType.String,
          false,
        ),
        applicationNo: deserializeParam(
          data['application_no'],
          ParamType.String,
          false,
        ),
        fullName: deserializeParam(
          data['full_name'],
          ParamType.String,
          false,
        ),
        firstNameTh: deserializeParam(
          data['first_name_th'],
          ParamType.String,
          false,
        ),
        lastNameTh: deserializeParam(
          data['last_name_th'],
          ParamType.String,
          false,
        ),
        carRegistration: deserializeParam(
          data['car_registration'],
          ParamType.String,
          false,
        ),
        installmentFirstDue: deserializeParam(
          data['installment_first_due'],
          ParamType.String,
          false,
        ),
        installmentFirstDueName: deserializeParam(
          data['installment_first_due_name'],
          ParamType.String,
          false,
        ),
        tenorFirstDue: deserializeParam(
          data['tenor_first_due'],
          ParamType.String,
          false,
        ),
        tenor: deserializeParam(
          data['tenor'],
          ParamType.String,
          false,
        ),
        color: deserializeParam(
          data['color'],
          ParamType.String,
          false,
        ),
        coverTypeName: deserializeParam(
          data['cover_type_name'],
          ParamType.String,
          false,
        ),
        actTotal: deserializeParam(
          data['act_total'],
          ParamType.String,
          false,
        ),
        actTotalName: deserializeParam(
          data['act_total_name'],
          ParamType.String,
          false,
        ),
        netPremiumTotal: deserializeParam(
          data['net_premium_total'],
          ParamType.String,
          false,
        ),
        netPremiumTotalName: deserializeParam(
          data['net_premium_total_name'],
          ParamType.String,
          false,
        ),
        insurerId: deserializeParam(
          data['insurer_id'],
          ParamType.String,
          false,
        ),
        insurerCode: deserializeParam(
          data['insurer_code'],
          ParamType.String,
          false,
        ),
        insurerCode2: deserializeParam(
          data['insurer_code2'],
          ParamType.String,
          false,
        ),
        insurerName: deserializeParam(
          data['insurer_name'],
          ParamType.String,
          false,
        ),
        insurerLogo: deserializeParam(
          data['insurer_logo'],
          ParamType.String,
          false,
        ),
        tenorList: deserializeStructParam<TenorListDataModelStruct>(
          data['tenor_list'],
          ParamType.DataStruct,
          true,
          structBuilder: TenorListDataModelStruct.fromSerializableMap,
        ),
        garageTypeName: deserializeParam(
          data['garage_type_name'],
          ParamType.String,
          false,
        ),
        amountExcludeName: deserializeParam(
          data['amount_exclude_name'],
          ParamType.String,
          false,
        ),
        amountName: deserializeParam(
          data['amount_name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'InsuranceInfoDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is InsuranceInfoDataModelStruct &&
        branch == other.branch &&
        branchCodeRequest == other.branchCodeRequest &&
        branchNameRequest == other.branchNameRequest &&
        quotationId == other.quotationId &&
        applicationNo == other.applicationNo &&
        fullName == other.fullName &&
        firstNameTh == other.firstNameTh &&
        lastNameTh == other.lastNameTh &&
        carRegistration == other.carRegistration &&
        installmentFirstDue == other.installmentFirstDue &&
        installmentFirstDueName == other.installmentFirstDueName &&
        tenorFirstDue == other.tenorFirstDue &&
        tenor == other.tenor &&
        color == other.color &&
        coverTypeName == other.coverTypeName &&
        actTotal == other.actTotal &&
        actTotalName == other.actTotalName &&
        netPremiumTotal == other.netPremiumTotal &&
        netPremiumTotalName == other.netPremiumTotalName &&
        insurerId == other.insurerId &&
        insurerCode == other.insurerCode &&
        insurerCode2 == other.insurerCode2 &&
        insurerName == other.insurerName &&
        insurerLogo == other.insurerLogo &&
        listEquality.equals(tenorList, other.tenorList) &&
        garageTypeName == other.garageTypeName &&
        amountExcludeName == other.amountExcludeName &&
        amountName == other.amountName;
  }

  @override
  int get hashCode => const ListEquality().hash([
        branch,
        branchCodeRequest,
        branchNameRequest,
        quotationId,
        applicationNo,
        fullName,
        firstNameTh,
        lastNameTh,
        carRegistration,
        installmentFirstDue,
        installmentFirstDueName,
        tenorFirstDue,
        tenor,
        color,
        coverTypeName,
        actTotal,
        actTotalName,
        netPremiumTotal,
        netPremiumTotalName,
        insurerId,
        insurerCode,
        insurerCode2,
        insurerName,
        insurerLogo,
        tenorList,
        garageTypeName,
        amountExcludeName,
        amountName
      ]);
}

InsuranceInfoDataModelStruct createInsuranceInfoDataModelStruct({
  String? branch,
  String? branchCodeRequest,
  String? branchNameRequest,
  String? quotationId,
  String? applicationNo,
  String? fullName,
  String? firstNameTh,
  String? lastNameTh,
  String? carRegistration,
  String? installmentFirstDue,
  String? installmentFirstDueName,
  String? tenorFirstDue,
  String? tenor,
  String? color,
  String? coverTypeName,
  String? actTotal,
  String? actTotalName,
  String? netPremiumTotal,
  String? netPremiumTotalName,
  String? insurerId,
  String? insurerCode,
  String? insurerCode2,
  String? insurerName,
  String? insurerLogo,
  String? garageTypeName,
  String? amountExcludeName,
  String? amountName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    InsuranceInfoDataModelStruct(
      branch: branch,
      branchCodeRequest: branchCodeRequest,
      branchNameRequest: branchNameRequest,
      quotationId: quotationId,
      applicationNo: applicationNo,
      fullName: fullName,
      firstNameTh: firstNameTh,
      lastNameTh: lastNameTh,
      carRegistration: carRegistration,
      installmentFirstDue: installmentFirstDue,
      installmentFirstDueName: installmentFirstDueName,
      tenorFirstDue: tenorFirstDue,
      tenor: tenor,
      color: color,
      coverTypeName: coverTypeName,
      actTotal: actTotal,
      actTotalName: actTotalName,
      netPremiumTotal: netPremiumTotal,
      netPremiumTotalName: netPremiumTotalName,
      insurerId: insurerId,
      insurerCode: insurerCode,
      insurerCode2: insurerCode2,
      insurerName: insurerName,
      insurerLogo: insurerLogo,
      garageTypeName: garageTypeName,
      amountExcludeName: amountExcludeName,
      amountName: amountName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

InsuranceInfoDataModelStruct? updateInsuranceInfoDataModelStruct(
  InsuranceInfoDataModelStruct? insuranceInfoDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    insuranceInfoDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addInsuranceInfoDataModelStructData(
  Map<String, dynamic> firestoreData,
  InsuranceInfoDataModelStruct? insuranceInfoDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (insuranceInfoDataModel == null) {
    return;
  }
  if (insuranceInfoDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      insuranceInfoDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final insuranceInfoDataModelData = getInsuranceInfoDataModelFirestoreData(
      insuranceInfoDataModel, forFieldValue);
  final nestedData =
      insuranceInfoDataModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      insuranceInfoDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getInsuranceInfoDataModelFirestoreData(
  InsuranceInfoDataModelStruct? insuranceInfoDataModel, [
  bool forFieldValue = false,
]) {
  if (insuranceInfoDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(insuranceInfoDataModel.toMap());

  // Add any Firestore field values
  mapToFirestore(insuranceInfoDataModel.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getInsuranceInfoDataModelListFirestoreData(
  List<InsuranceInfoDataModelStruct>? insuranceInfoDataModels,
) =>
    insuranceInfoDataModels
        ?.map((e) => getInsuranceInfoDataModelFirestoreData(e, true))
        .toList() ??
    [];
