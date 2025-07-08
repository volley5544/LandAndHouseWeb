// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ChanodDataListStruct extends FFFirebaseStruct {
  ChanodDataListStruct({
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? birthDate,
    String? age,
    String? email,
    String? source,
    String? channel,
    String? subChannel,
    String? landAreaRai,
    String? landAreaNgan,
    String? landAreaWa,
    String? utmmap,
    String? landNo,
    String? surveyNo,
    String? districtCode,
    String? district,
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
    String? regionCode,
    String? regionName,
    String? createdUserid,
    String? importDate,
    String? updatedUserid,
    String? updatedAt,
    String? referToBranch,
    String? callStatus,
    String? contractNo,
    String? contractDate,
    String? province,
    String? assignFor,
    String? assignTo,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _firstName = firstName,
        _lastName = lastName,
        _phoneNumber = phoneNumber,
        _birthDate = birthDate,
        _age = age,
        _email = email,
        _source = source,
        _channel = channel,
        _subChannel = subChannel,
        _landAreaRai = landAreaRai,
        _landAreaNgan = landAreaNgan,
        _landAreaWa = landAreaWa,
        _utmmap = utmmap,
        _landNo = landNo,
        _surveyNo = surveyNo,
        _districtCode = districtCode,
        _district = district,
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
        _regionCode = regionCode,
        _regionName = regionName,
        _createdUserid = createdUserid,
        _importDate = importDate,
        _updatedUserid = updatedUserid,
        _updatedAt = updatedAt,
        _referToBranch = referToBranch,
        _callStatus = callStatus,
        _contractNo = contractNo,
        _contractDate = contractDate,
        _province = province,
        _assignFor = assignFor,
        _assignTo = assignTo,
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
  String? _age;
  String get age => _age ?? '';
  set age(String? val) => _age = val;

  bool hasAge() => _age != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

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

  // "created_userid" field.
  String? _createdUserid;
  String get createdUserid => _createdUserid ?? '';
  set createdUserid(String? val) => _createdUserid = val;

  bool hasCreatedUserid() => _createdUserid != null;

  // "import_date" field.
  String? _importDate;
  String get importDate => _importDate ?? '';
  set importDate(String? val) => _importDate = val;

  bool hasImportDate() => _importDate != null;

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

  // "refer_to_branch" field.
  String? _referToBranch;
  String get referToBranch => _referToBranch ?? '';
  set referToBranch(String? val) => _referToBranch = val;

  bool hasReferToBranch() => _referToBranch != null;

  // "call_status" field.
  String? _callStatus;
  String get callStatus => _callStatus ?? '';
  set callStatus(String? val) => _callStatus = val;

  bool hasCallStatus() => _callStatus != null;

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

  // "province" field.
  String? _province;
  String get province => _province ?? '';
  set province(String? val) => _province = val;

  bool hasProvince() => _province != null;

  // "assign_for" field.
  String? _assignFor;
  String get assignFor => _assignFor ?? '';
  set assignFor(String? val) => _assignFor = val;

  bool hasAssignFor() => _assignFor != null;

  // "assign_to" field.
  String? _assignTo;
  String get assignTo => _assignTo ?? '';
  set assignTo(String? val) => _assignTo = val;

  bool hasAssignTo() => _assignTo != null;

  static ChanodDataListStruct fromMap(Map<String, dynamic> data) =>
      ChanodDataListStruct(
        firstName: data['first_name'] as String?,
        lastName: data['last_name'] as String?,
        phoneNumber: data['phone_number'] as String?,
        birthDate: data['birth_date'] as String?,
        age: data['age'] as String?,
        email: data['email'] as String?,
        source: data['source'] as String?,
        channel: data['channel'] as String?,
        subChannel: data['sub_channel'] as String?,
        landAreaRai: data['land_area_rai'] as String?,
        landAreaNgan: data['land_area_ngan'] as String?,
        landAreaWa: data['land_area_wa'] as String?,
        utmmap: data['utmmap'] as String?,
        landNo: data['land_no'] as String?,
        surveyNo: data['survey_no'] as String?,
        districtCode: data['district_code'] as String?,
        district: data['district'] as String?,
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
        regionCode: data['region_code'] as String?,
        regionName: data['region_name'] as String?,
        createdUserid: data['created_userid'] as String?,
        importDate: data['import_date'] as String?,
        updatedUserid: data['updated_userid'] as String?,
        updatedAt: data['updated_at'] as String?,
        referToBranch: data['refer_to_branch'] as String?,
        callStatus: data['call_status'] as String?,
        contractNo: data['contract_no'] as String?,
        contractDate: data['contract_date'] as String?,
        province: data['province'] as String?,
        assignFor: data['assign_for'] as String?,
        assignTo: data['assign_to'] as String?,
      );

  static ChanodDataListStruct? maybeFromMap(dynamic data) => data is Map
      ? ChanodDataListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'first_name': _firstName,
        'last_name': _lastName,
        'phone_number': _phoneNumber,
        'birth_date': _birthDate,
        'age': _age,
        'email': _email,
        'source': _source,
        'channel': _channel,
        'sub_channel': _subChannel,
        'land_area_rai': _landAreaRai,
        'land_area_ngan': _landAreaNgan,
        'land_area_wa': _landAreaWa,
        'utmmap': _utmmap,
        'land_no': _landNo,
        'survey_no': _surveyNo,
        'district_code': _districtCode,
        'district': _district,
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
        'region_code': _regionCode,
        'region_name': _regionName,
        'created_userid': _createdUserid,
        'import_date': _importDate,
        'updated_userid': _updatedUserid,
        'updated_at': _updatedAt,
        'refer_to_branch': _referToBranch,
        'call_status': _callStatus,
        'contract_no': _contractNo,
        'contract_date': _contractDate,
        'province': _province,
        'assign_for': _assignFor,
        'assign_to': _assignTo,
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
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
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
        'region_code': serializeParam(
          _regionCode,
          ParamType.String,
        ),
        'region_name': serializeParam(
          _regionName,
          ParamType.String,
        ),
        'created_userid': serializeParam(
          _createdUserid,
          ParamType.String,
        ),
        'import_date': serializeParam(
          _importDate,
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
        'refer_to_branch': serializeParam(
          _referToBranch,
          ParamType.String,
        ),
        'call_status': serializeParam(
          _callStatus,
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
        'province': serializeParam(
          _province,
          ParamType.String,
        ),
        'assign_for': serializeParam(
          _assignFor,
          ParamType.String,
        ),
        'assign_to': serializeParam(
          _assignTo,
          ParamType.String,
        ),
      }.withoutNulls;

  static ChanodDataListStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChanodDataListStruct(
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
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
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
        createdUserid: deserializeParam(
          data['created_userid'],
          ParamType.String,
          false,
        ),
        importDate: deserializeParam(
          data['import_date'],
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
        referToBranch: deserializeParam(
          data['refer_to_branch'],
          ParamType.String,
          false,
        ),
        callStatus: deserializeParam(
          data['call_status'],
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
        province: deserializeParam(
          data['province'],
          ParamType.String,
          false,
        ),
        assignFor: deserializeParam(
          data['assign_for'],
          ParamType.String,
          false,
        ),
        assignTo: deserializeParam(
          data['assign_to'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ChanodDataListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChanodDataListStruct &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        phoneNumber == other.phoneNumber &&
        birthDate == other.birthDate &&
        age == other.age &&
        email == other.email &&
        source == other.source &&
        channel == other.channel &&
        subChannel == other.subChannel &&
        landAreaRai == other.landAreaRai &&
        landAreaNgan == other.landAreaNgan &&
        landAreaWa == other.landAreaWa &&
        utmmap == other.utmmap &&
        landNo == other.landNo &&
        surveyNo == other.surveyNo &&
        districtCode == other.districtCode &&
        district == other.district &&
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
        regionCode == other.regionCode &&
        regionName == other.regionName &&
        createdUserid == other.createdUserid &&
        importDate == other.importDate &&
        updatedUserid == other.updatedUserid &&
        updatedAt == other.updatedAt &&
        referToBranch == other.referToBranch &&
        callStatus == other.callStatus &&
        contractNo == other.contractNo &&
        contractDate == other.contractDate &&
        province == other.province &&
        assignFor == other.assignFor &&
        assignTo == other.assignTo;
  }

  @override
  int get hashCode => const ListEquality().hash([
        firstName,
        lastName,
        phoneNumber,
        birthDate,
        age,
        email,
        source,
        channel,
        subChannel,
        landAreaRai,
        landAreaNgan,
        landAreaWa,
        utmmap,
        landNo,
        surveyNo,
        districtCode,
        district,
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
        regionCode,
        regionName,
        createdUserid,
        importDate,
        updatedUserid,
        updatedAt,
        referToBranch,
        callStatus,
        contractNo,
        contractDate,
        province,
        assignFor,
        assignTo
      ]);
}

ChanodDataListStruct createChanodDataListStruct({
  String? firstName,
  String? lastName,
  String? phoneNumber,
  String? birthDate,
  String? age,
  String? email,
  String? source,
  String? channel,
  String? subChannel,
  String? landAreaRai,
  String? landAreaNgan,
  String? landAreaWa,
  String? utmmap,
  String? landNo,
  String? surveyNo,
  String? districtCode,
  String? district,
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
  String? regionCode,
  String? regionName,
  String? createdUserid,
  String? importDate,
  String? updatedUserid,
  String? updatedAt,
  String? referToBranch,
  String? callStatus,
  String? contractNo,
  String? contractDate,
  String? province,
  String? assignFor,
  String? assignTo,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChanodDataListStruct(
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      birthDate: birthDate,
      age: age,
      email: email,
      source: source,
      channel: channel,
      subChannel: subChannel,
      landAreaRai: landAreaRai,
      landAreaNgan: landAreaNgan,
      landAreaWa: landAreaWa,
      utmmap: utmmap,
      landNo: landNo,
      surveyNo: surveyNo,
      districtCode: districtCode,
      district: district,
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
      regionCode: regionCode,
      regionName: regionName,
      createdUserid: createdUserid,
      importDate: importDate,
      updatedUserid: updatedUserid,
      updatedAt: updatedAt,
      referToBranch: referToBranch,
      callStatus: callStatus,
      contractNo: contractNo,
      contractDate: contractDate,
      province: province,
      assignFor: assignFor,
      assignTo: assignTo,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChanodDataListStruct? updateChanodDataListStruct(
  ChanodDataListStruct? chanodDataList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    chanodDataList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChanodDataListStructData(
  Map<String, dynamic> firestoreData,
  ChanodDataListStruct? chanodDataList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chanodDataList == null) {
    return;
  }
  if (chanodDataList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && chanodDataList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chanodDataListData =
      getChanodDataListFirestoreData(chanodDataList, forFieldValue);
  final nestedData =
      chanodDataListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = chanodDataList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChanodDataListFirestoreData(
  ChanodDataListStruct? chanodDataList, [
  bool forFieldValue = false,
]) {
  if (chanodDataList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(chanodDataList.toMap());

  // Add any Firestore field values
  chanodDataList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChanodDataListListFirestoreData(
  List<ChanodDataListStruct>? chanodDataLists,
) =>
    chanodDataLists
        ?.map((e) => getChanodDataListFirestoreData(e, true))
        .toList() ??
    [];
