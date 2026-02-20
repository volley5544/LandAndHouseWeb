import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'check_rate_l_h_form_component_widget.dart'
    show CheckRateLHFormComponentWidget;
import 'package:flutter/material.dart';

class CheckRateLHFormComponentModel
    extends FlutterFlowModel<CheckRateLHFormComponentWidget> {
  ///  Local state fields for this component.

  bool isSearchByChanod = true;

  bool isFormState = true;

  bool paymentState = false;

  CheckRateDataModelStruct? checkRateData;
  void updateCheckRateDataStruct(Function(CheckRateDataModelStruct) updateFn) {
    updateFn(checkRateData ??= CheckRateDataModelStruct());
  }

  String commissionPageState = '0';

  ///  State fields for stateful widgets in this component.

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
  bool isDataUploading_uploadDataSqdComponent = false;
  FFUploadedFile uploadedLocalFile_uploadDataSqdComponent =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  bool isDataUploading_uploadDataSqd2Component = false;
  FFUploadedFile uploadedLocalFile_uploadDataSqd2Component =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  // Stores action output result for [Backend Call - API (agent commission)] action in TextField widget.
  ApiCallResponse? apiResulthzdcommissionLH;
  DateTime? datePicked;
  // Stores action output result for [Backend Call - API (checkRateApi)] action in Button widget.
  ApiCallResponse? aPIcheckRateOutput;
  // Stores action output result for [Custom Action - uploadFileFirebaseStorageCheckRate] action in Button widget.
  String? uploadedChanodeFrontUrl;
  // Stores action output result for [Custom Action - uploadFileFirebaseStorageCheckRate] action in Button widget.
  String? uploadedChanodeBackUrl;
  // Stores action output result for [Backend Call - API (CustomerCreateApi)] action in Button widget.
  ApiCallResponse? createCustomerOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
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

    textFieldFocusNode?.dispose();
    textController6?.dispose();
  }
}
