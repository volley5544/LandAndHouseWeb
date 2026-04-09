import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loan_data_component_widget.dart';
import '/components/p_c_banner_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SolarInfoPageModel extends FlutterFlowModel<SolarInfoPageWidget> {
  ///  Local state fields for this page.

  bool isSearchByChanod = true;

  bool chanodTypeIsSelected = false;

  bool temp = true;

  dynamic customerDataTemp;

  String? leadIdTemp;

  FFUploadedFile? idCardFile;

  FFUploadedFile? houseRegFile;

  List<FFUploadedFile> bookBankFile = [];
  void addToBookBankFile(FFUploadedFile item) => bookBankFile.add(item);
  void removeFromBookBankFile(FFUploadedFile item) => bookBankFile.remove(item);
  void removeAtIndexFromBookBankFile(int index) => bookBankFile.removeAt(index);
  void insertAtIndexInBookBankFile(int index, FFUploadedFile item) =>
      bookBankFile.insert(index, item);
  void updateBookBankFileAtIndex(
          int index, Function(FFUploadedFile) updateFn) =>
      bookBankFile[index] = updateFn(bookBankFile[index]);

  FFUploadedFile? quotation;

  FFUploadedFile? electricBill;

  String formState = 'normal';

  FFUploadedFile? chanodFrontFile;

  FFUploadedFile? chanodBackFile;

  FFUploadedFile? chanodFrontFileTemp;

  FFUploadedFile? chanodBackFileTemp;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in SolarInfoPage widget.
  ApplicationRecord? queryAPIUrl;
  // Model for PCBannerComponent component.
  late PCBannerComponentModel pCBannerComponentModel;
  // State field(s) for ThaiIdTextField widget.
  FocusNode? thaiIdTextFieldFocusNode;
  TextEditingController? thaiIdTextFieldTextController;
  late MaskTextInputFormatter thaiIdTextFieldMask;
  String? Function(BuildContext, String?)?
      thaiIdTextFieldTextControllerValidator;
  // State field(s) for ChanodNumberTextField widget.
  FocusNode? chanodNumberTextFieldFocusNode;
  TextEditingController? chanodNumberTextFieldTextController;
  String? Function(BuildContext, String?)?
      chanodNumberTextFieldTextControllerValidator;
  // State field(s) for RawangTextField widget.
  FocusNode? rawangTextFieldFocusNode;
  TextEditingController? rawangTextFieldTextController;
  String? Function(BuildContext, String?)?
      rawangTextFieldTextControllerValidator;
  // State field(s) for RaiTextField widget.
  FocusNode? raiTextFieldFocusNode;
  TextEditingController? raiTextFieldTextController;
  String? Function(BuildContext, String?)? raiTextFieldTextControllerValidator;
  // State field(s) for NganTextField widget.
  FocusNode? nganTextFieldFocusNode;
  TextEditingController? nganTextFieldTextController;
  String? Function(BuildContext, String?)? nganTextFieldTextControllerValidator;
  // State field(s) for TarangWaTextField widget.
  FocusNode? tarangWaTextFieldFocusNode;
  TextEditingController? tarangWaTextFieldTextController;
  String? Function(BuildContext, String?)?
      tarangWaTextFieldTextControllerValidator;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController1;
  int carouselCurrentIndex1 = 1;

  bool isDataUploading_uploadDataSqdWebMobile = false;
  FFUploadedFile uploadedLocalFile_uploadDataSqdWebMobile =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  bool isDataUploading_uploadDataSqd2Web5 = false;
  FFUploadedFile uploadedLocalFile_uploadDataSqd2Web5 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController2;
  int carouselCurrentIndex2 = 1;

  // Stores action output result for [Backend Call - API (checkRateApi)] action in Container widget.
  ApiCallResponse? aPIcheckRateOutputMobile;
  // Stores action output result for [Backend Call - API (saveRateApiWeb)] action in Container widget.
  ApiCallResponse? saveAPIOutputMobile;
  // State field(s) for ThaiIdTextFieldPC widget.
  FocusNode? thaiIdTextFieldPCFocusNode;
  TextEditingController? thaiIdTextFieldPCTextController;
  late MaskTextInputFormatter thaiIdTextFieldPCMask;
  String? Function(BuildContext, String?)?
      thaiIdTextFieldPCTextControllerValidator;
  // State field(s) for ChanodNumberTextFieldPC widget.
  FocusNode? chanodNumberTextFieldPCFocusNode;
  TextEditingController? chanodNumberTextFieldPCTextController;
  String? Function(BuildContext, String?)?
      chanodNumberTextFieldPCTextControllerValidator;
  // State field(s) for RawangTextFieldPC widget.
  FocusNode? rawangTextFieldPCFocusNode;
  TextEditingController? rawangTextFieldPCTextController;
  String? Function(BuildContext, String?)?
      rawangTextFieldPCTextControllerValidator;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Container widget.
  bool? addressOutput;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Container widget.
  bool? addressOutput2;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Container widget.
  bool? addressOutput3;
  // State field(s) for RaiTextFieldPC widget.
  FocusNode? raiTextFieldPCFocusNode;
  TextEditingController? raiTextFieldPCTextController;
  String? Function(BuildContext, String?)?
      raiTextFieldPCTextControllerValidator;
  // State field(s) for NganTextFieldPC widget.
  FocusNode? nganTextFieldPCFocusNode;
  TextEditingController? nganTextFieldPCTextController;
  String? Function(BuildContext, String?)?
      nganTextFieldPCTextControllerValidator;
  // State field(s) for TarangWaTextFieldPC widget.
  FocusNode? tarangWaTextFieldPCFocusNode;
  TextEditingController? tarangWaTextFieldPCTextController;
  String? Function(BuildContext, String?)?
      tarangWaTextFieldPCTextControllerValidator;
  bool isDataUploading_uploadDataSqdQuotationWebPC = false;
  FFUploadedFile uploadedLocalFile_uploadDataSqdQuotationWebPC =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  bool isDataUploading_uploadDataSqdIdCardWebPC = false;
  FFUploadedFile uploadedLocalFile_uploadDataSqdIdCardWebPC =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  bool isDataUploading_uploadDataSqdHouseRegWebPC = false;
  FFUploadedFile uploadedLocalFile_uploadDataSqdHouseRegWebPC =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  bool isDataUploading_uploadDataSqdElectricBillWebPC = false;
  FFUploadedFile uploadedLocalFile_uploadDataSqdElectricBillWebPC =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Backend Call - API (checkRateApi)] action in Container widget.
  ApiCallResponse? aPIcheckRateOutputPC;
  // Stores action output result for [Backend Call - API (saveRateApiWeb)] action in Container widget.
  ApiCallResponse? saveAPIOutputPC;
  // Model for loanDataComponent component.
  late LoanDataComponentModel loanDataComponentModel;
  bool isDataUploading_uploadNullValueAction = false;
  FFUploadedFile uploadedLocalFile_uploadNullValueAction =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  @override
  void initState(BuildContext context) {
    pCBannerComponentModel =
        createModel(context, () => PCBannerComponentModel());
    loanDataComponentModel =
        createModel(context, () => LoanDataComponentModel());
  }

  @override
  void dispose() {
    pCBannerComponentModel.dispose();
    thaiIdTextFieldFocusNode?.dispose();
    thaiIdTextFieldTextController?.dispose();

    chanodNumberTextFieldFocusNode?.dispose();
    chanodNumberTextFieldTextController?.dispose();

    rawangTextFieldFocusNode?.dispose();
    rawangTextFieldTextController?.dispose();

    raiTextFieldFocusNode?.dispose();
    raiTextFieldTextController?.dispose();

    nganTextFieldFocusNode?.dispose();
    nganTextFieldTextController?.dispose();

    tarangWaTextFieldFocusNode?.dispose();
    tarangWaTextFieldTextController?.dispose();

    thaiIdTextFieldPCFocusNode?.dispose();
    thaiIdTextFieldPCTextController?.dispose();

    chanodNumberTextFieldPCFocusNode?.dispose();
    chanodNumberTextFieldPCTextController?.dispose();

    rawangTextFieldPCFocusNode?.dispose();
    rawangTextFieldPCTextController?.dispose();

    raiTextFieldPCFocusNode?.dispose();
    raiTextFieldPCTextController?.dispose();

    nganTextFieldPCFocusNode?.dispose();
    nganTextFieldPCTextController?.dispose();

    tarangWaTextFieldPCFocusNode?.dispose();
    tarangWaTextFieldPCTextController?.dispose();

    loanDataComponentModel.dispose();
  }

  /// Action blocks.
  Future checkFromAddCustomerPage(BuildContext context) async {
    if (!(('${FFAppState().customerDetailJson.toString()}' != '') &&
        ('${FFAppState().customerDetailJson.toString()}' != 'null'))) {
      context.goNamed(
        AddCustomerLeadWidget.routeName,
        extra: <String, dynamic>{
          '__transition_info__': TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.fade,
            duration: Duration(milliseconds: 0),
          ),
        },
      );

      return;
    }
    if (!(('${FFAppState().leadsID}' != '') &&
        ('${FFAppState().leadsID}' != 'null'))) {
      context.goNamed(
        AddCustomerLeadWidget.routeName,
        extra: <String, dynamic>{
          '__transition_info__': TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.fade,
            duration: Duration(milliseconds: 0),
          ),
        },
      );

      return;
    }
  }

  Future checkTempParam(BuildContext context) async {
    if (!(('${''}' != 'null') &&
        ('${''}' != 'null') &&
        ('${''}' != 'null') &&
        ('${''}' != 'null'))) {
      context.goNamed(
        AddCustomerLeadWidget.routeName,
        extra: <String, dynamic>{
          '__transition_info__': TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.fade,
            duration: Duration(milliseconds: 0),
          ),
        },
      );

      return;
    }
  }
}
