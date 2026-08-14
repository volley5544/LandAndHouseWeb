import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ApplicationRecord extends FirestoreRecord {
  ApplicationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "api_url" field.
  ApiUrlStruct? _apiUrl;
  ApiUrlStruct get apiUrl => _apiUrl ?? ApiUrlStruct();
  bool hasApiUrl() => _apiUrl != null;

  // "topup_text_title" field.
  String? _topupTextTitle;
  String get topupTextTitle => _topupTextTitle ?? '';
  bool hasTopupTextTitle() => _topupTextTitle != null;

  // "topup_warnning_text_list" field.
  List<String>? _topupWarnningTextList;
  List<String> get topupWarnningTextList => _topupWarnningTextList ?? const [];
  bool hasTopupWarnningTextList() => _topupWarnningTextList != null;

  // "topup_text_list" field.
  List<String>? _topupTextList;
  List<String> get topupTextList => _topupTextList ?? const [];
  bool hasTopupTextList() => _topupTextList != null;

  // "topup_no_data_text" field.
  String? _topupNoDataText;
  String get topupNoDataText => _topupNoDataText ?? '';
  bool hasTopupNoDataText() => _topupNoDataText != null;

  // "topup_no_data2_text" field.
  String? _topupNoData2Text;
  String get topupNoData2Text => _topupNoData2Text ?? '';
  bool hasTopupNoData2Text() => _topupNoData2Text != null;

  // "comcode_config" field.
  ComcodeConfigModelStruct? _comcodeConfig;
  ComcodeConfigModelStruct get comcodeConfig =>
      _comcodeConfig ?? ComcodeConfigModelStruct();
  bool hasComcodeConfig() => _comcodeConfig != null;

  // "use_new_camera_action" field.
  bool? _useNewCameraAction;
  bool get useNewCameraAction => _useNewCameraAction ?? false;
  bool hasUseNewCameraAction() => _useNewCameraAction != null;

  // "isUseOtp" field.
  bool? _isUseOtp;
  bool get isUseOtp => _isUseOtp ?? false;
  bool hasIsUseOtp() => _isUseOtp != null;

  // "max_commission_amount_onetime" field.
  double? _maxCommissionAmountOnetime;
  double get maxCommissionAmountOnetime => _maxCommissionAmountOnetime ?? 0.0;
  bool hasMaxCommissionAmountOnetime() => _maxCommissionAmountOnetime != null;

  // "max_commission_amount_installment" field.
  double? _maxCommissionAmountInstallment;
  double get maxCommissionAmountInstallment =>
      _maxCommissionAmountInstallment ?? 0.0;
  bool hasMaxCommissionAmountInstallment() =>
      _maxCommissionAmountInstallment != null;

  // "max_commission_text_onetime" field.
  String? _maxCommissionTextOnetime;
  String get maxCommissionTextOnetime => _maxCommissionTextOnetime ?? '';
  bool hasMaxCommissionTextOnetime() => _maxCommissionTextOnetime != null;

  // "max_commission_text_installment" field.
  String? _maxCommissionTextInstallment;
  String get maxCommissionTextInstallment =>
      _maxCommissionTextInstallment ?? '';
  bool hasMaxCommissionTextInstallment() =>
      _maxCommissionTextInstallment != null;

  // "consent_text_agent" field.
  String? _consentTextAgent;
  String get consentTextAgent => _consentTextAgent ?? '';
  bool hasConsentTextAgent() => _consentTextAgent != null;

  // "consent_text_customer" field.
  String? _consentTextCustomer;
  String get consentTextCustomer => _consentTextCustomer ?? '';
  bool hasConsentTextCustomer() => _consentTextCustomer != null;

  // "mgm_user_manual_url" field.
  String? _mgmUserManualUrl;
  String get mgmUserManualUrl => _mgmUserManualUrl ?? '';
  bool hasMgmUserManualUrl() => _mgmUserManualUrl != null;

  // "is_use_otp_consent" field.
  bool? _isUseOtpConsent;
  bool get isUseOtpConsent => _isUseOtpConsent ?? false;
  bool hasIsUseOtpConsent() => _isUseOtpConsent != null;

  // "can_topup_default_msg" field.
  String? _canTopupDefaultMsg;
  String get canTopupDefaultMsg => _canTopupDefaultMsg ?? '';
  bool hasCanTopupDefaultMsg() => _canTopupDefaultMsg != null;

  // "topup_text_time" field.
  String? _topupTextTime;
  String get topupTextTime => _topupTextTime ?? '';
  bool hasTopupTextTime() => _topupTextTime != null;

  void _initializeFields() {
    _apiUrl = snapshotData['api_url'] is ApiUrlStruct
        ? snapshotData['api_url']
        : ApiUrlStruct.maybeFromMap(snapshotData['api_url']);
    _topupTextTitle = snapshotData['topup_text_title'] as String?;
    _topupWarnningTextList =
        getDataList(snapshotData['topup_warnning_text_list']);
    _topupTextList = getDataList(snapshotData['topup_text_list']);
    _topupNoDataText = snapshotData['topup_no_data_text'] as String?;
    _topupNoData2Text = snapshotData['topup_no_data2_text'] as String?;
    _comcodeConfig = snapshotData['comcode_config'] is ComcodeConfigModelStruct
        ? snapshotData['comcode_config']
        : ComcodeConfigModelStruct.maybeFromMap(snapshotData['comcode_config']);
    _useNewCameraAction = snapshotData['use_new_camera_action'] as bool?;
    _isUseOtp = snapshotData['isUseOtp'] as bool?;
    _maxCommissionAmountOnetime =
        castToType<double>(snapshotData['max_commission_amount_onetime']);
    _maxCommissionAmountInstallment =
        castToType<double>(snapshotData['max_commission_amount_installment']);
    _maxCommissionTextOnetime =
        snapshotData['max_commission_text_onetime'] as String?;
    _maxCommissionTextInstallment =
        snapshotData['max_commission_text_installment'] as String?;
    _consentTextAgent = snapshotData['consent_text_agent'] as String?;
    _consentTextCustomer = snapshotData['consent_text_customer'] as String?;
    _mgmUserManualUrl = snapshotData['mgm_user_manual_url'] as String?;
    _isUseOtpConsent = snapshotData['is_use_otp_consent'] as bool?;
    _canTopupDefaultMsg = snapshotData['can_topup_default_msg'] as String?;
    _topupTextTime = snapshotData['topup_text_time'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('application');

  static Stream<ApplicationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ApplicationRecord.fromSnapshot(s));

  static Future<ApplicationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ApplicationRecord.fromSnapshot(s));

  static ApplicationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ApplicationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ApplicationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ApplicationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ApplicationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ApplicationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createApplicationRecordData({
  ApiUrlStruct? apiUrl,
  String? topupTextTitle,
  String? topupNoDataText,
  String? topupNoData2Text,
  ComcodeConfigModelStruct? comcodeConfig,
  bool? useNewCameraAction,
  bool? isUseOtp,
  double? maxCommissionAmountOnetime,
  double? maxCommissionAmountInstallment,
  String? maxCommissionTextOnetime,
  String? maxCommissionTextInstallment,
  String? consentTextAgent,
  String? consentTextCustomer,
  String? mgmUserManualUrl,
  bool? isUseOtpConsent,
  String? canTopupDefaultMsg,
  String? topupTextTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'api_url': ApiUrlStruct().toMap(),
      'topup_text_title': topupTextTitle,
      'topup_no_data_text': topupNoDataText,
      'topup_no_data2_text': topupNoData2Text,
      'comcode_config': ComcodeConfigModelStruct().toMap(),
      'use_new_camera_action': useNewCameraAction,
      'isUseOtp': isUseOtp,
      'max_commission_amount_onetime': maxCommissionAmountOnetime,
      'max_commission_amount_installment': maxCommissionAmountInstallment,
      'max_commission_text_onetime': maxCommissionTextOnetime,
      'max_commission_text_installment': maxCommissionTextInstallment,
      'consent_text_agent': consentTextAgent,
      'consent_text_customer': consentTextCustomer,
      'mgm_user_manual_url': mgmUserManualUrl,
      'is_use_otp_consent': isUseOtpConsent,
      'can_topup_default_msg': canTopupDefaultMsg,
      'topup_text_time': topupTextTime,
    }.withoutNulls,
  );

  // Handle nested data for "api_url" field.
  addApiUrlStructData(firestoreData, apiUrl, 'api_url');

  // Handle nested data for "comcode_config" field.
  addComcodeConfigModelStructData(
      firestoreData, comcodeConfig, 'comcode_config');

  return firestoreData;
}

class ApplicationRecordDocumentEquality implements Equality<ApplicationRecord> {
  const ApplicationRecordDocumentEquality();

  @override
  bool equals(ApplicationRecord? e1, ApplicationRecord? e2) {
    const listEquality = ListEquality();
    return e1?.apiUrl == e2?.apiUrl &&
        e1?.topupTextTitle == e2?.topupTextTitle &&
        listEquality.equals(
            e1?.topupWarnningTextList, e2?.topupWarnningTextList) &&
        listEquality.equals(e1?.topupTextList, e2?.topupTextList) &&
        e1?.topupNoDataText == e2?.topupNoDataText &&
        e1?.topupNoData2Text == e2?.topupNoData2Text &&
        e1?.comcodeConfig == e2?.comcodeConfig &&
        e1?.useNewCameraAction == e2?.useNewCameraAction &&
        e1?.isUseOtp == e2?.isUseOtp &&
        e1?.maxCommissionAmountOnetime == e2?.maxCommissionAmountOnetime &&
        e1?.maxCommissionAmountInstallment ==
            e2?.maxCommissionAmountInstallment &&
        e1?.maxCommissionTextOnetime == e2?.maxCommissionTextOnetime &&
        e1?.maxCommissionTextInstallment == e2?.maxCommissionTextInstallment &&
        e1?.consentTextAgent == e2?.consentTextAgent &&
        e1?.consentTextCustomer == e2?.consentTextCustomer &&
        e1?.mgmUserManualUrl == e2?.mgmUserManualUrl &&
        e1?.isUseOtpConsent == e2?.isUseOtpConsent &&
        e1?.canTopupDefaultMsg == e2?.canTopupDefaultMsg &&
        e1?.topupTextTime == e2?.topupTextTime;
  }

  @override
  int hash(ApplicationRecord? e) => const ListEquality().hash([
        e?.apiUrl,
        e?.topupTextTitle,
        e?.topupWarnningTextList,
        e?.topupTextList,
        e?.topupNoDataText,
        e?.topupNoData2Text,
        e?.comcodeConfig,
        e?.useNewCameraAction,
        e?.isUseOtp,
        e?.maxCommissionAmountOnetime,
        e?.maxCommissionAmountInstallment,
        e?.maxCommissionTextOnetime,
        e?.maxCommissionTextInstallment,
        e?.consentTextAgent,
        e?.consentTextCustomer,
        e?.mgmUserManualUrl,
        e?.isUseOtpConsent,
        e?.canTopupDefaultMsg,
        e?.topupTextTime
      ]);

  @override
  bool isValidKey(Object? o) => o is ApplicationRecord;
}
