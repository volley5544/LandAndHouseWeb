import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/land_and_house_app/user_info/user_info_widget.dart';
import '/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  bool isSearchByChanod = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (userDetail)] action in HomePage widget.
  ApiCallResponse? userDetailOutput;
  // Stores action output result for [Backend Call - Read Document] action in HomePage widget.
  ApplicationRecord? queryAPIUrl;
  // Model for userInfo component.
  late UserInfoModel userInfoModel;
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
  bool isDataUploading_uploadDataSqd = false;
  FFUploadedFile uploadedLocalFile_uploadDataSqd =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadDataSqd2 = false;
  FFUploadedFile uploadedLocalFile_uploadDataSqd2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - requestCameraPermission] action in Text widget.
  String? test;

  @override
  void initState(BuildContext context) {
    userInfoModel = createModel(context, () => UserInfoModel());
  }

  @override
  void dispose() {
    userInfoModel.dispose();
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
  }
}
