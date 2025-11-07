// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class LeadAgentDataModelStruct extends FFFirebaseStruct {
  LeadAgentDataModelStruct({
    int? id,
    String? agentCode,
    String? lastName,
    String? firstName,
    String? leadStatus,
    String? loanTypeId,
    String? loanTypeCode,
    String? loanTypeName,
    String? loanAmount,
    String? carRegistration,
    String? registerId,
    String? brandCode,
    String? brandName,
    String? carGear,
    String? carModel,
    String? carCc,
    String? carYear,
    String? estimatePrice,
    String? mobilePhoneNumber,
    String? contactTime,
    String? privacyConsentFlag,
    String? privacyConsentDate,
    String? sensitiveConsentFlag,
    String? sensitiveConsentDate,
    String? productDetail,
    String? landAreaRai,
    String? landAreaNgan,
    String? landAreaWa,
    String? utmmap,
    String? landNo,
    String? surveyNo,
    String? landDistrictCode,
    String? landSubdistrict,
    String? landProvince,
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
    String? paymentMethod,
    String? deductionPercent,
    String? paymentChannel,
    String? accountNumber,
    String? promptpayNumber,
    String? product,
    String? createdAt,
    String? agentGroupId,
    String? comEstimateAmt,
    String? comEstimateVat,
    String? comEstimateNetAmt,
    String? defaultComPercent,
    String? actualComPercent,
    String? agentWht,
    String? comEstimateVatAmt,
    String? requestNo,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _agentCode = agentCode,
        _lastName = lastName,
        _firstName = firstName,
        _leadStatus = leadStatus,
        _loanTypeId = loanTypeId,
        _loanTypeCode = loanTypeCode,
        _loanTypeName = loanTypeName,
        _loanAmount = loanAmount,
        _carRegistration = carRegistration,
        _registerId = registerId,
        _brandCode = brandCode,
        _brandName = brandName,
        _carGear = carGear,
        _carModel = carModel,
        _carCc = carCc,
        _carYear = carYear,
        _estimatePrice = estimatePrice,
        _mobilePhoneNumber = mobilePhoneNumber,
        _contactTime = contactTime,
        _privacyConsentFlag = privacyConsentFlag,
        _privacyConsentDate = privacyConsentDate,
        _sensitiveConsentFlag = sensitiveConsentFlag,
        _sensitiveConsentDate = sensitiveConsentDate,
        _productDetail = productDetail,
        _landAreaRai = landAreaRai,
        _landAreaNgan = landAreaNgan,
        _landAreaWa = landAreaWa,
        _utmmap = utmmap,
        _landNo = landNo,
        _surveyNo = surveyNo,
        _landDistrictCode = landDistrictCode,
        _landSubdistrict = landSubdistrict,
        _landProvince = landProvince,
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
        _paymentMethod = paymentMethod,
        _deductionPercent = deductionPercent,
        _paymentChannel = paymentChannel,
        _accountNumber = accountNumber,
        _promptpayNumber = promptpayNumber,
        _product = product,
        _createdAt = createdAt,
        _agentGroupId = agentGroupId,
        _comEstimateAmt = comEstimateAmt,
        _comEstimateVat = comEstimateVat,
        _comEstimateNetAmt = comEstimateNetAmt,
        _defaultComPercent = defaultComPercent,
        _actualComPercent = actualComPercent,
        _agentWht = agentWht,
        _comEstimateVatAmt = comEstimateVatAmt,
        _requestNo = requestNo,
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

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  set lastName(String? val) => _lastName = val;

  bool hasLastName() => _lastName != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? val) => _firstName = val;

  bool hasFirstName() => _firstName != null;

  // "lead_status" field.
  String? _leadStatus;
  String get leadStatus => _leadStatus ?? '';
  set leadStatus(String? val) => _leadStatus = val;

  bool hasLeadStatus() => _leadStatus != null;

  // "loan_type_id" field.
  String? _loanTypeId;
  String get loanTypeId => _loanTypeId ?? '';
  set loanTypeId(String? val) => _loanTypeId = val;

  bool hasLoanTypeId() => _loanTypeId != null;

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

  // "loan_amount" field.
  String? _loanAmount;
  String get loanAmount => _loanAmount ?? '';
  set loanAmount(String? val) => _loanAmount = val;

  bool hasLoanAmount() => _loanAmount != null;

  // "car_registration" field.
  String? _carRegistration;
  String get carRegistration => _carRegistration ?? '';
  set carRegistration(String? val) => _carRegistration = val;

  bool hasCarRegistration() => _carRegistration != null;

  // "register_id" field.
  String? _registerId;
  String get registerId => _registerId ?? '';
  set registerId(String? val) => _registerId = val;

  bool hasRegisterId() => _registerId != null;

  // "brand_code" field.
  String? _brandCode;
  String get brandCode => _brandCode ?? '';
  set brandCode(String? val) => _brandCode = val;

  bool hasBrandCode() => _brandCode != null;

  // "brand_name" field.
  String? _brandName;
  String get brandName => _brandName ?? '';
  set brandName(String? val) => _brandName = val;

  bool hasBrandName() => _brandName != null;

  // "car_gear" field.
  String? _carGear;
  String get carGear => _carGear ?? '';
  set carGear(String? val) => _carGear = val;

  bool hasCarGear() => _carGear != null;

  // "car_model" field.
  String? _carModel;
  String get carModel => _carModel ?? '';
  set carModel(String? val) => _carModel = val;

  bool hasCarModel() => _carModel != null;

  // "car_cc" field.
  String? _carCc;
  String get carCc => _carCc ?? '';
  set carCc(String? val) => _carCc = val;

  bool hasCarCc() => _carCc != null;

  // "car_year" field.
  String? _carYear;
  String get carYear => _carYear ?? '';
  set carYear(String? val) => _carYear = val;

  bool hasCarYear() => _carYear != null;

  // "estimate_price" field.
  String? _estimatePrice;
  String get estimatePrice => _estimatePrice ?? '';
  set estimatePrice(String? val) => _estimatePrice = val;

  bool hasEstimatePrice() => _estimatePrice != null;

  // "mobile_phone_number" field.
  String? _mobilePhoneNumber;
  String get mobilePhoneNumber => _mobilePhoneNumber ?? '';
  set mobilePhoneNumber(String? val) => _mobilePhoneNumber = val;

  bool hasMobilePhoneNumber() => _mobilePhoneNumber != null;

  // "contact_time" field.
  String? _contactTime;
  String get contactTime => _contactTime ?? '';
  set contactTime(String? val) => _contactTime = val;

  bool hasContactTime() => _contactTime != null;

  // "privacy_consent_flag" field.
  String? _privacyConsentFlag;
  String get privacyConsentFlag => _privacyConsentFlag ?? '';
  set privacyConsentFlag(String? val) => _privacyConsentFlag = val;

  bool hasPrivacyConsentFlag() => _privacyConsentFlag != null;

  // "privacy_consent_date" field.
  String? _privacyConsentDate;
  String get privacyConsentDate => _privacyConsentDate ?? '';
  set privacyConsentDate(String? val) => _privacyConsentDate = val;

  bool hasPrivacyConsentDate() => _privacyConsentDate != null;

  // "sensitive_consent_flag" field.
  String? _sensitiveConsentFlag;
  String get sensitiveConsentFlag => _sensitiveConsentFlag ?? '';
  set sensitiveConsentFlag(String? val) => _sensitiveConsentFlag = val;

  bool hasSensitiveConsentFlag() => _sensitiveConsentFlag != null;

  // "sensitive_consent_date" field.
  String? _sensitiveConsentDate;
  String get sensitiveConsentDate => _sensitiveConsentDate ?? '';
  set sensitiveConsentDate(String? val) => _sensitiveConsentDate = val;

  bool hasSensitiveConsentDate() => _sensitiveConsentDate != null;

  // "product_detail" field.
  String? _productDetail;
  String get productDetail => _productDetail ?? '';
  set productDetail(String? val) => _productDetail = val;

  bool hasProductDetail() => _productDetail != null;

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

  // "land_district_code" field.
  String? _landDistrictCode;
  String get landDistrictCode => _landDistrictCode ?? '';
  set landDistrictCode(String? val) => _landDistrictCode = val;

  bool hasLandDistrictCode() => _landDistrictCode != null;

  // "land_subdistrict" field.
  String? _landSubdistrict;
  String get landSubdistrict => _landSubdistrict ?? '';
  set landSubdistrict(String? val) => _landSubdistrict = val;

  bool hasLandSubdistrict() => _landSubdistrict != null;

  // "land_province" field.
  String? _landProvince;
  String get landProvince => _landProvince ?? '';
  set landProvince(String? val) => _landProvince = val;

  bool hasLandProvince() => _landProvince != null;

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

  // "product" field.
  String? _product;
  String get product => _product ?? '';
  set product(String? val) => _product = val;

  bool hasProduct() => _product != null;

  // "created_at" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "agent_group_id" field.
  String? _agentGroupId;
  String get agentGroupId => _agentGroupId ?? '';
  set agentGroupId(String? val) => _agentGroupId = val;

  bool hasAgentGroupId() => _agentGroupId != null;

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

  // "agent_wht" field.
  String? _agentWht;
  String get agentWht => _agentWht ?? '';
  set agentWht(String? val) => _agentWht = val;

  bool hasAgentWht() => _agentWht != null;

  // "com_estimate_vat_amt" field.
  String? _comEstimateVatAmt;
  String get comEstimateVatAmt => _comEstimateVatAmt ?? '';
  set comEstimateVatAmt(String? val) => _comEstimateVatAmt = val;

  bool hasComEstimateVatAmt() => _comEstimateVatAmt != null;

  // "request_no" field.
  String? _requestNo;
  String get requestNo => _requestNo ?? '';
  set requestNo(String? val) => _requestNo = val;

  bool hasRequestNo() => _requestNo != null;

  static LeadAgentDataModelStruct fromMap(Map<String, dynamic> data) =>
      LeadAgentDataModelStruct(
        id: castToType<int>(data['id']),
        agentCode: data['agent_code'] as String?,
        lastName: data['last_name'] as String?,
        firstName: data['first_name'] as String?,
        leadStatus: data['lead_status'] as String?,
        loanTypeId: data['loan_type_id'] as String?,
        loanTypeCode: data['loan_type_code'] as String?,
        loanTypeName: data['loan_type_name'] as String?,
        loanAmount: data['loan_amount'] as String?,
        carRegistration: data['car_registration'] as String?,
        registerId: data['register_id'] as String?,
        brandCode: data['brand_code'] as String?,
        brandName: data['brand_name'] as String?,
        carGear: data['car_gear'] as String?,
        carModel: data['car_model'] as String?,
        carCc: data['car_cc'] as String?,
        carYear: data['car_year'] as String?,
        estimatePrice: data['estimate_price'] as String?,
        mobilePhoneNumber: data['mobile_phone_number'] as String?,
        contactTime: data['contact_time'] as String?,
        privacyConsentFlag: data['privacy_consent_flag'] as String?,
        privacyConsentDate: data['privacy_consent_date'] as String?,
        sensitiveConsentFlag: data['sensitive_consent_flag'] as String?,
        sensitiveConsentDate: data['sensitive_consent_date'] as String?,
        productDetail: data['product_detail'] as String?,
        landAreaRai: data['land_area_rai'] as String?,
        landAreaNgan: data['land_area_ngan'] as String?,
        landAreaWa: data['land_area_wa'] as String?,
        utmmap: data['utmmap'] as String?,
        landNo: data['land_no'] as String?,
        surveyNo: data['survey_no'] as String?,
        landDistrictCode: data['land_district_code'] as String?,
        landSubdistrict: data['land_subdistrict'] as String?,
        landProvince: data['land_province'] as String?,
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
        paymentMethod: data['payment_method'] as String?,
        deductionPercent: data['deduction_percent'] as String?,
        paymentChannel: data['payment_channel'] as String?,
        accountNumber: data['account_number'] as String?,
        promptpayNumber: data['promptpay_number'] as String?,
        product: data['product'] as String?,
        createdAt: data['created_at'] as String?,
        agentGroupId: data['agent_group_id'] as String?,
        comEstimateAmt: data['com_estimate_amt'] as String?,
        comEstimateVat: data['com_estimate_vat'] as String?,
        comEstimateNetAmt: data['com_estimate_net_amt'] as String?,
        defaultComPercent: data['default_com_percent'] as String?,
        actualComPercent: data['actual_com_percent'] as String?,
        agentWht: data['agent_wht'] as String?,
        comEstimateVatAmt: data['com_estimate_vat_amt'] as String?,
        requestNo: data['request_no'] as String?,
      );

  static LeadAgentDataModelStruct? maybeFromMap(dynamic data) => data is Map
      ? LeadAgentDataModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'agent_code': _agentCode,
        'last_name': _lastName,
        'first_name': _firstName,
        'lead_status': _leadStatus,
        'loan_type_id': _loanTypeId,
        'loan_type_code': _loanTypeCode,
        'loan_type_name': _loanTypeName,
        'loan_amount': _loanAmount,
        'car_registration': _carRegistration,
        'register_id': _registerId,
        'brand_code': _brandCode,
        'brand_name': _brandName,
        'car_gear': _carGear,
        'car_model': _carModel,
        'car_cc': _carCc,
        'car_year': _carYear,
        'estimate_price': _estimatePrice,
        'mobile_phone_number': _mobilePhoneNumber,
        'contact_time': _contactTime,
        'privacy_consent_flag': _privacyConsentFlag,
        'privacy_consent_date': _privacyConsentDate,
        'sensitive_consent_flag': _sensitiveConsentFlag,
        'sensitive_consent_date': _sensitiveConsentDate,
        'product_detail': _productDetail,
        'land_area_rai': _landAreaRai,
        'land_area_ngan': _landAreaNgan,
        'land_area_wa': _landAreaWa,
        'utmmap': _utmmap,
        'land_no': _landNo,
        'survey_no': _surveyNo,
        'land_district_code': _landDistrictCode,
        'land_subdistrict': _landSubdistrict,
        'land_province': _landProvince,
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
        'payment_method': _paymentMethod,
        'deduction_percent': _deductionPercent,
        'payment_channel': _paymentChannel,
        'account_number': _accountNumber,
        'promptpay_number': _promptpayNumber,
        'product': _product,
        'created_at': _createdAt,
        'agent_group_id': _agentGroupId,
        'com_estimate_amt': _comEstimateAmt,
        'com_estimate_vat': _comEstimateVat,
        'com_estimate_net_amt': _comEstimateNetAmt,
        'default_com_percent': _defaultComPercent,
        'actual_com_percent': _actualComPercent,
        'agent_wht': _agentWht,
        'com_estimate_vat_amt': _comEstimateVatAmt,
        'request_no': _requestNo,
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
        'last_name': serializeParam(
          _lastName,
          ParamType.String,
        ),
        'first_name': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'lead_status': serializeParam(
          _leadStatus,
          ParamType.String,
        ),
        'loan_type_id': serializeParam(
          _loanTypeId,
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
        'loan_amount': serializeParam(
          _loanAmount,
          ParamType.String,
        ),
        'car_registration': serializeParam(
          _carRegistration,
          ParamType.String,
        ),
        'register_id': serializeParam(
          _registerId,
          ParamType.String,
        ),
        'brand_code': serializeParam(
          _brandCode,
          ParamType.String,
        ),
        'brand_name': serializeParam(
          _brandName,
          ParamType.String,
        ),
        'car_gear': serializeParam(
          _carGear,
          ParamType.String,
        ),
        'car_model': serializeParam(
          _carModel,
          ParamType.String,
        ),
        'car_cc': serializeParam(
          _carCc,
          ParamType.String,
        ),
        'car_year': serializeParam(
          _carYear,
          ParamType.String,
        ),
        'estimate_price': serializeParam(
          _estimatePrice,
          ParamType.String,
        ),
        'mobile_phone_number': serializeParam(
          _mobilePhoneNumber,
          ParamType.String,
        ),
        'contact_time': serializeParam(
          _contactTime,
          ParamType.String,
        ),
        'privacy_consent_flag': serializeParam(
          _privacyConsentFlag,
          ParamType.String,
        ),
        'privacy_consent_date': serializeParam(
          _privacyConsentDate,
          ParamType.String,
        ),
        'sensitive_consent_flag': serializeParam(
          _sensitiveConsentFlag,
          ParamType.String,
        ),
        'sensitive_consent_date': serializeParam(
          _sensitiveConsentDate,
          ParamType.String,
        ),
        'product_detail': serializeParam(
          _productDetail,
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
        'land_district_code': serializeParam(
          _landDistrictCode,
          ParamType.String,
        ),
        'land_subdistrict': serializeParam(
          _landSubdistrict,
          ParamType.String,
        ),
        'land_province': serializeParam(
          _landProvince,
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
        'product': serializeParam(
          _product,
          ParamType.String,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'agent_group_id': serializeParam(
          _agentGroupId,
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
        'agent_wht': serializeParam(
          _agentWht,
          ParamType.String,
        ),
        'com_estimate_vat_amt': serializeParam(
          _comEstimateVatAmt,
          ParamType.String,
        ),
        'request_no': serializeParam(
          _requestNo,
          ParamType.String,
        ),
      }.withoutNulls;

  static LeadAgentDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      LeadAgentDataModelStruct(
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
        lastName: deserializeParam(
          data['last_name'],
          ParamType.String,
          false,
        ),
        firstName: deserializeParam(
          data['first_name'],
          ParamType.String,
          false,
        ),
        leadStatus: deserializeParam(
          data['lead_status'],
          ParamType.String,
          false,
        ),
        loanTypeId: deserializeParam(
          data['loan_type_id'],
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
        loanAmount: deserializeParam(
          data['loan_amount'],
          ParamType.String,
          false,
        ),
        carRegistration: deserializeParam(
          data['car_registration'],
          ParamType.String,
          false,
        ),
        registerId: deserializeParam(
          data['register_id'],
          ParamType.String,
          false,
        ),
        brandCode: deserializeParam(
          data['brand_code'],
          ParamType.String,
          false,
        ),
        brandName: deserializeParam(
          data['brand_name'],
          ParamType.String,
          false,
        ),
        carGear: deserializeParam(
          data['car_gear'],
          ParamType.String,
          false,
        ),
        carModel: deserializeParam(
          data['car_model'],
          ParamType.String,
          false,
        ),
        carCc: deserializeParam(
          data['car_cc'],
          ParamType.String,
          false,
        ),
        carYear: deserializeParam(
          data['car_year'],
          ParamType.String,
          false,
        ),
        estimatePrice: deserializeParam(
          data['estimate_price'],
          ParamType.String,
          false,
        ),
        mobilePhoneNumber: deserializeParam(
          data['mobile_phone_number'],
          ParamType.String,
          false,
        ),
        contactTime: deserializeParam(
          data['contact_time'],
          ParamType.String,
          false,
        ),
        privacyConsentFlag: deserializeParam(
          data['privacy_consent_flag'],
          ParamType.String,
          false,
        ),
        privacyConsentDate: deserializeParam(
          data['privacy_consent_date'],
          ParamType.String,
          false,
        ),
        sensitiveConsentFlag: deserializeParam(
          data['sensitive_consent_flag'],
          ParamType.String,
          false,
        ),
        sensitiveConsentDate: deserializeParam(
          data['sensitive_consent_date'],
          ParamType.String,
          false,
        ),
        productDetail: deserializeParam(
          data['product_detail'],
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
        landDistrictCode: deserializeParam(
          data['land_district_code'],
          ParamType.String,
          false,
        ),
        landSubdistrict: deserializeParam(
          data['land_subdistrict'],
          ParamType.String,
          false,
        ),
        landProvince: deserializeParam(
          data['land_province'],
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
        product: deserializeParam(
          data['product'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.String,
          false,
        ),
        agentGroupId: deserializeParam(
          data['agent_group_id'],
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
        agentWht: deserializeParam(
          data['agent_wht'],
          ParamType.String,
          false,
        ),
        comEstimateVatAmt: deserializeParam(
          data['com_estimate_vat_amt'],
          ParamType.String,
          false,
        ),
        requestNo: deserializeParam(
          data['request_no'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LeadAgentDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LeadAgentDataModelStruct &&
        id == other.id &&
        agentCode == other.agentCode &&
        lastName == other.lastName &&
        firstName == other.firstName &&
        leadStatus == other.leadStatus &&
        loanTypeId == other.loanTypeId &&
        loanTypeCode == other.loanTypeCode &&
        loanTypeName == other.loanTypeName &&
        loanAmount == other.loanAmount &&
        carRegistration == other.carRegistration &&
        registerId == other.registerId &&
        brandCode == other.brandCode &&
        brandName == other.brandName &&
        carGear == other.carGear &&
        carModel == other.carModel &&
        carCc == other.carCc &&
        carYear == other.carYear &&
        estimatePrice == other.estimatePrice &&
        mobilePhoneNumber == other.mobilePhoneNumber &&
        contactTime == other.contactTime &&
        privacyConsentFlag == other.privacyConsentFlag &&
        privacyConsentDate == other.privacyConsentDate &&
        sensitiveConsentFlag == other.sensitiveConsentFlag &&
        sensitiveConsentDate == other.sensitiveConsentDate &&
        productDetail == other.productDetail &&
        landAreaRai == other.landAreaRai &&
        landAreaNgan == other.landAreaNgan &&
        landAreaWa == other.landAreaWa &&
        utmmap == other.utmmap &&
        landNo == other.landNo &&
        surveyNo == other.surveyNo &&
        landDistrictCode == other.landDistrictCode &&
        landSubdistrict == other.landSubdistrict &&
        landProvince == other.landProvince &&
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
        paymentMethod == other.paymentMethod &&
        deductionPercent == other.deductionPercent &&
        paymentChannel == other.paymentChannel &&
        accountNumber == other.accountNumber &&
        promptpayNumber == other.promptpayNumber &&
        product == other.product &&
        createdAt == other.createdAt &&
        agentGroupId == other.agentGroupId &&
        comEstimateAmt == other.comEstimateAmt &&
        comEstimateVat == other.comEstimateVat &&
        comEstimateNetAmt == other.comEstimateNetAmt &&
        defaultComPercent == other.defaultComPercent &&
        actualComPercent == other.actualComPercent &&
        agentWht == other.agentWht &&
        comEstimateVatAmt == other.comEstimateVatAmt &&
        requestNo == other.requestNo;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        agentCode,
        lastName,
        firstName,
        leadStatus,
        loanTypeId,
        loanTypeCode,
        loanTypeName,
        loanAmount,
        carRegistration,
        registerId,
        brandCode,
        brandName,
        carGear,
        carModel,
        carCc,
        carYear,
        estimatePrice,
        mobilePhoneNumber,
        contactTime,
        privacyConsentFlag,
        privacyConsentDate,
        sensitiveConsentFlag,
        sensitiveConsentDate,
        productDetail,
        landAreaRai,
        landAreaNgan,
        landAreaWa,
        utmmap,
        landNo,
        surveyNo,
        landDistrictCode,
        landSubdistrict,
        landProvince,
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
        paymentMethod,
        deductionPercent,
        paymentChannel,
        accountNumber,
        promptpayNumber,
        product,
        createdAt,
        agentGroupId,
        comEstimateAmt,
        comEstimateVat,
        comEstimateNetAmt,
        defaultComPercent,
        actualComPercent,
        agentWht,
        comEstimateVatAmt,
        requestNo
      ]);
}

LeadAgentDataModelStruct createLeadAgentDataModelStruct({
  int? id,
  String? agentCode,
  String? lastName,
  String? firstName,
  String? leadStatus,
  String? loanTypeId,
  String? loanTypeCode,
  String? loanTypeName,
  String? loanAmount,
  String? carRegistration,
  String? registerId,
  String? brandCode,
  String? brandName,
  String? carGear,
  String? carModel,
  String? carCc,
  String? carYear,
  String? estimatePrice,
  String? mobilePhoneNumber,
  String? contactTime,
  String? privacyConsentFlag,
  String? privacyConsentDate,
  String? sensitiveConsentFlag,
  String? sensitiveConsentDate,
  String? productDetail,
  String? landAreaRai,
  String? landAreaNgan,
  String? landAreaWa,
  String? utmmap,
  String? landNo,
  String? surveyNo,
  String? landDistrictCode,
  String? landSubdistrict,
  String? landProvince,
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
  String? paymentMethod,
  String? deductionPercent,
  String? paymentChannel,
  String? accountNumber,
  String? promptpayNumber,
  String? product,
  String? createdAt,
  String? agentGroupId,
  String? comEstimateAmt,
  String? comEstimateVat,
  String? comEstimateNetAmt,
  String? defaultComPercent,
  String? actualComPercent,
  String? agentWht,
  String? comEstimateVatAmt,
  String? requestNo,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LeadAgentDataModelStruct(
      id: id,
      agentCode: agentCode,
      lastName: lastName,
      firstName: firstName,
      leadStatus: leadStatus,
      loanTypeId: loanTypeId,
      loanTypeCode: loanTypeCode,
      loanTypeName: loanTypeName,
      loanAmount: loanAmount,
      carRegistration: carRegistration,
      registerId: registerId,
      brandCode: brandCode,
      brandName: brandName,
      carGear: carGear,
      carModel: carModel,
      carCc: carCc,
      carYear: carYear,
      estimatePrice: estimatePrice,
      mobilePhoneNumber: mobilePhoneNumber,
      contactTime: contactTime,
      privacyConsentFlag: privacyConsentFlag,
      privacyConsentDate: privacyConsentDate,
      sensitiveConsentFlag: sensitiveConsentFlag,
      sensitiveConsentDate: sensitiveConsentDate,
      productDetail: productDetail,
      landAreaRai: landAreaRai,
      landAreaNgan: landAreaNgan,
      landAreaWa: landAreaWa,
      utmmap: utmmap,
      landNo: landNo,
      surveyNo: surveyNo,
      landDistrictCode: landDistrictCode,
      landSubdistrict: landSubdistrict,
      landProvince: landProvince,
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
      paymentMethod: paymentMethod,
      deductionPercent: deductionPercent,
      paymentChannel: paymentChannel,
      accountNumber: accountNumber,
      promptpayNumber: promptpayNumber,
      product: product,
      createdAt: createdAt,
      agentGroupId: agentGroupId,
      comEstimateAmt: comEstimateAmt,
      comEstimateVat: comEstimateVat,
      comEstimateNetAmt: comEstimateNetAmt,
      defaultComPercent: defaultComPercent,
      actualComPercent: actualComPercent,
      agentWht: agentWht,
      comEstimateVatAmt: comEstimateVatAmt,
      requestNo: requestNo,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LeadAgentDataModelStruct? updateLeadAgentDataModelStruct(
  LeadAgentDataModelStruct? leadAgentDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    leadAgentDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLeadAgentDataModelStructData(
  Map<String, dynamic> firestoreData,
  LeadAgentDataModelStruct? leadAgentDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (leadAgentDataModel == null) {
    return;
  }
  if (leadAgentDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && leadAgentDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final leadAgentDataModelData =
      getLeadAgentDataModelFirestoreData(leadAgentDataModel, forFieldValue);
  final nestedData =
      leadAgentDataModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      leadAgentDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLeadAgentDataModelFirestoreData(
  LeadAgentDataModelStruct? leadAgentDataModel, [
  bool forFieldValue = false,
]) {
  if (leadAgentDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(leadAgentDataModel.toMap());

  // Add any Firestore field values
  leadAgentDataModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLeadAgentDataModelListFirestoreData(
  List<LeadAgentDataModelStruct>? leadAgentDataModels,
) =>
    leadAgentDataModels
        ?.map((e) => getLeadAgentDataModelFirestoreData(e, true))
        .toList() ??
    [];
