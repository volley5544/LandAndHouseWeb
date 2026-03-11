// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AssignLeadMCDataModelStruct extends FFFirebaseStruct {
  AssignLeadMCDataModelStruct({
    String? leadId,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? birthDate,
    String? age,
    String? email,
    String? source,
    String? channel,
    String? subChannel,
    String? carRegistration,
    String? provinceCode,
    String? province,
    String? carBrand,
    String? carBrandName,
    String? carModelName,
    String? carYear,
    String? carCcName,
    String? carRate,
    String? currEvaprice,
    String? totalEvaprice,
    String? latitude,
    String? longitude,
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
    String? branchCode,
    String? branchName,
    String? areaCode,
    String? areaName,
    String? remark,
    String? carVehicleCode,
    String? carVehicleName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _leadId = leadId,
        _firstName = firstName,
        _lastName = lastName,
        _phoneNumber = phoneNumber,
        _birthDate = birthDate,
        _age = age,
        _email = email,
        _source = source,
        _channel = channel,
        _subChannel = subChannel,
        _carRegistration = carRegistration,
        _provinceCode = provinceCode,
        _province = province,
        _carBrand = carBrand,
        _carBrandName = carBrandName,
        _carModelName = carModelName,
        _carYear = carYear,
        _carCcName = carCcName,
        _carRate = carRate,
        _currEvaprice = currEvaprice,
        _totalEvaprice = totalEvaprice,
        _latitude = latitude,
        _longitude = longitude,
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
        _branchCode = branchCode,
        _branchName = branchName,
        _areaCode = areaCode,
        _areaName = areaName,
        _remark = remark,
        _carVehicleCode = carVehicleCode,
        _carVehicleName = carVehicleName,
        super(firestoreUtilData);

  // "lead_id" field.
  String? _leadId;
  String get leadId => _leadId ?? '';
  set leadId(String? val) => _leadId = val;

  bool hasLeadId() => _leadId != null;

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

  // "car_registration" field.
  String? _carRegistration;
  String get carRegistration => _carRegistration ?? '';
  set carRegistration(String? val) => _carRegistration = val;

  bool hasCarRegistration() => _carRegistration != null;

  // "province_code" field.
  String? _provinceCode;
  String get provinceCode => _provinceCode ?? '';
  set provinceCode(String? val) => _provinceCode = val;

  bool hasProvinceCode() => _provinceCode != null;

  // "province" field.
  String? _province;
  String get province => _province ?? '';
  set province(String? val) => _province = val;

  bool hasProvince() => _province != null;

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

  // "car_year" field.
  String? _carYear;
  String get carYear => _carYear ?? '';
  set carYear(String? val) => _carYear = val;

  bool hasCarYear() => _carYear != null;

  // "car_cc_name" field.
  String? _carCcName;
  String get carCcName => _carCcName ?? '';
  set carCcName(String? val) => _carCcName = val;

  bool hasCarCcName() => _carCcName != null;

  // "car_rate" field.
  String? _carRate;
  String get carRate => _carRate ?? '';
  set carRate(String? val) => _carRate = val;

  bool hasCarRate() => _carRate != null;

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

  // "remark" field.
  String? _remark;
  String get remark => _remark ?? '';
  set remark(String? val) => _remark = val;

  bool hasRemark() => _remark != null;

  // "car_vehicle_code" field.
  String? _carVehicleCode;
  String get carVehicleCode => _carVehicleCode ?? '';
  set carVehicleCode(String? val) => _carVehicleCode = val;

  bool hasCarVehicleCode() => _carVehicleCode != null;

  // "car_vehicle_name" field.
  String? _carVehicleName;
  String get carVehicleName => _carVehicleName ?? '';
  set carVehicleName(String? val) => _carVehicleName = val;

  bool hasCarVehicleName() => _carVehicleName != null;

  static AssignLeadMCDataModelStruct fromMap(Map<String, dynamic> data) =>
      AssignLeadMCDataModelStruct(
        leadId: data['lead_id'] as String?,
        firstName: data['first_name'] as String?,
        lastName: data['last_name'] as String?,
        phoneNumber: data['phone_number'] as String?,
        birthDate: data['birth_date'] as String?,
        age: data['age'] as String?,
        email: data['email'] as String?,
        source: data['source'] as String?,
        channel: data['channel'] as String?,
        subChannel: data['sub_channel'] as String?,
        carRegistration: data['car_registration'] as String?,
        provinceCode: data['province_code'] as String?,
        province: data['province'] as String?,
        carBrand: data['car_brand'] as String?,
        carBrandName: data['car_brand_name'] as String?,
        carModelName: data['car_model_name'] as String?,
        carYear: data['car_year'] as String?,
        carCcName: data['car_cc_name'] as String?,
        carRate: data['car_rate'] as String?,
        currEvaprice: data['curr_evaprice'] as String?,
        totalEvaprice: data['total_evaprice'] as String?,
        latitude: data['latitude'] as String?,
        longitude: data['longitude'] as String?,
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
        branchCode: data['branch_code'] as String?,
        branchName: data['branch_name'] as String?,
        areaCode: data['area_code'] as String?,
        areaName: data['area_name'] as String?,
        remark: data['remark'] as String?,
        carVehicleCode: data['car_vehicle_code'] as String?,
        carVehicleName: data['car_vehicle_name'] as String?,
      );

  static AssignLeadMCDataModelStruct? maybeFromMap(dynamic data) => data is Map
      ? AssignLeadMCDataModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'lead_id': _leadId,
        'first_name': _firstName,
        'last_name': _lastName,
        'phone_number': _phoneNumber,
        'birth_date': _birthDate,
        'age': _age,
        'email': _email,
        'source': _source,
        'channel': _channel,
        'sub_channel': _subChannel,
        'car_registration': _carRegistration,
        'province_code': _provinceCode,
        'province': _province,
        'car_brand': _carBrand,
        'car_brand_name': _carBrandName,
        'car_model_name': _carModelName,
        'car_year': _carYear,
        'car_cc_name': _carCcName,
        'car_rate': _carRate,
        'curr_evaprice': _currEvaprice,
        'total_evaprice': _totalEvaprice,
        'latitude': _latitude,
        'longitude': _longitude,
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
        'branch_code': _branchCode,
        'branch_name': _branchName,
        'area_code': _areaCode,
        'area_name': _areaName,
        'remark': _remark,
        'car_vehicle_code': _carVehicleCode,
        'car_vehicle_name': _carVehicleName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'lead_id': serializeParam(
          _leadId,
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
        'car_registration': serializeParam(
          _carRegistration,
          ParamType.String,
        ),
        'province_code': serializeParam(
          _provinceCode,
          ParamType.String,
        ),
        'province': serializeParam(
          _province,
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
        'car_year': serializeParam(
          _carYear,
          ParamType.String,
        ),
        'car_cc_name': serializeParam(
          _carCcName,
          ParamType.String,
        ),
        'car_rate': serializeParam(
          _carRate,
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
        'latitude': serializeParam(
          _latitude,
          ParamType.String,
        ),
        'longitude': serializeParam(
          _longitude,
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
        'branch_code': serializeParam(
          _branchCode,
          ParamType.String,
        ),
        'branch_name': serializeParam(
          _branchName,
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
        'remark': serializeParam(
          _remark,
          ParamType.String,
        ),
        'car_vehicle_code': serializeParam(
          _carVehicleCode,
          ParamType.String,
        ),
        'car_vehicle_name': serializeParam(
          _carVehicleName,
          ParamType.String,
        ),
      }.withoutNulls;

  static AssignLeadMCDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      AssignLeadMCDataModelStruct(
        leadId: deserializeParam(
          data['lead_id'],
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
        carRegistration: deserializeParam(
          data['car_registration'],
          ParamType.String,
          false,
        ),
        provinceCode: deserializeParam(
          data['province_code'],
          ParamType.String,
          false,
        ),
        province: deserializeParam(
          data['province'],
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
        carYear: deserializeParam(
          data['car_year'],
          ParamType.String,
          false,
        ),
        carCcName: deserializeParam(
          data['car_cc_name'],
          ParamType.String,
          false,
        ),
        carRate: deserializeParam(
          data['car_rate'],
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
        remark: deserializeParam(
          data['remark'],
          ParamType.String,
          false,
        ),
        carVehicleCode: deserializeParam(
          data['car_vehicle_code'],
          ParamType.String,
          false,
        ),
        carVehicleName: deserializeParam(
          data['car_vehicle_name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AssignLeadMCDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AssignLeadMCDataModelStruct &&
        leadId == other.leadId &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        phoneNumber == other.phoneNumber &&
        birthDate == other.birthDate &&
        age == other.age &&
        email == other.email &&
        source == other.source &&
        channel == other.channel &&
        subChannel == other.subChannel &&
        carRegistration == other.carRegistration &&
        provinceCode == other.provinceCode &&
        province == other.province &&
        carBrand == other.carBrand &&
        carBrandName == other.carBrandName &&
        carModelName == other.carModelName &&
        carYear == other.carYear &&
        carCcName == other.carCcName &&
        carRate == other.carRate &&
        currEvaprice == other.currEvaprice &&
        totalEvaprice == other.totalEvaprice &&
        latitude == other.latitude &&
        longitude == other.longitude &&
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
        branchCode == other.branchCode &&
        branchName == other.branchName &&
        areaCode == other.areaCode &&
        areaName == other.areaName &&
        remark == other.remark &&
        carVehicleCode == other.carVehicleCode &&
        carVehicleName == other.carVehicleName;
  }

  @override
  int get hashCode => const ListEquality().hash([
        leadId,
        firstName,
        lastName,
        phoneNumber,
        birthDate,
        age,
        email,
        source,
        channel,
        subChannel,
        carRegistration,
        provinceCode,
        province,
        carBrand,
        carBrandName,
        carModelName,
        carYear,
        carCcName,
        carRate,
        currEvaprice,
        totalEvaprice,
        latitude,
        longitude,
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
        branchCode,
        branchName,
        areaCode,
        areaName,
        remark,
        carVehicleCode,
        carVehicleName
      ]);
}

AssignLeadMCDataModelStruct createAssignLeadMCDataModelStruct({
  String? leadId,
  String? firstName,
  String? lastName,
  String? phoneNumber,
  String? birthDate,
  String? age,
  String? email,
  String? source,
  String? channel,
  String? subChannel,
  String? carRegistration,
  String? provinceCode,
  String? province,
  String? carBrand,
  String? carBrandName,
  String? carModelName,
  String? carYear,
  String? carCcName,
  String? carRate,
  String? currEvaprice,
  String? totalEvaprice,
  String? latitude,
  String? longitude,
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
  String? branchCode,
  String? branchName,
  String? areaCode,
  String? areaName,
  String? remark,
  String? carVehicleCode,
  String? carVehicleName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AssignLeadMCDataModelStruct(
      leadId: leadId,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      birthDate: birthDate,
      age: age,
      email: email,
      source: source,
      channel: channel,
      subChannel: subChannel,
      carRegistration: carRegistration,
      provinceCode: provinceCode,
      province: province,
      carBrand: carBrand,
      carBrandName: carBrandName,
      carModelName: carModelName,
      carYear: carYear,
      carCcName: carCcName,
      carRate: carRate,
      currEvaprice: currEvaprice,
      totalEvaprice: totalEvaprice,
      latitude: latitude,
      longitude: longitude,
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
      branchCode: branchCode,
      branchName: branchName,
      areaCode: areaCode,
      areaName: areaName,
      remark: remark,
      carVehicleCode: carVehicleCode,
      carVehicleName: carVehicleName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AssignLeadMCDataModelStruct? updateAssignLeadMCDataModelStruct(
  AssignLeadMCDataModelStruct? assignLeadMCDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    assignLeadMCDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAssignLeadMCDataModelStructData(
  Map<String, dynamic> firestoreData,
  AssignLeadMCDataModelStruct? assignLeadMCDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (assignLeadMCDataModel == null) {
    return;
  }
  if (assignLeadMCDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      assignLeadMCDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final assignLeadMCDataModelData = getAssignLeadMCDataModelFirestoreData(
      assignLeadMCDataModel, forFieldValue);
  final nestedData =
      assignLeadMCDataModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      assignLeadMCDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAssignLeadMCDataModelFirestoreData(
  AssignLeadMCDataModelStruct? assignLeadMCDataModel, [
  bool forFieldValue = false,
]) {
  if (assignLeadMCDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(assignLeadMCDataModel.toMap());

  // Add any Firestore field values
  assignLeadMCDataModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAssignLeadMCDataModelListFirestoreData(
  List<AssignLeadMCDataModelStruct>? assignLeadMCDataModels,
) =>
    assignLeadMCDataModels
        ?.map((e) => getAssignLeadMCDataModelFirestoreData(e, true))
        .toList() ??
    [];
