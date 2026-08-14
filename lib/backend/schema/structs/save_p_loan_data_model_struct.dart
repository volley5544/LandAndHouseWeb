// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SavePLoanDataModelStruct extends FFFirebaseStruct {
  SavePLoanDataModelStruct({
    String? transNo,
    String? transDate,
    String? mobileNo,
    String? creditAmt,
    String? loanAmt,
    String? gpsAumphurId,
    String? gpsProvinceId,
    String? termPeriod,
    String? totalAmt,
    String? intAmt,
    String? intRate,
    String? regularPeriod,
    String? lastPeriod,
    String? lastPeriodPromo,
    String? payDay,
    String? initialDate,
    String? bankCode,
    String? bankAccNo,
    String? transferAmt,
    String? statusCode,
    String? empId,
    String? branchID,
    String? remark,
    String? requestCredit,
    String? latitude,
    String? longitude,
    String? mktChannel,
    String? registerYear,
    String? customerSource,
    String? marketingConsent,
    String? sensitiveConsent,
    String? refContractNo,
    String? citizenId,
    String? test,
    bool? isNewPLoan,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _transNo = transNo,
        _transDate = transDate,
        _mobileNo = mobileNo,
        _creditAmt = creditAmt,
        _loanAmt = loanAmt,
        _gpsAumphurId = gpsAumphurId,
        _gpsProvinceId = gpsProvinceId,
        _termPeriod = termPeriod,
        _totalAmt = totalAmt,
        _intAmt = intAmt,
        _intRate = intRate,
        _regularPeriod = regularPeriod,
        _lastPeriod = lastPeriod,
        _lastPeriodPromo = lastPeriodPromo,
        _payDay = payDay,
        _initialDate = initialDate,
        _bankCode = bankCode,
        _bankAccNo = bankAccNo,
        _transferAmt = transferAmt,
        _statusCode = statusCode,
        _empId = empId,
        _branchID = branchID,
        _remark = remark,
        _requestCredit = requestCredit,
        _latitude = latitude,
        _longitude = longitude,
        _mktChannel = mktChannel,
        _registerYear = registerYear,
        _customerSource = customerSource,
        _marketingConsent = marketingConsent,
        _sensitiveConsent = sensitiveConsent,
        _refContractNo = refContractNo,
        _citizenId = citizenId,
        _test = test,
        _isNewPLoan = isNewPLoan,
        super(firestoreUtilData);

  // "transNo" field.
  String? _transNo;
  String get transNo => _transNo ?? '';
  set transNo(String? val) => _transNo = val;

  bool hasTransNo() => _transNo != null;

  // "transDate" field.
  String? _transDate;
  String get transDate => _transDate ?? '';
  set transDate(String? val) => _transDate = val;

  bool hasTransDate() => _transDate != null;

  // "mobileNo" field.
  String? _mobileNo;
  String get mobileNo => _mobileNo ?? '';
  set mobileNo(String? val) => _mobileNo = val;

  bool hasMobileNo() => _mobileNo != null;

  // "creditAmt" field.
  String? _creditAmt;
  String get creditAmt => _creditAmt ?? '';
  set creditAmt(String? val) => _creditAmt = val;

  bool hasCreditAmt() => _creditAmt != null;

  // "loanAmt" field.
  String? _loanAmt;
  String get loanAmt => _loanAmt ?? '';
  set loanAmt(String? val) => _loanAmt = val;

  bool hasLoanAmt() => _loanAmt != null;

  // "gpsAumphurId" field.
  String? _gpsAumphurId;
  String get gpsAumphurId => _gpsAumphurId ?? '';
  set gpsAumphurId(String? val) => _gpsAumphurId = val;

  bool hasGpsAumphurId() => _gpsAumphurId != null;

  // "gpsProvinceId" field.
  String? _gpsProvinceId;
  String get gpsProvinceId => _gpsProvinceId ?? '';
  set gpsProvinceId(String? val) => _gpsProvinceId = val;

  bool hasGpsProvinceId() => _gpsProvinceId != null;

  // "termPeriod" field.
  String? _termPeriod;
  String get termPeriod => _termPeriod ?? '';
  set termPeriod(String? val) => _termPeriod = val;

  bool hasTermPeriod() => _termPeriod != null;

  // "totalAmt" field.
  String? _totalAmt;
  String get totalAmt => _totalAmt ?? '';
  set totalAmt(String? val) => _totalAmt = val;

  bool hasTotalAmt() => _totalAmt != null;

  // "intAmt" field.
  String? _intAmt;
  String get intAmt => _intAmt ?? '';
  set intAmt(String? val) => _intAmt = val;

  bool hasIntAmt() => _intAmt != null;

  // "intRate" field.
  String? _intRate;
  String get intRate => _intRate ?? '';
  set intRate(String? val) => _intRate = val;

  bool hasIntRate() => _intRate != null;

  // "regularPeriod" field.
  String? _regularPeriod;
  String get regularPeriod => _regularPeriod ?? '';
  set regularPeriod(String? val) => _regularPeriod = val;

  bool hasRegularPeriod() => _regularPeriod != null;

  // "lastPeriod" field.
  String? _lastPeriod;
  String get lastPeriod => _lastPeriod ?? '';
  set lastPeriod(String? val) => _lastPeriod = val;

  bool hasLastPeriod() => _lastPeriod != null;

  // "lastPeriodPromo" field.
  String? _lastPeriodPromo;
  String get lastPeriodPromo => _lastPeriodPromo ?? '';
  set lastPeriodPromo(String? val) => _lastPeriodPromo = val;

  bool hasLastPeriodPromo() => _lastPeriodPromo != null;

  // "payDay" field.
  String? _payDay;
  String get payDay => _payDay ?? '';
  set payDay(String? val) => _payDay = val;

  bool hasPayDay() => _payDay != null;

  // "initialDate" field.
  String? _initialDate;
  String get initialDate => _initialDate ?? '';
  set initialDate(String? val) => _initialDate = val;

  bool hasInitialDate() => _initialDate != null;

  // "bankCode" field.
  String? _bankCode;
  String get bankCode => _bankCode ?? '';
  set bankCode(String? val) => _bankCode = val;

  bool hasBankCode() => _bankCode != null;

  // "bankAccNo" field.
  String? _bankAccNo;
  String get bankAccNo => _bankAccNo ?? '';
  set bankAccNo(String? val) => _bankAccNo = val;

  bool hasBankAccNo() => _bankAccNo != null;

  // "transferAmt" field.
  String? _transferAmt;
  String get transferAmt => _transferAmt ?? '';
  set transferAmt(String? val) => _transferAmt = val;

  bool hasTransferAmt() => _transferAmt != null;

  // "statusCode" field.
  String? _statusCode;
  String get statusCode => _statusCode ?? '';
  set statusCode(String? val) => _statusCode = val;

  bool hasStatusCode() => _statusCode != null;

  // "empId" field.
  String? _empId;
  String get empId => _empId ?? '';
  set empId(String? val) => _empId = val;

  bool hasEmpId() => _empId != null;

  // "branchID" field.
  String? _branchID;
  String get branchID => _branchID ?? '';
  set branchID(String? val) => _branchID = val;

  bool hasBranchID() => _branchID != null;

  // "remark" field.
  String? _remark;
  String get remark => _remark ?? '';
  set remark(String? val) => _remark = val;

  bool hasRemark() => _remark != null;

  // "requestCredit" field.
  String? _requestCredit;
  String get requestCredit => _requestCredit ?? '';
  set requestCredit(String? val) => _requestCredit = val;

  bool hasRequestCredit() => _requestCredit != null;

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

  // "mktChannel" field.
  String? _mktChannel;
  String get mktChannel => _mktChannel ?? '';
  set mktChannel(String? val) => _mktChannel = val;

  bool hasMktChannel() => _mktChannel != null;

  // "registerYear" field.
  String? _registerYear;
  String get registerYear => _registerYear ?? '';
  set registerYear(String? val) => _registerYear = val;

  bool hasRegisterYear() => _registerYear != null;

  // "customerSource" field.
  String? _customerSource;
  String get customerSource => _customerSource ?? '';
  set customerSource(String? val) => _customerSource = val;

  bool hasCustomerSource() => _customerSource != null;

  // "marketingConsent" field.
  String? _marketingConsent;
  String get marketingConsent => _marketingConsent ?? '';
  set marketingConsent(String? val) => _marketingConsent = val;

  bool hasMarketingConsent() => _marketingConsent != null;

  // "sensitiveConsent" field.
  String? _sensitiveConsent;
  String get sensitiveConsent => _sensitiveConsent ?? '';
  set sensitiveConsent(String? val) => _sensitiveConsent = val;

  bool hasSensitiveConsent() => _sensitiveConsent != null;

  // "refContractNo" field.
  String? _refContractNo;
  String get refContractNo => _refContractNo ?? '';
  set refContractNo(String? val) => _refContractNo = val;

  bool hasRefContractNo() => _refContractNo != null;

  // "citizenId" field.
  String? _citizenId;
  String get citizenId => _citizenId ?? '';
  set citizenId(String? val) => _citizenId = val;

  bool hasCitizenId() => _citizenId != null;

  // "test" field.
  String? _test;
  String get test => _test ?? '';
  set test(String? val) => _test = val;

  bool hasTest() => _test != null;

  // "isNewPLoan" field.
  bool? _isNewPLoan;
  bool get isNewPLoan => _isNewPLoan ?? false;
  set isNewPLoan(bool? val) => _isNewPLoan = val;

  bool hasIsNewPLoan() => _isNewPLoan != null;

  static SavePLoanDataModelStruct fromMap(Map<String, dynamic> data) =>
      SavePLoanDataModelStruct(
        transNo: data['transNo'] as String?,
        transDate: data['transDate'] as String?,
        mobileNo: data['mobileNo'] as String?,
        creditAmt: data['creditAmt'] as String?,
        loanAmt: data['loanAmt'] as String?,
        gpsAumphurId: data['gpsAumphurId'] as String?,
        gpsProvinceId: data['gpsProvinceId'] as String?,
        termPeriod: data['termPeriod'] as String?,
        totalAmt: data['totalAmt'] as String?,
        intAmt: data['intAmt'] as String?,
        intRate: data['intRate'] as String?,
        regularPeriod: data['regularPeriod'] as String?,
        lastPeriod: data['lastPeriod'] as String?,
        lastPeriodPromo: data['lastPeriodPromo'] as String?,
        payDay: data['payDay'] as String?,
        initialDate: data['initialDate'] as String?,
        bankCode: data['bankCode'] as String?,
        bankAccNo: data['bankAccNo'] as String?,
        transferAmt: data['transferAmt'] as String?,
        statusCode: data['statusCode'] as String?,
        empId: data['empId'] as String?,
        branchID: data['branchID'] as String?,
        remark: data['remark'] as String?,
        requestCredit: data['requestCredit'] as String?,
        latitude: data['latitude'] as String?,
        longitude: data['longitude'] as String?,
        mktChannel: data['mktChannel'] as String?,
        registerYear: data['registerYear'] as String?,
        customerSource: data['customerSource'] as String?,
        marketingConsent: data['marketingConsent'] as String?,
        sensitiveConsent: data['sensitiveConsent'] as String?,
        refContractNo: data['refContractNo'] as String?,
        citizenId: data['citizenId'] as String?,
        test: data['test'] as String?,
        isNewPLoan: data['isNewPLoan'] as bool?,
      );

  static SavePLoanDataModelStruct? maybeFromMap(dynamic data) => data is Map
      ? SavePLoanDataModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'transNo': _transNo,
        'transDate': _transDate,
        'mobileNo': _mobileNo,
        'creditAmt': _creditAmt,
        'loanAmt': _loanAmt,
        'gpsAumphurId': _gpsAumphurId,
        'gpsProvinceId': _gpsProvinceId,
        'termPeriod': _termPeriod,
        'totalAmt': _totalAmt,
        'intAmt': _intAmt,
        'intRate': _intRate,
        'regularPeriod': _regularPeriod,
        'lastPeriod': _lastPeriod,
        'lastPeriodPromo': _lastPeriodPromo,
        'payDay': _payDay,
        'initialDate': _initialDate,
        'bankCode': _bankCode,
        'bankAccNo': _bankAccNo,
        'transferAmt': _transferAmt,
        'statusCode': _statusCode,
        'empId': _empId,
        'branchID': _branchID,
        'remark': _remark,
        'requestCredit': _requestCredit,
        'latitude': _latitude,
        'longitude': _longitude,
        'mktChannel': _mktChannel,
        'registerYear': _registerYear,
        'customerSource': _customerSource,
        'marketingConsent': _marketingConsent,
        'sensitiveConsent': _sensitiveConsent,
        'refContractNo': _refContractNo,
        'citizenId': _citizenId,
        'test': _test,
        'isNewPLoan': _isNewPLoan,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'transNo': serializeParam(
          _transNo,
          ParamType.String,
        ),
        'transDate': serializeParam(
          _transDate,
          ParamType.String,
        ),
        'mobileNo': serializeParam(
          _mobileNo,
          ParamType.String,
        ),
        'creditAmt': serializeParam(
          _creditAmt,
          ParamType.String,
        ),
        'loanAmt': serializeParam(
          _loanAmt,
          ParamType.String,
        ),
        'gpsAumphurId': serializeParam(
          _gpsAumphurId,
          ParamType.String,
        ),
        'gpsProvinceId': serializeParam(
          _gpsProvinceId,
          ParamType.String,
        ),
        'termPeriod': serializeParam(
          _termPeriod,
          ParamType.String,
        ),
        'totalAmt': serializeParam(
          _totalAmt,
          ParamType.String,
        ),
        'intAmt': serializeParam(
          _intAmt,
          ParamType.String,
        ),
        'intRate': serializeParam(
          _intRate,
          ParamType.String,
        ),
        'regularPeriod': serializeParam(
          _regularPeriod,
          ParamType.String,
        ),
        'lastPeriod': serializeParam(
          _lastPeriod,
          ParamType.String,
        ),
        'lastPeriodPromo': serializeParam(
          _lastPeriodPromo,
          ParamType.String,
        ),
        'payDay': serializeParam(
          _payDay,
          ParamType.String,
        ),
        'initialDate': serializeParam(
          _initialDate,
          ParamType.String,
        ),
        'bankCode': serializeParam(
          _bankCode,
          ParamType.String,
        ),
        'bankAccNo': serializeParam(
          _bankAccNo,
          ParamType.String,
        ),
        'transferAmt': serializeParam(
          _transferAmt,
          ParamType.String,
        ),
        'statusCode': serializeParam(
          _statusCode,
          ParamType.String,
        ),
        'empId': serializeParam(
          _empId,
          ParamType.String,
        ),
        'branchID': serializeParam(
          _branchID,
          ParamType.String,
        ),
        'remark': serializeParam(
          _remark,
          ParamType.String,
        ),
        'requestCredit': serializeParam(
          _requestCredit,
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
        'mktChannel': serializeParam(
          _mktChannel,
          ParamType.String,
        ),
        'registerYear': serializeParam(
          _registerYear,
          ParamType.String,
        ),
        'customerSource': serializeParam(
          _customerSource,
          ParamType.String,
        ),
        'marketingConsent': serializeParam(
          _marketingConsent,
          ParamType.String,
        ),
        'sensitiveConsent': serializeParam(
          _sensitiveConsent,
          ParamType.String,
        ),
        'refContractNo': serializeParam(
          _refContractNo,
          ParamType.String,
        ),
        'citizenId': serializeParam(
          _citizenId,
          ParamType.String,
        ),
        'test': serializeParam(
          _test,
          ParamType.String,
        ),
        'isNewPLoan': serializeParam(
          _isNewPLoan,
          ParamType.bool,
        ),
      }.withoutNulls;

  static SavePLoanDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SavePLoanDataModelStruct(
        transNo: deserializeParam(
          data['transNo'],
          ParamType.String,
          false,
        ),
        transDate: deserializeParam(
          data['transDate'],
          ParamType.String,
          false,
        ),
        mobileNo: deserializeParam(
          data['mobileNo'],
          ParamType.String,
          false,
        ),
        creditAmt: deserializeParam(
          data['creditAmt'],
          ParamType.String,
          false,
        ),
        loanAmt: deserializeParam(
          data['loanAmt'],
          ParamType.String,
          false,
        ),
        gpsAumphurId: deserializeParam(
          data['gpsAumphurId'],
          ParamType.String,
          false,
        ),
        gpsProvinceId: deserializeParam(
          data['gpsProvinceId'],
          ParamType.String,
          false,
        ),
        termPeriod: deserializeParam(
          data['termPeriod'],
          ParamType.String,
          false,
        ),
        totalAmt: deserializeParam(
          data['totalAmt'],
          ParamType.String,
          false,
        ),
        intAmt: deserializeParam(
          data['intAmt'],
          ParamType.String,
          false,
        ),
        intRate: deserializeParam(
          data['intRate'],
          ParamType.String,
          false,
        ),
        regularPeriod: deserializeParam(
          data['regularPeriod'],
          ParamType.String,
          false,
        ),
        lastPeriod: deserializeParam(
          data['lastPeriod'],
          ParamType.String,
          false,
        ),
        lastPeriodPromo: deserializeParam(
          data['lastPeriodPromo'],
          ParamType.String,
          false,
        ),
        payDay: deserializeParam(
          data['payDay'],
          ParamType.String,
          false,
        ),
        initialDate: deserializeParam(
          data['initialDate'],
          ParamType.String,
          false,
        ),
        bankCode: deserializeParam(
          data['bankCode'],
          ParamType.String,
          false,
        ),
        bankAccNo: deserializeParam(
          data['bankAccNo'],
          ParamType.String,
          false,
        ),
        transferAmt: deserializeParam(
          data['transferAmt'],
          ParamType.String,
          false,
        ),
        statusCode: deserializeParam(
          data['statusCode'],
          ParamType.String,
          false,
        ),
        empId: deserializeParam(
          data['empId'],
          ParamType.String,
          false,
        ),
        branchID: deserializeParam(
          data['branchID'],
          ParamType.String,
          false,
        ),
        remark: deserializeParam(
          data['remark'],
          ParamType.String,
          false,
        ),
        requestCredit: deserializeParam(
          data['requestCredit'],
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
        mktChannel: deserializeParam(
          data['mktChannel'],
          ParamType.String,
          false,
        ),
        registerYear: deserializeParam(
          data['registerYear'],
          ParamType.String,
          false,
        ),
        customerSource: deserializeParam(
          data['customerSource'],
          ParamType.String,
          false,
        ),
        marketingConsent: deserializeParam(
          data['marketingConsent'],
          ParamType.String,
          false,
        ),
        sensitiveConsent: deserializeParam(
          data['sensitiveConsent'],
          ParamType.String,
          false,
        ),
        refContractNo: deserializeParam(
          data['refContractNo'],
          ParamType.String,
          false,
        ),
        citizenId: deserializeParam(
          data['citizenId'],
          ParamType.String,
          false,
        ),
        test: deserializeParam(
          data['test'],
          ParamType.String,
          false,
        ),
        isNewPLoan: deserializeParam(
          data['isNewPLoan'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'SavePLoanDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SavePLoanDataModelStruct &&
        transNo == other.transNo &&
        transDate == other.transDate &&
        mobileNo == other.mobileNo &&
        creditAmt == other.creditAmt &&
        loanAmt == other.loanAmt &&
        gpsAumphurId == other.gpsAumphurId &&
        gpsProvinceId == other.gpsProvinceId &&
        termPeriod == other.termPeriod &&
        totalAmt == other.totalAmt &&
        intAmt == other.intAmt &&
        intRate == other.intRate &&
        regularPeriod == other.regularPeriod &&
        lastPeriod == other.lastPeriod &&
        lastPeriodPromo == other.lastPeriodPromo &&
        payDay == other.payDay &&
        initialDate == other.initialDate &&
        bankCode == other.bankCode &&
        bankAccNo == other.bankAccNo &&
        transferAmt == other.transferAmt &&
        statusCode == other.statusCode &&
        empId == other.empId &&
        branchID == other.branchID &&
        remark == other.remark &&
        requestCredit == other.requestCredit &&
        latitude == other.latitude &&
        longitude == other.longitude &&
        mktChannel == other.mktChannel &&
        registerYear == other.registerYear &&
        customerSource == other.customerSource &&
        marketingConsent == other.marketingConsent &&
        sensitiveConsent == other.sensitiveConsent &&
        refContractNo == other.refContractNo &&
        citizenId == other.citizenId &&
        test == other.test &&
        isNewPLoan == other.isNewPLoan;
  }

  @override
  int get hashCode => const ListEquality().hash([
        transNo,
        transDate,
        mobileNo,
        creditAmt,
        loanAmt,
        gpsAumphurId,
        gpsProvinceId,
        termPeriod,
        totalAmt,
        intAmt,
        intRate,
        regularPeriod,
        lastPeriod,
        lastPeriodPromo,
        payDay,
        initialDate,
        bankCode,
        bankAccNo,
        transferAmt,
        statusCode,
        empId,
        branchID,
        remark,
        requestCredit,
        latitude,
        longitude,
        mktChannel,
        registerYear,
        customerSource,
        marketingConsent,
        sensitiveConsent,
        refContractNo,
        citizenId,
        test,
        isNewPLoan
      ]);
}

SavePLoanDataModelStruct createSavePLoanDataModelStruct({
  String? transNo,
  String? transDate,
  String? mobileNo,
  String? creditAmt,
  String? loanAmt,
  String? gpsAumphurId,
  String? gpsProvinceId,
  String? termPeriod,
  String? totalAmt,
  String? intAmt,
  String? intRate,
  String? regularPeriod,
  String? lastPeriod,
  String? lastPeriodPromo,
  String? payDay,
  String? initialDate,
  String? bankCode,
  String? bankAccNo,
  String? transferAmt,
  String? statusCode,
  String? empId,
  String? branchID,
  String? remark,
  String? requestCredit,
  String? latitude,
  String? longitude,
  String? mktChannel,
  String? registerYear,
  String? customerSource,
  String? marketingConsent,
  String? sensitiveConsent,
  String? refContractNo,
  String? citizenId,
  String? test,
  bool? isNewPLoan,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SavePLoanDataModelStruct(
      transNo: transNo,
      transDate: transDate,
      mobileNo: mobileNo,
      creditAmt: creditAmt,
      loanAmt: loanAmt,
      gpsAumphurId: gpsAumphurId,
      gpsProvinceId: gpsProvinceId,
      termPeriod: termPeriod,
      totalAmt: totalAmt,
      intAmt: intAmt,
      intRate: intRate,
      regularPeriod: regularPeriod,
      lastPeriod: lastPeriod,
      lastPeriodPromo: lastPeriodPromo,
      payDay: payDay,
      initialDate: initialDate,
      bankCode: bankCode,
      bankAccNo: bankAccNo,
      transferAmt: transferAmt,
      statusCode: statusCode,
      empId: empId,
      branchID: branchID,
      remark: remark,
      requestCredit: requestCredit,
      latitude: latitude,
      longitude: longitude,
      mktChannel: mktChannel,
      registerYear: registerYear,
      customerSource: customerSource,
      marketingConsent: marketingConsent,
      sensitiveConsent: sensitiveConsent,
      refContractNo: refContractNo,
      citizenId: citizenId,
      test: test,
      isNewPLoan: isNewPLoan,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SavePLoanDataModelStruct? updateSavePLoanDataModelStruct(
  SavePLoanDataModelStruct? savePLoanDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    savePLoanDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSavePLoanDataModelStructData(
  Map<String, dynamic> firestoreData,
  SavePLoanDataModelStruct? savePLoanDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (savePLoanDataModel == null) {
    return;
  }
  if (savePLoanDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && savePLoanDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final savePLoanDataModelData =
      getSavePLoanDataModelFirestoreData(savePLoanDataModel, forFieldValue);
  final nestedData =
      savePLoanDataModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      savePLoanDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSavePLoanDataModelFirestoreData(
  SavePLoanDataModelStruct? savePLoanDataModel, [
  bool forFieldValue = false,
]) {
  if (savePLoanDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(savePLoanDataModel.toMap());

  // Add any Firestore field values
  mapToFirestore(savePLoanDataModel.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSavePLoanDataModelListFirestoreData(
  List<SavePLoanDataModelStruct>? savePLoanDataModels,
) =>
    savePLoanDataModels
        ?.map((e) => getSavePLoanDataModelFirestoreData(e, true))
        .toList() ??
    [];
