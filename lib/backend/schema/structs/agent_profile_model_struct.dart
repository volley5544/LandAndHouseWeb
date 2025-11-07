// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AgentProfileModelStruct extends FFFirebaseStruct {
  AgentProfileModelStruct({
    int? id,
    String? agentCode,
    String? companyNameTh,
    String? companyNameEn,
    String? companyAddress,
    String? companyProvinceCode,
    String? companyProvinceName,
    String? companyDistrictCode,
    String? companyDistrictName,
    String? companySubdistrictCode,
    String? companySubdistrictName,
    String? companyZipcode,
    String? companyPhoneNumber,
    String? companyMobileNumber,
    String? agentTitleEn,
    String? agentTitleTh,
    String? agentNameTh,
    String? agentNameEn,
    String? agentAddress,
    String? agentProvinceCode,
    String? agentProvinceName,
    String? agentDistrictCode,
    String? agentDistrictName,
    String? agentSubdistrictCode,
    String? agentSubdistrictName,
    String? agentZipcode,
    String? agentPhoneNumber,
    String? agentMobilePhone,
    String? agentEmail,
    String? agentAutoEmail,
    String? agentAutoSms,
    String? agentTaxId,
    String? agentTax,
    String? agentWht,
    String? agentBusinessGroupCode,
    String? agentBusinessGroupName,
    String? contractName,
    String? contractPosition,
    String? contractMobilePhone,
    String? agentPaymentTypeCode,
    String? agentPaymentTypeName,
    String? ownerBankCode,
    String? ownerBankName,
    String? ownerBankNo,
    String? agentBankCode,
    String? agentBankName,
    String? agentBankAccountName,
    String? agentBankNo,
    String? agentPaymentPeriodCode,
    String? agentPaymentPeriodName,
    String? agentBankOpendate,
    String? agentTypeCode,
    String? agentTypeName,
    String? agentNicknameTh,
    String? agentNicknameEn,
    String? agentFax,
    String? agentDob,
    String? agentBankBranchCode,
    String? agentBankBranchName,
    String? agentOccupationCode,
    String? agentOccupationName,
    String? transactionChannelCode,
    String? transactionChannelName,
    String? lastedLogin,
    String? passwordChange,
    String? agentStatus,
    String? agentReason,
    String? regionCode,
    String? regionName,
    String? areaCode,
    String? areaName,
    String? branchCode,
    String? branchName,
    String? agentActivateCode,
    String? agentActivateFlag,
    String? agentActivateDate,
    String? agentIdImage,
    String? agentBankImage,
    String? agentAppImage,
    String? smsSendFlg,
    String? smsSendDate,
    String? smsStatus,
    String? smsMessage,
    String? smsSmid,
    String? deleted,
    String? createdUserid,
    String? createdAt,
    String? updatedUserid,
    String? updatedAt,
    String? groupChannelCode,
    String? agentGroupId,
    String? paymentMethod,
    String? deductionPercent,
    String? paymentChannel,
    String? accountNumber,
    String? promptpayNumber,
    String? agentLastnameTh,
    String? agentLastnameEn,
    String? comEstimateAmt,
    String? comEstimateVat,
    String? comEstimateNetAmt,
    String? defaultComPercent,
    String? actualComPercent,
    String? comEstimateVatAmt,
    String? actualPercent,
    String? defaultPercent,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _agentCode = agentCode,
        _companyNameTh = companyNameTh,
        _companyNameEn = companyNameEn,
        _companyAddress = companyAddress,
        _companyProvinceCode = companyProvinceCode,
        _companyProvinceName = companyProvinceName,
        _companyDistrictCode = companyDistrictCode,
        _companyDistrictName = companyDistrictName,
        _companySubdistrictCode = companySubdistrictCode,
        _companySubdistrictName = companySubdistrictName,
        _companyZipcode = companyZipcode,
        _companyPhoneNumber = companyPhoneNumber,
        _companyMobileNumber = companyMobileNumber,
        _agentTitleEn = agentTitleEn,
        _agentTitleTh = agentTitleTh,
        _agentNameTh = agentNameTh,
        _agentNameEn = agentNameEn,
        _agentAddress = agentAddress,
        _agentProvinceCode = agentProvinceCode,
        _agentProvinceName = agentProvinceName,
        _agentDistrictCode = agentDistrictCode,
        _agentDistrictName = agentDistrictName,
        _agentSubdistrictCode = agentSubdistrictCode,
        _agentSubdistrictName = agentSubdistrictName,
        _agentZipcode = agentZipcode,
        _agentPhoneNumber = agentPhoneNumber,
        _agentMobilePhone = agentMobilePhone,
        _agentEmail = agentEmail,
        _agentAutoEmail = agentAutoEmail,
        _agentAutoSms = agentAutoSms,
        _agentTaxId = agentTaxId,
        _agentTax = agentTax,
        _agentWht = agentWht,
        _agentBusinessGroupCode = agentBusinessGroupCode,
        _agentBusinessGroupName = agentBusinessGroupName,
        _contractName = contractName,
        _contractPosition = contractPosition,
        _contractMobilePhone = contractMobilePhone,
        _agentPaymentTypeCode = agentPaymentTypeCode,
        _agentPaymentTypeName = agentPaymentTypeName,
        _ownerBankCode = ownerBankCode,
        _ownerBankName = ownerBankName,
        _ownerBankNo = ownerBankNo,
        _agentBankCode = agentBankCode,
        _agentBankName = agentBankName,
        _agentBankAccountName = agentBankAccountName,
        _agentBankNo = agentBankNo,
        _agentPaymentPeriodCode = agentPaymentPeriodCode,
        _agentPaymentPeriodName = agentPaymentPeriodName,
        _agentBankOpendate = agentBankOpendate,
        _agentTypeCode = agentTypeCode,
        _agentTypeName = agentTypeName,
        _agentNicknameTh = agentNicknameTh,
        _agentNicknameEn = agentNicknameEn,
        _agentFax = agentFax,
        _agentDob = agentDob,
        _agentBankBranchCode = agentBankBranchCode,
        _agentBankBranchName = agentBankBranchName,
        _agentOccupationCode = agentOccupationCode,
        _agentOccupationName = agentOccupationName,
        _transactionChannelCode = transactionChannelCode,
        _transactionChannelName = transactionChannelName,
        _lastedLogin = lastedLogin,
        _passwordChange = passwordChange,
        _agentStatus = agentStatus,
        _agentReason = agentReason,
        _regionCode = regionCode,
        _regionName = regionName,
        _areaCode = areaCode,
        _areaName = areaName,
        _branchCode = branchCode,
        _branchName = branchName,
        _agentActivateCode = agentActivateCode,
        _agentActivateFlag = agentActivateFlag,
        _agentActivateDate = agentActivateDate,
        _agentIdImage = agentIdImage,
        _agentBankImage = agentBankImage,
        _agentAppImage = agentAppImage,
        _smsSendFlg = smsSendFlg,
        _smsSendDate = smsSendDate,
        _smsStatus = smsStatus,
        _smsMessage = smsMessage,
        _smsSmid = smsSmid,
        _deleted = deleted,
        _createdUserid = createdUserid,
        _createdAt = createdAt,
        _updatedUserid = updatedUserid,
        _updatedAt = updatedAt,
        _groupChannelCode = groupChannelCode,
        _agentGroupId = agentGroupId,
        _paymentMethod = paymentMethod,
        _deductionPercent = deductionPercent,
        _paymentChannel = paymentChannel,
        _accountNumber = accountNumber,
        _promptpayNumber = promptpayNumber,
        _agentLastnameTh = agentLastnameTh,
        _agentLastnameEn = agentLastnameEn,
        _comEstimateAmt = comEstimateAmt,
        _comEstimateVat = comEstimateVat,
        _comEstimateNetAmt = comEstimateNetAmt,
        _defaultComPercent = defaultComPercent,
        _actualComPercent = actualComPercent,
        _comEstimateVatAmt = comEstimateVatAmt,
        _actualPercent = actualPercent,
        _defaultPercent = defaultPercent,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "agent_code" field.
  String? _agentCode;
  String get agentCode => _agentCode ?? '';
  set agentCode(String? val) => _agentCode = val;

  bool hasAgentCode() => _agentCode != null;

  // "company_name_th" field.
  String? _companyNameTh;
  String get companyNameTh => _companyNameTh ?? '';
  set companyNameTh(String? val) => _companyNameTh = val;

  bool hasCompanyNameTh() => _companyNameTh != null;

  // "company_name_en" field.
  String? _companyNameEn;
  String get companyNameEn => _companyNameEn ?? '';
  set companyNameEn(String? val) => _companyNameEn = val;

  bool hasCompanyNameEn() => _companyNameEn != null;

  // "company_address" field.
  String? _companyAddress;
  String get companyAddress => _companyAddress ?? '';
  set companyAddress(String? val) => _companyAddress = val;

  bool hasCompanyAddress() => _companyAddress != null;

  // "company_province_code" field.
  String? _companyProvinceCode;
  String get companyProvinceCode => _companyProvinceCode ?? '';
  set companyProvinceCode(String? val) => _companyProvinceCode = val;

  bool hasCompanyProvinceCode() => _companyProvinceCode != null;

  // "company_province_name" field.
  String? _companyProvinceName;
  String get companyProvinceName => _companyProvinceName ?? '';
  set companyProvinceName(String? val) => _companyProvinceName = val;

  bool hasCompanyProvinceName() => _companyProvinceName != null;

  // "company_district_code" field.
  String? _companyDistrictCode;
  String get companyDistrictCode => _companyDistrictCode ?? '';
  set companyDistrictCode(String? val) => _companyDistrictCode = val;

  bool hasCompanyDistrictCode() => _companyDistrictCode != null;

  // "company_district_name" field.
  String? _companyDistrictName;
  String get companyDistrictName => _companyDistrictName ?? '';
  set companyDistrictName(String? val) => _companyDistrictName = val;

  bool hasCompanyDistrictName() => _companyDistrictName != null;

  // "company_subdistrict_code" field.
  String? _companySubdistrictCode;
  String get companySubdistrictCode => _companySubdistrictCode ?? '';
  set companySubdistrictCode(String? val) => _companySubdistrictCode = val;

  bool hasCompanySubdistrictCode() => _companySubdistrictCode != null;

  // "company_subdistrict_name" field.
  String? _companySubdistrictName;
  String get companySubdistrictName => _companySubdistrictName ?? '';
  set companySubdistrictName(String? val) => _companySubdistrictName = val;

  bool hasCompanySubdistrictName() => _companySubdistrictName != null;

  // "company_zipcode" field.
  String? _companyZipcode;
  String get companyZipcode => _companyZipcode ?? '';
  set companyZipcode(String? val) => _companyZipcode = val;

  bool hasCompanyZipcode() => _companyZipcode != null;

  // "company_phone_number" field.
  String? _companyPhoneNumber;
  String get companyPhoneNumber => _companyPhoneNumber ?? '';
  set companyPhoneNumber(String? val) => _companyPhoneNumber = val;

  bool hasCompanyPhoneNumber() => _companyPhoneNumber != null;

  // "company_mobile_number" field.
  String? _companyMobileNumber;
  String get companyMobileNumber => _companyMobileNumber ?? '';
  set companyMobileNumber(String? val) => _companyMobileNumber = val;

  bool hasCompanyMobileNumber() => _companyMobileNumber != null;

  // "agent_title_en" field.
  String? _agentTitleEn;
  String get agentTitleEn => _agentTitleEn ?? '';
  set agentTitleEn(String? val) => _agentTitleEn = val;

  bool hasAgentTitleEn() => _agentTitleEn != null;

  // "agent_title_th" field.
  String? _agentTitleTh;
  String get agentTitleTh => _agentTitleTh ?? '';
  set agentTitleTh(String? val) => _agentTitleTh = val;

  bool hasAgentTitleTh() => _agentTitleTh != null;

  // "agent_name_th" field.
  String? _agentNameTh;
  String get agentNameTh => _agentNameTh ?? '';
  set agentNameTh(String? val) => _agentNameTh = val;

  bool hasAgentNameTh() => _agentNameTh != null;

  // "agent_name_en" field.
  String? _agentNameEn;
  String get agentNameEn => _agentNameEn ?? '';
  set agentNameEn(String? val) => _agentNameEn = val;

  bool hasAgentNameEn() => _agentNameEn != null;

  // "agent_address" field.
  String? _agentAddress;
  String get agentAddress => _agentAddress ?? '';
  set agentAddress(String? val) => _agentAddress = val;

  bool hasAgentAddress() => _agentAddress != null;

  // "agent_province_code" field.
  String? _agentProvinceCode;
  String get agentProvinceCode => _agentProvinceCode ?? '';
  set agentProvinceCode(String? val) => _agentProvinceCode = val;

  bool hasAgentProvinceCode() => _agentProvinceCode != null;

  // "agent_province_name" field.
  String? _agentProvinceName;
  String get agentProvinceName => _agentProvinceName ?? '';
  set agentProvinceName(String? val) => _agentProvinceName = val;

  bool hasAgentProvinceName() => _agentProvinceName != null;

  // "agent_district_code" field.
  String? _agentDistrictCode;
  String get agentDistrictCode => _agentDistrictCode ?? '';
  set agentDistrictCode(String? val) => _agentDistrictCode = val;

  bool hasAgentDistrictCode() => _agentDistrictCode != null;

  // "agent_district_name" field.
  String? _agentDistrictName;
  String get agentDistrictName => _agentDistrictName ?? '';
  set agentDistrictName(String? val) => _agentDistrictName = val;

  bool hasAgentDistrictName() => _agentDistrictName != null;

  // "agent_subdistrict_code" field.
  String? _agentSubdistrictCode;
  String get agentSubdistrictCode => _agentSubdistrictCode ?? '';
  set agentSubdistrictCode(String? val) => _agentSubdistrictCode = val;

  bool hasAgentSubdistrictCode() => _agentSubdistrictCode != null;

  // "agent_subdistrict_name" field.
  String? _agentSubdistrictName;
  String get agentSubdistrictName => _agentSubdistrictName ?? '';
  set agentSubdistrictName(String? val) => _agentSubdistrictName = val;

  bool hasAgentSubdistrictName() => _agentSubdistrictName != null;

  // "agent_zipcode" field.
  String? _agentZipcode;
  String get agentZipcode => _agentZipcode ?? '';
  set agentZipcode(String? val) => _agentZipcode = val;

  bool hasAgentZipcode() => _agentZipcode != null;

  // "agent_phone_number" field.
  String? _agentPhoneNumber;
  String get agentPhoneNumber => _agentPhoneNumber ?? '';
  set agentPhoneNumber(String? val) => _agentPhoneNumber = val;

  bool hasAgentPhoneNumber() => _agentPhoneNumber != null;

  // "agent_mobile_phone" field.
  String? _agentMobilePhone;
  String get agentMobilePhone => _agentMobilePhone ?? '';
  set agentMobilePhone(String? val) => _agentMobilePhone = val;

  bool hasAgentMobilePhone() => _agentMobilePhone != null;

  // "agent_email" field.
  String? _agentEmail;
  String get agentEmail => _agentEmail ?? '';
  set agentEmail(String? val) => _agentEmail = val;

  bool hasAgentEmail() => _agentEmail != null;

  // "agent_auto_email" field.
  String? _agentAutoEmail;
  String get agentAutoEmail => _agentAutoEmail ?? '';
  set agentAutoEmail(String? val) => _agentAutoEmail = val;

  bool hasAgentAutoEmail() => _agentAutoEmail != null;

  // "agent_auto_sms" field.
  String? _agentAutoSms;
  String get agentAutoSms => _agentAutoSms ?? '';
  set agentAutoSms(String? val) => _agentAutoSms = val;

  bool hasAgentAutoSms() => _agentAutoSms != null;

  // "agent_tax_id" field.
  String? _agentTaxId;
  String get agentTaxId => _agentTaxId ?? '';
  set agentTaxId(String? val) => _agentTaxId = val;

  bool hasAgentTaxId() => _agentTaxId != null;

  // "agent_tax" field.
  String? _agentTax;
  String get agentTax => _agentTax ?? '';
  set agentTax(String? val) => _agentTax = val;

  bool hasAgentTax() => _agentTax != null;

  // "agent_wht" field.
  String? _agentWht;
  String get agentWht => _agentWht ?? '';
  set agentWht(String? val) => _agentWht = val;

  bool hasAgentWht() => _agentWht != null;

  // "agent_business_group_code" field.
  String? _agentBusinessGroupCode;
  String get agentBusinessGroupCode => _agentBusinessGroupCode ?? '';
  set agentBusinessGroupCode(String? val) => _agentBusinessGroupCode = val;

  bool hasAgentBusinessGroupCode() => _agentBusinessGroupCode != null;

  // "agent_business_group_name" field.
  String? _agentBusinessGroupName;
  String get agentBusinessGroupName => _agentBusinessGroupName ?? '';
  set agentBusinessGroupName(String? val) => _agentBusinessGroupName = val;

  bool hasAgentBusinessGroupName() => _agentBusinessGroupName != null;

  // "contract_name" field.
  String? _contractName;
  String get contractName => _contractName ?? '';
  set contractName(String? val) => _contractName = val;

  bool hasContractName() => _contractName != null;

  // "contract_position" field.
  String? _contractPosition;
  String get contractPosition => _contractPosition ?? '';
  set contractPosition(String? val) => _contractPosition = val;

  bool hasContractPosition() => _contractPosition != null;

  // "contract_mobile_phone" field.
  String? _contractMobilePhone;
  String get contractMobilePhone => _contractMobilePhone ?? '';
  set contractMobilePhone(String? val) => _contractMobilePhone = val;

  bool hasContractMobilePhone() => _contractMobilePhone != null;

  // "agent_payment_type_code" field.
  String? _agentPaymentTypeCode;
  String get agentPaymentTypeCode => _agentPaymentTypeCode ?? '';
  set agentPaymentTypeCode(String? val) => _agentPaymentTypeCode = val;

  bool hasAgentPaymentTypeCode() => _agentPaymentTypeCode != null;

  // "agent_payment_type_name" field.
  String? _agentPaymentTypeName;
  String get agentPaymentTypeName => _agentPaymentTypeName ?? '';
  set agentPaymentTypeName(String? val) => _agentPaymentTypeName = val;

  bool hasAgentPaymentTypeName() => _agentPaymentTypeName != null;

  // "owner_bank_code" field.
  String? _ownerBankCode;
  String get ownerBankCode => _ownerBankCode ?? '';
  set ownerBankCode(String? val) => _ownerBankCode = val;

  bool hasOwnerBankCode() => _ownerBankCode != null;

  // "owner_bank_name" field.
  String? _ownerBankName;
  String get ownerBankName => _ownerBankName ?? '';
  set ownerBankName(String? val) => _ownerBankName = val;

  bool hasOwnerBankName() => _ownerBankName != null;

  // "owner_bank_no" field.
  String? _ownerBankNo;
  String get ownerBankNo => _ownerBankNo ?? '';
  set ownerBankNo(String? val) => _ownerBankNo = val;

  bool hasOwnerBankNo() => _ownerBankNo != null;

  // "agent_bank_code" field.
  String? _agentBankCode;
  String get agentBankCode => _agentBankCode ?? '';
  set agentBankCode(String? val) => _agentBankCode = val;

  bool hasAgentBankCode() => _agentBankCode != null;

  // "agent_bank_name" field.
  String? _agentBankName;
  String get agentBankName => _agentBankName ?? '';
  set agentBankName(String? val) => _agentBankName = val;

  bool hasAgentBankName() => _agentBankName != null;

  // "agent_bank_account_name" field.
  String? _agentBankAccountName;
  String get agentBankAccountName => _agentBankAccountName ?? '';
  set agentBankAccountName(String? val) => _agentBankAccountName = val;

  bool hasAgentBankAccountName() => _agentBankAccountName != null;

  // "agent_bank_no" field.
  String? _agentBankNo;
  String get agentBankNo => _agentBankNo ?? '';
  set agentBankNo(String? val) => _agentBankNo = val;

  bool hasAgentBankNo() => _agentBankNo != null;

  // "agent_payment_period_code" field.
  String? _agentPaymentPeriodCode;
  String get agentPaymentPeriodCode => _agentPaymentPeriodCode ?? '';
  set agentPaymentPeriodCode(String? val) => _agentPaymentPeriodCode = val;

  bool hasAgentPaymentPeriodCode() => _agentPaymentPeriodCode != null;

  // "agent_payment_period_name" field.
  String? _agentPaymentPeriodName;
  String get agentPaymentPeriodName => _agentPaymentPeriodName ?? '';
  set agentPaymentPeriodName(String? val) => _agentPaymentPeriodName = val;

  bool hasAgentPaymentPeriodName() => _agentPaymentPeriodName != null;

  // "agent_bank_opendate" field.
  String? _agentBankOpendate;
  String get agentBankOpendate => _agentBankOpendate ?? '';
  set agentBankOpendate(String? val) => _agentBankOpendate = val;

  bool hasAgentBankOpendate() => _agentBankOpendate != null;

  // "agent_type_code" field.
  String? _agentTypeCode;
  String get agentTypeCode => _agentTypeCode ?? '';
  set agentTypeCode(String? val) => _agentTypeCode = val;

  bool hasAgentTypeCode() => _agentTypeCode != null;

  // "agent_type_name" field.
  String? _agentTypeName;
  String get agentTypeName => _agentTypeName ?? '';
  set agentTypeName(String? val) => _agentTypeName = val;

  bool hasAgentTypeName() => _agentTypeName != null;

  // "agent_nickname_th" field.
  String? _agentNicknameTh;
  String get agentNicknameTh => _agentNicknameTh ?? '';
  set agentNicknameTh(String? val) => _agentNicknameTh = val;

  bool hasAgentNicknameTh() => _agentNicknameTh != null;

  // "agent_nickname_en" field.
  String? _agentNicknameEn;
  String get agentNicknameEn => _agentNicknameEn ?? '';
  set agentNicknameEn(String? val) => _agentNicknameEn = val;

  bool hasAgentNicknameEn() => _agentNicknameEn != null;

  // "agent_fax" field.
  String? _agentFax;
  String get agentFax => _agentFax ?? '';
  set agentFax(String? val) => _agentFax = val;

  bool hasAgentFax() => _agentFax != null;

  // "agent_dob" field.
  String? _agentDob;
  String get agentDob => _agentDob ?? '';
  set agentDob(String? val) => _agentDob = val;

  bool hasAgentDob() => _agentDob != null;

  // "agent_bank_branch_code" field.
  String? _agentBankBranchCode;
  String get agentBankBranchCode => _agentBankBranchCode ?? '';
  set agentBankBranchCode(String? val) => _agentBankBranchCode = val;

  bool hasAgentBankBranchCode() => _agentBankBranchCode != null;

  // "agent_bank_branch_name" field.
  String? _agentBankBranchName;
  String get agentBankBranchName => _agentBankBranchName ?? '';
  set agentBankBranchName(String? val) => _agentBankBranchName = val;

  bool hasAgentBankBranchName() => _agentBankBranchName != null;

  // "agent_occupation_code" field.
  String? _agentOccupationCode;
  String get agentOccupationCode => _agentOccupationCode ?? '';
  set agentOccupationCode(String? val) => _agentOccupationCode = val;

  bool hasAgentOccupationCode() => _agentOccupationCode != null;

  // "agent_occupation_name" field.
  String? _agentOccupationName;
  String get agentOccupationName => _agentOccupationName ?? '';
  set agentOccupationName(String? val) => _agentOccupationName = val;

  bool hasAgentOccupationName() => _agentOccupationName != null;

  // "transaction_channel_code" field.
  String? _transactionChannelCode;
  String get transactionChannelCode => _transactionChannelCode ?? '';
  set transactionChannelCode(String? val) => _transactionChannelCode = val;

  bool hasTransactionChannelCode() => _transactionChannelCode != null;

  // "transaction_channel_name" field.
  String? _transactionChannelName;
  String get transactionChannelName => _transactionChannelName ?? '';
  set transactionChannelName(String? val) => _transactionChannelName = val;

  bool hasTransactionChannelName() => _transactionChannelName != null;

  // "lasted_login" field.
  String? _lastedLogin;
  String get lastedLogin => _lastedLogin ?? '';
  set lastedLogin(String? val) => _lastedLogin = val;

  bool hasLastedLogin() => _lastedLogin != null;

  // "password_change" field.
  String? _passwordChange;
  String get passwordChange => _passwordChange ?? '';
  set passwordChange(String? val) => _passwordChange = val;

  bool hasPasswordChange() => _passwordChange != null;

  // "agent_status" field.
  String? _agentStatus;
  String get agentStatus => _agentStatus ?? '';
  set agentStatus(String? val) => _agentStatus = val;

  bool hasAgentStatus() => _agentStatus != null;

  // "agent_reason" field.
  String? _agentReason;
  String get agentReason => _agentReason ?? '';
  set agentReason(String? val) => _agentReason = val;

  bool hasAgentReason() => _agentReason != null;

  // "region_code" field.
  String? _regionCode;
  String get regionCode => _regionCode ?? '';
  set regionCode(String? val) => _regionCode = val;

  bool hasRegionCode() => _regionCode != null;

  // "region_name" field.
  String? _regionName;
  String get regionName => _regionName ?? '';
  set regionName(String? val) => _regionName = val;

  bool hasRegionName() => _regionName != null;

  // "area_code" field.
  String? _areaCode;
  String get areaCode => _areaCode ?? '';
  set areaCode(String? val) => _areaCode = val;

  bool hasAreaCode() => _areaCode != null;

  // "area_name" field.
  String? _areaName;
  String get areaName => _areaName ?? '';
  set areaName(String? val) => _areaName = val;

  bool hasAreaName() => _areaName != null;

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

  // "agent_activate_code" field.
  String? _agentActivateCode;
  String get agentActivateCode => _agentActivateCode ?? '';
  set agentActivateCode(String? val) => _agentActivateCode = val;

  bool hasAgentActivateCode() => _agentActivateCode != null;

  // "agent_activate_flag" field.
  String? _agentActivateFlag;
  String get agentActivateFlag => _agentActivateFlag ?? '';
  set agentActivateFlag(String? val) => _agentActivateFlag = val;

  bool hasAgentActivateFlag() => _agentActivateFlag != null;

  // "agent_activate_date" field.
  String? _agentActivateDate;
  String get agentActivateDate => _agentActivateDate ?? '';
  set agentActivateDate(String? val) => _agentActivateDate = val;

  bool hasAgentActivateDate() => _agentActivateDate != null;

  // "agent_id_image" field.
  String? _agentIdImage;
  String get agentIdImage => _agentIdImage ?? '';
  set agentIdImage(String? val) => _agentIdImage = val;

  bool hasAgentIdImage() => _agentIdImage != null;

  // "agent_bank_image" field.
  String? _agentBankImage;
  String get agentBankImage => _agentBankImage ?? '';
  set agentBankImage(String? val) => _agentBankImage = val;

  bool hasAgentBankImage() => _agentBankImage != null;

  // "agent_app_image" field.
  String? _agentAppImage;
  String get agentAppImage => _agentAppImage ?? '';
  set agentAppImage(String? val) => _agentAppImage = val;

  bool hasAgentAppImage() => _agentAppImage != null;

  // "sms_send_flg" field.
  String? _smsSendFlg;
  String get smsSendFlg => _smsSendFlg ?? '';
  set smsSendFlg(String? val) => _smsSendFlg = val;

  bool hasSmsSendFlg() => _smsSendFlg != null;

  // "sms_send_date" field.
  String? _smsSendDate;
  String get smsSendDate => _smsSendDate ?? '';
  set smsSendDate(String? val) => _smsSendDate = val;

  bool hasSmsSendDate() => _smsSendDate != null;

  // "sms_status" field.
  String? _smsStatus;
  String get smsStatus => _smsStatus ?? '';
  set smsStatus(String? val) => _smsStatus = val;

  bool hasSmsStatus() => _smsStatus != null;

  // "sms_message" field.
  String? _smsMessage;
  String get smsMessage => _smsMessage ?? '';
  set smsMessage(String? val) => _smsMessage = val;

  bool hasSmsMessage() => _smsMessage != null;

  // "sms_smid" field.
  String? _smsSmid;
  String get smsSmid => _smsSmid ?? '';
  set smsSmid(String? val) => _smsSmid = val;

  bool hasSmsSmid() => _smsSmid != null;

  // "deleted" field.
  String? _deleted;
  String get deleted => _deleted ?? '';
  set deleted(String? val) => _deleted = val;

  bool hasDeleted() => _deleted != null;

  // "created_userid" field.
  String? _createdUserid;
  String get createdUserid => _createdUserid ?? '';
  set createdUserid(String? val) => _createdUserid = val;

  bool hasCreatedUserid() => _createdUserid != null;

  // "created_at" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "updated_userid" field.
  String? _updatedUserid;
  String get updatedUserid => _updatedUserid ?? '';
  set updatedUserid(String? val) => _updatedUserid = val;

  bool hasUpdatedUserid() => _updatedUserid != null;

  // "updated_at" field.
  String? _updatedAt;
  String get updatedAt => _updatedAt ?? '';
  set updatedAt(String? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

  // "group_channel_code" field.
  String? _groupChannelCode;
  String get groupChannelCode => _groupChannelCode ?? '';
  set groupChannelCode(String? val) => _groupChannelCode = val;

  bool hasGroupChannelCode() => _groupChannelCode != null;

  // "agent_group_id" field.
  String? _agentGroupId;
  String get agentGroupId => _agentGroupId ?? '';
  set agentGroupId(String? val) => _agentGroupId = val;

  bool hasAgentGroupId() => _agentGroupId != null;

  // "payment_method" field.
  String? _paymentMethod;
  String get paymentMethod => _paymentMethod ?? '';
  set paymentMethod(String? val) => _paymentMethod = val;

  bool hasPaymentMethod() => _paymentMethod != null;

  // "deduction_percent" field.
  String? _deductionPercent;
  String get deductionPercent => _deductionPercent ?? '';
  set deductionPercent(String? val) => _deductionPercent = val;

  bool hasDeductionPercent() => _deductionPercent != null;

  // "payment_channel" field.
  String? _paymentChannel;
  String get paymentChannel => _paymentChannel ?? '';
  set paymentChannel(String? val) => _paymentChannel = val;

  bool hasPaymentChannel() => _paymentChannel != null;

  // "account_number" field.
  String? _accountNumber;
  String get accountNumber => _accountNumber ?? '';
  set accountNumber(String? val) => _accountNumber = val;

  bool hasAccountNumber() => _accountNumber != null;

  // "promptpay_number" field.
  String? _promptpayNumber;
  String get promptpayNumber => _promptpayNumber ?? '';
  set promptpayNumber(String? val) => _promptpayNumber = val;

  bool hasPromptpayNumber() => _promptpayNumber != null;

  // "agent_lastname_th" field.
  String? _agentLastnameTh;
  String get agentLastnameTh => _agentLastnameTh ?? '';
  set agentLastnameTh(String? val) => _agentLastnameTh = val;

  bool hasAgentLastnameTh() => _agentLastnameTh != null;

  // "agent_lastname_en" field.
  String? _agentLastnameEn;
  String get agentLastnameEn => _agentLastnameEn ?? '';
  set agentLastnameEn(String? val) => _agentLastnameEn = val;

  bool hasAgentLastnameEn() => _agentLastnameEn != null;

  // "com_estimate_amt" field.
  String? _comEstimateAmt;
  String get comEstimateAmt => _comEstimateAmt ?? '';
  set comEstimateAmt(String? val) => _comEstimateAmt = val;

  bool hasComEstimateAmt() => _comEstimateAmt != null;

  // "com_estimate_vat" field.
  String? _comEstimateVat;
  String get comEstimateVat => _comEstimateVat ?? '';
  set comEstimateVat(String? val) => _comEstimateVat = val;

  bool hasComEstimateVat() => _comEstimateVat != null;

  // "com_estimate_net_amt" field.
  String? _comEstimateNetAmt;
  String get comEstimateNetAmt => _comEstimateNetAmt ?? '';
  set comEstimateNetAmt(String? val) => _comEstimateNetAmt = val;

  bool hasComEstimateNetAmt() => _comEstimateNetAmt != null;

  // "default_com_percent" field.
  String? _defaultComPercent;
  String get defaultComPercent => _defaultComPercent ?? '';
  set defaultComPercent(String? val) => _defaultComPercent = val;

  bool hasDefaultComPercent() => _defaultComPercent != null;

  // "actual_com_percent" field.
  String? _actualComPercent;
  String get actualComPercent => _actualComPercent ?? '';
  set actualComPercent(String? val) => _actualComPercent = val;

  bool hasActualComPercent() => _actualComPercent != null;

  // "com_estimate_vat_amt" field.
  String? _comEstimateVatAmt;
  String get comEstimateVatAmt => _comEstimateVatAmt ?? '';
  set comEstimateVatAmt(String? val) => _comEstimateVatAmt = val;

  bool hasComEstimateVatAmt() => _comEstimateVatAmt != null;

  // "actual_percent" field.
  String? _actualPercent;
  String get actualPercent => _actualPercent ?? '';
  set actualPercent(String? val) => _actualPercent = val;

  bool hasActualPercent() => _actualPercent != null;

  // "default_percent" field.
  String? _defaultPercent;
  String get defaultPercent => _defaultPercent ?? '';
  set defaultPercent(String? val) => _defaultPercent = val;

  bool hasDefaultPercent() => _defaultPercent != null;

  static AgentProfileModelStruct fromMap(Map<String, dynamic> data) =>
      AgentProfileModelStruct(
        id: castToType<int>(data['id']),
        agentCode: data['agent_code'] as String?,
        companyNameTh: data['company_name_th'] as String?,
        companyNameEn: data['company_name_en'] as String?,
        companyAddress: data['company_address'] as String?,
        companyProvinceCode: data['company_province_code'] as String?,
        companyProvinceName: data['company_province_name'] as String?,
        companyDistrictCode: data['company_district_code'] as String?,
        companyDistrictName: data['company_district_name'] as String?,
        companySubdistrictCode: data['company_subdistrict_code'] as String?,
        companySubdistrictName: data['company_subdistrict_name'] as String?,
        companyZipcode: data['company_zipcode'] as String?,
        companyPhoneNumber: data['company_phone_number'] as String?,
        companyMobileNumber: data['company_mobile_number'] as String?,
        agentTitleEn: data['agent_title_en'] as String?,
        agentTitleTh: data['agent_title_th'] as String?,
        agentNameTh: data['agent_name_th'] as String?,
        agentNameEn: data['agent_name_en'] as String?,
        agentAddress: data['agent_address'] as String?,
        agentProvinceCode: data['agent_province_code'] as String?,
        agentProvinceName: data['agent_province_name'] as String?,
        agentDistrictCode: data['agent_district_code'] as String?,
        agentDistrictName: data['agent_district_name'] as String?,
        agentSubdistrictCode: data['agent_subdistrict_code'] as String?,
        agentSubdistrictName: data['agent_subdistrict_name'] as String?,
        agentZipcode: data['agent_zipcode'] as String?,
        agentPhoneNumber: data['agent_phone_number'] as String?,
        agentMobilePhone: data['agent_mobile_phone'] as String?,
        agentEmail: data['agent_email'] as String?,
        agentAutoEmail: data['agent_auto_email'] as String?,
        agentAutoSms: data['agent_auto_sms'] as String?,
        agentTaxId: data['agent_tax_id'] as String?,
        agentTax: data['agent_tax'] as String?,
        agentWht: data['agent_wht'] as String?,
        agentBusinessGroupCode: data['agent_business_group_code'] as String?,
        agentBusinessGroupName: data['agent_business_group_name'] as String?,
        contractName: data['contract_name'] as String?,
        contractPosition: data['contract_position'] as String?,
        contractMobilePhone: data['contract_mobile_phone'] as String?,
        agentPaymentTypeCode: data['agent_payment_type_code'] as String?,
        agentPaymentTypeName: data['agent_payment_type_name'] as String?,
        ownerBankCode: data['owner_bank_code'] as String?,
        ownerBankName: data['owner_bank_name'] as String?,
        ownerBankNo: data['owner_bank_no'] as String?,
        agentBankCode: data['agent_bank_code'] as String?,
        agentBankName: data['agent_bank_name'] as String?,
        agentBankAccountName: data['agent_bank_account_name'] as String?,
        agentBankNo: data['agent_bank_no'] as String?,
        agentPaymentPeriodCode: data['agent_payment_period_code'] as String?,
        agentPaymentPeriodName: data['agent_payment_period_name'] as String?,
        agentBankOpendate: data['agent_bank_opendate'] as String?,
        agentTypeCode: data['agent_type_code'] as String?,
        agentTypeName: data['agent_type_name'] as String?,
        agentNicknameTh: data['agent_nickname_th'] as String?,
        agentNicknameEn: data['agent_nickname_en'] as String?,
        agentFax: data['agent_fax'] as String?,
        agentDob: data['agent_dob'] as String?,
        agentBankBranchCode: data['agent_bank_branch_code'] as String?,
        agentBankBranchName: data['agent_bank_branch_name'] as String?,
        agentOccupationCode: data['agent_occupation_code'] as String?,
        agentOccupationName: data['agent_occupation_name'] as String?,
        transactionChannelCode: data['transaction_channel_code'] as String?,
        transactionChannelName: data['transaction_channel_name'] as String?,
        lastedLogin: data['lasted_login'] as String?,
        passwordChange: data['password_change'] as String?,
        agentStatus: data['agent_status'] as String?,
        agentReason: data['agent_reason'] as String?,
        regionCode: data['region_code'] as String?,
        regionName: data['region_name'] as String?,
        areaCode: data['area_code'] as String?,
        areaName: data['area_name'] as String?,
        branchCode: data['branch_code'] as String?,
        branchName: data['branch_name'] as String?,
        agentActivateCode: data['agent_activate_code'] as String?,
        agentActivateFlag: data['agent_activate_flag'] as String?,
        agentActivateDate: data['agent_activate_date'] as String?,
        agentIdImage: data['agent_id_image'] as String?,
        agentBankImage: data['agent_bank_image'] as String?,
        agentAppImage: data['agent_app_image'] as String?,
        smsSendFlg: data['sms_send_flg'] as String?,
        smsSendDate: data['sms_send_date'] as String?,
        smsStatus: data['sms_status'] as String?,
        smsMessage: data['sms_message'] as String?,
        smsSmid: data['sms_smid'] as String?,
        deleted: data['deleted'] as String?,
        createdUserid: data['created_userid'] as String?,
        createdAt: data['created_at'] as String?,
        updatedUserid: data['updated_userid'] as String?,
        updatedAt: data['updated_at'] as String?,
        groupChannelCode: data['group_channel_code'] as String?,
        agentGroupId: data['agent_group_id'] as String?,
        paymentMethod: data['payment_method'] as String?,
        deductionPercent: data['deduction_percent'] as String?,
        paymentChannel: data['payment_channel'] as String?,
        accountNumber: data['account_number'] as String?,
        promptpayNumber: data['promptpay_number'] as String?,
        agentLastnameTh: data['agent_lastname_th'] as String?,
        agentLastnameEn: data['agent_lastname_en'] as String?,
        comEstimateAmt: data['com_estimate_amt'] as String?,
        comEstimateVat: data['com_estimate_vat'] as String?,
        comEstimateNetAmt: data['com_estimate_net_amt'] as String?,
        defaultComPercent: data['default_com_percent'] as String?,
        actualComPercent: data['actual_com_percent'] as String?,
        comEstimateVatAmt: data['com_estimate_vat_amt'] as String?,
        actualPercent: data['actual_percent'] as String?,
        defaultPercent: data['default_percent'] as String?,
      );

  static AgentProfileModelStruct? maybeFromMap(dynamic data) => data is Map
      ? AgentProfileModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'agent_code': _agentCode,
        'company_name_th': _companyNameTh,
        'company_name_en': _companyNameEn,
        'company_address': _companyAddress,
        'company_province_code': _companyProvinceCode,
        'company_province_name': _companyProvinceName,
        'company_district_code': _companyDistrictCode,
        'company_district_name': _companyDistrictName,
        'company_subdistrict_code': _companySubdistrictCode,
        'company_subdistrict_name': _companySubdistrictName,
        'company_zipcode': _companyZipcode,
        'company_phone_number': _companyPhoneNumber,
        'company_mobile_number': _companyMobileNumber,
        'agent_title_en': _agentTitleEn,
        'agent_title_th': _agentTitleTh,
        'agent_name_th': _agentNameTh,
        'agent_name_en': _agentNameEn,
        'agent_address': _agentAddress,
        'agent_province_code': _agentProvinceCode,
        'agent_province_name': _agentProvinceName,
        'agent_district_code': _agentDistrictCode,
        'agent_district_name': _agentDistrictName,
        'agent_subdistrict_code': _agentSubdistrictCode,
        'agent_subdistrict_name': _agentSubdistrictName,
        'agent_zipcode': _agentZipcode,
        'agent_phone_number': _agentPhoneNumber,
        'agent_mobile_phone': _agentMobilePhone,
        'agent_email': _agentEmail,
        'agent_auto_email': _agentAutoEmail,
        'agent_auto_sms': _agentAutoSms,
        'agent_tax_id': _agentTaxId,
        'agent_tax': _agentTax,
        'agent_wht': _agentWht,
        'agent_business_group_code': _agentBusinessGroupCode,
        'agent_business_group_name': _agentBusinessGroupName,
        'contract_name': _contractName,
        'contract_position': _contractPosition,
        'contract_mobile_phone': _contractMobilePhone,
        'agent_payment_type_code': _agentPaymentTypeCode,
        'agent_payment_type_name': _agentPaymentTypeName,
        'owner_bank_code': _ownerBankCode,
        'owner_bank_name': _ownerBankName,
        'owner_bank_no': _ownerBankNo,
        'agent_bank_code': _agentBankCode,
        'agent_bank_name': _agentBankName,
        'agent_bank_account_name': _agentBankAccountName,
        'agent_bank_no': _agentBankNo,
        'agent_payment_period_code': _agentPaymentPeriodCode,
        'agent_payment_period_name': _agentPaymentPeriodName,
        'agent_bank_opendate': _agentBankOpendate,
        'agent_type_code': _agentTypeCode,
        'agent_type_name': _agentTypeName,
        'agent_nickname_th': _agentNicknameTh,
        'agent_nickname_en': _agentNicknameEn,
        'agent_fax': _agentFax,
        'agent_dob': _agentDob,
        'agent_bank_branch_code': _agentBankBranchCode,
        'agent_bank_branch_name': _agentBankBranchName,
        'agent_occupation_code': _agentOccupationCode,
        'agent_occupation_name': _agentOccupationName,
        'transaction_channel_code': _transactionChannelCode,
        'transaction_channel_name': _transactionChannelName,
        'lasted_login': _lastedLogin,
        'password_change': _passwordChange,
        'agent_status': _agentStatus,
        'agent_reason': _agentReason,
        'region_code': _regionCode,
        'region_name': _regionName,
        'area_code': _areaCode,
        'area_name': _areaName,
        'branch_code': _branchCode,
        'branch_name': _branchName,
        'agent_activate_code': _agentActivateCode,
        'agent_activate_flag': _agentActivateFlag,
        'agent_activate_date': _agentActivateDate,
        'agent_id_image': _agentIdImage,
        'agent_bank_image': _agentBankImage,
        'agent_app_image': _agentAppImage,
        'sms_send_flg': _smsSendFlg,
        'sms_send_date': _smsSendDate,
        'sms_status': _smsStatus,
        'sms_message': _smsMessage,
        'sms_smid': _smsSmid,
        'deleted': _deleted,
        'created_userid': _createdUserid,
        'created_at': _createdAt,
        'updated_userid': _updatedUserid,
        'updated_at': _updatedAt,
        'group_channel_code': _groupChannelCode,
        'agent_group_id': _agentGroupId,
        'payment_method': _paymentMethod,
        'deduction_percent': _deductionPercent,
        'payment_channel': _paymentChannel,
        'account_number': _accountNumber,
        'promptpay_number': _promptpayNumber,
        'agent_lastname_th': _agentLastnameTh,
        'agent_lastname_en': _agentLastnameEn,
        'com_estimate_amt': _comEstimateAmt,
        'com_estimate_vat': _comEstimateVat,
        'com_estimate_net_amt': _comEstimateNetAmt,
        'default_com_percent': _defaultComPercent,
        'actual_com_percent': _actualComPercent,
        'com_estimate_vat_amt': _comEstimateVatAmt,
        'actual_percent': _actualPercent,
        'default_percent': _defaultPercent,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'agent_code': serializeParam(
          _agentCode,
          ParamType.String,
        ),
        'company_name_th': serializeParam(
          _companyNameTh,
          ParamType.String,
        ),
        'company_name_en': serializeParam(
          _companyNameEn,
          ParamType.String,
        ),
        'company_address': serializeParam(
          _companyAddress,
          ParamType.String,
        ),
        'company_province_code': serializeParam(
          _companyProvinceCode,
          ParamType.String,
        ),
        'company_province_name': serializeParam(
          _companyProvinceName,
          ParamType.String,
        ),
        'company_district_code': serializeParam(
          _companyDistrictCode,
          ParamType.String,
        ),
        'company_district_name': serializeParam(
          _companyDistrictName,
          ParamType.String,
        ),
        'company_subdistrict_code': serializeParam(
          _companySubdistrictCode,
          ParamType.String,
        ),
        'company_subdistrict_name': serializeParam(
          _companySubdistrictName,
          ParamType.String,
        ),
        'company_zipcode': serializeParam(
          _companyZipcode,
          ParamType.String,
        ),
        'company_phone_number': serializeParam(
          _companyPhoneNumber,
          ParamType.String,
        ),
        'company_mobile_number': serializeParam(
          _companyMobileNumber,
          ParamType.String,
        ),
        'agent_title_en': serializeParam(
          _agentTitleEn,
          ParamType.String,
        ),
        'agent_title_th': serializeParam(
          _agentTitleTh,
          ParamType.String,
        ),
        'agent_name_th': serializeParam(
          _agentNameTh,
          ParamType.String,
        ),
        'agent_name_en': serializeParam(
          _agentNameEn,
          ParamType.String,
        ),
        'agent_address': serializeParam(
          _agentAddress,
          ParamType.String,
        ),
        'agent_province_code': serializeParam(
          _agentProvinceCode,
          ParamType.String,
        ),
        'agent_province_name': serializeParam(
          _agentProvinceName,
          ParamType.String,
        ),
        'agent_district_code': serializeParam(
          _agentDistrictCode,
          ParamType.String,
        ),
        'agent_district_name': serializeParam(
          _agentDistrictName,
          ParamType.String,
        ),
        'agent_subdistrict_code': serializeParam(
          _agentSubdistrictCode,
          ParamType.String,
        ),
        'agent_subdistrict_name': serializeParam(
          _agentSubdistrictName,
          ParamType.String,
        ),
        'agent_zipcode': serializeParam(
          _agentZipcode,
          ParamType.String,
        ),
        'agent_phone_number': serializeParam(
          _agentPhoneNumber,
          ParamType.String,
        ),
        'agent_mobile_phone': serializeParam(
          _agentMobilePhone,
          ParamType.String,
        ),
        'agent_email': serializeParam(
          _agentEmail,
          ParamType.String,
        ),
        'agent_auto_email': serializeParam(
          _agentAutoEmail,
          ParamType.String,
        ),
        'agent_auto_sms': serializeParam(
          _agentAutoSms,
          ParamType.String,
        ),
        'agent_tax_id': serializeParam(
          _agentTaxId,
          ParamType.String,
        ),
        'agent_tax': serializeParam(
          _agentTax,
          ParamType.String,
        ),
        'agent_wht': serializeParam(
          _agentWht,
          ParamType.String,
        ),
        'agent_business_group_code': serializeParam(
          _agentBusinessGroupCode,
          ParamType.String,
        ),
        'agent_business_group_name': serializeParam(
          _agentBusinessGroupName,
          ParamType.String,
        ),
        'contract_name': serializeParam(
          _contractName,
          ParamType.String,
        ),
        'contract_position': serializeParam(
          _contractPosition,
          ParamType.String,
        ),
        'contract_mobile_phone': serializeParam(
          _contractMobilePhone,
          ParamType.String,
        ),
        'agent_payment_type_code': serializeParam(
          _agentPaymentTypeCode,
          ParamType.String,
        ),
        'agent_payment_type_name': serializeParam(
          _agentPaymentTypeName,
          ParamType.String,
        ),
        'owner_bank_code': serializeParam(
          _ownerBankCode,
          ParamType.String,
        ),
        'owner_bank_name': serializeParam(
          _ownerBankName,
          ParamType.String,
        ),
        'owner_bank_no': serializeParam(
          _ownerBankNo,
          ParamType.String,
        ),
        'agent_bank_code': serializeParam(
          _agentBankCode,
          ParamType.String,
        ),
        'agent_bank_name': serializeParam(
          _agentBankName,
          ParamType.String,
        ),
        'agent_bank_account_name': serializeParam(
          _agentBankAccountName,
          ParamType.String,
        ),
        'agent_bank_no': serializeParam(
          _agentBankNo,
          ParamType.String,
        ),
        'agent_payment_period_code': serializeParam(
          _agentPaymentPeriodCode,
          ParamType.String,
        ),
        'agent_payment_period_name': serializeParam(
          _agentPaymentPeriodName,
          ParamType.String,
        ),
        'agent_bank_opendate': serializeParam(
          _agentBankOpendate,
          ParamType.String,
        ),
        'agent_type_code': serializeParam(
          _agentTypeCode,
          ParamType.String,
        ),
        'agent_type_name': serializeParam(
          _agentTypeName,
          ParamType.String,
        ),
        'agent_nickname_th': serializeParam(
          _agentNicknameTh,
          ParamType.String,
        ),
        'agent_nickname_en': serializeParam(
          _agentNicknameEn,
          ParamType.String,
        ),
        'agent_fax': serializeParam(
          _agentFax,
          ParamType.String,
        ),
        'agent_dob': serializeParam(
          _agentDob,
          ParamType.String,
        ),
        'agent_bank_branch_code': serializeParam(
          _agentBankBranchCode,
          ParamType.String,
        ),
        'agent_bank_branch_name': serializeParam(
          _agentBankBranchName,
          ParamType.String,
        ),
        'agent_occupation_code': serializeParam(
          _agentOccupationCode,
          ParamType.String,
        ),
        'agent_occupation_name': serializeParam(
          _agentOccupationName,
          ParamType.String,
        ),
        'transaction_channel_code': serializeParam(
          _transactionChannelCode,
          ParamType.String,
        ),
        'transaction_channel_name': serializeParam(
          _transactionChannelName,
          ParamType.String,
        ),
        'lasted_login': serializeParam(
          _lastedLogin,
          ParamType.String,
        ),
        'password_change': serializeParam(
          _passwordChange,
          ParamType.String,
        ),
        'agent_status': serializeParam(
          _agentStatus,
          ParamType.String,
        ),
        'agent_reason': serializeParam(
          _agentReason,
          ParamType.String,
        ),
        'region_code': serializeParam(
          _regionCode,
          ParamType.String,
        ),
        'region_name': serializeParam(
          _regionName,
          ParamType.String,
        ),
        'area_code': serializeParam(
          _areaCode,
          ParamType.String,
        ),
        'area_name': serializeParam(
          _areaName,
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
        'agent_activate_code': serializeParam(
          _agentActivateCode,
          ParamType.String,
        ),
        'agent_activate_flag': serializeParam(
          _agentActivateFlag,
          ParamType.String,
        ),
        'agent_activate_date': serializeParam(
          _agentActivateDate,
          ParamType.String,
        ),
        'agent_id_image': serializeParam(
          _agentIdImage,
          ParamType.String,
        ),
        'agent_bank_image': serializeParam(
          _agentBankImage,
          ParamType.String,
        ),
        'agent_app_image': serializeParam(
          _agentAppImage,
          ParamType.String,
        ),
        'sms_send_flg': serializeParam(
          _smsSendFlg,
          ParamType.String,
        ),
        'sms_send_date': serializeParam(
          _smsSendDate,
          ParamType.String,
        ),
        'sms_status': serializeParam(
          _smsStatus,
          ParamType.String,
        ),
        'sms_message': serializeParam(
          _smsMessage,
          ParamType.String,
        ),
        'sms_smid': serializeParam(
          _smsSmid,
          ParamType.String,
        ),
        'deleted': serializeParam(
          _deleted,
          ParamType.String,
        ),
        'created_userid': serializeParam(
          _createdUserid,
          ParamType.String,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'updated_userid': serializeParam(
          _updatedUserid,
          ParamType.String,
        ),
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.String,
        ),
        'group_channel_code': serializeParam(
          _groupChannelCode,
          ParamType.String,
        ),
        'agent_group_id': serializeParam(
          _agentGroupId,
          ParamType.String,
        ),
        'payment_method': serializeParam(
          _paymentMethod,
          ParamType.String,
        ),
        'deduction_percent': serializeParam(
          _deductionPercent,
          ParamType.String,
        ),
        'payment_channel': serializeParam(
          _paymentChannel,
          ParamType.String,
        ),
        'account_number': serializeParam(
          _accountNumber,
          ParamType.String,
        ),
        'promptpay_number': serializeParam(
          _promptpayNumber,
          ParamType.String,
        ),
        'agent_lastname_th': serializeParam(
          _agentLastnameTh,
          ParamType.String,
        ),
        'agent_lastname_en': serializeParam(
          _agentLastnameEn,
          ParamType.String,
        ),
        'com_estimate_amt': serializeParam(
          _comEstimateAmt,
          ParamType.String,
        ),
        'com_estimate_vat': serializeParam(
          _comEstimateVat,
          ParamType.String,
        ),
        'com_estimate_net_amt': serializeParam(
          _comEstimateNetAmt,
          ParamType.String,
        ),
        'default_com_percent': serializeParam(
          _defaultComPercent,
          ParamType.String,
        ),
        'actual_com_percent': serializeParam(
          _actualComPercent,
          ParamType.String,
        ),
        'com_estimate_vat_amt': serializeParam(
          _comEstimateVatAmt,
          ParamType.String,
        ),
        'actual_percent': serializeParam(
          _actualPercent,
          ParamType.String,
        ),
        'default_percent': serializeParam(
          _defaultPercent,
          ParamType.String,
        ),
      }.withoutNulls;

  static AgentProfileModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      AgentProfileModelStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        agentCode: deserializeParam(
          data['agent_code'],
          ParamType.String,
          false,
        ),
        companyNameTh: deserializeParam(
          data['company_name_th'],
          ParamType.String,
          false,
        ),
        companyNameEn: deserializeParam(
          data['company_name_en'],
          ParamType.String,
          false,
        ),
        companyAddress: deserializeParam(
          data['company_address'],
          ParamType.String,
          false,
        ),
        companyProvinceCode: deserializeParam(
          data['company_province_code'],
          ParamType.String,
          false,
        ),
        companyProvinceName: deserializeParam(
          data['company_province_name'],
          ParamType.String,
          false,
        ),
        companyDistrictCode: deserializeParam(
          data['company_district_code'],
          ParamType.String,
          false,
        ),
        companyDistrictName: deserializeParam(
          data['company_district_name'],
          ParamType.String,
          false,
        ),
        companySubdistrictCode: deserializeParam(
          data['company_subdistrict_code'],
          ParamType.String,
          false,
        ),
        companySubdistrictName: deserializeParam(
          data['company_subdistrict_name'],
          ParamType.String,
          false,
        ),
        companyZipcode: deserializeParam(
          data['company_zipcode'],
          ParamType.String,
          false,
        ),
        companyPhoneNumber: deserializeParam(
          data['company_phone_number'],
          ParamType.String,
          false,
        ),
        companyMobileNumber: deserializeParam(
          data['company_mobile_number'],
          ParamType.String,
          false,
        ),
        agentTitleEn: deserializeParam(
          data['agent_title_en'],
          ParamType.String,
          false,
        ),
        agentTitleTh: deserializeParam(
          data['agent_title_th'],
          ParamType.String,
          false,
        ),
        agentNameTh: deserializeParam(
          data['agent_name_th'],
          ParamType.String,
          false,
        ),
        agentNameEn: deserializeParam(
          data['agent_name_en'],
          ParamType.String,
          false,
        ),
        agentAddress: deserializeParam(
          data['agent_address'],
          ParamType.String,
          false,
        ),
        agentProvinceCode: deserializeParam(
          data['agent_province_code'],
          ParamType.String,
          false,
        ),
        agentProvinceName: deserializeParam(
          data['agent_province_name'],
          ParamType.String,
          false,
        ),
        agentDistrictCode: deserializeParam(
          data['agent_district_code'],
          ParamType.String,
          false,
        ),
        agentDistrictName: deserializeParam(
          data['agent_district_name'],
          ParamType.String,
          false,
        ),
        agentSubdistrictCode: deserializeParam(
          data['agent_subdistrict_code'],
          ParamType.String,
          false,
        ),
        agentSubdistrictName: deserializeParam(
          data['agent_subdistrict_name'],
          ParamType.String,
          false,
        ),
        agentZipcode: deserializeParam(
          data['agent_zipcode'],
          ParamType.String,
          false,
        ),
        agentPhoneNumber: deserializeParam(
          data['agent_phone_number'],
          ParamType.String,
          false,
        ),
        agentMobilePhone: deserializeParam(
          data['agent_mobile_phone'],
          ParamType.String,
          false,
        ),
        agentEmail: deserializeParam(
          data['agent_email'],
          ParamType.String,
          false,
        ),
        agentAutoEmail: deserializeParam(
          data['agent_auto_email'],
          ParamType.String,
          false,
        ),
        agentAutoSms: deserializeParam(
          data['agent_auto_sms'],
          ParamType.String,
          false,
        ),
        agentTaxId: deserializeParam(
          data['agent_tax_id'],
          ParamType.String,
          false,
        ),
        agentTax: deserializeParam(
          data['agent_tax'],
          ParamType.String,
          false,
        ),
        agentWht: deserializeParam(
          data['agent_wht'],
          ParamType.String,
          false,
        ),
        agentBusinessGroupCode: deserializeParam(
          data['agent_business_group_code'],
          ParamType.String,
          false,
        ),
        agentBusinessGroupName: deserializeParam(
          data['agent_business_group_name'],
          ParamType.String,
          false,
        ),
        contractName: deserializeParam(
          data['contract_name'],
          ParamType.String,
          false,
        ),
        contractPosition: deserializeParam(
          data['contract_position'],
          ParamType.String,
          false,
        ),
        contractMobilePhone: deserializeParam(
          data['contract_mobile_phone'],
          ParamType.String,
          false,
        ),
        agentPaymentTypeCode: deserializeParam(
          data['agent_payment_type_code'],
          ParamType.String,
          false,
        ),
        agentPaymentTypeName: deserializeParam(
          data['agent_payment_type_name'],
          ParamType.String,
          false,
        ),
        ownerBankCode: deserializeParam(
          data['owner_bank_code'],
          ParamType.String,
          false,
        ),
        ownerBankName: deserializeParam(
          data['owner_bank_name'],
          ParamType.String,
          false,
        ),
        ownerBankNo: deserializeParam(
          data['owner_bank_no'],
          ParamType.String,
          false,
        ),
        agentBankCode: deserializeParam(
          data['agent_bank_code'],
          ParamType.String,
          false,
        ),
        agentBankName: deserializeParam(
          data['agent_bank_name'],
          ParamType.String,
          false,
        ),
        agentBankAccountName: deserializeParam(
          data['agent_bank_account_name'],
          ParamType.String,
          false,
        ),
        agentBankNo: deserializeParam(
          data['agent_bank_no'],
          ParamType.String,
          false,
        ),
        agentPaymentPeriodCode: deserializeParam(
          data['agent_payment_period_code'],
          ParamType.String,
          false,
        ),
        agentPaymentPeriodName: deserializeParam(
          data['agent_payment_period_name'],
          ParamType.String,
          false,
        ),
        agentBankOpendate: deserializeParam(
          data['agent_bank_opendate'],
          ParamType.String,
          false,
        ),
        agentTypeCode: deserializeParam(
          data['agent_type_code'],
          ParamType.String,
          false,
        ),
        agentTypeName: deserializeParam(
          data['agent_type_name'],
          ParamType.String,
          false,
        ),
        agentNicknameTh: deserializeParam(
          data['agent_nickname_th'],
          ParamType.String,
          false,
        ),
        agentNicknameEn: deserializeParam(
          data['agent_nickname_en'],
          ParamType.String,
          false,
        ),
        agentFax: deserializeParam(
          data['agent_fax'],
          ParamType.String,
          false,
        ),
        agentDob: deserializeParam(
          data['agent_dob'],
          ParamType.String,
          false,
        ),
        agentBankBranchCode: deserializeParam(
          data['agent_bank_branch_code'],
          ParamType.String,
          false,
        ),
        agentBankBranchName: deserializeParam(
          data['agent_bank_branch_name'],
          ParamType.String,
          false,
        ),
        agentOccupationCode: deserializeParam(
          data['agent_occupation_code'],
          ParamType.String,
          false,
        ),
        agentOccupationName: deserializeParam(
          data['agent_occupation_name'],
          ParamType.String,
          false,
        ),
        transactionChannelCode: deserializeParam(
          data['transaction_channel_code'],
          ParamType.String,
          false,
        ),
        transactionChannelName: deserializeParam(
          data['transaction_channel_name'],
          ParamType.String,
          false,
        ),
        lastedLogin: deserializeParam(
          data['lasted_login'],
          ParamType.String,
          false,
        ),
        passwordChange: deserializeParam(
          data['password_change'],
          ParamType.String,
          false,
        ),
        agentStatus: deserializeParam(
          data['agent_status'],
          ParamType.String,
          false,
        ),
        agentReason: deserializeParam(
          data['agent_reason'],
          ParamType.String,
          false,
        ),
        regionCode: deserializeParam(
          data['region_code'],
          ParamType.String,
          false,
        ),
        regionName: deserializeParam(
          data['region_name'],
          ParamType.String,
          false,
        ),
        areaCode: deserializeParam(
          data['area_code'],
          ParamType.String,
          false,
        ),
        areaName: deserializeParam(
          data['area_name'],
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
        agentActivateCode: deserializeParam(
          data['agent_activate_code'],
          ParamType.String,
          false,
        ),
        agentActivateFlag: deserializeParam(
          data['agent_activate_flag'],
          ParamType.String,
          false,
        ),
        agentActivateDate: deserializeParam(
          data['agent_activate_date'],
          ParamType.String,
          false,
        ),
        agentIdImage: deserializeParam(
          data['agent_id_image'],
          ParamType.String,
          false,
        ),
        agentBankImage: deserializeParam(
          data['agent_bank_image'],
          ParamType.String,
          false,
        ),
        agentAppImage: deserializeParam(
          data['agent_app_image'],
          ParamType.String,
          false,
        ),
        smsSendFlg: deserializeParam(
          data['sms_send_flg'],
          ParamType.String,
          false,
        ),
        smsSendDate: deserializeParam(
          data['sms_send_date'],
          ParamType.String,
          false,
        ),
        smsStatus: deserializeParam(
          data['sms_status'],
          ParamType.String,
          false,
        ),
        smsMessage: deserializeParam(
          data['sms_message'],
          ParamType.String,
          false,
        ),
        smsSmid: deserializeParam(
          data['sms_smid'],
          ParamType.String,
          false,
        ),
        deleted: deserializeParam(
          data['deleted'],
          ParamType.String,
          false,
        ),
        createdUserid: deserializeParam(
          data['created_userid'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.String,
          false,
        ),
        updatedUserid: deserializeParam(
          data['updated_userid'],
          ParamType.String,
          false,
        ),
        updatedAt: deserializeParam(
          data['updated_at'],
          ParamType.String,
          false,
        ),
        groupChannelCode: deserializeParam(
          data['group_channel_code'],
          ParamType.String,
          false,
        ),
        agentGroupId: deserializeParam(
          data['agent_group_id'],
          ParamType.String,
          false,
        ),
        paymentMethod: deserializeParam(
          data['payment_method'],
          ParamType.String,
          false,
        ),
        deductionPercent: deserializeParam(
          data['deduction_percent'],
          ParamType.String,
          false,
        ),
        paymentChannel: deserializeParam(
          data['payment_channel'],
          ParamType.String,
          false,
        ),
        accountNumber: deserializeParam(
          data['account_number'],
          ParamType.String,
          false,
        ),
        promptpayNumber: deserializeParam(
          data['promptpay_number'],
          ParamType.String,
          false,
        ),
        agentLastnameTh: deserializeParam(
          data['agent_lastname_th'],
          ParamType.String,
          false,
        ),
        agentLastnameEn: deserializeParam(
          data['agent_lastname_en'],
          ParamType.String,
          false,
        ),
        comEstimateAmt: deserializeParam(
          data['com_estimate_amt'],
          ParamType.String,
          false,
        ),
        comEstimateVat: deserializeParam(
          data['com_estimate_vat'],
          ParamType.String,
          false,
        ),
        comEstimateNetAmt: deserializeParam(
          data['com_estimate_net_amt'],
          ParamType.String,
          false,
        ),
        defaultComPercent: deserializeParam(
          data['default_com_percent'],
          ParamType.String,
          false,
        ),
        actualComPercent: deserializeParam(
          data['actual_com_percent'],
          ParamType.String,
          false,
        ),
        comEstimateVatAmt: deserializeParam(
          data['com_estimate_vat_amt'],
          ParamType.String,
          false,
        ),
        actualPercent: deserializeParam(
          data['actual_percent'],
          ParamType.String,
          false,
        ),
        defaultPercent: deserializeParam(
          data['default_percent'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AgentProfileModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AgentProfileModelStruct &&
        id == other.id &&
        agentCode == other.agentCode &&
        companyNameTh == other.companyNameTh &&
        companyNameEn == other.companyNameEn &&
        companyAddress == other.companyAddress &&
        companyProvinceCode == other.companyProvinceCode &&
        companyProvinceName == other.companyProvinceName &&
        companyDistrictCode == other.companyDistrictCode &&
        companyDistrictName == other.companyDistrictName &&
        companySubdistrictCode == other.companySubdistrictCode &&
        companySubdistrictName == other.companySubdistrictName &&
        companyZipcode == other.companyZipcode &&
        companyPhoneNumber == other.companyPhoneNumber &&
        companyMobileNumber == other.companyMobileNumber &&
        agentTitleEn == other.agentTitleEn &&
        agentTitleTh == other.agentTitleTh &&
        agentNameTh == other.agentNameTh &&
        agentNameEn == other.agentNameEn &&
        agentAddress == other.agentAddress &&
        agentProvinceCode == other.agentProvinceCode &&
        agentProvinceName == other.agentProvinceName &&
        agentDistrictCode == other.agentDistrictCode &&
        agentDistrictName == other.agentDistrictName &&
        agentSubdistrictCode == other.agentSubdistrictCode &&
        agentSubdistrictName == other.agentSubdistrictName &&
        agentZipcode == other.agentZipcode &&
        agentPhoneNumber == other.agentPhoneNumber &&
        agentMobilePhone == other.agentMobilePhone &&
        agentEmail == other.agentEmail &&
        agentAutoEmail == other.agentAutoEmail &&
        agentAutoSms == other.agentAutoSms &&
        agentTaxId == other.agentTaxId &&
        agentTax == other.agentTax &&
        agentWht == other.agentWht &&
        agentBusinessGroupCode == other.agentBusinessGroupCode &&
        agentBusinessGroupName == other.agentBusinessGroupName &&
        contractName == other.contractName &&
        contractPosition == other.contractPosition &&
        contractMobilePhone == other.contractMobilePhone &&
        agentPaymentTypeCode == other.agentPaymentTypeCode &&
        agentPaymentTypeName == other.agentPaymentTypeName &&
        ownerBankCode == other.ownerBankCode &&
        ownerBankName == other.ownerBankName &&
        ownerBankNo == other.ownerBankNo &&
        agentBankCode == other.agentBankCode &&
        agentBankName == other.agentBankName &&
        agentBankAccountName == other.agentBankAccountName &&
        agentBankNo == other.agentBankNo &&
        agentPaymentPeriodCode == other.agentPaymentPeriodCode &&
        agentPaymentPeriodName == other.agentPaymentPeriodName &&
        agentBankOpendate == other.agentBankOpendate &&
        agentTypeCode == other.agentTypeCode &&
        agentTypeName == other.agentTypeName &&
        agentNicknameTh == other.agentNicknameTh &&
        agentNicknameEn == other.agentNicknameEn &&
        agentFax == other.agentFax &&
        agentDob == other.agentDob &&
        agentBankBranchCode == other.agentBankBranchCode &&
        agentBankBranchName == other.agentBankBranchName &&
        agentOccupationCode == other.agentOccupationCode &&
        agentOccupationName == other.agentOccupationName &&
        transactionChannelCode == other.transactionChannelCode &&
        transactionChannelName == other.transactionChannelName &&
        lastedLogin == other.lastedLogin &&
        passwordChange == other.passwordChange &&
        agentStatus == other.agentStatus &&
        agentReason == other.agentReason &&
        regionCode == other.regionCode &&
        regionName == other.regionName &&
        areaCode == other.areaCode &&
        areaName == other.areaName &&
        branchCode == other.branchCode &&
        branchName == other.branchName &&
        agentActivateCode == other.agentActivateCode &&
        agentActivateFlag == other.agentActivateFlag &&
        agentActivateDate == other.agentActivateDate &&
        agentIdImage == other.agentIdImage &&
        agentBankImage == other.agentBankImage &&
        agentAppImage == other.agentAppImage &&
        smsSendFlg == other.smsSendFlg &&
        smsSendDate == other.smsSendDate &&
        smsStatus == other.smsStatus &&
        smsMessage == other.smsMessage &&
        smsSmid == other.smsSmid &&
        deleted == other.deleted &&
        createdUserid == other.createdUserid &&
        createdAt == other.createdAt &&
        updatedUserid == other.updatedUserid &&
        updatedAt == other.updatedAt &&
        groupChannelCode == other.groupChannelCode &&
        agentGroupId == other.agentGroupId &&
        paymentMethod == other.paymentMethod &&
        deductionPercent == other.deductionPercent &&
        paymentChannel == other.paymentChannel &&
        accountNumber == other.accountNumber &&
        promptpayNumber == other.promptpayNumber &&
        agentLastnameTh == other.agentLastnameTh &&
        agentLastnameEn == other.agentLastnameEn &&
        comEstimateAmt == other.comEstimateAmt &&
        comEstimateVat == other.comEstimateVat &&
        comEstimateNetAmt == other.comEstimateNetAmt &&
        defaultComPercent == other.defaultComPercent &&
        actualComPercent == other.actualComPercent &&
        comEstimateVatAmt == other.comEstimateVatAmt &&
        actualPercent == other.actualPercent &&
        defaultPercent == other.defaultPercent;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        agentCode,
        companyNameTh,
        companyNameEn,
        companyAddress,
        companyProvinceCode,
        companyProvinceName,
        companyDistrictCode,
        companyDistrictName,
        companySubdistrictCode,
        companySubdistrictName,
        companyZipcode,
        companyPhoneNumber,
        companyMobileNumber,
        agentTitleEn,
        agentTitleTh,
        agentNameTh,
        agentNameEn,
        agentAddress,
        agentProvinceCode,
        agentProvinceName,
        agentDistrictCode,
        agentDistrictName,
        agentSubdistrictCode,
        agentSubdistrictName,
        agentZipcode,
        agentPhoneNumber,
        agentMobilePhone,
        agentEmail,
        agentAutoEmail,
        agentAutoSms,
        agentTaxId,
        agentTax,
        agentWht,
        agentBusinessGroupCode,
        agentBusinessGroupName,
        contractName,
        contractPosition,
        contractMobilePhone,
        agentPaymentTypeCode,
        agentPaymentTypeName,
        ownerBankCode,
        ownerBankName,
        ownerBankNo,
        agentBankCode,
        agentBankName,
        agentBankAccountName,
        agentBankNo,
        agentPaymentPeriodCode,
        agentPaymentPeriodName,
        agentBankOpendate,
        agentTypeCode,
        agentTypeName,
        agentNicknameTh,
        agentNicknameEn,
        agentFax,
        agentDob,
        agentBankBranchCode,
        agentBankBranchName,
        agentOccupationCode,
        agentOccupationName,
        transactionChannelCode,
        transactionChannelName,
        lastedLogin,
        passwordChange,
        agentStatus,
        agentReason,
        regionCode,
        regionName,
        areaCode,
        areaName,
        branchCode,
        branchName,
        agentActivateCode,
        agentActivateFlag,
        agentActivateDate,
        agentIdImage,
        agentBankImage,
        agentAppImage,
        smsSendFlg,
        smsSendDate,
        smsStatus,
        smsMessage,
        smsSmid,
        deleted,
        createdUserid,
        createdAt,
        updatedUserid,
        updatedAt,
        groupChannelCode,
        agentGroupId,
        paymentMethod,
        deductionPercent,
        paymentChannel,
        accountNumber,
        promptpayNumber,
        agentLastnameTh,
        agentLastnameEn,
        comEstimateAmt,
        comEstimateVat,
        comEstimateNetAmt,
        defaultComPercent,
        actualComPercent,
        comEstimateVatAmt,
        actualPercent,
        defaultPercent
      ]);
}

AgentProfileModelStruct createAgentProfileModelStruct({
  int? id,
  String? agentCode,
  String? companyNameTh,
  String? companyNameEn,
  String? companyAddress,
  String? companyProvinceCode,
  String? companyProvinceName,
  String? companyDistrictCode,
  String? companyDistrictName,
  String? companySubdistrictCode,
  String? companySubdistrictName,
  String? companyZipcode,
  String? companyPhoneNumber,
  String? companyMobileNumber,
  String? agentTitleEn,
  String? agentTitleTh,
  String? agentNameTh,
  String? agentNameEn,
  String? agentAddress,
  String? agentProvinceCode,
  String? agentProvinceName,
  String? agentDistrictCode,
  String? agentDistrictName,
  String? agentSubdistrictCode,
  String? agentSubdistrictName,
  String? agentZipcode,
  String? agentPhoneNumber,
  String? agentMobilePhone,
  String? agentEmail,
  String? agentAutoEmail,
  String? agentAutoSms,
  String? agentTaxId,
  String? agentTax,
  String? agentWht,
  String? agentBusinessGroupCode,
  String? agentBusinessGroupName,
  String? contractName,
  String? contractPosition,
  String? contractMobilePhone,
  String? agentPaymentTypeCode,
  String? agentPaymentTypeName,
  String? ownerBankCode,
  String? ownerBankName,
  String? ownerBankNo,
  String? agentBankCode,
  String? agentBankName,
  String? agentBankAccountName,
  String? agentBankNo,
  String? agentPaymentPeriodCode,
  String? agentPaymentPeriodName,
  String? agentBankOpendate,
  String? agentTypeCode,
  String? agentTypeName,
  String? agentNicknameTh,
  String? agentNicknameEn,
  String? agentFax,
  String? agentDob,
  String? agentBankBranchCode,
  String? agentBankBranchName,
  String? agentOccupationCode,
  String? agentOccupationName,
  String? transactionChannelCode,
  String? transactionChannelName,
  String? lastedLogin,
  String? passwordChange,
  String? agentStatus,
  String? agentReason,
  String? regionCode,
  String? regionName,
  String? areaCode,
  String? areaName,
  String? branchCode,
  String? branchName,
  String? agentActivateCode,
  String? agentActivateFlag,
  String? agentActivateDate,
  String? agentIdImage,
  String? agentBankImage,
  String? agentAppImage,
  String? smsSendFlg,
  String? smsSendDate,
  String? smsStatus,
  String? smsMessage,
  String? smsSmid,
  String? deleted,
  String? createdUserid,
  String? createdAt,
  String? updatedUserid,
  String? updatedAt,
  String? groupChannelCode,
  String? agentGroupId,
  String? paymentMethod,
  String? deductionPercent,
  String? paymentChannel,
  String? accountNumber,
  String? promptpayNumber,
  String? agentLastnameTh,
  String? agentLastnameEn,
  String? comEstimateAmt,
  String? comEstimateVat,
  String? comEstimateNetAmt,
  String? defaultComPercent,
  String? actualComPercent,
  String? comEstimateVatAmt,
  String? actualPercent,
  String? defaultPercent,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AgentProfileModelStruct(
      id: id,
      agentCode: agentCode,
      companyNameTh: companyNameTh,
      companyNameEn: companyNameEn,
      companyAddress: companyAddress,
      companyProvinceCode: companyProvinceCode,
      companyProvinceName: companyProvinceName,
      companyDistrictCode: companyDistrictCode,
      companyDistrictName: companyDistrictName,
      companySubdistrictCode: companySubdistrictCode,
      companySubdistrictName: companySubdistrictName,
      companyZipcode: companyZipcode,
      companyPhoneNumber: companyPhoneNumber,
      companyMobileNumber: companyMobileNumber,
      agentTitleEn: agentTitleEn,
      agentTitleTh: agentTitleTh,
      agentNameTh: agentNameTh,
      agentNameEn: agentNameEn,
      agentAddress: agentAddress,
      agentProvinceCode: agentProvinceCode,
      agentProvinceName: agentProvinceName,
      agentDistrictCode: agentDistrictCode,
      agentDistrictName: agentDistrictName,
      agentSubdistrictCode: agentSubdistrictCode,
      agentSubdistrictName: agentSubdistrictName,
      agentZipcode: agentZipcode,
      agentPhoneNumber: agentPhoneNumber,
      agentMobilePhone: agentMobilePhone,
      agentEmail: agentEmail,
      agentAutoEmail: agentAutoEmail,
      agentAutoSms: agentAutoSms,
      agentTaxId: agentTaxId,
      agentTax: agentTax,
      agentWht: agentWht,
      agentBusinessGroupCode: agentBusinessGroupCode,
      agentBusinessGroupName: agentBusinessGroupName,
      contractName: contractName,
      contractPosition: contractPosition,
      contractMobilePhone: contractMobilePhone,
      agentPaymentTypeCode: agentPaymentTypeCode,
      agentPaymentTypeName: agentPaymentTypeName,
      ownerBankCode: ownerBankCode,
      ownerBankName: ownerBankName,
      ownerBankNo: ownerBankNo,
      agentBankCode: agentBankCode,
      agentBankName: agentBankName,
      agentBankAccountName: agentBankAccountName,
      agentBankNo: agentBankNo,
      agentPaymentPeriodCode: agentPaymentPeriodCode,
      agentPaymentPeriodName: agentPaymentPeriodName,
      agentBankOpendate: agentBankOpendate,
      agentTypeCode: agentTypeCode,
      agentTypeName: agentTypeName,
      agentNicknameTh: agentNicknameTh,
      agentNicknameEn: agentNicknameEn,
      agentFax: agentFax,
      agentDob: agentDob,
      agentBankBranchCode: agentBankBranchCode,
      agentBankBranchName: agentBankBranchName,
      agentOccupationCode: agentOccupationCode,
      agentOccupationName: agentOccupationName,
      transactionChannelCode: transactionChannelCode,
      transactionChannelName: transactionChannelName,
      lastedLogin: lastedLogin,
      passwordChange: passwordChange,
      agentStatus: agentStatus,
      agentReason: agentReason,
      regionCode: regionCode,
      regionName: regionName,
      areaCode: areaCode,
      areaName: areaName,
      branchCode: branchCode,
      branchName: branchName,
      agentActivateCode: agentActivateCode,
      agentActivateFlag: agentActivateFlag,
      agentActivateDate: agentActivateDate,
      agentIdImage: agentIdImage,
      agentBankImage: agentBankImage,
      agentAppImage: agentAppImage,
      smsSendFlg: smsSendFlg,
      smsSendDate: smsSendDate,
      smsStatus: smsStatus,
      smsMessage: smsMessage,
      smsSmid: smsSmid,
      deleted: deleted,
      createdUserid: createdUserid,
      createdAt: createdAt,
      updatedUserid: updatedUserid,
      updatedAt: updatedAt,
      groupChannelCode: groupChannelCode,
      agentGroupId: agentGroupId,
      paymentMethod: paymentMethod,
      deductionPercent: deductionPercent,
      paymentChannel: paymentChannel,
      accountNumber: accountNumber,
      promptpayNumber: promptpayNumber,
      agentLastnameTh: agentLastnameTh,
      agentLastnameEn: agentLastnameEn,
      comEstimateAmt: comEstimateAmt,
      comEstimateVat: comEstimateVat,
      comEstimateNetAmt: comEstimateNetAmt,
      defaultComPercent: defaultComPercent,
      actualComPercent: actualComPercent,
      comEstimateVatAmt: comEstimateVatAmt,
      actualPercent: actualPercent,
      defaultPercent: defaultPercent,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AgentProfileModelStruct? updateAgentProfileModelStruct(
  AgentProfileModelStruct? agentProfileModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    agentProfileModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAgentProfileModelStructData(
  Map<String, dynamic> firestoreData,
  AgentProfileModelStruct? agentProfileModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (agentProfileModel == null) {
    return;
  }
  if (agentProfileModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && agentProfileModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final agentProfileModelData =
      getAgentProfileModelFirestoreData(agentProfileModel, forFieldValue);
  final nestedData =
      agentProfileModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = agentProfileModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAgentProfileModelFirestoreData(
  AgentProfileModelStruct? agentProfileModel, [
  bool forFieldValue = false,
]) {
  if (agentProfileModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(agentProfileModel.toMap());

  // Add any Firestore field values
  agentProfileModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAgentProfileModelListFirestoreData(
  List<AgentProfileModelStruct>? agentProfileModels,
) =>
    agentProfileModels
        ?.map((e) => getAgentProfileModelFirestoreData(e, true))
        .toList() ??
    [];
