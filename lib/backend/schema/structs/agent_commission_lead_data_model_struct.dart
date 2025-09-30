// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AgentCommissionLeadDataModelStruct extends FFFirebaseStruct {
  AgentCommissionLeadDataModelStruct({
    int? id,
    String? agentId,
    String? agentCode,
    String? product,
    String? loanTypeId,
    String? loanTypeCode,
    String? loanTypeName,
    String? registerId,
    String? firstName,
    String? lastName,
    String? mobilePhoneNumber,
    String? paymentMethod,
    String? deductionPercent,
    String? paymentChannel,
    String? accountNumber,
    String? promptpayNumber,
    String? docNo,
    String? db,
    String? cuscod,
    String? contNo,
    String? arnow,
    String? sdate,
    String? contnoType,
    String? constat,
    String? targetstat,
    String? csname,
    String? name1,
    String? name2,
    String? mobile,
    String? lpayd,
    String? expDay,
    String? expAmt,
    String? tNopay,
    String? lpaytot,
    String? comPayAmt,
    String? comAllPeriod,
    String? comDeductAmt,
    String? comPaidPeriod,
    String? comWaitingPayAmt,
    String? comWaitingApproveAmt,
    String? comNextPayAmt,
    String? comReceivedAmt,
    String? comStatus,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _agentId = agentId,
        _agentCode = agentCode,
        _product = product,
        _loanTypeId = loanTypeId,
        _loanTypeCode = loanTypeCode,
        _loanTypeName = loanTypeName,
        _registerId = registerId,
        _firstName = firstName,
        _lastName = lastName,
        _mobilePhoneNumber = mobilePhoneNumber,
        _paymentMethod = paymentMethod,
        _deductionPercent = deductionPercent,
        _paymentChannel = paymentChannel,
        _accountNumber = accountNumber,
        _promptpayNumber = promptpayNumber,
        _docNo = docNo,
        _db = db,
        _cuscod = cuscod,
        _contNo = contNo,
        _arnow = arnow,
        _sdate = sdate,
        _contnoType = contnoType,
        _constat = constat,
        _targetstat = targetstat,
        _csname = csname,
        _name1 = name1,
        _name2 = name2,
        _mobile = mobile,
        _lpayd = lpayd,
        _expDay = expDay,
        _expAmt = expAmt,
        _tNopay = tNopay,
        _lpaytot = lpaytot,
        _comPayAmt = comPayAmt,
        _comAllPeriod = comAllPeriod,
        _comDeductAmt = comDeductAmt,
        _comPaidPeriod = comPaidPeriod,
        _comWaitingPayAmt = comWaitingPayAmt,
        _comWaitingApproveAmt = comWaitingApproveAmt,
        _comNextPayAmt = comNextPayAmt,
        _comReceivedAmt = comReceivedAmt,
        _comStatus = comStatus,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

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

  // "product" field.
  String? _product;
  String get product => _product ?? '';
  set product(String? val) => _product = val;

  bool hasProduct() => _product != null;

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

  // "register_id" field.
  String? _registerId;
  String get registerId => _registerId ?? '';
  set registerId(String? val) => _registerId = val;

  bool hasRegisterId() => _registerId != null;

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

  // "mobile_phone_number" field.
  String? _mobilePhoneNumber;
  String get mobilePhoneNumber => _mobilePhoneNumber ?? '';
  set mobilePhoneNumber(String? val) => _mobilePhoneNumber = val;

  bool hasMobilePhoneNumber() => _mobilePhoneNumber != null;

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

  // "doc_no" field.
  String? _docNo;
  String get docNo => _docNo ?? '';
  set docNo(String? val) => _docNo = val;

  bool hasDocNo() => _docNo != null;

  // "db" field.
  String? _db;
  String get db => _db ?? '';
  set db(String? val) => _db = val;

  bool hasDb() => _db != null;

  // "cuscod" field.
  String? _cuscod;
  String get cuscod => _cuscod ?? '';
  set cuscod(String? val) => _cuscod = val;

  bool hasCuscod() => _cuscod != null;

  // "cont_no" field.
  String? _contNo;
  String get contNo => _contNo ?? '';
  set contNo(String? val) => _contNo = val;

  bool hasContNo() => _contNo != null;

  // "arnow" field.
  String? _arnow;
  String get arnow => _arnow ?? '';
  set arnow(String? val) => _arnow = val;

  bool hasArnow() => _arnow != null;

  // "sdate" field.
  String? _sdate;
  String get sdate => _sdate ?? '';
  set sdate(String? val) => _sdate = val;

  bool hasSdate() => _sdate != null;

  // "contno_type" field.
  String? _contnoType;
  String get contnoType => _contnoType ?? '';
  set contnoType(String? val) => _contnoType = val;

  bool hasContnoType() => _contnoType != null;

  // "constat" field.
  String? _constat;
  String get constat => _constat ?? '';
  set constat(String? val) => _constat = val;

  bool hasConstat() => _constat != null;

  // "targetstat" field.
  String? _targetstat;
  String get targetstat => _targetstat ?? '';
  set targetstat(String? val) => _targetstat = val;

  bool hasTargetstat() => _targetstat != null;

  // "csname" field.
  String? _csname;
  String get csname => _csname ?? '';
  set csname(String? val) => _csname = val;

  bool hasCsname() => _csname != null;

  // "name1" field.
  String? _name1;
  String get name1 => _name1 ?? '';
  set name1(String? val) => _name1 = val;

  bool hasName1() => _name1 != null;

  // "name2" field.
  String? _name2;
  String get name2 => _name2 ?? '';
  set name2(String? val) => _name2 = val;

  bool hasName2() => _name2 != null;

  // "mobile" field.
  String? _mobile;
  String get mobile => _mobile ?? '';
  set mobile(String? val) => _mobile = val;

  bool hasMobile() => _mobile != null;

  // "lpayd" field.
  String? _lpayd;
  String get lpayd => _lpayd ?? '';
  set lpayd(String? val) => _lpayd = val;

  bool hasLpayd() => _lpayd != null;

  // "exp_day" field.
  String? _expDay;
  String get expDay => _expDay ?? '';
  set expDay(String? val) => _expDay = val;

  bool hasExpDay() => _expDay != null;

  // "exp_amt" field.
  String? _expAmt;
  String get expAmt => _expAmt ?? '';
  set expAmt(String? val) => _expAmt = val;

  bool hasExpAmt() => _expAmt != null;

  // "t_nopay" field.
  String? _tNopay;
  String get tNopay => _tNopay ?? '';
  set tNopay(String? val) => _tNopay = val;

  bool hasTNopay() => _tNopay != null;

  // "lpaytot" field.
  String? _lpaytot;
  String get lpaytot => _lpaytot ?? '';
  set lpaytot(String? val) => _lpaytot = val;

  bool hasLpaytot() => _lpaytot != null;

  // "com_pay_amt" field.
  String? _comPayAmt;
  String get comPayAmt => _comPayAmt ?? '';
  set comPayAmt(String? val) => _comPayAmt = val;

  bool hasComPayAmt() => _comPayAmt != null;

  // "com_all_period" field.
  String? _comAllPeriod;
  String get comAllPeriod => _comAllPeriod ?? '';
  set comAllPeriod(String? val) => _comAllPeriod = val;

  bool hasComAllPeriod() => _comAllPeriod != null;

  // "com_deduct_amt" field.
  String? _comDeductAmt;
  String get comDeductAmt => _comDeductAmt ?? '';
  set comDeductAmt(String? val) => _comDeductAmt = val;

  bool hasComDeductAmt() => _comDeductAmt != null;

  // "com_paid_period" field.
  String? _comPaidPeriod;
  String get comPaidPeriod => _comPaidPeriod ?? '';
  set comPaidPeriod(String? val) => _comPaidPeriod = val;

  bool hasComPaidPeriod() => _comPaidPeriod != null;

  // "com_waiting_pay_amt" field.
  String? _comWaitingPayAmt;
  String get comWaitingPayAmt => _comWaitingPayAmt ?? '';
  set comWaitingPayAmt(String? val) => _comWaitingPayAmt = val;

  bool hasComWaitingPayAmt() => _comWaitingPayAmt != null;

  // "com_waiting_approve_amt" field.
  String? _comWaitingApproveAmt;
  String get comWaitingApproveAmt => _comWaitingApproveAmt ?? '';
  set comWaitingApproveAmt(String? val) => _comWaitingApproveAmt = val;

  bool hasComWaitingApproveAmt() => _comWaitingApproveAmt != null;

  // "com_next_pay_amt" field.
  String? _comNextPayAmt;
  String get comNextPayAmt => _comNextPayAmt ?? '';
  set comNextPayAmt(String? val) => _comNextPayAmt = val;

  bool hasComNextPayAmt() => _comNextPayAmt != null;

  // "com_received_amt" field.
  String? _comReceivedAmt;
  String get comReceivedAmt => _comReceivedAmt ?? '';
  set comReceivedAmt(String? val) => _comReceivedAmt = val;

  bool hasComReceivedAmt() => _comReceivedAmt != null;

  // "com_status" field.
  String? _comStatus;
  String get comStatus => _comStatus ?? '';
  set comStatus(String? val) => _comStatus = val;

  bool hasComStatus() => _comStatus != null;

  static AgentCommissionLeadDataModelStruct fromMap(
          Map<String, dynamic> data) =>
      AgentCommissionLeadDataModelStruct(
        id: castToType<int>(data['id']),
        agentId: data['agent_id'] as String?,
        agentCode: data['agent_code'] as String?,
        product: data['product'] as String?,
        loanTypeId: data['loan_type_id'] as String?,
        loanTypeCode: data['loan_type_code'] as String?,
        loanTypeName: data['loan_type_name'] as String?,
        registerId: data['register_id'] as String?,
        firstName: data['first_name'] as String?,
        lastName: data['last_name'] as String?,
        mobilePhoneNumber: data['mobile_phone_number'] as String?,
        paymentMethod: data['payment_method'] as String?,
        deductionPercent: data['deduction_percent'] as String?,
        paymentChannel: data['payment_channel'] as String?,
        accountNumber: data['account_number'] as String?,
        promptpayNumber: data['promptpay_number'] as String?,
        docNo: data['doc_no'] as String?,
        db: data['db'] as String?,
        cuscod: data['cuscod'] as String?,
        contNo: data['cont_no'] as String?,
        arnow: data['arnow'] as String?,
        sdate: data['sdate'] as String?,
        contnoType: data['contno_type'] as String?,
        constat: data['constat'] as String?,
        targetstat: data['targetstat'] as String?,
        csname: data['csname'] as String?,
        name1: data['name1'] as String?,
        name2: data['name2'] as String?,
        mobile: data['mobile'] as String?,
        lpayd: data['lpayd'] as String?,
        expDay: data['exp_day'] as String?,
        expAmt: data['exp_amt'] as String?,
        tNopay: data['t_nopay'] as String?,
        lpaytot: data['lpaytot'] as String?,
        comPayAmt: data['com_pay_amt'] as String?,
        comAllPeriod: data['com_all_period'] as String?,
        comDeductAmt: data['com_deduct_amt'] as String?,
        comPaidPeriod: data['com_paid_period'] as String?,
        comWaitingPayAmt: data['com_waiting_pay_amt'] as String?,
        comWaitingApproveAmt: data['com_waiting_approve_amt'] as String?,
        comNextPayAmt: data['com_next_pay_amt'] as String?,
        comReceivedAmt: data['com_received_amt'] as String?,
        comStatus: data['com_status'] as String?,
      );

  static AgentCommissionLeadDataModelStruct? maybeFromMap(dynamic data) => data
          is Map
      ? AgentCommissionLeadDataModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'agent_id': _agentId,
        'agent_code': _agentCode,
        'product': _product,
        'loan_type_id': _loanTypeId,
        'loan_type_code': _loanTypeCode,
        'loan_type_name': _loanTypeName,
        'register_id': _registerId,
        'first_name': _firstName,
        'last_name': _lastName,
        'mobile_phone_number': _mobilePhoneNumber,
        'payment_method': _paymentMethod,
        'deduction_percent': _deductionPercent,
        'payment_channel': _paymentChannel,
        'account_number': _accountNumber,
        'promptpay_number': _promptpayNumber,
        'doc_no': _docNo,
        'db': _db,
        'cuscod': _cuscod,
        'cont_no': _contNo,
        'arnow': _arnow,
        'sdate': _sdate,
        'contno_type': _contnoType,
        'constat': _constat,
        'targetstat': _targetstat,
        'csname': _csname,
        'name1': _name1,
        'name2': _name2,
        'mobile': _mobile,
        'lpayd': _lpayd,
        'exp_day': _expDay,
        'exp_amt': _expAmt,
        't_nopay': _tNopay,
        'lpaytot': _lpaytot,
        'com_pay_amt': _comPayAmt,
        'com_all_period': _comAllPeriod,
        'com_deduct_amt': _comDeductAmt,
        'com_paid_period': _comPaidPeriod,
        'com_waiting_pay_amt': _comWaitingPayAmt,
        'com_waiting_approve_amt': _comWaitingApproveAmt,
        'com_next_pay_amt': _comNextPayAmt,
        'com_received_amt': _comReceivedAmt,
        'com_status': _comStatus,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'agent_id': serializeParam(
          _agentId,
          ParamType.String,
        ),
        'agent_code': serializeParam(
          _agentCode,
          ParamType.String,
        ),
        'product': serializeParam(
          _product,
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
        'register_id': serializeParam(
          _registerId,
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
        'mobile_phone_number': serializeParam(
          _mobilePhoneNumber,
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
        'doc_no': serializeParam(
          _docNo,
          ParamType.String,
        ),
        'db': serializeParam(
          _db,
          ParamType.String,
        ),
        'cuscod': serializeParam(
          _cuscod,
          ParamType.String,
        ),
        'cont_no': serializeParam(
          _contNo,
          ParamType.String,
        ),
        'arnow': serializeParam(
          _arnow,
          ParamType.String,
        ),
        'sdate': serializeParam(
          _sdate,
          ParamType.String,
        ),
        'contno_type': serializeParam(
          _contnoType,
          ParamType.String,
        ),
        'constat': serializeParam(
          _constat,
          ParamType.String,
        ),
        'targetstat': serializeParam(
          _targetstat,
          ParamType.String,
        ),
        'csname': serializeParam(
          _csname,
          ParamType.String,
        ),
        'name1': serializeParam(
          _name1,
          ParamType.String,
        ),
        'name2': serializeParam(
          _name2,
          ParamType.String,
        ),
        'mobile': serializeParam(
          _mobile,
          ParamType.String,
        ),
        'lpayd': serializeParam(
          _lpayd,
          ParamType.String,
        ),
        'exp_day': serializeParam(
          _expDay,
          ParamType.String,
        ),
        'exp_amt': serializeParam(
          _expAmt,
          ParamType.String,
        ),
        't_nopay': serializeParam(
          _tNopay,
          ParamType.String,
        ),
        'lpaytot': serializeParam(
          _lpaytot,
          ParamType.String,
        ),
        'com_pay_amt': serializeParam(
          _comPayAmt,
          ParamType.String,
        ),
        'com_all_period': serializeParam(
          _comAllPeriod,
          ParamType.String,
        ),
        'com_deduct_amt': serializeParam(
          _comDeductAmt,
          ParamType.String,
        ),
        'com_paid_period': serializeParam(
          _comPaidPeriod,
          ParamType.String,
        ),
        'com_waiting_pay_amt': serializeParam(
          _comWaitingPayAmt,
          ParamType.String,
        ),
        'com_waiting_approve_amt': serializeParam(
          _comWaitingApproveAmt,
          ParamType.String,
        ),
        'com_next_pay_amt': serializeParam(
          _comNextPayAmt,
          ParamType.String,
        ),
        'com_received_amt': serializeParam(
          _comReceivedAmt,
          ParamType.String,
        ),
        'com_status': serializeParam(
          _comStatus,
          ParamType.String,
        ),
      }.withoutNulls;

  static AgentCommissionLeadDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      AgentCommissionLeadDataModelStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
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
        product: deserializeParam(
          data['product'],
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
        registerId: deserializeParam(
          data['register_id'],
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
        mobilePhoneNumber: deserializeParam(
          data['mobile_phone_number'],
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
        docNo: deserializeParam(
          data['doc_no'],
          ParamType.String,
          false,
        ),
        db: deserializeParam(
          data['db'],
          ParamType.String,
          false,
        ),
        cuscod: deserializeParam(
          data['cuscod'],
          ParamType.String,
          false,
        ),
        contNo: deserializeParam(
          data['cont_no'],
          ParamType.String,
          false,
        ),
        arnow: deserializeParam(
          data['arnow'],
          ParamType.String,
          false,
        ),
        sdate: deserializeParam(
          data['sdate'],
          ParamType.String,
          false,
        ),
        contnoType: deserializeParam(
          data['contno_type'],
          ParamType.String,
          false,
        ),
        constat: deserializeParam(
          data['constat'],
          ParamType.String,
          false,
        ),
        targetstat: deserializeParam(
          data['targetstat'],
          ParamType.String,
          false,
        ),
        csname: deserializeParam(
          data['csname'],
          ParamType.String,
          false,
        ),
        name1: deserializeParam(
          data['name1'],
          ParamType.String,
          false,
        ),
        name2: deserializeParam(
          data['name2'],
          ParamType.String,
          false,
        ),
        mobile: deserializeParam(
          data['mobile'],
          ParamType.String,
          false,
        ),
        lpayd: deserializeParam(
          data['lpayd'],
          ParamType.String,
          false,
        ),
        expDay: deserializeParam(
          data['exp_day'],
          ParamType.String,
          false,
        ),
        expAmt: deserializeParam(
          data['exp_amt'],
          ParamType.String,
          false,
        ),
        tNopay: deserializeParam(
          data['t_nopay'],
          ParamType.String,
          false,
        ),
        lpaytot: deserializeParam(
          data['lpaytot'],
          ParamType.String,
          false,
        ),
        comPayAmt: deserializeParam(
          data['com_pay_amt'],
          ParamType.String,
          false,
        ),
        comAllPeriod: deserializeParam(
          data['com_all_period'],
          ParamType.String,
          false,
        ),
        comDeductAmt: deserializeParam(
          data['com_deduct_amt'],
          ParamType.String,
          false,
        ),
        comPaidPeriod: deserializeParam(
          data['com_paid_period'],
          ParamType.String,
          false,
        ),
        comWaitingPayAmt: deserializeParam(
          data['com_waiting_pay_amt'],
          ParamType.String,
          false,
        ),
        comWaitingApproveAmt: deserializeParam(
          data['com_waiting_approve_amt'],
          ParamType.String,
          false,
        ),
        comNextPayAmt: deserializeParam(
          data['com_next_pay_amt'],
          ParamType.String,
          false,
        ),
        comReceivedAmt: deserializeParam(
          data['com_received_amt'],
          ParamType.String,
          false,
        ),
        comStatus: deserializeParam(
          data['com_status'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AgentCommissionLeadDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AgentCommissionLeadDataModelStruct &&
        id == other.id &&
        agentId == other.agentId &&
        agentCode == other.agentCode &&
        product == other.product &&
        loanTypeId == other.loanTypeId &&
        loanTypeCode == other.loanTypeCode &&
        loanTypeName == other.loanTypeName &&
        registerId == other.registerId &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        mobilePhoneNumber == other.mobilePhoneNumber &&
        paymentMethod == other.paymentMethod &&
        deductionPercent == other.deductionPercent &&
        paymentChannel == other.paymentChannel &&
        accountNumber == other.accountNumber &&
        promptpayNumber == other.promptpayNumber &&
        docNo == other.docNo &&
        db == other.db &&
        cuscod == other.cuscod &&
        contNo == other.contNo &&
        arnow == other.arnow &&
        sdate == other.sdate &&
        contnoType == other.contnoType &&
        constat == other.constat &&
        targetstat == other.targetstat &&
        csname == other.csname &&
        name1 == other.name1 &&
        name2 == other.name2 &&
        mobile == other.mobile &&
        lpayd == other.lpayd &&
        expDay == other.expDay &&
        expAmt == other.expAmt &&
        tNopay == other.tNopay &&
        lpaytot == other.lpaytot &&
        comPayAmt == other.comPayAmt &&
        comAllPeriod == other.comAllPeriod &&
        comDeductAmt == other.comDeductAmt &&
        comPaidPeriod == other.comPaidPeriod &&
        comWaitingPayAmt == other.comWaitingPayAmt &&
        comWaitingApproveAmt == other.comWaitingApproveAmt &&
        comNextPayAmt == other.comNextPayAmt &&
        comReceivedAmt == other.comReceivedAmt &&
        comStatus == other.comStatus;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        agentId,
        agentCode,
        product,
        loanTypeId,
        loanTypeCode,
        loanTypeName,
        registerId,
        firstName,
        lastName,
        mobilePhoneNumber,
        paymentMethod,
        deductionPercent,
        paymentChannel,
        accountNumber,
        promptpayNumber,
        docNo,
        db,
        cuscod,
        contNo,
        arnow,
        sdate,
        contnoType,
        constat,
        targetstat,
        csname,
        name1,
        name2,
        mobile,
        lpayd,
        expDay,
        expAmt,
        tNopay,
        lpaytot,
        comPayAmt,
        comAllPeriod,
        comDeductAmt,
        comPaidPeriod,
        comWaitingPayAmt,
        comWaitingApproveAmt,
        comNextPayAmt,
        comReceivedAmt,
        comStatus
      ]);
}

AgentCommissionLeadDataModelStruct createAgentCommissionLeadDataModelStruct({
  int? id,
  String? agentId,
  String? agentCode,
  String? product,
  String? loanTypeId,
  String? loanTypeCode,
  String? loanTypeName,
  String? registerId,
  String? firstName,
  String? lastName,
  String? mobilePhoneNumber,
  String? paymentMethod,
  String? deductionPercent,
  String? paymentChannel,
  String? accountNumber,
  String? promptpayNumber,
  String? docNo,
  String? db,
  String? cuscod,
  String? contNo,
  String? arnow,
  String? sdate,
  String? contnoType,
  String? constat,
  String? targetstat,
  String? csname,
  String? name1,
  String? name2,
  String? mobile,
  String? lpayd,
  String? expDay,
  String? expAmt,
  String? tNopay,
  String? lpaytot,
  String? comPayAmt,
  String? comAllPeriod,
  String? comDeductAmt,
  String? comPaidPeriod,
  String? comWaitingPayAmt,
  String? comWaitingApproveAmt,
  String? comNextPayAmt,
  String? comReceivedAmt,
  String? comStatus,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AgentCommissionLeadDataModelStruct(
      id: id,
      agentId: agentId,
      agentCode: agentCode,
      product: product,
      loanTypeId: loanTypeId,
      loanTypeCode: loanTypeCode,
      loanTypeName: loanTypeName,
      registerId: registerId,
      firstName: firstName,
      lastName: lastName,
      mobilePhoneNumber: mobilePhoneNumber,
      paymentMethod: paymentMethod,
      deductionPercent: deductionPercent,
      paymentChannel: paymentChannel,
      accountNumber: accountNumber,
      promptpayNumber: promptpayNumber,
      docNo: docNo,
      db: db,
      cuscod: cuscod,
      contNo: contNo,
      arnow: arnow,
      sdate: sdate,
      contnoType: contnoType,
      constat: constat,
      targetstat: targetstat,
      csname: csname,
      name1: name1,
      name2: name2,
      mobile: mobile,
      lpayd: lpayd,
      expDay: expDay,
      expAmt: expAmt,
      tNopay: tNopay,
      lpaytot: lpaytot,
      comPayAmt: comPayAmt,
      comAllPeriod: comAllPeriod,
      comDeductAmt: comDeductAmt,
      comPaidPeriod: comPaidPeriod,
      comWaitingPayAmt: comWaitingPayAmt,
      comWaitingApproveAmt: comWaitingApproveAmt,
      comNextPayAmt: comNextPayAmt,
      comReceivedAmt: comReceivedAmt,
      comStatus: comStatus,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AgentCommissionLeadDataModelStruct? updateAgentCommissionLeadDataModelStruct(
  AgentCommissionLeadDataModelStruct? agentCommissionLeadDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    agentCommissionLeadDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAgentCommissionLeadDataModelStructData(
  Map<String, dynamic> firestoreData,
  AgentCommissionLeadDataModelStruct? agentCommissionLeadDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (agentCommissionLeadDataModel == null) {
    return;
  }
  if (agentCommissionLeadDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      agentCommissionLeadDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final agentCommissionLeadDataModelData =
      getAgentCommissionLeadDataModelFirestoreData(
          agentCommissionLeadDataModel, forFieldValue);
  final nestedData = agentCommissionLeadDataModelData
      .map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      agentCommissionLeadDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAgentCommissionLeadDataModelFirestoreData(
  AgentCommissionLeadDataModelStruct? agentCommissionLeadDataModel, [
  bool forFieldValue = false,
]) {
  if (agentCommissionLeadDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(agentCommissionLeadDataModel.toMap());

  // Add any Firestore field values
  agentCommissionLeadDataModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAgentCommissionLeadDataModelListFirestoreData(
  List<AgentCommissionLeadDataModelStruct>? agentCommissionLeadDataModels,
) =>
    agentCommissionLeadDataModels
        ?.map((e) => getAgentCommissionLeadDataModelFirestoreData(e, true))
        .toList() ??
    [];
