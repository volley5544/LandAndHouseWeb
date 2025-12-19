import '/backend/api_requests/api_calls.dart';
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
  DateTime? datePicked;
  // Stores action output result for [Backend Call - API (checkRateApi)] action in Button widget.
  ApiCallResponse? aPIcheckRateOutput;

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
