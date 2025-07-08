// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ChanodData2Struct extends FFFirebaseStruct {
  ChanodData2Struct({
    String? leadCode,
    String? dataType,
    String? regionCode,
    String? regionName,
    String? areaCode,
    String? areaName,
    String? branchCode,
    String? branchName,
    String? branchEmail,
    int? titleId,
    String? titleName,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? birthDate,
    int? age,
    String? email,
    String? carYear,
    String? carBrand,
    String? carBrandName,
    String? carModelName,
    String? carCcName,
    String? carVehicleId,
    String? carVehicleName,
    String? carVehicleCode,
    String? carProvince,
    String? carProvinceName,
    String? carRegistration,
    String? carColor,
    String? carOwner,
    String? carRate,
    String? source,
    String? channel,
    String? subChannel,
    String? leadType,
    String? ownerId,
    String? callStatusId,
    String? callStatus,
    String? leadStatus,
    String? reasonId,
    String? reasonCode,
    String? reasonName,
    String? importDate,
    String? actionDate,
    String? flgSendEmail,
    String? oldDbName,
    String? oldContractNo,
    String? oldContractDate,
    String? oldLoanAmount,
    String? dbName,
    String? contractNo,
    String? contractDate,
    String? contractThaiId,
    String? loanAmount,
    String? amountRequest,
    String? chkContractDate,
    String? chkCusConfirmStatus,
    String? chkCusConfirmDate,
    String? chkCrdConfirmStatus,
    String? chkCrdConfirmDate,
    String? chkCusAccepStatus,
    String? chkCusAccepDate,
    String? chkContractStatus,
    String? sendDataFlg,
    String? sendDataDate,
    String? recTelesaleId,
    String? teleLeadId,
    String? gsbBranchCode,
    String? gsbBranchName,
    String? gsbBranchEmail,
    String? leadSystem,
    String? leadRefId,
    String? checkLoop,
    String? pdpaFlg,
    String? pdpaDate,
    String? sqlId,
    String? deleted,
    String? createdUserid,
    String? createdAt,
    String? updatedUserid,
    String? updatedAt,
    String? checkdateException,
    String? remark,
    String? descInfo,
    String? cardType,
    String? countCall,
    String? expireAssignDate,
    String? contractRequest,
    String? sourceBy,
    String? carVehicleNameOld,
    String? subChannelOld,
    String? sourceByOld,
    String? addressBranch,
    String? refEmpLead,
    int? leadMobileId,
    String? idType,
    String? hashId,
    String? landAreaRai,
    String? landAreaNgan,
    String? landAreaWa,
    String? utmmap,
    String? landNo,
    String? surveyNo,
    String? districtCode,
    String? district,
    String? subdistrictCode,
    String? subdistrict,
    String? utmmap1,
    String? utmmap2,
    String? utmmap3,
    String? utmmap4,
    String? parcelType,
    String? landAreaOrg,
    String? landAreaAdj,
    String? currEvaprice,
    String? totalEvaprice,
    String? ltv1,
    String? ltv1Amount,
    String? ltv1waAmount,
    String? ltv2,
    String? ltv2Amount,
    String? ltv2waAmount,
    String? latitude,
    String? longitude,
    String? imageChanodFront,
    String? imageChanodBack,
    String? userVendorName,
    String? referToBranch,
    String? product,
    String? installmentStatus,
    String? coverTypeCode,
    String? packageId,
    String? province,
    String? provinceCode,
    String? leadId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _leadCode = leadCode,
        _dataType = dataType,
        _regionCode = regionCode,
        _regionName = regionName,
        _areaCode = areaCode,
        _areaName = areaName,
        _branchCode = branchCode,
        _branchName = branchName,
        _branchEmail = branchEmail,
        _titleId = titleId,
        _titleName = titleName,
        _firstName = firstName,
        _lastName = lastName,
        _phoneNumber = phoneNumber,
        _birthDate = birthDate,
        _age = age,
        _email = email,
        _carYear = carYear,
        _carBrand = carBrand,
        _carBrandName = carBrandName,
        _carModelName = carModelName,
        _carCcName = carCcName,
        _carVehicleId = carVehicleId,
        _carVehicleName = carVehicleName,
        _carVehicleCode = carVehicleCode,
        _carProvince = carProvince,
        _carProvinceName = carProvinceName,
        _carRegistration = carRegistration,
        _carColor = carColor,
        _carOwner = carOwner,
        _carRate = carRate,
        _source = source,
        _channel = channel,
        _subChannel = subChannel,
        _leadType = leadType,
        _ownerId = ownerId,
        _callStatusId = callStatusId,
        _callStatus = callStatus,
        _leadStatus = leadStatus,
        _reasonId = reasonId,
        _reasonCode = reasonCode,
        _reasonName = reasonName,
        _importDate = importDate,
        _actionDate = actionDate,
        _flgSendEmail = flgSendEmail,
        _oldDbName = oldDbName,
        _oldContractNo = oldContractNo,
        _oldContractDate = oldContractDate,
        _oldLoanAmount = oldLoanAmount,
        _dbName = dbName,
        _contractNo = contractNo,
        _contractDate = contractDate,
        _contractThaiId = contractThaiId,
        _loanAmount = loanAmount,
        _amountRequest = amountRequest,
        _chkContractDate = chkContractDate,
        _chkCusConfirmStatus = chkCusConfirmStatus,
        _chkCusConfirmDate = chkCusConfirmDate,
        _chkCrdConfirmStatus = chkCrdConfirmStatus,
        _chkCrdConfirmDate = chkCrdConfirmDate,
        _chkCusAccepStatus = chkCusAccepStatus,
        _chkCusAccepDate = chkCusAccepDate,
        _chkContractStatus = chkContractStatus,
        _sendDataFlg = sendDataFlg,
        _sendDataDate = sendDataDate,
        _recTelesaleId = recTelesaleId,
        _teleLeadId = teleLeadId,
        _gsbBranchCode = gsbBranchCode,
        _gsbBranchName = gsbBranchName,
        _gsbBranchEmail = gsbBranchEmail,
        _leadSystem = leadSystem,
        _leadRefId = leadRefId,
        _checkLoop = checkLoop,
        _pdpaFlg = pdpaFlg,
        _pdpaDate = pdpaDate,
        _sqlId = sqlId,
        _deleted = deleted,
        _createdUserid = createdUserid,
        _createdAt = createdAt,
        _updatedUserid = updatedUserid,
        _updatedAt = updatedAt,
        _checkdateException = checkdateException,
        _remark = remark,
        _descInfo = descInfo,
        _cardType = cardType,
        _countCall = countCall,
        _expireAssignDate = expireAssignDate,
        _contractRequest = contractRequest,
        _sourceBy = sourceBy,
        _carVehicleNameOld = carVehicleNameOld,
        _subChannelOld = subChannelOld,
        _sourceByOld = sourceByOld,
        _addressBranch = addressBranch,
        _refEmpLead = refEmpLead,
        _leadMobileId = leadMobileId,
        _idType = idType,
        _hashId = hashId,
        _landAreaRai = landAreaRai,
        _landAreaNgan = landAreaNgan,
        _landAreaWa = landAreaWa,
        _utmmap = utmmap,
        _landNo = landNo,
        _surveyNo = surveyNo,
        _districtCode = districtCode,
        _district = district,
        _subdistrictCode = subdistrictCode,
        _subdistrict = subdistrict,
        _utmmap1 = utmmap1,
        _utmmap2 = utmmap2,
        _utmmap3 = utmmap3,
        _utmmap4 = utmmap4,
        _parcelType = parcelType,
        _landAreaOrg = landAreaOrg,
        _landAreaAdj = landAreaAdj,
        _currEvaprice = currEvaprice,
        _totalEvaprice = totalEvaprice,
        _ltv1 = ltv1,
        _ltv1Amount = ltv1Amount,
        _ltv1waAmount = ltv1waAmount,
        _ltv2 = ltv2,
        _ltv2Amount = ltv2Amount,
        _ltv2waAmount = ltv2waAmount,
        _latitude = latitude,
        _longitude = longitude,
        _imageChanodFront = imageChanodFront,
        _imageChanodBack = imageChanodBack,
        _userVendorName = userVendorName,
        _referToBranch = referToBranch,
        _product = product,
        _installmentStatus = installmentStatus,
        _coverTypeCode = coverTypeCode,
        _packageId = packageId,
        _province = province,
        _provinceCode = provinceCode,
        _leadId = leadId,
        super(firestoreUtilData);

  // "lead_code" field.
  String? _leadCode;
  String get leadCode => _leadCode ?? '';
  set leadCode(String? val) => _leadCode = val;

  bool hasLeadCode() => _leadCode != null;

  // "data_type" field.
  String? _dataType;
  String get dataType => _dataType ?? '';
  set dataType(String? val) => _dataType = val;

  bool hasDataType() => _dataType != null;

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

  // "branch_email" field.
  String? _branchEmail;
  String get branchEmail => _branchEmail ?? '';
  set branchEmail(String? val) => _branchEmail = val;

  bool hasBranchEmail() => _branchEmail != null;

  // "title_id" field.
  int? _titleId;
  int get titleId => _titleId ?? 0;
  set titleId(int? val) => _titleId = val;

  void incrementTitleId(int amount) => titleId = titleId + amount;

  bool hasTitleId() => _titleId != null;

  // "title_name" field.
  String? _titleName;
  String get titleName => _titleName ?? '';
  set titleName(String? val) => _titleName = val;

  bool hasTitleName() => _titleName != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? val) => _firstName = val;

  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  set lastName(String? val) => _lastName = val;

  bool hasLastName() => _lastName != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;

  bool hasPhoneNumber() => _phoneNumber != null;

  // "birth_date" field.
  String? _birthDate;
  String get birthDate => _birthDate ?? '';
  set birthDate(String? val) => _birthDate = val;

  bool hasBirthDate() => _birthDate != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  set age(int? val) => _age = val;

  void incrementAge(int amount) => age = age + amount;

  bool hasAge() => _age != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "car_year" field.
  String? _carYear;
  String get carYear => _carYear ?? '';
  set carYear(String? val) => _carYear = val;

  bool hasCarYear() => _carYear != null;

  // "car_brand" field.
  String? _carBrand;
  String get carBrand => _carBrand ?? '';
  set carBrand(String? val) => _carBrand = val;

  bool hasCarBrand() => _carBrand != null;

  // "car_brand_name" field.
  String? _carBrandName;
  String get carBrandName => _carBrandName ?? '';
  set carBrandName(String? val) => _carBrandName = val;

  bool hasCarBrandName() => _carBrandName != null;

  // "car_model_name" field.
  String? _carModelName;
  String get carModelName => _carModelName ?? '';
  set carModelName(String? val) => _carModelName = val;

  bool hasCarModelName() => _carModelName != null;

  // "car_cc_name" field.
  String? _carCcName;
  String get carCcName => _carCcName ?? '';
  set carCcName(String? val) => _carCcName = val;

  bool hasCarCcName() => _carCcName != null;

  // "car_vehicle_id" field.
  String? _carVehicleId;
  String get carVehicleId => _carVehicleId ?? '';
  set carVehicleId(String? val) => _carVehicleId = val;

  bool hasCarVehicleId() => _carVehicleId != null;

  // "car_vehicle_name" field.
  String? _carVehicleName;
  String get carVehicleName => _carVehicleName ?? '';
  set carVehicleName(String? val) => _carVehicleName = val;

  bool hasCarVehicleName() => _carVehicleName != null;

  // "car_vehicle_code" field.
  String? _carVehicleCode;
  String get carVehicleCode => _carVehicleCode ?? '';
  set carVehicleCode(String? val) => _carVehicleCode = val;

  bool hasCarVehicleCode() => _carVehicleCode != null;

  // "car_province" field.
  String? _carProvince;
  String get carProvince => _carProvince ?? '';
  set carProvince(String? val) => _carProvince = val;

  bool hasCarProvince() => _carProvince != null;

  // "car_province_name" field.
  String? _carProvinceName;
  String get carProvinceName => _carProvinceName ?? '';
  set carProvinceName(String? val) => _carProvinceName = val;

  bool hasCarProvinceName() => _carProvinceName != null;

  // "car_registration" field.
  String? _carRegistration;
  String get carRegistration => _carRegistration ?? '';
  set carRegistration(String? val) => _carRegistration = val;

  bool hasCarRegistration() => _carRegistration != null;

  // "car_color" field.
  String? _carColor;
  String get carColor => _carColor ?? '';
  set carColor(String? val) => _carColor = val;

  bool hasCarColor() => _carColor != null;

  // "car_owner" field.
  String? _carOwner;
  String get carOwner => _carOwner ?? '';
  set carOwner(String? val) => _carOwner = val;

  bool hasCarOwner() => _carOwner != null;

  // "car_rate" field.
  String? _carRate;
  String get carRate => _carRate ?? '';
  set carRate(String? val) => _carRate = val;

  bool hasCarRate() => _carRate != null;

  // "source" field.
  String? _source;
  String get source => _source ?? '';
  set source(String? val) => _source = val;

  bool hasSource() => _source != null;

  // "channel" field.
  String? _channel;
  String get channel => _channel ?? '';
  set channel(String? val) => _channel = val;

  bool hasChannel() => _channel != null;

  // "sub_channel" field.
  String? _subChannel;
  String get subChannel => _subChannel ?? '';
  set subChannel(String? val) => _subChannel = val;

  bool hasSubChannel() => _subChannel != null;

  // "lead_type" field.
  String? _leadType;
  String get leadType => _leadType ?? '';
  set leadType(String? val) => _leadType = val;

  bool hasLeadType() => _leadType != null;

  // "owner_id" field.
  String? _ownerId;
  String get ownerId => _ownerId ?? '';
  set ownerId(String? val) => _ownerId = val;

  bool hasOwnerId() => _ownerId != null;

  // "call_status_id" field.
  String? _callStatusId;
  String get callStatusId => _callStatusId ?? '';
  set callStatusId(String? val) => _callStatusId = val;

  bool hasCallStatusId() => _callStatusId != null;

  // "call_status" field.
  String? _callStatus;
  String get callStatus => _callStatus ?? '';
  set callStatus(String? val) => _callStatus = val;

  bool hasCallStatus() => _callStatus != null;

  // "lead_status" field.
  String? _leadStatus;
  String get leadStatus => _leadStatus ?? '';
  set leadStatus(String? val) => _leadStatus = val;

  bool hasLeadStatus() => _leadStatus != null;

  // "reason_id" field.
  String? _reasonId;
  String get reasonId => _reasonId ?? '';
  set reasonId(String? val) => _reasonId = val;

  bool hasReasonId() => _reasonId != null;

  // "reason_code" field.
  String? _reasonCode;
  String get reasonCode => _reasonCode ?? '';
  set reasonCode(String? val) => _reasonCode = val;

  bool hasReasonCode() => _reasonCode != null;

  // "reason_name" field.
  String? _reasonName;
  String get reasonName => _reasonName ?? '';
  set reasonName(String? val) => _reasonName = val;

  bool hasReasonName() => _reasonName != null;

  // "import_date" field.
  String? _importDate;
  String get importDate => _importDate ?? '';
  set importDate(String? val) => _importDate = val;

  bool hasImportDate() => _importDate != null;

  // "action_date" field.
  String? _actionDate;
  String get actionDate => _actionDate ?? '';
  set actionDate(String? val) => _actionDate = val;

  bool hasActionDate() => _actionDate != null;

  // "flg_send_email" field.
  String? _flgSendEmail;
  String get flgSendEmail => _flgSendEmail ?? '';
  set flgSendEmail(String? val) => _flgSendEmail = val;

  bool hasFlgSendEmail() => _flgSendEmail != null;

  // "old_db_name" field.
  String? _oldDbName;
  String get oldDbName => _oldDbName ?? '';
  set oldDbName(String? val) => _oldDbName = val;

  bool hasOldDbName() => _oldDbName != null;

  // "old_contract_no" field.
  String? _oldContractNo;
  String get oldContractNo => _oldContractNo ?? '';
  set oldContractNo(String? val) => _oldContractNo = val;

  bool hasOldContractNo() => _oldContractNo != null;

  // "old_contract_date" field.
  String? _oldContractDate;
  String get oldContractDate => _oldContractDate ?? '';
  set oldContractDate(String? val) => _oldContractDate = val;

  bool hasOldContractDate() => _oldContractDate != null;

  // "old_loan_amount" field.
  String? _oldLoanAmount;
  String get oldLoanAmount => _oldLoanAmount ?? '';
  set oldLoanAmount(String? val) => _oldLoanAmount = val;

  bool hasOldLoanAmount() => _oldLoanAmount != null;

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

  // "contract_date" field.
  String? _contractDate;
  String get contractDate => _contractDate ?? '';
  set contractDate(String? val) => _contractDate = val;

  bool hasContractDate() => _contractDate != null;

  // "contract_thai_id" field.
  String? _contractThaiId;
  String get contractThaiId => _contractThaiId ?? '';
  set contractThaiId(String? val) => _contractThaiId = val;

  bool hasContractThaiId() => _contractThaiId != null;

  // "loan_amount" field.
  String? _loanAmount;
  String get loanAmount => _loanAmount ?? '';
  set loanAmount(String? val) => _loanAmount = val;

  bool hasLoanAmount() => _loanAmount != null;

  // "amount_request" field.
  String? _amountRequest;
  String get amountRequest => _amountRequest ?? '';
  set amountRequest(String? val) => _amountRequest = val;

  bool hasAmountRequest() => _amountRequest != null;

  // "chk_contract_date" field.
  String? _chkContractDate;
  String get chkContractDate => _chkContractDate ?? '';
  set chkContractDate(String? val) => _chkContractDate = val;

  bool hasChkContractDate() => _chkContractDate != null;

  // "chk_cus_confirm_status" field.
  String? _chkCusConfirmStatus;
  String get chkCusConfirmStatus => _chkCusConfirmStatus ?? '';
  set chkCusConfirmStatus(String? val) => _chkCusConfirmStatus = val;

  bool hasChkCusConfirmStatus() => _chkCusConfirmStatus != null;

  // "chk_cus_confirm_date" field.
  String? _chkCusConfirmDate;
  String get chkCusConfirmDate => _chkCusConfirmDate ?? '';
  set chkCusConfirmDate(String? val) => _chkCusConfirmDate = val;

  bool hasChkCusConfirmDate() => _chkCusConfirmDate != null;

  // "chk_crd_confirm_status" field.
  String? _chkCrdConfirmStatus;
  String get chkCrdConfirmStatus => _chkCrdConfirmStatus ?? '';
  set chkCrdConfirmStatus(String? val) => _chkCrdConfirmStatus = val;

  bool hasChkCrdConfirmStatus() => _chkCrdConfirmStatus != null;

  // "chk_crd_confirm_date" field.
  String? _chkCrdConfirmDate;
  String get chkCrdConfirmDate => _chkCrdConfirmDate ?? '';
  set chkCrdConfirmDate(String? val) => _chkCrdConfirmDate = val;

  bool hasChkCrdConfirmDate() => _chkCrdConfirmDate != null;

  // "chk_cus_accep_status" field.
  String? _chkCusAccepStatus;
  String get chkCusAccepStatus => _chkCusAccepStatus ?? '';
  set chkCusAccepStatus(String? val) => _chkCusAccepStatus = val;

  bool hasChkCusAccepStatus() => _chkCusAccepStatus != null;

  // "chk_cus_accep_date" field.
  String? _chkCusAccepDate;
  String get chkCusAccepDate => _chkCusAccepDate ?? '';
  set chkCusAccepDate(String? val) => _chkCusAccepDate = val;

  bool hasChkCusAccepDate() => _chkCusAccepDate != null;

  // "chk_contract_status" field.
  String? _chkContractStatus;
  String get chkContractStatus => _chkContractStatus ?? '';
  set chkContractStatus(String? val) => _chkContractStatus = val;

  bool hasChkContractStatus() => _chkContractStatus != null;

  // "send_data_flg" field.
  String? _sendDataFlg;
  String get sendDataFlg => _sendDataFlg ?? '';
  set sendDataFlg(String? val) => _sendDataFlg = val;

  bool hasSendDataFlg() => _sendDataFlg != null;

  // "send_data_date" field.
  String? _sendDataDate;
  String get sendDataDate => _sendDataDate ?? '';
  set sendDataDate(String? val) => _sendDataDate = val;

  bool hasSendDataDate() => _sendDataDate != null;

  // "rec_telesale_id" field.
  String? _recTelesaleId;
  String get recTelesaleId => _recTelesaleId ?? '';
  set recTelesaleId(String? val) => _recTelesaleId = val;

  bool hasRecTelesaleId() => _recTelesaleId != null;

  // "tele_lead_id" field.
  String? _teleLeadId;
  String get teleLeadId => _teleLeadId ?? '';
  set teleLeadId(String? val) => _teleLeadId = val;

  bool hasTeleLeadId() => _teleLeadId != null;

  // "gsb_branch_code" field.
  String? _gsbBranchCode;
  String get gsbBranchCode => _gsbBranchCode ?? '';
  set gsbBranchCode(String? val) => _gsbBranchCode = val;

  bool hasGsbBranchCode() => _gsbBranchCode != null;

  // "gsb_branch_name" field.
  String? _gsbBranchName;
  String get gsbBranchName => _gsbBranchName ?? '';
  set gsbBranchName(String? val) => _gsbBranchName = val;

  bool hasGsbBranchName() => _gsbBranchName != null;

  // "gsb_branch_email" field.
  String? _gsbBranchEmail;
  String get gsbBranchEmail => _gsbBranchEmail ?? '';
  set gsbBranchEmail(String? val) => _gsbBranchEmail = val;

  bool hasGsbBranchEmail() => _gsbBranchEmail != null;

  // "lead_system" field.
  String? _leadSystem;
  String get leadSystem => _leadSystem ?? '';
  set leadSystem(String? val) => _leadSystem = val;

  bool hasLeadSystem() => _leadSystem != null;

  // "lead_ref_id" field.
  String? _leadRefId;
  String get leadRefId => _leadRefId ?? '';
  set leadRefId(String? val) => _leadRefId = val;

  bool hasLeadRefId() => _leadRefId != null;

  // "check_loop" field.
  String? _checkLoop;
  String get checkLoop => _checkLoop ?? '';
  set checkLoop(String? val) => _checkLoop = val;

  bool hasCheckLoop() => _checkLoop != null;

  // "pdpa_flg" field.
  String? _pdpaFlg;
  String get pdpaFlg => _pdpaFlg ?? '';
  set pdpaFlg(String? val) => _pdpaFlg = val;

  bool hasPdpaFlg() => _pdpaFlg != null;

  // "pdpa_date" field.
  String? _pdpaDate;
  String get pdpaDate => _pdpaDate ?? '';
  set pdpaDate(String? val) => _pdpaDate = val;

  bool hasPdpaDate() => _pdpaDate != null;

  // "sql_id" field.
  String? _sqlId;
  String get sqlId => _sqlId ?? '';
  set sqlId(String? val) => _sqlId = val;

  bool hasSqlId() => _sqlId != null;

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

  // "checkdate_exception" field.
  String? _checkdateException;
  String get checkdateException => _checkdateException ?? '';
  set checkdateException(String? val) => _checkdateException = val;

  bool hasCheckdateException() => _checkdateException != null;

  // "remark" field.
  String? _remark;
  String get remark => _remark ?? '';
  set remark(String? val) => _remark = val;

  bool hasRemark() => _remark != null;

  // "desc_info" field.
  String? _descInfo;
  String get descInfo => _descInfo ?? '';
  set descInfo(String? val) => _descInfo = val;

  bool hasDescInfo() => _descInfo != null;

  // "card_type" field.
  String? _cardType;
  String get cardType => _cardType ?? '';
  set cardType(String? val) => _cardType = val;

  bool hasCardType() => _cardType != null;

  // "countCall" field.
  String? _countCall;
  String get countCall => _countCall ?? '';
  set countCall(String? val) => _countCall = val;

  bool hasCountCall() => _countCall != null;

  // "expire_assign_date" field.
  String? _expireAssignDate;
  String get expireAssignDate => _expireAssignDate ?? '';
  set expireAssignDate(String? val) => _expireAssignDate = val;

  bool hasExpireAssignDate() => _expireAssignDate != null;

  // "contract_request" field.
  String? _contractRequest;
  String get contractRequest => _contractRequest ?? '';
  set contractRequest(String? val) => _contractRequest = val;

  bool hasContractRequest() => _contractRequest != null;

  // "source_by" field.
  String? _sourceBy;
  String get sourceBy => _sourceBy ?? '';
  set sourceBy(String? val) => _sourceBy = val;

  bool hasSourceBy() => _sourceBy != null;

  // "car_vehicle_name_old" field.
  String? _carVehicleNameOld;
  String get carVehicleNameOld => _carVehicleNameOld ?? '';
  set carVehicleNameOld(String? val) => _carVehicleNameOld = val;

  bool hasCarVehicleNameOld() => _carVehicleNameOld != null;

  // "sub_channel_old" field.
  String? _subChannelOld;
  String get subChannelOld => _subChannelOld ?? '';
  set subChannelOld(String? val) => _subChannelOld = val;

  bool hasSubChannelOld() => _subChannelOld != null;

  // "source_by_old" field.
  String? _sourceByOld;
  String get sourceByOld => _sourceByOld ?? '';
  set sourceByOld(String? val) => _sourceByOld = val;

  bool hasSourceByOld() => _sourceByOld != null;

  // "address_branch" field.
  String? _addressBranch;
  String get addressBranch => _addressBranch ?? '';
  set addressBranch(String? val) => _addressBranch = val;

  bool hasAddressBranch() => _addressBranch != null;

  // "ref_emp_lead" field.
  String? _refEmpLead;
  String get refEmpLead => _refEmpLead ?? '';
  set refEmpLead(String? val) => _refEmpLead = val;

  bool hasRefEmpLead() => _refEmpLead != null;

  // "lead_mobile_id" field.
  int? _leadMobileId;
  int get leadMobileId => _leadMobileId ?? 0;
  set leadMobileId(int? val) => _leadMobileId = val;

  void incrementLeadMobileId(int amount) =>
      leadMobileId = leadMobileId + amount;

  bool hasLeadMobileId() => _leadMobileId != null;

  // "id_type" field.
  String? _idType;
  String get idType => _idType ?? '';
  set idType(String? val) => _idType = val;

  bool hasIdType() => _idType != null;

  // "hash_id" field.
  String? _hashId;
  String get hashId => _hashId ?? '';
  set hashId(String? val) => _hashId = val;

  bool hasHashId() => _hashId != null;

  // "land_area_rai" field.
  String? _landAreaRai;
  String get landAreaRai => _landAreaRai ?? '';
  set landAreaRai(String? val) => _landAreaRai = val;

  bool hasLandAreaRai() => _landAreaRai != null;

  // "land_area_ngan" field.
  String? _landAreaNgan;
  String get landAreaNgan => _landAreaNgan ?? '';
  set landAreaNgan(String? val) => _landAreaNgan = val;

  bool hasLandAreaNgan() => _landAreaNgan != null;

  // "land_area_wa" field.
  String? _landAreaWa;
  String get landAreaWa => _landAreaWa ?? '';
  set landAreaWa(String? val) => _landAreaWa = val;

  bool hasLandAreaWa() => _landAreaWa != null;

  // "utmmap" field.
  String? _utmmap;
  String get utmmap => _utmmap ?? '';
  set utmmap(String? val) => _utmmap = val;

  bool hasUtmmap() => _utmmap != null;

  // "land_no" field.
  String? _landNo;
  String get landNo => _landNo ?? '';
  set landNo(String? val) => _landNo = val;

  bool hasLandNo() => _landNo != null;

  // "survey_no" field.
  String? _surveyNo;
  String get surveyNo => _surveyNo ?? '';
  set surveyNo(String? val) => _surveyNo = val;

  bool hasSurveyNo() => _surveyNo != null;

  // "district_code" field.
  String? _districtCode;
  String get districtCode => _districtCode ?? '';
  set districtCode(String? val) => _districtCode = val;

  bool hasDistrictCode() => _districtCode != null;

  // "district" field.
  String? _district;
  String get district => _district ?? '';
  set district(String? val) => _district = val;

  bool hasDistrict() => _district != null;

  // "subdistrict_code" field.
  String? _subdistrictCode;
  String get subdistrictCode => _subdistrictCode ?? '';
  set subdistrictCode(String? val) => _subdistrictCode = val;

  bool hasSubdistrictCode() => _subdistrictCode != null;

  // "subdistrict" field.
  String? _subdistrict;
  String get subdistrict => _subdistrict ?? '';
  set subdistrict(String? val) => _subdistrict = val;

  bool hasSubdistrict() => _subdistrict != null;

  // "utmmap1" field.
  String? _utmmap1;
  String get utmmap1 => _utmmap1 ?? '';
  set utmmap1(String? val) => _utmmap1 = val;

  bool hasUtmmap1() => _utmmap1 != null;

  // "utmmap2" field.
  String? _utmmap2;
  String get utmmap2 => _utmmap2 ?? '';
  set utmmap2(String? val) => _utmmap2 = val;

  bool hasUtmmap2() => _utmmap2 != null;

  // "utmmap3" field.
  String? _utmmap3;
  String get utmmap3 => _utmmap3 ?? '';
  set utmmap3(String? val) => _utmmap3 = val;

  bool hasUtmmap3() => _utmmap3 != null;

  // "utmmap4" field.
  String? _utmmap4;
  String get utmmap4 => _utmmap4 ?? '';
  set utmmap4(String? val) => _utmmap4 = val;

  bool hasUtmmap4() => _utmmap4 != null;

  // "parcel_type" field.
  String? _parcelType;
  String get parcelType => _parcelType ?? '';
  set parcelType(String? val) => _parcelType = val;

  bool hasParcelType() => _parcelType != null;

  // "land_area_org" field.
  String? _landAreaOrg;
  String get landAreaOrg => _landAreaOrg ?? '';
  set landAreaOrg(String? val) => _landAreaOrg = val;

  bool hasLandAreaOrg() => _landAreaOrg != null;

  // "land_area_adj" field.
  String? _landAreaAdj;
  String get landAreaAdj => _landAreaAdj ?? '';
  set landAreaAdj(String? val) => _landAreaAdj = val;

  bool hasLandAreaAdj() => _landAreaAdj != null;

  // "curr_evaprice" field.
  String? _currEvaprice;
  String get currEvaprice => _currEvaprice ?? '';
  set currEvaprice(String? val) => _currEvaprice = val;

  bool hasCurrEvaprice() => _currEvaprice != null;

  // "total_evaprice" field.
  String? _totalEvaprice;
  String get totalEvaprice => _totalEvaprice ?? '';
  set totalEvaprice(String? val) => _totalEvaprice = val;

  bool hasTotalEvaprice() => _totalEvaprice != null;

  // "ltv1" field.
  String? _ltv1;
  String get ltv1 => _ltv1 ?? '';
  set ltv1(String? val) => _ltv1 = val;

  bool hasLtv1() => _ltv1 != null;

  // "ltv1_amount" field.
  String? _ltv1Amount;
  String get ltv1Amount => _ltv1Amount ?? '';
  set ltv1Amount(String? val) => _ltv1Amount = val;

  bool hasLtv1Amount() => _ltv1Amount != null;

  // "ltv1wa_amount" field.
  String? _ltv1waAmount;
  String get ltv1waAmount => _ltv1waAmount ?? '';
  set ltv1waAmount(String? val) => _ltv1waAmount = val;

  bool hasLtv1waAmount() => _ltv1waAmount != null;

  // "ltv2" field.
  String? _ltv2;
  String get ltv2 => _ltv2 ?? '';
  set ltv2(String? val) => _ltv2 = val;

  bool hasLtv2() => _ltv2 != null;

  // "ltv2_amount" field.
  String? _ltv2Amount;
  String get ltv2Amount => _ltv2Amount ?? '';
  set ltv2Amount(String? val) => _ltv2Amount = val;

  bool hasLtv2Amount() => _ltv2Amount != null;

  // "ltv2wa_amount" field.
  String? _ltv2waAmount;
  String get ltv2waAmount => _ltv2waAmount ?? '';
  set ltv2waAmount(String? val) => _ltv2waAmount = val;

  bool hasLtv2waAmount() => _ltv2waAmount != null;

  // "latitude" field.
  String? _latitude;
  String get latitude => _latitude ?? '';
  set latitude(String? val) => _latitude = val;

  bool hasLatitude() => _latitude != null;

  // "longitude" field.
  String? _longitude;
  String get longitude => _longitude ?? '';
  set longitude(String? val) => _longitude = val;

  bool hasLongitude() => _longitude != null;

  // "image_chanod_front" field.
  String? _imageChanodFront;
  String get imageChanodFront => _imageChanodFront ?? '';
  set imageChanodFront(String? val) => _imageChanodFront = val;

  bool hasImageChanodFront() => _imageChanodFront != null;

  // "image_chanod_back" field.
  String? _imageChanodBack;
  String get imageChanodBack => _imageChanodBack ?? '';
  set imageChanodBack(String? val) => _imageChanodBack = val;

  bool hasImageChanodBack() => _imageChanodBack != null;

  // "user_vendor_name" field.
  String? _userVendorName;
  String get userVendorName => _userVendorName ?? '';
  set userVendorName(String? val) => _userVendorName = val;

  bool hasUserVendorName() => _userVendorName != null;

  // "refer_to_branch" field.
  String? _referToBranch;
  String get referToBranch => _referToBranch ?? '';
  set referToBranch(String? val) => _referToBranch = val;

  bool hasReferToBranch() => _referToBranch != null;

  // "product" field.
  String? _product;
  String get product => _product ?? '';
  set product(String? val) => _product = val;

  bool hasProduct() => _product != null;

  // "installment_status" field.
  String? _installmentStatus;
  String get installmentStatus => _installmentStatus ?? '';
  set installmentStatus(String? val) => _installmentStatus = val;

  bool hasInstallmentStatus() => _installmentStatus != null;

  // "cover_type_code" field.
  String? _coverTypeCode;
  String get coverTypeCode => _coverTypeCode ?? '';
  set coverTypeCode(String? val) => _coverTypeCode = val;

  bool hasCoverTypeCode() => _coverTypeCode != null;

  // "package_id" field.
  String? _packageId;
  String get packageId => _packageId ?? '';
  set packageId(String? val) => _packageId = val;

  bool hasPackageId() => _packageId != null;

  // "province" field.
  String? _province;
  String get province => _province ?? '';
  set province(String? val) => _province = val;

  bool hasProvince() => _province != null;

  // "province_code" field.
  String? _provinceCode;
  String get provinceCode => _provinceCode ?? '';
  set provinceCode(String? val) => _provinceCode = val;

  bool hasProvinceCode() => _provinceCode != null;

  // "lead_id" field.
  String? _leadId;
  String get leadId => _leadId ?? '';
  set leadId(String? val) => _leadId = val;

  bool hasLeadId() => _leadId != null;

  static ChanodData2Struct fromMap(Map<String, dynamic> data) =>
      ChanodData2Struct(
        leadCode: data['lead_code'] as String?,
        dataType: data['data_type'] as String?,
        regionCode: data['region_code'] as String?,
        regionName: data['region_name'] as String?,
        areaCode: data['area_code'] as String?,
        areaName: data['area_name'] as String?,
        branchCode: data['branch_code'] as String?,
        branchName: data['branch_name'] as String?,
        branchEmail: data['branch_email'] as String?,
        titleId: castToType<int>(data['title_id']),
        titleName: data['title_name'] as String?,
        firstName: data['first_name'] as String?,
        lastName: data['last_name'] as String?,
        phoneNumber: data['phone_number'] as String?,
        birthDate: data['birth_date'] as String?,
        age: castToType<int>(data['age']),
        email: data['email'] as String?,
        carYear: data['car_year'] as String?,
        carBrand: data['car_brand'] as String?,
        carBrandName: data['car_brand_name'] as String?,
        carModelName: data['car_model_name'] as String?,
        carCcName: data['car_cc_name'] as String?,
        carVehicleId: data['car_vehicle_id'] as String?,
        carVehicleName: data['car_vehicle_name'] as String?,
        carVehicleCode: data['car_vehicle_code'] as String?,
        carProvince: data['car_province'] as String?,
        carProvinceName: data['car_province_name'] as String?,
        carRegistration: data['car_registration'] as String?,
        carColor: data['car_color'] as String?,
        carOwner: data['car_owner'] as String?,
        carRate: data['car_rate'] as String?,
        source: data['source'] as String?,
        channel: data['channel'] as String?,
        subChannel: data['sub_channel'] as String?,
        leadType: data['lead_type'] as String?,
        ownerId: data['owner_id'] as String?,
        callStatusId: data['call_status_id'] as String?,
        callStatus: data['call_status'] as String?,
        leadStatus: data['lead_status'] as String?,
        reasonId: data['reason_id'] as String?,
        reasonCode: data['reason_code'] as String?,
        reasonName: data['reason_name'] as String?,
        importDate: data['import_date'] as String?,
        actionDate: data['action_date'] as String?,
        flgSendEmail: data['flg_send_email'] as String?,
        oldDbName: data['old_db_name'] as String?,
        oldContractNo: data['old_contract_no'] as String?,
        oldContractDate: data['old_contract_date'] as String?,
        oldLoanAmount: data['old_loan_amount'] as String?,
        dbName: data['db_name'] as String?,
        contractNo: data['contract_no'] as String?,
        contractDate: data['contract_date'] as String?,
        contractThaiId: data['contract_thai_id'] as String?,
        loanAmount: data['loan_amount'] as String?,
        amountRequest: data['amount_request'] as String?,
        chkContractDate: data['chk_contract_date'] as String?,
        chkCusConfirmStatus: data['chk_cus_confirm_status'] as String?,
        chkCusConfirmDate: data['chk_cus_confirm_date'] as String?,
        chkCrdConfirmStatus: data['chk_crd_confirm_status'] as String?,
        chkCrdConfirmDate: data['chk_crd_confirm_date'] as String?,
        chkCusAccepStatus: data['chk_cus_accep_status'] as String?,
        chkCusAccepDate: data['chk_cus_accep_date'] as String?,
        chkContractStatus: data['chk_contract_status'] as String?,
        sendDataFlg: data['send_data_flg'] as String?,
        sendDataDate: data['send_data_date'] as String?,
        recTelesaleId: data['rec_telesale_id'] as String?,
        teleLeadId: data['tele_lead_id'] as String?,
        gsbBranchCode: data['gsb_branch_code'] as String?,
        gsbBranchName: data['gsb_branch_name'] as String?,
        gsbBranchEmail: data['gsb_branch_email'] as String?,
        leadSystem: data['lead_system'] as String?,
        leadRefId: data['lead_ref_id'] as String?,
        checkLoop: data['check_loop'] as String?,
        pdpaFlg: data['pdpa_flg'] as String?,
        pdpaDate: data['pdpa_date'] as String?,
        sqlId: data['sql_id'] as String?,
        deleted: data['deleted'] as String?,
        createdUserid: data['created_userid'] as String?,
        createdAt: data['created_at'] as String?,
        updatedUserid: data['updated_userid'] as String?,
        updatedAt: data['updated_at'] as String?,
        checkdateException: data['checkdate_exception'] as String?,
        remark: data['remark'] as String?,
        descInfo: data['desc_info'] as String?,
        cardType: data['card_type'] as String?,
        countCall: data['countCall'] as String?,
        expireAssignDate: data['expire_assign_date'] as String?,
        contractRequest: data['contract_request'] as String?,
        sourceBy: data['source_by'] as String?,
        carVehicleNameOld: data['car_vehicle_name_old'] as String?,
        subChannelOld: data['sub_channel_old'] as String?,
        sourceByOld: data['source_by_old'] as String?,
        addressBranch: data['address_branch'] as String?,
        refEmpLead: data['ref_emp_lead'] as String?,
        leadMobileId: castToType<int>(data['lead_mobile_id']),
        idType: data['id_type'] as String?,
        hashId: data['hash_id'] as String?,
        landAreaRai: data['land_area_rai'] as String?,
        landAreaNgan: data['land_area_ngan'] as String?,
        landAreaWa: data['land_area_wa'] as String?,
        utmmap: data['utmmap'] as String?,
        landNo: data['land_no'] as String?,
        surveyNo: data['survey_no'] as String?,
        districtCode: data['district_code'] as String?,
        district: data['district'] as String?,
        subdistrictCode: data['subdistrict_code'] as String?,
        subdistrict: data['subdistrict'] as String?,
        utmmap1: data['utmmap1'] as String?,
        utmmap2: data['utmmap2'] as String?,
        utmmap3: data['utmmap3'] as String?,
        utmmap4: data['utmmap4'] as String?,
        parcelType: data['parcel_type'] as String?,
        landAreaOrg: data['land_area_org'] as String?,
        landAreaAdj: data['land_area_adj'] as String?,
        currEvaprice: data['curr_evaprice'] as String?,
        totalEvaprice: data['total_evaprice'] as String?,
        ltv1: data['ltv1'] as String?,
        ltv1Amount: data['ltv1_amount'] as String?,
        ltv1waAmount: data['ltv1wa_amount'] as String?,
        ltv2: data['ltv2'] as String?,
        ltv2Amount: data['ltv2_amount'] as String?,
        ltv2waAmount: data['ltv2wa_amount'] as String?,
        latitude: data['latitude'] as String?,
        longitude: data['longitude'] as String?,
        imageChanodFront: data['image_chanod_front'] as String?,
        imageChanodBack: data['image_chanod_back'] as String?,
        userVendorName: data['user_vendor_name'] as String?,
        referToBranch: data['refer_to_branch'] as String?,
        product: data['product'] as String?,
        installmentStatus: data['installment_status'] as String?,
        coverTypeCode: data['cover_type_code'] as String?,
        packageId: data['package_id'] as String?,
        province: data['province'] as String?,
        provinceCode: data['province_code'] as String?,
        leadId: data['lead_id'] as String?,
      );

  static ChanodData2Struct? maybeFromMap(dynamic data) => data is Map
      ? ChanodData2Struct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'lead_code': _leadCode,
        'data_type': _dataType,
        'region_code': _regionCode,
        'region_name': _regionName,
        'area_code': _areaCode,
        'area_name': _areaName,
        'branch_code': _branchCode,
        'branch_name': _branchName,
        'branch_email': _branchEmail,
        'title_id': _titleId,
        'title_name': _titleName,
        'first_name': _firstName,
        'last_name': _lastName,
        'phone_number': _phoneNumber,
        'birth_date': _birthDate,
        'age': _age,
        'email': _email,
        'car_year': _carYear,
        'car_brand': _carBrand,
        'car_brand_name': _carBrandName,
        'car_model_name': _carModelName,
        'car_cc_name': _carCcName,
        'car_vehicle_id': _carVehicleId,
        'car_vehicle_name': _carVehicleName,
        'car_vehicle_code': _carVehicleCode,
        'car_province': _carProvince,
        'car_province_name': _carProvinceName,
        'car_registration': _carRegistration,
        'car_color': _carColor,
        'car_owner': _carOwner,
        'car_rate': _carRate,
        'source': _source,
        'channel': _channel,
        'sub_channel': _subChannel,
        'lead_type': _leadType,
        'owner_id': _ownerId,
        'call_status_id': _callStatusId,
        'call_status': _callStatus,
        'lead_status': _leadStatus,
        'reason_id': _reasonId,
        'reason_code': _reasonCode,
        'reason_name': _reasonName,
        'import_date': _importDate,
        'action_date': _actionDate,
        'flg_send_email': _flgSendEmail,
        'old_db_name': _oldDbName,
        'old_contract_no': _oldContractNo,
        'old_contract_date': _oldContractDate,
        'old_loan_amount': _oldLoanAmount,
        'db_name': _dbName,
        'contract_no': _contractNo,
        'contract_date': _contractDate,
        'contract_thai_id': _contractThaiId,
        'loan_amount': _loanAmount,
        'amount_request': _amountRequest,
        'chk_contract_date': _chkContractDate,
        'chk_cus_confirm_status': _chkCusConfirmStatus,
        'chk_cus_confirm_date': _chkCusConfirmDate,
        'chk_crd_confirm_status': _chkCrdConfirmStatus,
        'chk_crd_confirm_date': _chkCrdConfirmDate,
        'chk_cus_accep_status': _chkCusAccepStatus,
        'chk_cus_accep_date': _chkCusAccepDate,
        'chk_contract_status': _chkContractStatus,
        'send_data_flg': _sendDataFlg,
        'send_data_date': _sendDataDate,
        'rec_telesale_id': _recTelesaleId,
        'tele_lead_id': _teleLeadId,
        'gsb_branch_code': _gsbBranchCode,
        'gsb_branch_name': _gsbBranchName,
        'gsb_branch_email': _gsbBranchEmail,
        'lead_system': _leadSystem,
        'lead_ref_id': _leadRefId,
        'check_loop': _checkLoop,
        'pdpa_flg': _pdpaFlg,
        'pdpa_date': _pdpaDate,
        'sql_id': _sqlId,
        'deleted': _deleted,
        'created_userid': _createdUserid,
        'created_at': _createdAt,
        'updated_userid': _updatedUserid,
        'updated_at': _updatedAt,
        'checkdate_exception': _checkdateException,
        'remark': _remark,
        'desc_info': _descInfo,
        'card_type': _cardType,
        'countCall': _countCall,
        'expire_assign_date': _expireAssignDate,
        'contract_request': _contractRequest,
        'source_by': _sourceBy,
        'car_vehicle_name_old': _carVehicleNameOld,
        'sub_channel_old': _subChannelOld,
        'source_by_old': _sourceByOld,
        'address_branch': _addressBranch,
        'ref_emp_lead': _refEmpLead,
        'lead_mobile_id': _leadMobileId,
        'id_type': _idType,
        'hash_id': _hashId,
        'land_area_rai': _landAreaRai,
        'land_area_ngan': _landAreaNgan,
        'land_area_wa': _landAreaWa,
        'utmmap': _utmmap,
        'land_no': _landNo,
        'survey_no': _surveyNo,
        'district_code': _districtCode,
        'district': _district,
        'subdistrict_code': _subdistrictCode,
        'subdistrict': _subdistrict,
        'utmmap1': _utmmap1,
        'utmmap2': _utmmap2,
        'utmmap3': _utmmap3,
        'utmmap4': _utmmap4,
        'parcel_type': _parcelType,
        'land_area_org': _landAreaOrg,
        'land_area_adj': _landAreaAdj,
        'curr_evaprice': _currEvaprice,
        'total_evaprice': _totalEvaprice,
        'ltv1': _ltv1,
        'ltv1_amount': _ltv1Amount,
        'ltv1wa_amount': _ltv1waAmount,
        'ltv2': _ltv2,
        'ltv2_amount': _ltv2Amount,
        'ltv2wa_amount': _ltv2waAmount,
        'latitude': _latitude,
        'longitude': _longitude,
        'image_chanod_front': _imageChanodFront,
        'image_chanod_back': _imageChanodBack,
        'user_vendor_name': _userVendorName,
        'refer_to_branch': _referToBranch,
        'product': _product,
        'installment_status': _installmentStatus,
        'cover_type_code': _coverTypeCode,
        'package_id': _packageId,
        'province': _province,
        'province_code': _provinceCode,
        'lead_id': _leadId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'lead_code': serializeParam(
          _leadCode,
          ParamType.String,
        ),
        'data_type': serializeParam(
          _dataType,
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
        'branch_email': serializeParam(
          _branchEmail,
          ParamType.String,
        ),
        'title_id': serializeParam(
          _titleId,
          ParamType.int,
        ),
        'title_name': serializeParam(
          _titleName,
          ParamType.String,
        ),
        'first_name': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'last_name': serializeParam(
          _lastName,
          ParamType.String,
        ),
        'phone_number': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
        'birth_date': serializeParam(
          _birthDate,
          ParamType.String,
        ),
        'age': serializeParam(
          _age,
          ParamType.int,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'car_year': serializeParam(
          _carYear,
          ParamType.String,
        ),
        'car_brand': serializeParam(
          _carBrand,
          ParamType.String,
        ),
        'car_brand_name': serializeParam(
          _carBrandName,
          ParamType.String,
        ),
        'car_model_name': serializeParam(
          _carModelName,
          ParamType.String,
        ),
        'car_cc_name': serializeParam(
          _carCcName,
          ParamType.String,
        ),
        'car_vehicle_id': serializeParam(
          _carVehicleId,
          ParamType.String,
        ),
        'car_vehicle_name': serializeParam(
          _carVehicleName,
          ParamType.String,
        ),
        'car_vehicle_code': serializeParam(
          _carVehicleCode,
          ParamType.String,
        ),
        'car_province': serializeParam(
          _carProvince,
          ParamType.String,
        ),
        'car_province_name': serializeParam(
          _carProvinceName,
          ParamType.String,
        ),
        'car_registration': serializeParam(
          _carRegistration,
          ParamType.String,
        ),
        'car_color': serializeParam(
          _carColor,
          ParamType.String,
        ),
        'car_owner': serializeParam(
          _carOwner,
          ParamType.String,
        ),
        'car_rate': serializeParam(
          _carRate,
          ParamType.String,
        ),
        'source': serializeParam(
          _source,
          ParamType.String,
        ),
        'channel': serializeParam(
          _channel,
          ParamType.String,
        ),
        'sub_channel': serializeParam(
          _subChannel,
          ParamType.String,
        ),
        'lead_type': serializeParam(
          _leadType,
          ParamType.String,
        ),
        'owner_id': serializeParam(
          _ownerId,
          ParamType.String,
        ),
        'call_status_id': serializeParam(
          _callStatusId,
          ParamType.String,
        ),
        'call_status': serializeParam(
          _callStatus,
          ParamType.String,
        ),
        'lead_status': serializeParam(
          _leadStatus,
          ParamType.String,
        ),
        'reason_id': serializeParam(
          _reasonId,
          ParamType.String,
        ),
        'reason_code': serializeParam(
          _reasonCode,
          ParamType.String,
        ),
        'reason_name': serializeParam(
          _reasonName,
          ParamType.String,
        ),
        'import_date': serializeParam(
          _importDate,
          ParamType.String,
        ),
        'action_date': serializeParam(
          _actionDate,
          ParamType.String,
        ),
        'flg_send_email': serializeParam(
          _flgSendEmail,
          ParamType.String,
        ),
        'old_db_name': serializeParam(
          _oldDbName,
          ParamType.String,
        ),
        'old_contract_no': serializeParam(
          _oldContractNo,
          ParamType.String,
        ),
        'old_contract_date': serializeParam(
          _oldContractDate,
          ParamType.String,
        ),
        'old_loan_amount': serializeParam(
          _oldLoanAmount,
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
        'contract_date': serializeParam(
          _contractDate,
          ParamType.String,
        ),
        'contract_thai_id': serializeParam(
          _contractThaiId,
          ParamType.String,
        ),
        'loan_amount': serializeParam(
          _loanAmount,
          ParamType.String,
        ),
        'amount_request': serializeParam(
          _amountRequest,
          ParamType.String,
        ),
        'chk_contract_date': serializeParam(
          _chkContractDate,
          ParamType.String,
        ),
        'chk_cus_confirm_status': serializeParam(
          _chkCusConfirmStatus,
          ParamType.String,
        ),
        'chk_cus_confirm_date': serializeParam(
          _chkCusConfirmDate,
          ParamType.String,
        ),
        'chk_crd_confirm_status': serializeParam(
          _chkCrdConfirmStatus,
          ParamType.String,
        ),
        'chk_crd_confirm_date': serializeParam(
          _chkCrdConfirmDate,
          ParamType.String,
        ),
        'chk_cus_accep_status': serializeParam(
          _chkCusAccepStatus,
          ParamType.String,
        ),
        'chk_cus_accep_date': serializeParam(
          _chkCusAccepDate,
          ParamType.String,
        ),
        'chk_contract_status': serializeParam(
          _chkContractStatus,
          ParamType.String,
        ),
        'send_data_flg': serializeParam(
          _sendDataFlg,
          ParamType.String,
        ),
        'send_data_date': serializeParam(
          _sendDataDate,
          ParamType.String,
        ),
        'rec_telesale_id': serializeParam(
          _recTelesaleId,
          ParamType.String,
        ),
        'tele_lead_id': serializeParam(
          _teleLeadId,
          ParamType.String,
        ),
        'gsb_branch_code': serializeParam(
          _gsbBranchCode,
          ParamType.String,
        ),
        'gsb_branch_name': serializeParam(
          _gsbBranchName,
          ParamType.String,
        ),
        'gsb_branch_email': serializeParam(
          _gsbBranchEmail,
          ParamType.String,
        ),
        'lead_system': serializeParam(
          _leadSystem,
          ParamType.String,
        ),
        'lead_ref_id': serializeParam(
          _leadRefId,
          ParamType.String,
        ),
        'check_loop': serializeParam(
          _checkLoop,
          ParamType.String,
        ),
        'pdpa_flg': serializeParam(
          _pdpaFlg,
          ParamType.String,
        ),
        'pdpa_date': serializeParam(
          _pdpaDate,
          ParamType.String,
        ),
        'sql_id': serializeParam(
          _sqlId,
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
        'checkdate_exception': serializeParam(
          _checkdateException,
          ParamType.String,
        ),
        'remark': serializeParam(
          _remark,
          ParamType.String,
        ),
        'desc_info': serializeParam(
          _descInfo,
          ParamType.String,
        ),
        'card_type': serializeParam(
          _cardType,
          ParamType.String,
        ),
        'countCall': serializeParam(
          _countCall,
          ParamType.String,
        ),
        'expire_assign_date': serializeParam(
          _expireAssignDate,
          ParamType.String,
        ),
        'contract_request': serializeParam(
          _contractRequest,
          ParamType.String,
        ),
        'source_by': serializeParam(
          _sourceBy,
          ParamType.String,
        ),
        'car_vehicle_name_old': serializeParam(
          _carVehicleNameOld,
          ParamType.String,
        ),
        'sub_channel_old': serializeParam(
          _subChannelOld,
          ParamType.String,
        ),
        'source_by_old': serializeParam(
          _sourceByOld,
          ParamType.String,
        ),
        'address_branch': serializeParam(
          _addressBranch,
          ParamType.String,
        ),
        'ref_emp_lead': serializeParam(
          _refEmpLead,
          ParamType.String,
        ),
        'lead_mobile_id': serializeParam(
          _leadMobileId,
          ParamType.int,
        ),
        'id_type': serializeParam(
          _idType,
          ParamType.String,
        ),
        'hash_id': serializeParam(
          _hashId,
          ParamType.String,
        ),
        'land_area_rai': serializeParam(
          _landAreaRai,
          ParamType.String,
        ),
        'land_area_ngan': serializeParam(
          _landAreaNgan,
          ParamType.String,
        ),
        'land_area_wa': serializeParam(
          _landAreaWa,
          ParamType.String,
        ),
        'utmmap': serializeParam(
          _utmmap,
          ParamType.String,
        ),
        'land_no': serializeParam(
          _landNo,
          ParamType.String,
        ),
        'survey_no': serializeParam(
          _surveyNo,
          ParamType.String,
        ),
        'district_code': serializeParam(
          _districtCode,
          ParamType.String,
        ),
        'district': serializeParam(
          _district,
          ParamType.String,
        ),
        'subdistrict_code': serializeParam(
          _subdistrictCode,
          ParamType.String,
        ),
        'subdistrict': serializeParam(
          _subdistrict,
          ParamType.String,
        ),
        'utmmap1': serializeParam(
          _utmmap1,
          ParamType.String,
        ),
        'utmmap2': serializeParam(
          _utmmap2,
          ParamType.String,
        ),
        'utmmap3': serializeParam(
          _utmmap3,
          ParamType.String,
        ),
        'utmmap4': serializeParam(
          _utmmap4,
          ParamType.String,
        ),
        'parcel_type': serializeParam(
          _parcelType,
          ParamType.String,
        ),
        'land_area_org': serializeParam(
          _landAreaOrg,
          ParamType.String,
        ),
        'land_area_adj': serializeParam(
          _landAreaAdj,
          ParamType.String,
        ),
        'curr_evaprice': serializeParam(
          _currEvaprice,
          ParamType.String,
        ),
        'total_evaprice': serializeParam(
          _totalEvaprice,
          ParamType.String,
        ),
        'ltv1': serializeParam(
          _ltv1,
          ParamType.String,
        ),
        'ltv1_amount': serializeParam(
          _ltv1Amount,
          ParamType.String,
        ),
        'ltv1wa_amount': serializeParam(
          _ltv1waAmount,
          ParamType.String,
        ),
        'ltv2': serializeParam(
          _ltv2,
          ParamType.String,
        ),
        'ltv2_amount': serializeParam(
          _ltv2Amount,
          ParamType.String,
        ),
        'ltv2wa_amount': serializeParam(
          _ltv2waAmount,
          ParamType.String,
        ),
        'latitude': serializeParam(
          _latitude,
          ParamType.String,
        ),
        'longitude': serializeParam(
          _longitude,
          ParamType.String,
        ),
        'image_chanod_front': serializeParam(
          _imageChanodFront,
          ParamType.String,
        ),
        'image_chanod_back': serializeParam(
          _imageChanodBack,
          ParamType.String,
        ),
        'user_vendor_name': serializeParam(
          _userVendorName,
          ParamType.String,
        ),
        'refer_to_branch': serializeParam(
          _referToBranch,
          ParamType.String,
        ),
        'product': serializeParam(
          _product,
          ParamType.String,
        ),
        'installment_status': serializeParam(
          _installmentStatus,
          ParamType.String,
        ),
        'cover_type_code': serializeParam(
          _coverTypeCode,
          ParamType.String,
        ),
        'package_id': serializeParam(
          _packageId,
          ParamType.String,
        ),
        'province': serializeParam(
          _province,
          ParamType.String,
        ),
        'province_code': serializeParam(
          _provinceCode,
          ParamType.String,
        ),
        'lead_id': serializeParam(
          _leadId,
          ParamType.String,
        ),
      }.withoutNulls;

  static ChanodData2Struct fromSerializableMap(Map<String, dynamic> data) =>
      ChanodData2Struct(
        leadCode: deserializeParam(
          data['lead_code'],
          ParamType.String,
          false,
        ),
        dataType: deserializeParam(
          data['data_type'],
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
        branchEmail: deserializeParam(
          data['branch_email'],
          ParamType.String,
          false,
        ),
        titleId: deserializeParam(
          data['title_id'],
          ParamType.int,
          false,
        ),
        titleName: deserializeParam(
          data['title_name'],
          ParamType.String,
          false,
        ),
        firstName: deserializeParam(
          data['first_name'],
          ParamType.String,
          false,
        ),
        lastName: deserializeParam(
          data['last_name'],
          ParamType.String,
          false,
        ),
        phoneNumber: deserializeParam(
          data['phone_number'],
          ParamType.String,
          false,
        ),
        birthDate: deserializeParam(
          data['birth_date'],
          ParamType.String,
          false,
        ),
        age: deserializeParam(
          data['age'],
          ParamType.int,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        carYear: deserializeParam(
          data['car_year'],
          ParamType.String,
          false,
        ),
        carBrand: deserializeParam(
          data['car_brand'],
          ParamType.String,
          false,
        ),
        carBrandName: deserializeParam(
          data['car_brand_name'],
          ParamType.String,
          false,
        ),
        carModelName: deserializeParam(
          data['car_model_name'],
          ParamType.String,
          false,
        ),
        carCcName: deserializeParam(
          data['car_cc_name'],
          ParamType.String,
          false,
        ),
        carVehicleId: deserializeParam(
          data['car_vehicle_id'],
          ParamType.String,
          false,
        ),
        carVehicleName: deserializeParam(
          data['car_vehicle_name'],
          ParamType.String,
          false,
        ),
        carVehicleCode: deserializeParam(
          data['car_vehicle_code'],
          ParamType.String,
          false,
        ),
        carProvince: deserializeParam(
          data['car_province'],
          ParamType.String,
          false,
        ),
        carProvinceName: deserializeParam(
          data['car_province_name'],
          ParamType.String,
          false,
        ),
        carRegistration: deserializeParam(
          data['car_registration'],
          ParamType.String,
          false,
        ),
        carColor: deserializeParam(
          data['car_color'],
          ParamType.String,
          false,
        ),
        carOwner: deserializeParam(
          data['car_owner'],
          ParamType.String,
          false,
        ),
        carRate: deserializeParam(
          data['car_rate'],
          ParamType.String,
          false,
        ),
        source: deserializeParam(
          data['source'],
          ParamType.String,
          false,
        ),
        channel: deserializeParam(
          data['channel'],
          ParamType.String,
          false,
        ),
        subChannel: deserializeParam(
          data['sub_channel'],
          ParamType.String,
          false,
        ),
        leadType: deserializeParam(
          data['lead_type'],
          ParamType.String,
          false,
        ),
        ownerId: deserializeParam(
          data['owner_id'],
          ParamType.String,
          false,
        ),
        callStatusId: deserializeParam(
          data['call_status_id'],
          ParamType.String,
          false,
        ),
        callStatus: deserializeParam(
          data['call_status'],
          ParamType.String,
          false,
        ),
        leadStatus: deserializeParam(
          data['lead_status'],
          ParamType.String,
          false,
        ),
        reasonId: deserializeParam(
          data['reason_id'],
          ParamType.String,
          false,
        ),
        reasonCode: deserializeParam(
          data['reason_code'],
          ParamType.String,
          false,
        ),
        reasonName: deserializeParam(
          data['reason_name'],
          ParamType.String,
          false,
        ),
        importDate: deserializeParam(
          data['import_date'],
          ParamType.String,
          false,
        ),
        actionDate: deserializeParam(
          data['action_date'],
          ParamType.String,
          false,
        ),
        flgSendEmail: deserializeParam(
          data['flg_send_email'],
          ParamType.String,
          false,
        ),
        oldDbName: deserializeParam(
          data['old_db_name'],
          ParamType.String,
          false,
        ),
        oldContractNo: deserializeParam(
          data['old_contract_no'],
          ParamType.String,
          false,
        ),
        oldContractDate: deserializeParam(
          data['old_contract_date'],
          ParamType.String,
          false,
        ),
        oldLoanAmount: deserializeParam(
          data['old_loan_amount'],
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
        contractDate: deserializeParam(
          data['contract_date'],
          ParamType.String,
          false,
        ),
        contractThaiId: deserializeParam(
          data['contract_thai_id'],
          ParamType.String,
          false,
        ),
        loanAmount: deserializeParam(
          data['loan_amount'],
          ParamType.String,
          false,
        ),
        amountRequest: deserializeParam(
          data['amount_request'],
          ParamType.String,
          false,
        ),
        chkContractDate: deserializeParam(
          data['chk_contract_date'],
          ParamType.String,
          false,
        ),
        chkCusConfirmStatus: deserializeParam(
          data['chk_cus_confirm_status'],
          ParamType.String,
          false,
        ),
        chkCusConfirmDate: deserializeParam(
          data['chk_cus_confirm_date'],
          ParamType.String,
          false,
        ),
        chkCrdConfirmStatus: deserializeParam(
          data['chk_crd_confirm_status'],
          ParamType.String,
          false,
        ),
        chkCrdConfirmDate: deserializeParam(
          data['chk_crd_confirm_date'],
          ParamType.String,
          false,
        ),
        chkCusAccepStatus: deserializeParam(
          data['chk_cus_accep_status'],
          ParamType.String,
          false,
        ),
        chkCusAccepDate: deserializeParam(
          data['chk_cus_accep_date'],
          ParamType.String,
          false,
        ),
        chkContractStatus: deserializeParam(
          data['chk_contract_status'],
          ParamType.String,
          false,
        ),
        sendDataFlg: deserializeParam(
          data['send_data_flg'],
          ParamType.String,
          false,
        ),
        sendDataDate: deserializeParam(
          data['send_data_date'],
          ParamType.String,
          false,
        ),
        recTelesaleId: deserializeParam(
          data['rec_telesale_id'],
          ParamType.String,
          false,
        ),
        teleLeadId: deserializeParam(
          data['tele_lead_id'],
          ParamType.String,
          false,
        ),
        gsbBranchCode: deserializeParam(
          data['gsb_branch_code'],
          ParamType.String,
          false,
        ),
        gsbBranchName: deserializeParam(
          data['gsb_branch_name'],
          ParamType.String,
          false,
        ),
        gsbBranchEmail: deserializeParam(
          data['gsb_branch_email'],
          ParamType.String,
          false,
        ),
        leadSystem: deserializeParam(
          data['lead_system'],
          ParamType.String,
          false,
        ),
        leadRefId: deserializeParam(
          data['lead_ref_id'],
          ParamType.String,
          false,
        ),
        checkLoop: deserializeParam(
          data['check_loop'],
          ParamType.String,
          false,
        ),
        pdpaFlg: deserializeParam(
          data['pdpa_flg'],
          ParamType.String,
          false,
        ),
        pdpaDate: deserializeParam(
          data['pdpa_date'],
          ParamType.String,
          false,
        ),
        sqlId: deserializeParam(
          data['sql_id'],
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
        checkdateException: deserializeParam(
          data['checkdate_exception'],
          ParamType.String,
          false,
        ),
        remark: deserializeParam(
          data['remark'],
          ParamType.String,
          false,
        ),
        descInfo: deserializeParam(
          data['desc_info'],
          ParamType.String,
          false,
        ),
        cardType: deserializeParam(
          data['card_type'],
          ParamType.String,
          false,
        ),
        countCall: deserializeParam(
          data['countCall'],
          ParamType.String,
          false,
        ),
        expireAssignDate: deserializeParam(
          data['expire_assign_date'],
          ParamType.String,
          false,
        ),
        contractRequest: deserializeParam(
          data['contract_request'],
          ParamType.String,
          false,
        ),
        sourceBy: deserializeParam(
          data['source_by'],
          ParamType.String,
          false,
        ),
        carVehicleNameOld: deserializeParam(
          data['car_vehicle_name_old'],
          ParamType.String,
          false,
        ),
        subChannelOld: deserializeParam(
          data['sub_channel_old'],
          ParamType.String,
          false,
        ),
        sourceByOld: deserializeParam(
          data['source_by_old'],
          ParamType.String,
          false,
        ),
        addressBranch: deserializeParam(
          data['address_branch'],
          ParamType.String,
          false,
        ),
        refEmpLead: deserializeParam(
          data['ref_emp_lead'],
          ParamType.String,
          false,
        ),
        leadMobileId: deserializeParam(
          data['lead_mobile_id'],
          ParamType.int,
          false,
        ),
        idType: deserializeParam(
          data['id_type'],
          ParamType.String,
          false,
        ),
        hashId: deserializeParam(
          data['hash_id'],
          ParamType.String,
          false,
        ),
        landAreaRai: deserializeParam(
          data['land_area_rai'],
          ParamType.String,
          false,
        ),
        landAreaNgan: deserializeParam(
          data['land_area_ngan'],
          ParamType.String,
          false,
        ),
        landAreaWa: deserializeParam(
          data['land_area_wa'],
          ParamType.String,
          false,
        ),
        utmmap: deserializeParam(
          data['utmmap'],
          ParamType.String,
          false,
        ),
        landNo: deserializeParam(
          data['land_no'],
          ParamType.String,
          false,
        ),
        surveyNo: deserializeParam(
          data['survey_no'],
          ParamType.String,
          false,
        ),
        districtCode: deserializeParam(
          data['district_code'],
          ParamType.String,
          false,
        ),
        district: deserializeParam(
          data['district'],
          ParamType.String,
          false,
        ),
        subdistrictCode: deserializeParam(
          data['subdistrict_code'],
          ParamType.String,
          false,
        ),
        subdistrict: deserializeParam(
          data['subdistrict'],
          ParamType.String,
          false,
        ),
        utmmap1: deserializeParam(
          data['utmmap1'],
          ParamType.String,
          false,
        ),
        utmmap2: deserializeParam(
          data['utmmap2'],
          ParamType.String,
          false,
        ),
        utmmap3: deserializeParam(
          data['utmmap3'],
          ParamType.String,
          false,
        ),
        utmmap4: deserializeParam(
          data['utmmap4'],
          ParamType.String,
          false,
        ),
        parcelType: deserializeParam(
          data['parcel_type'],
          ParamType.String,
          false,
        ),
        landAreaOrg: deserializeParam(
          data['land_area_org'],
          ParamType.String,
          false,
        ),
        landAreaAdj: deserializeParam(
          data['land_area_adj'],
          ParamType.String,
          false,
        ),
        currEvaprice: deserializeParam(
          data['curr_evaprice'],
          ParamType.String,
          false,
        ),
        totalEvaprice: deserializeParam(
          data['total_evaprice'],
          ParamType.String,
          false,
        ),
        ltv1: deserializeParam(
          data['ltv1'],
          ParamType.String,
          false,
        ),
        ltv1Amount: deserializeParam(
          data['ltv1_amount'],
          ParamType.String,
          false,
        ),
        ltv1waAmount: deserializeParam(
          data['ltv1wa_amount'],
          ParamType.String,
          false,
        ),
        ltv2: deserializeParam(
          data['ltv2'],
          ParamType.String,
          false,
        ),
        ltv2Amount: deserializeParam(
          data['ltv2_amount'],
          ParamType.String,
          false,
        ),
        ltv2waAmount: deserializeParam(
          data['ltv2wa_amount'],
          ParamType.String,
          false,
        ),
        latitude: deserializeParam(
          data['latitude'],
          ParamType.String,
          false,
        ),
        longitude: deserializeParam(
          data['longitude'],
          ParamType.String,
          false,
        ),
        imageChanodFront: deserializeParam(
          data['image_chanod_front'],
          ParamType.String,
          false,
        ),
        imageChanodBack: deserializeParam(
          data['image_chanod_back'],
          ParamType.String,
          false,
        ),
        userVendorName: deserializeParam(
          data['user_vendor_name'],
          ParamType.String,
          false,
        ),
        referToBranch: deserializeParam(
          data['refer_to_branch'],
          ParamType.String,
          false,
        ),
        product: deserializeParam(
          data['product'],
          ParamType.String,
          false,
        ),
        installmentStatus: deserializeParam(
          data['installment_status'],
          ParamType.String,
          false,
        ),
        coverTypeCode: deserializeParam(
          data['cover_type_code'],
          ParamType.String,
          false,
        ),
        packageId: deserializeParam(
          data['package_id'],
          ParamType.String,
          false,
        ),
        province: deserializeParam(
          data['province'],
          ParamType.String,
          false,
        ),
        provinceCode: deserializeParam(
          data['province_code'],
          ParamType.String,
          false,
        ),
        leadId: deserializeParam(
          data['lead_id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ChanodData2Struct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChanodData2Struct &&
        leadCode == other.leadCode &&
        dataType == other.dataType &&
        regionCode == other.regionCode &&
        regionName == other.regionName &&
        areaCode == other.areaCode &&
        areaName == other.areaName &&
        branchCode == other.branchCode &&
        branchName == other.branchName &&
        branchEmail == other.branchEmail &&
        titleId == other.titleId &&
        titleName == other.titleName &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        phoneNumber == other.phoneNumber &&
        birthDate == other.birthDate &&
        age == other.age &&
        email == other.email &&
        carYear == other.carYear &&
        carBrand == other.carBrand &&
        carBrandName == other.carBrandName &&
        carModelName == other.carModelName &&
        carCcName == other.carCcName &&
        carVehicleId == other.carVehicleId &&
        carVehicleName == other.carVehicleName &&
        carVehicleCode == other.carVehicleCode &&
        carProvince == other.carProvince &&
        carProvinceName == other.carProvinceName &&
        carRegistration == other.carRegistration &&
        carColor == other.carColor &&
        carOwner == other.carOwner &&
        carRate == other.carRate &&
        source == other.source &&
        channel == other.channel &&
        subChannel == other.subChannel &&
        leadType == other.leadType &&
        ownerId == other.ownerId &&
        callStatusId == other.callStatusId &&
        callStatus == other.callStatus &&
        leadStatus == other.leadStatus &&
        reasonId == other.reasonId &&
        reasonCode == other.reasonCode &&
        reasonName == other.reasonName &&
        importDate == other.importDate &&
        actionDate == other.actionDate &&
        flgSendEmail == other.flgSendEmail &&
        oldDbName == other.oldDbName &&
        oldContractNo == other.oldContractNo &&
        oldContractDate == other.oldContractDate &&
        oldLoanAmount == other.oldLoanAmount &&
        dbName == other.dbName &&
        contractNo == other.contractNo &&
        contractDate == other.contractDate &&
        contractThaiId == other.contractThaiId &&
        loanAmount == other.loanAmount &&
        amountRequest == other.amountRequest &&
        chkContractDate == other.chkContractDate &&
        chkCusConfirmStatus == other.chkCusConfirmStatus &&
        chkCusConfirmDate == other.chkCusConfirmDate &&
        chkCrdConfirmStatus == other.chkCrdConfirmStatus &&
        chkCrdConfirmDate == other.chkCrdConfirmDate &&
        chkCusAccepStatus == other.chkCusAccepStatus &&
        chkCusAccepDate == other.chkCusAccepDate &&
        chkContractStatus == other.chkContractStatus &&
        sendDataFlg == other.sendDataFlg &&
        sendDataDate == other.sendDataDate &&
        recTelesaleId == other.recTelesaleId &&
        teleLeadId == other.teleLeadId &&
        gsbBranchCode == other.gsbBranchCode &&
        gsbBranchName == other.gsbBranchName &&
        gsbBranchEmail == other.gsbBranchEmail &&
        leadSystem == other.leadSystem &&
        leadRefId == other.leadRefId &&
        checkLoop == other.checkLoop &&
        pdpaFlg == other.pdpaFlg &&
        pdpaDate == other.pdpaDate &&
        sqlId == other.sqlId &&
        deleted == other.deleted &&
        createdUserid == other.createdUserid &&
        createdAt == other.createdAt &&
        updatedUserid == other.updatedUserid &&
        updatedAt == other.updatedAt &&
        checkdateException == other.checkdateException &&
        remark == other.remark &&
        descInfo == other.descInfo &&
        cardType == other.cardType &&
        countCall == other.countCall &&
        expireAssignDate == other.expireAssignDate &&
        contractRequest == other.contractRequest &&
        sourceBy == other.sourceBy &&
        carVehicleNameOld == other.carVehicleNameOld &&
        subChannelOld == other.subChannelOld &&
        sourceByOld == other.sourceByOld &&
        addressBranch == other.addressBranch &&
        refEmpLead == other.refEmpLead &&
        leadMobileId == other.leadMobileId &&
        idType == other.idType &&
        hashId == other.hashId &&
        landAreaRai == other.landAreaRai &&
        landAreaNgan == other.landAreaNgan &&
        landAreaWa == other.landAreaWa &&
        utmmap == other.utmmap &&
        landNo == other.landNo &&
        surveyNo == other.surveyNo &&
        districtCode == other.districtCode &&
        district == other.district &&
        subdistrictCode == other.subdistrictCode &&
        subdistrict == other.subdistrict &&
        utmmap1 == other.utmmap1 &&
        utmmap2 == other.utmmap2 &&
        utmmap3 == other.utmmap3 &&
        utmmap4 == other.utmmap4 &&
        parcelType == other.parcelType &&
        landAreaOrg == other.landAreaOrg &&
        landAreaAdj == other.landAreaAdj &&
        currEvaprice == other.currEvaprice &&
        totalEvaprice == other.totalEvaprice &&
        ltv1 == other.ltv1 &&
        ltv1Amount == other.ltv1Amount &&
        ltv1waAmount == other.ltv1waAmount &&
        ltv2 == other.ltv2 &&
        ltv2Amount == other.ltv2Amount &&
        ltv2waAmount == other.ltv2waAmount &&
        latitude == other.latitude &&
        longitude == other.longitude &&
        imageChanodFront == other.imageChanodFront &&
        imageChanodBack == other.imageChanodBack &&
        userVendorName == other.userVendorName &&
        referToBranch == other.referToBranch &&
        product == other.product &&
        installmentStatus == other.installmentStatus &&
        coverTypeCode == other.coverTypeCode &&
        packageId == other.packageId &&
        province == other.province &&
        provinceCode == other.provinceCode &&
        leadId == other.leadId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        leadCode,
        dataType,
        regionCode,
        regionName,
        areaCode,
        areaName,
        branchCode,
        branchName,
        branchEmail,
        titleId,
        titleName,
        firstName,
        lastName,
        phoneNumber,
        birthDate,
        age,
        email,
        carYear,
        carBrand,
        carBrandName,
        carModelName,
        carCcName,
        carVehicleId,
        carVehicleName,
        carVehicleCode,
        carProvince,
        carProvinceName,
        carRegistration,
        carColor,
        carOwner,
        carRate,
        source,
        channel,
        subChannel,
        leadType,
        ownerId,
        callStatusId,
        callStatus,
        leadStatus,
        reasonId,
        reasonCode,
        reasonName,
        importDate,
        actionDate,
        flgSendEmail,
        oldDbName,
        oldContractNo,
        oldContractDate,
        oldLoanAmount,
        dbName,
        contractNo,
        contractDate,
        contractThaiId,
        loanAmount,
        amountRequest,
        chkContractDate,
        chkCusConfirmStatus,
        chkCusConfirmDate,
        chkCrdConfirmStatus,
        chkCrdConfirmDate,
        chkCusAccepStatus,
        chkCusAccepDate,
        chkContractStatus,
        sendDataFlg,
        sendDataDate,
        recTelesaleId,
        teleLeadId,
        gsbBranchCode,
        gsbBranchName,
        gsbBranchEmail,
        leadSystem,
        leadRefId,
        checkLoop,
        pdpaFlg,
        pdpaDate,
        sqlId,
        deleted,
        createdUserid,
        createdAt,
        updatedUserid,
        updatedAt,
        checkdateException,
        remark,
        descInfo,
        cardType,
        countCall,
        expireAssignDate,
        contractRequest,
        sourceBy,
        carVehicleNameOld,
        subChannelOld,
        sourceByOld,
        addressBranch,
        refEmpLead,
        leadMobileId,
        idType,
        hashId,
        landAreaRai,
        landAreaNgan,
        landAreaWa,
        utmmap,
        landNo,
        surveyNo,
        districtCode,
        district,
        subdistrictCode,
        subdistrict,
        utmmap1,
        utmmap2,
        utmmap3,
        utmmap4,
        parcelType,
        landAreaOrg,
        landAreaAdj,
        currEvaprice,
        totalEvaprice,
        ltv1,
        ltv1Amount,
        ltv1waAmount,
        ltv2,
        ltv2Amount,
        ltv2waAmount,
        latitude,
        longitude,
        imageChanodFront,
        imageChanodBack,
        userVendorName,
        referToBranch,
        product,
        installmentStatus,
        coverTypeCode,
        packageId,
        province,
        provinceCode,
        leadId
      ]);
}

ChanodData2Struct createChanodData2Struct({
  String? leadCode,
  String? dataType,
  String? regionCode,
  String? regionName,
  String? areaCode,
  String? areaName,
  String? branchCode,
  String? branchName,
  String? branchEmail,
  int? titleId,
  String? titleName,
  String? firstName,
  String? lastName,
  String? phoneNumber,
  String? birthDate,
  int? age,
  String? email,
  String? carYear,
  String? carBrand,
  String? carBrandName,
  String? carModelName,
  String? carCcName,
  String? carVehicleId,
  String? carVehicleName,
  String? carVehicleCode,
  String? carProvince,
  String? carProvinceName,
  String? carRegistration,
  String? carColor,
  String? carOwner,
  String? carRate,
  String? source,
  String? channel,
  String? subChannel,
  String? leadType,
  String? ownerId,
  String? callStatusId,
  String? callStatus,
  String? leadStatus,
  String? reasonId,
  String? reasonCode,
  String? reasonName,
  String? importDate,
  String? actionDate,
  String? flgSendEmail,
  String? oldDbName,
  String? oldContractNo,
  String? oldContractDate,
  String? oldLoanAmount,
  String? dbName,
  String? contractNo,
  String? contractDate,
  String? contractThaiId,
  String? loanAmount,
  String? amountRequest,
  String? chkContractDate,
  String? chkCusConfirmStatus,
  String? chkCusConfirmDate,
  String? chkCrdConfirmStatus,
  String? chkCrdConfirmDate,
  String? chkCusAccepStatus,
  String? chkCusAccepDate,
  String? chkContractStatus,
  String? sendDataFlg,
  String? sendDataDate,
  String? recTelesaleId,
  String? teleLeadId,
  String? gsbBranchCode,
  String? gsbBranchName,
  String? gsbBranchEmail,
  String? leadSystem,
  String? leadRefId,
  String? checkLoop,
  String? pdpaFlg,
  String? pdpaDate,
  String? sqlId,
  String? deleted,
  String? createdUserid,
  String? createdAt,
  String? updatedUserid,
  String? updatedAt,
  String? checkdateException,
  String? remark,
  String? descInfo,
  String? cardType,
  String? countCall,
  String? expireAssignDate,
  String? contractRequest,
  String? sourceBy,
  String? carVehicleNameOld,
  String? subChannelOld,
  String? sourceByOld,
  String? addressBranch,
  String? refEmpLead,
  int? leadMobileId,
  String? idType,
  String? hashId,
  String? landAreaRai,
  String? landAreaNgan,
  String? landAreaWa,
  String? utmmap,
  String? landNo,
  String? surveyNo,
  String? districtCode,
  String? district,
  String? subdistrictCode,
  String? subdistrict,
  String? utmmap1,
  String? utmmap2,
  String? utmmap3,
  String? utmmap4,
  String? parcelType,
  String? landAreaOrg,
  String? landAreaAdj,
  String? currEvaprice,
  String? totalEvaprice,
  String? ltv1,
  String? ltv1Amount,
  String? ltv1waAmount,
  String? ltv2,
  String? ltv2Amount,
  String? ltv2waAmount,
  String? latitude,
  String? longitude,
  String? imageChanodFront,
  String? imageChanodBack,
  String? userVendorName,
  String? referToBranch,
  String? product,
  String? installmentStatus,
  String? coverTypeCode,
  String? packageId,
  String? province,
  String? provinceCode,
  String? leadId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChanodData2Struct(
      leadCode: leadCode,
      dataType: dataType,
      regionCode: regionCode,
      regionName: regionName,
      areaCode: areaCode,
      areaName: areaName,
      branchCode: branchCode,
      branchName: branchName,
      branchEmail: branchEmail,
      titleId: titleId,
      titleName: titleName,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      birthDate: birthDate,
      age: age,
      email: email,
      carYear: carYear,
      carBrand: carBrand,
      carBrandName: carBrandName,
      carModelName: carModelName,
      carCcName: carCcName,
      carVehicleId: carVehicleId,
      carVehicleName: carVehicleName,
      carVehicleCode: carVehicleCode,
      carProvince: carProvince,
      carProvinceName: carProvinceName,
      carRegistration: carRegistration,
      carColor: carColor,
      carOwner: carOwner,
      carRate: carRate,
      source: source,
      channel: channel,
      subChannel: subChannel,
      leadType: leadType,
      ownerId: ownerId,
      callStatusId: callStatusId,
      callStatus: callStatus,
      leadStatus: leadStatus,
      reasonId: reasonId,
      reasonCode: reasonCode,
      reasonName: reasonName,
      importDate: importDate,
      actionDate: actionDate,
      flgSendEmail: flgSendEmail,
      oldDbName: oldDbName,
      oldContractNo: oldContractNo,
      oldContractDate: oldContractDate,
      oldLoanAmount: oldLoanAmount,
      dbName: dbName,
      contractNo: contractNo,
      contractDate: contractDate,
      contractThaiId: contractThaiId,
      loanAmount: loanAmount,
      amountRequest: amountRequest,
      chkContractDate: chkContractDate,
      chkCusConfirmStatus: chkCusConfirmStatus,
      chkCusConfirmDate: chkCusConfirmDate,
      chkCrdConfirmStatus: chkCrdConfirmStatus,
      chkCrdConfirmDate: chkCrdConfirmDate,
      chkCusAccepStatus: chkCusAccepStatus,
      chkCusAccepDate: chkCusAccepDate,
      chkContractStatus: chkContractStatus,
      sendDataFlg: sendDataFlg,
      sendDataDate: sendDataDate,
      recTelesaleId: recTelesaleId,
      teleLeadId: teleLeadId,
      gsbBranchCode: gsbBranchCode,
      gsbBranchName: gsbBranchName,
      gsbBranchEmail: gsbBranchEmail,
      leadSystem: leadSystem,
      leadRefId: leadRefId,
      checkLoop: checkLoop,
      pdpaFlg: pdpaFlg,
      pdpaDate: pdpaDate,
      sqlId: sqlId,
      deleted: deleted,
      createdUserid: createdUserid,
      createdAt: createdAt,
      updatedUserid: updatedUserid,
      updatedAt: updatedAt,
      checkdateException: checkdateException,
      remark: remark,
      descInfo: descInfo,
      cardType: cardType,
      countCall: countCall,
      expireAssignDate: expireAssignDate,
      contractRequest: contractRequest,
      sourceBy: sourceBy,
      carVehicleNameOld: carVehicleNameOld,
      subChannelOld: subChannelOld,
      sourceByOld: sourceByOld,
      addressBranch: addressBranch,
      refEmpLead: refEmpLead,
      leadMobileId: leadMobileId,
      idType: idType,
      hashId: hashId,
      landAreaRai: landAreaRai,
      landAreaNgan: landAreaNgan,
      landAreaWa: landAreaWa,
      utmmap: utmmap,
      landNo: landNo,
      surveyNo: surveyNo,
      districtCode: districtCode,
      district: district,
      subdistrictCode: subdistrictCode,
      subdistrict: subdistrict,
      utmmap1: utmmap1,
      utmmap2: utmmap2,
      utmmap3: utmmap3,
      utmmap4: utmmap4,
      parcelType: parcelType,
      landAreaOrg: landAreaOrg,
      landAreaAdj: landAreaAdj,
      currEvaprice: currEvaprice,
      totalEvaprice: totalEvaprice,
      ltv1: ltv1,
      ltv1Amount: ltv1Amount,
      ltv1waAmount: ltv1waAmount,
      ltv2: ltv2,
      ltv2Amount: ltv2Amount,
      ltv2waAmount: ltv2waAmount,
      latitude: latitude,
      longitude: longitude,
      imageChanodFront: imageChanodFront,
      imageChanodBack: imageChanodBack,
      userVendorName: userVendorName,
      referToBranch: referToBranch,
      product: product,
      installmentStatus: installmentStatus,
      coverTypeCode: coverTypeCode,
      packageId: packageId,
      province: province,
      provinceCode: provinceCode,
      leadId: leadId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChanodData2Struct? updateChanodData2Struct(
  ChanodData2Struct? chanodData2, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    chanodData2
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChanodData2StructData(
  Map<String, dynamic> firestoreData,
  ChanodData2Struct? chanodData2,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chanodData2 == null) {
    return;
  }
  if (chanodData2.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && chanodData2.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chanodData2Data =
      getChanodData2FirestoreData(chanodData2, forFieldValue);
  final nestedData =
      chanodData2Data.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = chanodData2.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChanodData2FirestoreData(
  ChanodData2Struct? chanodData2, [
  bool forFieldValue = false,
]) {
  if (chanodData2 == null) {
    return {};
  }
  final firestoreData = mapToFirestore(chanodData2.toMap());

  // Add any Firestore field values
  chanodData2.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChanodData2ListFirestoreData(
  List<ChanodData2Struct>? chanodData2s,
) =>
    chanodData2s?.map((e) => getChanodData2FirestoreData(e, true)).toList() ??
    [];
