// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CheckRateDataModelStruct extends FFFirebaseStruct {
  CheckRateDataModelStruct({
    String? firstName,
    String? lastName,
    String? email,
    String? customerId,
    String? registerId,
    String? mobilePhoneNumber,
    String? loanAmount,
    String? loanTypeCode,
    String? loanTypeName,
    String? productDetail,
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
    String? privacyConsentFlag,
    String? privacyConsentDate,
    String? carGear,
    String? brandName,
    String? carYear,
    String? carModel,
    String? carCc,
    String? carRegistration,
    String? carProvince,
    String? bluebookImageUrl,
    String? chanodFrontImageUrl,
    String? chanodBackImageUrl,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _firstName = firstName,
        _lastName = lastName,
        _email = email,
        _customerId = customerId,
        _registerId = registerId,
        _mobilePhoneNumber = mobilePhoneNumber,
        _loanAmount = loanAmount,
        _loanTypeCode = loanTypeCode,
        _loanTypeName = loanTypeName,
        _productDetail = productDetail,
        _estimatePrice = estimatePrice,
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
        _privacyConsentFlag = privacyConsentFlag,
        _privacyConsentDate = privacyConsentDate,
        _carGear = carGear,
        _brandName = brandName,
        _carYear = carYear,
        _carModel = carModel,
        _carCc = carCc,
        _carRegistration = carRegistration,
        _carProvince = carProvince,
        _bluebookImageUrl = bluebookImageUrl,
        _chanodFrontImageUrl = chanodFrontImageUrl,
        _chanodBackImageUrl = chanodBackImageUrl,
        super(firestoreUtilData);

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

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "customer_id" field.
  String? _customerId;
  String get customerId => _customerId ?? '';
  set customerId(String? val) => _customerId = val;

  bool hasCustomerId() => _customerId != null;

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

  // "loan_amount" field.
  String? _loanAmount;
  String get loanAmount => _loanAmount ?? '';
  set loanAmount(String? val) => _loanAmount = val;

  bool hasLoanAmount() => _loanAmount != null;

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

  // "product_detail" field.
  String? _productDetail;
  String get productDetail => _productDetail ?? '';
  set productDetail(String? val) => _productDetail = val;

  bool hasProductDetail() => _productDetail != null;

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

  // "bluebook_image_url" field.
  String? _bluebookImageUrl;
  String get bluebookImageUrl => _bluebookImageUrl ?? '';
  set bluebookImageUrl(String? val) => _bluebookImageUrl = val;

  bool hasBluebookImageUrl() => _bluebookImageUrl != null;

  // "chanod_front_image_url" field.
  String? _chanodFrontImageUrl;
  String get chanodFrontImageUrl => _chanodFrontImageUrl ?? '';
  set chanodFrontImageUrl(String? val) => _chanodFrontImageUrl = val;

  bool hasChanodFrontImageUrl() => _chanodFrontImageUrl != null;

  // "chanod_back_image_url" field.
  String? _chanodBackImageUrl;
  String get chanodBackImageUrl => _chanodBackImageUrl ?? '';
  set chanodBackImageUrl(String? val) => _chanodBackImageUrl = val;

  bool hasChanodBackImageUrl() => _chanodBackImageUrl != null;

  static CheckRateDataModelStruct fromMap(Map<String, dynamic> data) =>
      CheckRateDataModelStruct(
        firstName: data['first_name'] as String?,
        lastName: data['last_name'] as String?,
        email: data['email'] as String?,
        customerId: data['customer_id'] as String?,
        registerId: data['register_id'] as String?,
        mobilePhoneNumber: data['mobile_phone_number'] as String?,
        loanAmount: data['loan_amount'] as String?,
        loanTypeCode: data['loan_type_code'] as String?,
        loanTypeName: data['loan_type_name'] as String?,
        productDetail: data['product_detail'] as String?,
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
        privacyConsentFlag: data['privacy_consent_flag'] as String?,
        privacyConsentDate: data['privacy_consent_date'] as String?,
        carGear: data['car_gear'] as String?,
        brandName: data['brand_name'] as String?,
        carYear: data['car_year'] as String?,
        carModel: data['car_model'] as String?,
        carCc: data['car_cc'] as String?,
        carRegistration: data['car_registration'] as String?,
        carProvince: data['car_province'] as String?,
        bluebookImageUrl: data['bluebook_image_url'] as String?,
        chanodFrontImageUrl: data['chanod_front_image_url'] as String?,
        chanodBackImageUrl: data['chanod_back_image_url'] as String?,
      );

  static CheckRateDataModelStruct? maybeFromMap(dynamic data) => data is Map
      ? CheckRateDataModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'first_name': _firstName,
        'last_name': _lastName,
        'email': _email,
        'customer_id': _customerId,
        'register_id': _registerId,
        'mobile_phone_number': _mobilePhoneNumber,
        'loan_amount': _loanAmount,
        'loan_type_code': _loanTypeCode,
        'loan_type_name': _loanTypeName,
        'product_detail': _productDetail,
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
        'privacy_consent_flag': _privacyConsentFlag,
        'privacy_consent_date': _privacyConsentDate,
        'car_gear': _carGear,
        'brand_name': _brandName,
        'car_year': _carYear,
        'car_model': _carModel,
        'car_cc': _carCc,
        'car_registration': _carRegistration,
        'car_province': _carProvince,
        'bluebook_image_url': _bluebookImageUrl,
        'chanod_front_image_url': _chanodFrontImageUrl,
        'chanod_back_image_url': _chanodBackImageUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'first_name': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'last_name': serializeParam(
          _lastName,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'customer_id': serializeParam(
          _customerId,
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
        'loan_amount': serializeParam(
          _loanAmount,
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
        'product_detail': serializeParam(
          _productDetail,
          ParamType.String,
        ),
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
        'privacy_consent_flag': serializeParam(
          _privacyConsentFlag,
          ParamType.String,
        ),
        'privacy_consent_date': serializeParam(
          _privacyConsentDate,
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
        'car_registration': serializeParam(
          _carRegistration,
          ParamType.String,
        ),
        'car_province': serializeParam(
          _carProvince,
          ParamType.String,
        ),
        'bluebook_image_url': serializeParam(
          _bluebookImageUrl,
          ParamType.String,
        ),
        'chanod_front_image_url': serializeParam(
          _chanodFrontImageUrl,
          ParamType.String,
        ),
        'chanod_back_image_url': serializeParam(
          _chanodBackImageUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static CheckRateDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CheckRateDataModelStruct(
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
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        customerId: deserializeParam(
          data['customer_id'],
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
        loanAmount: deserializeParam(
          data['loan_amount'],
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
        productDetail: deserializeParam(
          data['product_detail'],
          ParamType.String,
          false,
        ),
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
        bluebookImageUrl: deserializeParam(
          data['bluebook_image_url'],
          ParamType.String,
          false,
        ),
        chanodFrontImageUrl: deserializeParam(
          data['chanod_front_image_url'],
          ParamType.String,
          false,
        ),
        chanodBackImageUrl: deserializeParam(
          data['chanod_back_image_url'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CheckRateDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CheckRateDataModelStruct &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        email == other.email &&
        customerId == other.customerId &&
        registerId == other.registerId &&
        mobilePhoneNumber == other.mobilePhoneNumber &&
        loanAmount == other.loanAmount &&
        loanTypeCode == other.loanTypeCode &&
        loanTypeName == other.loanTypeName &&
        productDetail == other.productDetail &&
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
        privacyConsentFlag == other.privacyConsentFlag &&
        privacyConsentDate == other.privacyConsentDate &&
        carGear == other.carGear &&
        brandName == other.brandName &&
        carYear == other.carYear &&
        carModel == other.carModel &&
        carCc == other.carCc &&
        carRegistration == other.carRegistration &&
        carProvince == other.carProvince &&
        bluebookImageUrl == other.bluebookImageUrl &&
        chanodFrontImageUrl == other.chanodFrontImageUrl &&
        chanodBackImageUrl == other.chanodBackImageUrl;
  }

  @override
  int get hashCode => const ListEquality().hash([
        firstName,
        lastName,
        email,
        customerId,
        registerId,
        mobilePhoneNumber,
        loanAmount,
        loanTypeCode,
        loanTypeName,
        productDetail,
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
        privacyConsentFlag,
        privacyConsentDate,
        carGear,
        brandName,
        carYear,
        carModel,
        carCc,
        carRegistration,
        carProvince,
        bluebookImageUrl,
        chanodFrontImageUrl,
        chanodBackImageUrl
      ]);
}

CheckRateDataModelStruct createCheckRateDataModelStruct({
  String? firstName,
  String? lastName,
  String? email,
  String? customerId,
  String? registerId,
  String? mobilePhoneNumber,
  String? loanAmount,
  String? loanTypeCode,
  String? loanTypeName,
  String? productDetail,
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
  String? privacyConsentFlag,
  String? privacyConsentDate,
  String? carGear,
  String? brandName,
  String? carYear,
  String? carModel,
  String? carCc,
  String? carRegistration,
  String? carProvince,
  String? bluebookImageUrl,
  String? chanodFrontImageUrl,
  String? chanodBackImageUrl,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CheckRateDataModelStruct(
      firstName: firstName,
      lastName: lastName,
      email: email,
      customerId: customerId,
      registerId: registerId,
      mobilePhoneNumber: mobilePhoneNumber,
      loanAmount: loanAmount,
      loanTypeCode: loanTypeCode,
      loanTypeName: loanTypeName,
      productDetail: productDetail,
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
      privacyConsentFlag: privacyConsentFlag,
      privacyConsentDate: privacyConsentDate,
      carGear: carGear,
      brandName: brandName,
      carYear: carYear,
      carModel: carModel,
      carCc: carCc,
      carRegistration: carRegistration,
      carProvince: carProvince,
      bluebookImageUrl: bluebookImageUrl,
      chanodFrontImageUrl: chanodFrontImageUrl,
      chanodBackImageUrl: chanodBackImageUrl,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CheckRateDataModelStruct? updateCheckRateDataModelStruct(
  CheckRateDataModelStruct? checkRateDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    checkRateDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCheckRateDataModelStructData(
  Map<String, dynamic> firestoreData,
  CheckRateDataModelStruct? checkRateDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (checkRateDataModel == null) {
    return;
  }
  if (checkRateDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && checkRateDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final checkRateDataModelData =
      getCheckRateDataModelFirestoreData(checkRateDataModel, forFieldValue);
  final nestedData =
      checkRateDataModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      checkRateDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCheckRateDataModelFirestoreData(
  CheckRateDataModelStruct? checkRateDataModel, [
  bool forFieldValue = false,
]) {
  if (checkRateDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(checkRateDataModel.toMap());

  // Add any Firestore field values
  checkRateDataModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCheckRateDataModelListFirestoreData(
  List<CheckRateDataModelStruct>? checkRateDataModels,
) =>
    checkRateDataModels
        ?.map((e) => getCheckRateDataModelFirestoreData(e, true))
        .toList() ??
    [];
