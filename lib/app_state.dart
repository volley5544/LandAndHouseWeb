import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _accessToken = prefs.getString('ff_accessToken') ?? _accessToken;
    });
    _safeInit(() {
      _isTextFieldVisible =
          prefs.getBool('ff_isTextFieldVisible') ?? _isTextFieldVisible;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  ChanodDataModelStruct _chanodOutput = ChanodDataModelStruct();
  ChanodDataModelStruct get chanodOutput => _chanodOutput;
  set chanodOutput(ChanodDataModelStruct value) {
    _chanodOutput = value;
  }

  void updateChanodOutputStruct(Function(ChanodDataModelStruct) updateFn) {
    updateFn(_chanodOutput);
  }

  AddressDataModelStruct _addressOutput = AddressDataModelStruct();
  AddressDataModelStruct get addressOutput => _addressOutput;
  set addressOutput(AddressDataModelStruct value) {
    _addressOutput = value;
  }

  void updateAddressOutputStruct(Function(AddressDataModelStruct) updateFn) {
    updateFn(_addressOutput);
  }

  List<AddressDataModelStruct> _addressDataOriginal = [];
  List<AddressDataModelStruct> get addressDataOriginal => _addressDataOriginal;
  set addressDataOriginal(List<AddressDataModelStruct> value) {
    _addressDataOriginal = value;
  }

  void addToAddressDataOriginal(AddressDataModelStruct value) {
    addressDataOriginal.add(value);
  }

  void removeFromAddressDataOriginal(AddressDataModelStruct value) {
    addressDataOriginal.remove(value);
  }

  void removeAtIndexFromAddressDataOriginal(int index) {
    addressDataOriginal.removeAt(index);
  }

  void updateAddressDataOriginalAtIndex(
    int index,
    AddressDataModelStruct Function(AddressDataModelStruct) updateFn,
  ) {
    addressDataOriginal[index] = updateFn(_addressDataOriginal[index]);
  }

  void insertAtIndexInAddressDataOriginal(
      int index, AddressDataModelStruct value) {
    addressDataOriginal.insert(index, value);
  }

  CustomerDetailStruct _customerDetailData = CustomerDetailStruct();
  CustomerDetailStruct get customerDetailData => _customerDetailData;
  set customerDetailData(CustomerDetailStruct value) {
    _customerDetailData = value;
  }

  void updateCustomerDetailDataStruct(Function(CustomerDetailStruct) updateFn) {
    updateFn(_customerDetailData);
  }

  List<AddressDataModelStruct> _addressDataListOutput = [];
  List<AddressDataModelStruct> get addressDataListOutput =>
      _addressDataListOutput;
  set addressDataListOutput(List<AddressDataModelStruct> value) {
    _addressDataListOutput = value;
  }

  void addToAddressDataListOutput(AddressDataModelStruct value) {
    addressDataListOutput.add(value);
  }

  void removeFromAddressDataListOutput(AddressDataModelStruct value) {
    addressDataListOutput.remove(value);
  }

  void removeAtIndexFromAddressDataListOutput(int index) {
    addressDataListOutput.removeAt(index);
  }

  void updateAddressDataListOutputAtIndex(
    int index,
    AddressDataModelStruct Function(AddressDataModelStruct) updateFn,
  ) {
    addressDataListOutput[index] = updateFn(_addressDataListOutput[index]);
  }

  void insertAtIndexInAddressDataListOutput(
      int index, AddressDataModelStruct value) {
    addressDataListOutput.insert(index, value);
  }

  String _AppStateAREARAI = '';
  String get AppStateAREARAI => _AppStateAREARAI;
  set AppStateAREARAI(String value) {
    _AppStateAREARAI = value;
  }

  String _AppStateAREANGAN = '';
  String get AppStateAREANGAN => _AppStateAREANGAN;
  set AppStateAREANGAN(String value) {
    _AppStateAREANGAN = value;
  }

  String _AppStateAREAWA = '';
  String get AppStateAREAWA => _AppStateAREAWA;
  set AppStateAREAWA(String value) {
    _AppStateAREAWA = value;
  }

  DocumentReference? _landAndHouseAPIDocRef =
      FirebaseFirestore.instance.doc('/application/configs');
  DocumentReference? get landAndHouseAPIDocRef => _landAndHouseAPIDocRef;
  set landAndHouseAPIDocRef(DocumentReference? value) {
    _landAndHouseAPIDocRef = value;
  }

  String _landAndHouseAPIUrl = '';
  String get landAndHouseAPIUrl => _landAndHouseAPIUrl;
  set landAndHouseAPIUrl(String value) {
    _landAndHouseAPIUrl = value;
  }

  String _landAndHouseAssignApiUrl = '';
  String get landAndHouseAssignApiUrl => _landAndHouseAssignApiUrl;
  set landAndHouseAssignApiUrl(String value) {
    _landAndHouseAssignApiUrl = value;
  }

  String _arunsawadApiUrl = '';
  String get arunsawadApiUrl => _arunsawadApiUrl;
  set arunsawadApiUrl(String value) {
    _arunsawadApiUrl = value;
  }

  String _accessToken = '';
  String get accessToken => _accessToken;
  set accessToken(String value) {
    _accessToken = value;
    prefs.setString('ff_accessToken', value);
  }

  bool _isTextFieldVisible = false;
  bool get isTextFieldVisible => _isTextFieldVisible;
  set isTextFieldVisible(bool value) {
    _isTextFieldVisible = value;
    prefs.setBool('ff_isTextFieldVisible', value);
  }

  List<bool> _isIconVisible = [];
  List<bool> get isIconVisible => _isIconVisible;
  set isIconVisible(List<bool> value) {
    _isIconVisible = value;
  }

  void addToIsIconVisible(bool value) {
    isIconVisible.add(value);
  }

  void removeFromIsIconVisible(bool value) {
    isIconVisible.remove(value);
  }

  void removeAtIndexFromIsIconVisible(int index) {
    isIconVisible.removeAt(index);
  }

  void updateIsIconVisibleAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    isIconVisible[index] = updateFn(_isIconVisible[index]);
  }

  void insertAtIndexInIsIconVisible(int index, bool value) {
    isIconVisible.insert(index, value);
  }

  SaveAssignBranchStruct _saveBranchDataTemp = SaveAssignBranchStruct();
  SaveAssignBranchStruct get saveBranchDataTemp => _saveBranchDataTemp;
  set saveBranchDataTemp(SaveAssignBranchStruct value) {
    _saveBranchDataTemp = value;
  }

  void updateSaveBranchDataTempStruct(
      Function(SaveAssignBranchStruct) updateFn) {
    updateFn(_saveBranchDataTemp);
  }

  String _projectName = '';
  String get projectName => _projectName;
  set projectName(String value) {
    _projectName = value;
  }

  String _leadsID = '';
  String get leadsID => _leadsID;
  set leadsID(String value) {
    _leadsID = value;
  }

  dynamic _customerDetailJson;
  dynamic get customerDetailJson => _customerDetailJson;
  set customerDetailJson(dynamic value) {
    _customerDetailJson = value;
  }

  String _ltv1AmountWeb = '';
  String get ltv1AmountWeb => _ltv1AmountWeb;
  set ltv1AmountWeb(String value) {
    _ltv1AmountWeb = value;
  }

  String _ltv2AmountWeb = '';
  String get ltv2AmountWeb => _ltv2AmountWeb;
  set ltv2AmountWeb(String value) {
    _ltv2AmountWeb = value;
  }

  String _consentFlg = '';
  String get consentFlg => _consentFlg;
  set consentFlg(String value) {
    _consentFlg = value;
  }

  String _utmSourceAppState = '';
  String get utmSourceAppState => _utmSourceAppState;
  set utmSourceAppState(String value) {
    _utmSourceAppState = value;
  }

  String _utmMediumAppState = '';
  String get utmMediumAppState => _utmMediumAppState;
  set utmMediumAppState(String value) {
    _utmMediumAppState = value;
  }

  String _utmCampaignAppState = '';
  String get utmCampaignAppState => _utmCampaignAppState;
  set utmCampaignAppState(String value) {
    _utmCampaignAppState = value;
  }

  List<String> _listTempTest = ['1', '2', '3'];
  List<String> get listTempTest => _listTempTest;
  set listTempTest(List<String> value) {
    _listTempTest = value;
  }

  void addToListTempTest(String value) {
    listTempTest.add(value);
  }

  void removeFromListTempTest(String value) {
    listTempTest.remove(value);
  }

  void removeAtIndexFromListTempTest(int index) {
    listTempTest.removeAt(index);
  }

  void updateListTempTestAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    listTempTest[index] = updateFn(_listTempTest[index]);
  }

  void insertAtIndexInListTempTest(int index, String value) {
    listTempTest.insert(index, value);
  }

  DocumentReference? _tanjaiApiDocRef =
      FirebaseFirestore.instance.doc('/application/configs');
  DocumentReference? get tanjaiApiDocRef => _tanjaiApiDocRef;
  set tanjaiApiDocRef(DocumentReference? value) {
    _tanjaiApiDocRef = value;
  }

  DocumentReference? _configDocument =
      FirebaseFirestore.instance.doc('/application/configs');
  DocumentReference? get configDocument => _configDocument;
  set configDocument(DocumentReference? value) {
    _configDocument = value;
  }

  List<GetLoanListAPIDataTypeStruct> _getLoanListAPIResultAppState = [];
  List<GetLoanListAPIDataTypeStruct> get getLoanListAPIResultAppState =>
      _getLoanListAPIResultAppState;
  set getLoanListAPIResultAppState(List<GetLoanListAPIDataTypeStruct> value) {
    _getLoanListAPIResultAppState = value;
  }

  void addToGetLoanListAPIResultAppState(GetLoanListAPIDataTypeStruct value) {
    getLoanListAPIResultAppState.add(value);
  }

  void removeFromGetLoanListAPIResultAppState(
      GetLoanListAPIDataTypeStruct value) {
    getLoanListAPIResultAppState.remove(value);
  }

  void removeAtIndexFromGetLoanListAPIResultAppState(int index) {
    getLoanListAPIResultAppState.removeAt(index);
  }

  void updateGetLoanListAPIResultAppStateAtIndex(
    int index,
    GetLoanListAPIDataTypeStruct Function(GetLoanListAPIDataTypeStruct)
        updateFn,
  ) {
    getLoanListAPIResultAppState[index] =
        updateFn(_getLoanListAPIResultAppState[index]);
  }

  void insertAtIndexInGetLoanListAPIResultAppState(
      int index, GetLoanListAPIDataTypeStruct value) {
    getLoanListAPIResultAppState.insert(index, value);
  }

  List<String> _emptyList = [];
  List<String> get emptyList => _emptyList;
  set emptyList(List<String> value) {
    _emptyList = value;
  }

  void addToEmptyList(String value) {
    emptyList.add(value);
  }

  void removeFromEmptyList(String value) {
    emptyList.remove(value);
  }

  void removeAtIndexFromEmptyList(int index) {
    emptyList.removeAt(index);
  }

  void updateEmptyListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    emptyList[index] = updateFn(_emptyList[index]);
  }

  void insertAtIndexInEmptyList(int index, String value) {
    emptyList.insert(index, value);
  }

  GetLoanListAPIDataTypeStruct _getLoanListSelected =
      GetLoanListAPIDataTypeStruct();
  GetLoanListAPIDataTypeStruct get getLoanListSelected => _getLoanListSelected;
  set getLoanListSelected(GetLoanListAPIDataTypeStruct value) {
    _getLoanListSelected = value;
  }

  void updateGetLoanListSelectedStruct(
      Function(GetLoanListAPIDataTypeStruct) updateFn) {
    updateFn(_getLoanListSelected);
  }

  GetTopupDataAPIDataTypeStruct _getTopupDataAPIResultAppstate =
      GetTopupDataAPIDataTypeStruct.fromSerializableMap(jsonDecode('{}'));
  GetTopupDataAPIDataTypeStruct get getTopupDataAPIResultAppstate =>
      _getTopupDataAPIResultAppstate;
  set getTopupDataAPIResultAppstate(GetTopupDataAPIDataTypeStruct value) {
    _getTopupDataAPIResultAppstate = value;
  }

  void updateGetTopupDataAPIResultAppstateStruct(
      Function(GetTopupDataAPIDataTypeStruct) updateFn) {
    updateFn(_getTopupDataAPIResultAppstate);
  }

  TopupCalculateDataTypeStruct _getTopupCalculateAppState =
      TopupCalculateDataTypeStruct();
  TopupCalculateDataTypeStruct get getTopupCalculateAppState =>
      _getTopupCalculateAppState;
  set getTopupCalculateAppState(TopupCalculateDataTypeStruct value) {
    _getTopupCalculateAppState = value;
  }

  void updateGetTopupCalculateAppStateStruct(
      Function(TopupCalculateDataTypeStruct) updateFn) {
    updateFn(_getTopupCalculateAppState);
  }

  SaveTopupDataModelStruct _saveTopupData = SaveTopupDataModelStruct();
  SaveTopupDataModelStruct get saveTopupData => _saveTopupData;
  set saveTopupData(SaveTopupDataModelStruct value) {
    _saveTopupData = value;
  }

  void updateSaveTopupDataStruct(Function(SaveTopupDataModelStruct) updateFn) {
    updateFn(_saveTopupData);
  }

  String _hashThaiIdAppState = '';
  String get hashThaiIdAppState => _hashThaiIdAppState;
  set hashThaiIdAppState(String value) {
    _hashThaiIdAppState = value;
  }

  List<bool> _pdfDocListConsent = [false, false, false];
  List<bool> get pdfDocListConsent => _pdfDocListConsent;
  set pdfDocListConsent(List<bool> value) {
    _pdfDocListConsent = value;
  }

  void addToPdfDocListConsent(bool value) {
    pdfDocListConsent.add(value);
  }

  void removeFromPdfDocListConsent(bool value) {
    pdfDocListConsent.remove(value);
  }

  void removeAtIndexFromPdfDocListConsent(int index) {
    pdfDocListConsent.removeAt(index);
  }

  void updatePdfDocListConsentAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    pdfDocListConsent[index] = updateFn(_pdfDocListConsent[index]);
  }

  void insertAtIndexInPdfDocListConsent(int index, bool value) {
    pdfDocListConsent.insert(index, value);
  }

  InstallmentsStruct _topupInstallmentSelected = InstallmentsStruct();
  InstallmentsStruct get topupInstallmentSelected => _topupInstallmentSelected;
  set topupInstallmentSelected(InstallmentsStruct value) {
    _topupInstallmentSelected = value;
  }

  void updateTopupInstallmentSelectedStruct(
      Function(InstallmentsStruct) updateFn) {
    updateFn(_topupInstallmentSelected);
  }

  UserAllAddressDataModelStruct _userAddressData =
      UserAllAddressDataModelStruct();
  UserAllAddressDataModelStruct get userAddressData => _userAddressData;
  set userAddressData(UserAllAddressDataModelStruct value) {
    _userAddressData = value;
  }

  void updateUserAddressDataStruct(
      Function(UserAllAddressDataModelStruct) updateFn) {
    updateFn(_userAddressData);
  }

  String _idCardFilePath = 'path';
  String get idCardFilePath => _idCardFilePath;
  set idCardFilePath(String value) {
    _idCardFilePath = value;
  }

  String _idCardPlusSelfieFilePath = 'path';
  String get idCardPlusSelfieFilePath => _idCardPlusSelfieFilePath;
  set idCardPlusSelfieFilePath(String value) {
    _idCardPlusSelfieFilePath = value;
  }

  String _circleImageBase64SaveTopup = '';
  String get circleImageBase64SaveTopup => _circleImageBase64SaveTopup;
  set circleImageBase64SaveTopup(String value) {
    _circleImageBase64SaveTopup = value;
  }

  String _fullVehicleImageBase64SaveTopup = '';
  String get fullVehicleImageBase64SaveTopup =>
      _fullVehicleImageBase64SaveTopup;
  set fullVehicleImageBase64SaveTopup(String value) {
    _fullVehicleImageBase64SaveTopup = value;
  }

  QrCodeDataTypeStruct _qrCodeDataTypeAppState = QrCodeDataTypeStruct();
  QrCodeDataTypeStruct get qrCodeDataTypeAppState => _qrCodeDataTypeAppState;
  set qrCodeDataTypeAppState(QrCodeDataTypeStruct value) {
    _qrCodeDataTypeAppState = value;
  }

  void updateQrCodeDataTypeAppStateStruct(
      Function(QrCodeDataTypeStruct) updateFn) {
    updateFn(_qrCodeDataTypeAppState);
  }

  dynamic _jsonTemp = jsonDecode('{}');
  dynamic get jsonTemp => _jsonTemp;
  set jsonTemp(dynamic value) {
    _jsonTemp = value;
  }

  String _topupUrlDev = '';
  String get topupUrlDev => _topupUrlDev;
  set topupUrlDev(String value) {
    _topupUrlDev = value;
  }

  String _topupUrlProd = '';
  String get topupUrlProd => _topupUrlProd;
  set topupUrlProd(String value) {
    _topupUrlProd = value;
  }

  String _LeadUrlDev = '';
  String get LeadUrlDev => _LeadUrlDev;
  set LeadUrlDev(String value) {
    _LeadUrlDev = value;
  }

  String _LeadUrlProd = '';
  String get LeadUrlProd => _LeadUrlProd;
  set LeadUrlProd(String value) {
    _LeadUrlProd = value;
  }

  int _webProdVersion = 15;
  int get webProdVersion => _webProdVersion;
  set webProdVersion(int value) {
    _webProdVersion = value;
  }

  int _webUatVersion = 11;
  int get webUatVersion => _webUatVersion;
  set webUatVersion(int value) {
    _webUatVersion = value;
  }

  String _ocrUrlDev = '';
  String get ocrUrlDev => _ocrUrlDev;
  set ocrUrlDev(String value) {
    _ocrUrlDev = value;
  }

  String _ocrUrlProd = '';
  String get ocrUrlProd => _ocrUrlProd;
  set ocrUrlProd(String value) {
    _ocrUrlProd = value;
  }

  dynamic _comcodeConfigsDocument;
  dynamic get comcodeConfigsDocument => _comcodeConfigsDocument;
  set comcodeConfigsDocument(dynamic value) {
    _comcodeConfigsDocument = value;
  }

  DocumentReference? _topupProductConfig = FirebaseFirestore.instance
      .doc('/topup_product_config/6W7o20770r1YGvuCdHVQ');
  DocumentReference? get topupProductConfig => _topupProductConfig;
  set topupProductConfig(DocumentReference? value) {
    _topupProductConfig = value;
  }

  String _agentCode = '';
  String get agentCode => _agentCode;
  set agentCode(String value) {
    _agentCode = value;
  }

  AgentProfileModelStruct _agentProfileDataType = AgentProfileModelStruct();
  AgentProfileModelStruct get agentProfileDataType => _agentProfileDataType;
  set agentProfileDataType(AgentProfileModelStruct value) {
    _agentProfileDataType = value;
  }

  void updateAgentProfileDataTypeStruct(
      Function(AgentProfileModelStruct) updateFn) {
    updateFn(_agentProfileDataType);
  }

  List<String> _productList = [
    'รถมอเตอร์ไซค์',
    'รถเก๋ง',
    'รถกระบะ (ตอนเดียว)',
    'รถกระบะ (แคป)',
    'รถกระบะ (4 ประตู)',
    'รถตู้',
    'รถบรรทุก (4 ล้อ)',
    'รถบรรทุก (6 ล้อ)',
    'รถบรรทุก (10 ล้อ)',
    'รถบรรทุก (12 ล้อ)',
    'ที่ดินพร้อมสิ่งปลูกสร้าง',
    'ที่ดินเปล่า'
  ];
  List<String> get productList => _productList;
  set productList(List<String> value) {
    _productList = value;
  }

  void addToProductList(String value) {
    productList.add(value);
  }

  void removeFromProductList(String value) {
    productList.remove(value);
  }

  void removeAtIndexFromProductList(int index) {
    productList.removeAt(index);
  }

  void updateProductListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    productList[index] = updateFn(_productList[index]);
  }

  void insertAtIndexInProductList(int index, String value) {
    productList.insert(index, value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
