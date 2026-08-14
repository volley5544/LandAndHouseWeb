// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SaveLeadAgentDataModelStruct extends FFFirebaseStruct {
  SaveLeadAgentDataModelStruct({
    String? estimatePrice,
    String? landDistrict,
    String? landSubdistrict,
    String? landProvince,
    String? landPostcode,
    String? landAreaRai,
    String? landAreaNgan,
    String? landAreaWa,
    String? landNo,
    String? utmmap,
    String? surveyNo,
    String? ltv1Amount,
    String? ltv2Amount,
    String? agentGroupId,
    String? privacyConsentFlag,
    String? privacyConsentDate,
    String? paymentMethod,
    String? deductionPercent,
    String? paymentNumber,
    String? paymentChannel,
    String? id,
    String? agentId,
    String? agentCode,
    String? firstName,
    String? lastName,
    String? registerId,
    String? mobilePhoneNumber,
    String? contactTime,
    String? loanAmount,
    String? loanTypeId,
    String? loanTypeCode,
    String? loanTypeName,
    String? carGear,
    String? brandName,
    String? carYear,
    String? carModel,
    String? carCc,
    String? productDetail,
    String? carRegistration,
    String? carProvince,
    String? commission,
    String? comEstimateAmt,
    String? comEstimateVat,
    String? comEstimateNetAmt,
    String? defaultComPercent,
    String? actualComPercent,
    String? comEstimateVatAmt,
    String? smsCode,
    int? leadMobileId,
    String? subProduct,
    String? requestInstallmentTerm,
    String? requestInstallmentAmount,
    String? interestRate,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _estimatePrice = estimatePrice,
        _landDistrict = landDistrict,
        _landSubdistrict = landSubdistrict,
        _landProvince = landProvince,
        _landPostcode = landPostcode,
        _landAreaRai = landAreaRai,
        _landAreaNgan = landAreaNgan,
        _landAreaWa = landAreaWa,
        _landNo = landNo,
        _utmmap = utmmap,
        _surveyNo = surveyNo,
        _ltv1Amount = ltv1Amount,
        _ltv2Amount = ltv2Amount,
        _agentGroupId = agentGroupId,
        _privacyConsentFlag = privacyConsentFlag,
        _privacyConsentDate = privacyConsentDate,
        _paymentMethod = paymentMethod,
        _deductionPercent = deductionPercent,
        _paymentNumber = paymentNumber,
        _paymentChannel = paymentChannel,
        _id = id,
        _agentId = agentId,
        _agentCode = agentCode,
        _firstName = firstName,
        _lastName = lastName,
        _registerId = registerId,
        _mobilePhoneNumber = mobilePhoneNumber,
        _contactTime = contactTime,
        _loanAmount = loanAmount,
        _loanTypeId = loanTypeId,
        _loanTypeCode = loanTypeCode,
        _loanTypeName = loanTypeName,
        _carGear = carGear,
        _brandName = brandName,
        _carYear = carYear,
        _carModel = carModel,
        _carCc = carCc,
        _productDetail = productDetail,
        _carRegistration = carRegistration,
        _carProvince = carProvince,
        _commission = commission,
        _comEstimateAmt = comEstimateAmt,
        _comEstimateVat = comEstimateVat,
        _comEstimateNetAmt = comEstimateNetAmt,
        _defaultComPercent = defaultComPercent,
        _actualComPercent = actualComPercent,
        _comEstimateVatAmt = comEstimateVatAmt,
        _smsCode = smsCode,
        _leadMobileId = leadMobileId,
        _subProduct = subProduct,
        _requestInstallmentTerm = requestInstallmentTerm,
        _requestInstallmentAmount = requestInstallmentAmount,
        _interestRate = interestRate,
        super(firestoreUtilData);

  // "estimate_price" field.
  String? _estimatePrice;
  String get estimatePrice => _estimatePrice ?? '';
  set estimatePrice(String? val) => _estimatePrice = val;

  bool hasEstimatePrice() => _estimatePrice != null;

  // "land_district" field.
  String? _landDistrict;
  String get landDistrict => _landDistrict ?? '';
  set landDistrict(String? val) => _landDistrict = val;

  bool hasLandDistrict() => _landDistrict != null;

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

  // "land_postcode" field.
  String? _landPostcode;
  String get landPostcode => _landPostcode ?? '';
  set landPostcode(String? val) => _landPostcode = val;

  bool hasLandPostcode() => _landPostcode != null;

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

  // "land_no" field.
  String? _landNo;
  String get landNo => _landNo ?? '';
  set landNo(String? val) => _landNo = val;

  bool hasLandNo() => _landNo != null;

  // "utmmap" field.
  String? _utmmap;
  String get utmmap => _utmmap ?? '';
  set utmmap(String? val) => _utmmap = val;

  bool hasUtmmap() => _utmmap != null;

  // "survey_no" field.
  String? _surveyNo;
  String get surveyNo => _surveyNo ?? '';
  set surveyNo(String? val) => _surveyNo = val;

  bool hasSurveyNo() => _surveyNo != null;

  // "ltv1_amount" field.
  String? _ltv1Amount;
  String get ltv1Amount => _ltv1Amount ?? '';
  set ltv1Amount(String? val) => _ltv1Amount = val;

  bool hasLtv1Amount() => _ltv1Amount != null;

  // "ltv2_amount" field.
  String? _ltv2Amount;
  String get ltv2Amount => _ltv2Amount ?? '';
  set ltv2Amount(String? val) => _ltv2Amount = val;

  bool hasLtv2Amount() => _ltv2Amount != null;

  // "agent_group_id" field.
  String? _agentGroupId;
  String get agentGroupId => _agentGroupId ?? '';
  set agentGroupId(String? val) => _agentGroupId = val;

  bool hasAgentGroupId() => _agentGroupId != null;

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

  // "payment_number" field.
  String? _paymentNumber;
  String get paymentNumber => _paymentNumber ?? '';
  set paymentNumber(String? val) => _paymentNumber = val;

  bool hasPaymentNumber() => _paymentNumber != null;

  // "payment_channel" field.
  String? _paymentChannel;
  String get paymentChannel => _paymentChannel ?? '';
  set paymentChannel(String? val) => _paymentChannel = val;

  bool hasPaymentChannel() => _paymentChannel != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "agent_id" field.
  String? _agentId;
  String get agentId => _agentId ?? '';
  set agentId(String? val) => _agentId = val;

  bool hasAgentId() => _agentId != null;

  // "agent_code" field.
  String? _agentCode;
  String get agentCode => _agentCode ?? '';
  set agentCode(String? val) => _agentCode = val;

  bool hasAgentCode() => _agentCode != null;

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

  // "register_id" field.
  String? _registerId;
  String get registerId => _registerId ?? '';
  set registerId(String? val) => _registerId = val;

  bool hasRegisterId() => _registerId != null;

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

  // "loan_amount" field.
  String? _loanAmount;
  String get loanAmount => _loanAmount ?? '';
  set loanAmount(String? val) => _loanAmount = val;

  bool hasLoanAmount() => _loanAmount != null;

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

  // "car_gear" field.
  String? _carGear;
  String get carGear => _carGear ?? '';
  set carGear(String? val) => _carGear = val;

  bool hasCarGear() => _carGear != null;

  // "brand_name" field.
  String? _brandName;
  String get brandName => _brandName ?? '';
  set brandName(String? val) => _brandName = val;

  bool hasBrandName() => _brandName != null;

  // "car_year" field.
  String? _carYear;
  String get carYear => _carYear ?? '';
  set carYear(String? val) => _carYear = val;

  bool hasCarYear() => _carYear != null;

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

  // "product_detail" field.
  String? _productDetail;
  String get productDetail => _productDetail ?? '';
  set productDetail(String? val) => _productDetail = val;

  bool hasProductDetail() => _productDetail != null;

  // "car_registration" field.
  String? _carRegistration;
  String get carRegistration => _carRegistration ?? '';
  set carRegistration(String? val) => _carRegistration = val;

  bool hasCarRegistration() => _carRegistration != null;

  // "car_province" field.
  String? _carProvince;
  String get carProvince => _carProvince ?? '';
  set carProvince(String? val) => _carProvince = val;

  bool hasCarProvince() => _carProvince != null;

  // "commission" field.
  String? _commission;
  String get commission => _commission ?? '';
  set commission(String? val) => _commission = val;

  bool hasCommission() => _commission != null;

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

  // "sms_code" field.
  String? _smsCode;
  String get smsCode => _smsCode ?? '';
  set smsCode(String? val) => _smsCode = val;

  bool hasSmsCode() => _smsCode != null;

  // "lead_mobile_id" field.
  int? _leadMobileId;
  int get leadMobileId => _leadMobileId ?? 0;
  set leadMobileId(int? val) => _leadMobileId = val;

  void incrementLeadMobileId(int amount) =>
      leadMobileId = leadMobileId + amount;

  bool hasLeadMobileId() => _leadMobileId != null;

  // "sub_product" field.
  String? _subProduct;
  String get subProduct => _subProduct ?? '';
  set subProduct(String? val) => _subProduct = val;

  bool hasSubProduct() => _subProduct != null;

  // "request_installment_term" field.
  String? _requestInstallmentTerm;
  String get requestInstallmentTerm => _requestInstallmentTerm ?? '';
  set requestInstallmentTerm(String? val) => _requestInstallmentTerm = val;

  bool hasRequestInstallmentTerm() => _requestInstallmentTerm != null;

  // "request_installment_amount" field.
  String? _requestInstallmentAmount;
  String get requestInstallmentAmount => _requestInstallmentAmount ?? '';
  set requestInstallmentAmount(String? val) => _requestInstallmentAmount = val;

  bool hasRequestInstallmentAmount() => _requestInstallmentAmount != null;

  // "interest_rate" field.
  String? _interestRate;
  String get interestRate => _interestRate ?? '';
  set interestRate(String? val) => _interestRate = val;

  bool hasInterestRate() => _interestRate != null;

  static SaveLeadAgentDataModelStruct fromMap(Map<String, dynamic> data) =>
      SaveLeadAgentDataModelStruct(
        estimatePrice: data['estimate_price'] as String?,
        landDistrict: data['land_district'] as String?,
        landSubdistrict: data['land_subdistrict'] as String?,
        landProvince: data['land_province'] as String?,
        landPostcode: data['land_postcode'] as String?,
        landAreaRai: data['land_area_rai'] as String?,
        landAreaNgan: data['land_area_ngan'] as String?,
        landAreaWa: data['land_area_wa'] as String?,
        landNo: data['land_no'] as String?,
        utmmap: data['utmmap'] as String?,
        surveyNo: data['survey_no'] as String?,
        ltv1Amount: data['ltv1_amount'] as String?,
        ltv2Amount: data['ltv2_amount'] as String?,
        agentGroupId: data['agent_group_id'] as String?,
        privacyConsentFlag: data['privacy_consent_flag'] as String?,
        privacyConsentDate: data['privacy_consent_date'] as String?,
        paymentMethod: data['payment_method'] as String?,
        deductionPercent: data['deduction_percent'] as String?,
        paymentNumber: data['payment_number'] as String?,
        paymentChannel: data['payment_channel'] as String?,
        id: data['id'] as String?,
        agentId: data['agent_id'] as String?,
        agentCode: data['agent_code'] as String?,
        firstName: data['first_name'] as String?,
        lastName: data['last_name'] as String?,
        registerId: data['register_id'] as String?,
        mobilePhoneNumber: data['mobile_phone_number'] as String?,
        contactTime: data['contact_time'] as String?,
        loanAmount: data['loan_amount'] as String?,
        loanTypeId: data['loan_type_id'] as String?,
        loanTypeCode: data['loan_type_code'] as String?,
        loanTypeName: data['loan_type_name'] as String?,
        carGear: data['car_gear'] as String?,
        brandName: data['brand_name'] as String?,
        carYear: data['car_year'] as String?,
        carModel: data['car_model'] as String?,
        carCc: data['car_cc'] as String?,
        productDetail: data['product_detail'] as String?,
        carRegistration: data['car_registration'] as String?,
        carProvince: data['car_province'] as String?,
        commission: data['commission'] as String?,
        comEstimateAmt: data['com_estimate_amt'] as String?,
        comEstimateVat: data['com_estimate_vat'] as String?,
        comEstimateNetAmt: data['com_estimate_net_amt'] as String?,
        defaultComPercent: data['default_com_percent'] as String?,
        actualComPercent: data['actual_com_percent'] as String?,
        comEstimateVatAmt: data['com_estimate_vat_amt'] as String?,
        smsCode: data['sms_code'] as String?,
        leadMobileId: castToType<int>(data['lead_mobile_id']),
        subProduct: data['sub_product'] as String?,
        requestInstallmentTerm: data['request_installment_term'] as String?,
        requestInstallmentAmount: data['request_installment_amount'] as String?,
        interestRate: data['interest_rate'] as String?,
      );

  static SaveLeadAgentDataModelStruct? maybeFromMap(dynamic data) => data is Map
      ? SaveLeadAgentDataModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'estimate_price': _estimatePrice,
        'land_district': _landDistrict,
        'land_subdistrict': _landSubdistrict,
        'land_province': _landProvince,
        'land_postcode': _landPostcode,
        'land_area_rai': _landAreaRai,
        'land_area_ngan': _landAreaNgan,
        'land_area_wa': _landAreaWa,
        'land_no': _landNo,
        'utmmap': _utmmap,
        'survey_no': _surveyNo,
        'ltv1_amount': _ltv1Amount,
        'ltv2_amount': _ltv2Amount,
        'agent_group_id': _agentGroupId,
        'privacy_consent_flag': _privacyConsentFlag,
        'privacy_consent_date': _privacyConsentDate,
        'payment_method': _paymentMethod,
        'deduction_percent': _deductionPercent,
        'payment_number': _paymentNumber,
        'payment_channel': _paymentChannel,
        'id': _id,
        'agent_id': _agentId,
        'agent_code': _agentCode,
        'first_name': _firstName,
        'last_name': _lastName,
        'register_id': _registerId,
        'mobile_phone_number': _mobilePhoneNumber,
        'contact_time': _contactTime,
        'loan_amount': _loanAmount,
        'loan_type_id': _loanTypeId,
        'loan_type_code': _loanTypeCode,
        'loan_type_name': _loanTypeName,
        'car_gear': _carGear,
        'brand_name': _brandName,
        'car_year': _carYear,
        'car_model': _carModel,
        'car_cc': _carCc,
        'product_detail': _productDetail,
        'car_registration': _carRegistration,
        'car_province': _carProvince,
        'commission': _commission,
        'com_estimate_amt': _comEstimateAmt,
        'com_estimate_vat': _comEstimateVat,
        'com_estimate_net_amt': _comEstimateNetAmt,
        'default_com_percent': _defaultComPercent,
        'actual_com_percent': _actualComPercent,
        'com_estimate_vat_amt': _comEstimateVatAmt,
        'sms_code': _smsCode,
        'lead_mobile_id': _leadMobileId,
        'sub_product': _subProduct,
        'request_installment_term': _requestInstallmentTerm,
        'request_installment_amount': _requestInstallmentAmount,
        'interest_rate': _interestRate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'estimate_price': serializeParam(
          _estimatePrice,
          ParamType.String,
        ),
        'land_district': serializeParam(
          _landDistrict,
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
        'land_postcode': serializeParam(
          _landPostcode,
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
        'land_no': serializeParam(
          _landNo,
          ParamType.String,
        ),
        'utmmap': serializeParam(
          _utmmap,
          ParamType.String,
        ),
        'survey_no': serializeParam(
          _surveyNo,
          ParamType.String,
        ),
        'ltv1_amount': serializeParam(
          _ltv1Amount,
          ParamType.String,
        ),
        'ltv2_amount': serializeParam(
          _ltv2Amount,
          ParamType.String,
        ),
        'agent_group_id': serializeParam(
          _agentGroupId,
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
        'payment_method': serializeParam(
          _paymentMethod,
          ParamType.String,
        ),
        'deduction_percent': serializeParam(
          _deductionPercent,
          ParamType.String,
        ),
        'payment_number': serializeParam(
          _paymentNumber,
          ParamType.String,
        ),
        'payment_channel': serializeParam(
          _paymentChannel,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'agent_id': serializeParam(
          _agentId,
          ParamType.String,
        ),
        'agent_code': serializeParam(
          _agentCode,
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
        'register_id': serializeParam(
          _registerId,
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
        'loan_amount': serializeParam(
          _loanAmount,
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
        'car_gear': serializeParam(
          _carGear,
          ParamType.String,
        ),
        'brand_name': serializeParam(
          _brandName,
          ParamType.String,
        ),
        'car_year': serializeParam(
          _carYear,
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
        'product_detail': serializeParam(
          _productDetail,
          ParamType.String,
        ),
        'car_registration': serializeParam(
          _carRegistration,
          ParamType.String,
        ),
        'car_province': serializeParam(
          _carProvince,
          ParamType.String,
        ),
        'commission': serializeParam(
          _commission,
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
        'sms_code': serializeParam(
          _smsCode,
          ParamType.String,
        ),
        'lead_mobile_id': serializeParam(
          _leadMobileId,
          ParamType.int,
        ),
        'sub_product': serializeParam(
          _subProduct,
          ParamType.String,
        ),
        'request_installment_term': serializeParam(
          _requestInstallmentTerm,
          ParamType.String,
        ),
        'request_installment_amount': serializeParam(
          _requestInstallmentAmount,
          ParamType.String,
        ),
        'interest_rate': serializeParam(
          _interestRate,
          ParamType.String,
        ),
      }.withoutNulls;

  static SaveLeadAgentDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SaveLeadAgentDataModelStruct(
        estimatePrice: deserializeParam(
          data['estimate_price'],
          ParamType.String,
          false,
        ),
        landDistrict: deserializeParam(
          data['land_district'],
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
        landPostcode: deserializeParam(
          data['land_postcode'],
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
        landNo: deserializeParam(
          data['land_no'],
          ParamType.String,
          false,
        ),
        utmmap: deserializeParam(
          data['utmmap'],
          ParamType.String,
          false,
        ),
        surveyNo: deserializeParam(
          data['survey_no'],
          ParamType.String,
          false,
        ),
        ltv1Amount: deserializeParam(
          data['ltv1_amount'],
          ParamType.String,
          false,
        ),
        ltv2Amount: deserializeParam(
          data['ltv2_amount'],
          ParamType.String,
          false,
        ),
        agentGroupId: deserializeParam(
          data['agent_group_id'],
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
        paymentNumber: deserializeParam(
          data['payment_number'],
          ParamType.String,
          false,
        ),
        paymentChannel: deserializeParam(
          data['payment_channel'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        agentId: deserializeParam(
          data['agent_id'],
          ParamType.String,
          false,
        ),
        agentCode: deserializeParam(
          data['agent_code'],
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
        registerId: deserializeParam(
          data['register_id'],
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
        loanAmount: deserializeParam(
          data['loan_amount'],
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
        carGear: deserializeParam(
          data['car_gear'],
          ParamType.String,
          false,
        ),
        brandName: deserializeParam(
          data['brand_name'],
          ParamType.String,
          false,
        ),
        carYear: deserializeParam(
          data['car_year'],
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
        productDetail: deserializeParam(
          data['product_detail'],
          ParamType.String,
          false,
        ),
        carRegistration: deserializeParam(
          data['car_registration'],
          ParamType.String,
          false,
        ),
        carProvince: deserializeParam(
          data['car_province'],
          ParamType.String,
          false,
        ),
        commission: deserializeParam(
          data['commission'],
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
        smsCode: deserializeParam(
          data['sms_code'],
          ParamType.String,
          false,
        ),
        leadMobileId: deserializeParam(
          data['lead_mobile_id'],
          ParamType.int,
          false,
        ),
        subProduct: deserializeParam(
          data['sub_product'],
          ParamType.String,
          false,
        ),
        requestInstallmentTerm: deserializeParam(
          data['request_installment_term'],
          ParamType.String,
          false,
        ),
        requestInstallmentAmount: deserializeParam(
          data['request_installment_amount'],
          ParamType.String,
          false,
        ),
        interestRate: deserializeParam(
          data['interest_rate'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SaveLeadAgentDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SaveLeadAgentDataModelStruct &&
        estimatePrice == other.estimatePrice &&
        landDistrict == other.landDistrict &&
        landSubdistrict == other.landSubdistrict &&
        landProvince == other.landProvince &&
        landPostcode == other.landPostcode &&
        landAreaRai == other.landAreaRai &&
        landAreaNgan == other.landAreaNgan &&
        landAreaWa == other.landAreaWa &&
        landNo == other.landNo &&
        utmmap == other.utmmap &&
        surveyNo == other.surveyNo &&
        ltv1Amount == other.ltv1Amount &&
        ltv2Amount == other.ltv2Amount &&
        agentGroupId == other.agentGroupId &&
        privacyConsentFlag == other.privacyConsentFlag &&
        privacyConsentDate == other.privacyConsentDate &&
        paymentMethod == other.paymentMethod &&
        deductionPercent == other.deductionPercent &&
        paymentNumber == other.paymentNumber &&
        paymentChannel == other.paymentChannel &&
        id == other.id &&
        agentId == other.agentId &&
        agentCode == other.agentCode &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        registerId == other.registerId &&
        mobilePhoneNumber == other.mobilePhoneNumber &&
        contactTime == other.contactTime &&
        loanAmount == other.loanAmount &&
        loanTypeId == other.loanTypeId &&
        loanTypeCode == other.loanTypeCode &&
        loanTypeName == other.loanTypeName &&
        carGear == other.carGear &&
        brandName == other.brandName &&
        carYear == other.carYear &&
        carModel == other.carModel &&
        carCc == other.carCc &&
        productDetail == other.productDetail &&
        carRegistration == other.carRegistration &&
        carProvince == other.carProvince &&
        commission == other.commission &&
        comEstimateAmt == other.comEstimateAmt &&
        comEstimateVat == other.comEstimateVat &&
        comEstimateNetAmt == other.comEstimateNetAmt &&
        defaultComPercent == other.defaultComPercent &&
        actualComPercent == other.actualComPercent &&
        comEstimateVatAmt == other.comEstimateVatAmt &&
        smsCode == other.smsCode &&
        leadMobileId == other.leadMobileId &&
        subProduct == other.subProduct &&
        requestInstallmentTerm == other.requestInstallmentTerm &&
        requestInstallmentAmount == other.requestInstallmentAmount &&
        interestRate == other.interestRate;
  }

  @override
  int get hashCode => const ListEquality().hash([
        estimatePrice,
        landDistrict,
        landSubdistrict,
        landProvince,
        landPostcode,
        landAreaRai,
        landAreaNgan,
        landAreaWa,
        landNo,
        utmmap,
        surveyNo,
        ltv1Amount,
        ltv2Amount,
        agentGroupId,
        privacyConsentFlag,
        privacyConsentDate,
        paymentMethod,
        deductionPercent,
        paymentNumber,
        paymentChannel,
        id,
        agentId,
        agentCode,
        firstName,
        lastName,
        registerId,
        mobilePhoneNumber,
        contactTime,
        loanAmount,
        loanTypeId,
        loanTypeCode,
        loanTypeName,
        carGear,
        brandName,
        carYear,
        carModel,
        carCc,
        productDetail,
        carRegistration,
        carProvince,
        commission,
        comEstimateAmt,
        comEstimateVat,
        comEstimateNetAmt,
        defaultComPercent,
        actualComPercent,
        comEstimateVatAmt,
        smsCode,
        leadMobileId,
        subProduct,
        requestInstallmentTerm,
        requestInstallmentAmount,
        interestRate
      ]);
}

SaveLeadAgentDataModelStruct createSaveLeadAgentDataModelStruct({
  String? estimatePrice,
  String? landDistrict,
  String? landSubdistrict,
  String? landProvince,
  String? landPostcode,
  String? landAreaRai,
  String? landAreaNgan,
  String? landAreaWa,
  String? landNo,
  String? utmmap,
  String? surveyNo,
  String? ltv1Amount,
  String? ltv2Amount,
  String? agentGroupId,
  String? privacyConsentFlag,
  String? privacyConsentDate,
  String? paymentMethod,
  String? deductionPercent,
  String? paymentNumber,
  String? paymentChannel,
  String? id,
  String? agentId,
  String? agentCode,
  String? firstName,
  String? lastName,
  String? registerId,
  String? mobilePhoneNumber,
  String? contactTime,
  String? loanAmount,
  String? loanTypeId,
  String? loanTypeCode,
  String? loanTypeName,
  String? carGear,
  String? brandName,
  String? carYear,
  String? carModel,
  String? carCc,
  String? productDetail,
  String? carRegistration,
  String? carProvince,
  String? commission,
  String? comEstimateAmt,
  String? comEstimateVat,
  String? comEstimateNetAmt,
  String? defaultComPercent,
  String? actualComPercent,
  String? comEstimateVatAmt,
  String? smsCode,
  int? leadMobileId,
  String? subProduct,
  String? requestInstallmentTerm,
  String? requestInstallmentAmount,
  String? interestRate,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SaveLeadAgentDataModelStruct(
      estimatePrice: estimatePrice,
      landDistrict: landDistrict,
      landSubdistrict: landSubdistrict,
      landProvince: landProvince,
      landPostcode: landPostcode,
      landAreaRai: landAreaRai,
      landAreaNgan: landAreaNgan,
      landAreaWa: landAreaWa,
      landNo: landNo,
      utmmap: utmmap,
      surveyNo: surveyNo,
      ltv1Amount: ltv1Amount,
      ltv2Amount: ltv2Amount,
      agentGroupId: agentGroupId,
      privacyConsentFlag: privacyConsentFlag,
      privacyConsentDate: privacyConsentDate,
      paymentMethod: paymentMethod,
      deductionPercent: deductionPercent,
      paymentNumber: paymentNumber,
      paymentChannel: paymentChannel,
      id: id,
      agentId: agentId,
      agentCode: agentCode,
      firstName: firstName,
      lastName: lastName,
      registerId: registerId,
      mobilePhoneNumber: mobilePhoneNumber,
      contactTime: contactTime,
      loanAmount: loanAmount,
      loanTypeId: loanTypeId,
      loanTypeCode: loanTypeCode,
      loanTypeName: loanTypeName,
      carGear: carGear,
      brandName: brandName,
      carYear: carYear,
      carModel: carModel,
      carCc: carCc,
      productDetail: productDetail,
      carRegistration: carRegistration,
      carProvince: carProvince,
      commission: commission,
      comEstimateAmt: comEstimateAmt,
      comEstimateVat: comEstimateVat,
      comEstimateNetAmt: comEstimateNetAmt,
      defaultComPercent: defaultComPercent,
      actualComPercent: actualComPercent,
      comEstimateVatAmt: comEstimateVatAmt,
      smsCode: smsCode,
      leadMobileId: leadMobileId,
      subProduct: subProduct,
      requestInstallmentTerm: requestInstallmentTerm,
      requestInstallmentAmount: requestInstallmentAmount,
      interestRate: interestRate,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SaveLeadAgentDataModelStruct? updateSaveLeadAgentDataModelStruct(
  SaveLeadAgentDataModelStruct? saveLeadAgentDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    saveLeadAgentDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSaveLeadAgentDataModelStructData(
  Map<String, dynamic> firestoreData,
  SaveLeadAgentDataModelStruct? saveLeadAgentDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (saveLeadAgentDataModel == null) {
    return;
  }
  if (saveLeadAgentDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      saveLeadAgentDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final saveLeadAgentDataModelData = getSaveLeadAgentDataModelFirestoreData(
      saveLeadAgentDataModel, forFieldValue);
  final nestedData =
      saveLeadAgentDataModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      saveLeadAgentDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSaveLeadAgentDataModelFirestoreData(
  SaveLeadAgentDataModelStruct? saveLeadAgentDataModel, [
  bool forFieldValue = false,
]) {
  if (saveLeadAgentDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(saveLeadAgentDataModel.toMap());

  // Add any Firestore field values
  mapToFirestore(saveLeadAgentDataModel.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSaveLeadAgentDataModelListFirestoreData(
  List<SaveLeadAgentDataModelStruct>? saveLeadAgentDataModels,
) =>
    saveLeadAgentDataModels
        ?.map((e) => getSaveLeadAgentDataModelFirestoreData(e, true))
        .toList() ??
    [];
