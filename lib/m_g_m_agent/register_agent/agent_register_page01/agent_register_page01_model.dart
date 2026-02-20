import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'agent_register_page01_widget.dart' show AgentRegisterPage01Widget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AgentRegisterPage01Model
    extends FlutterFlowModel<AgentRegisterPage01Widget> {
  ///  Local state fields for this page.

  bool otpState = false;

  int countingOtp = 0;

  String? phoneNumberPageState = '0800000000';

  String? otpCode;

  String? otpRef;

  ///  State fields for stateful widgets in this page.

  // State field(s) for phonenumberField widget.
  FocusNode? phonenumberFieldFocusNode;
  TextEditingController? phonenumberFieldTextController;
  late MaskTextInputFormatter phonenumberFieldMask;
  String? Function(BuildContext, String?)?
      phonenumberFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (Send an otp to user)] action in Text widget.
  ApiCallResponse? otpAPIOutputRetry;
  // State field(s) for OTPField widget.
  FocusNode? oTPFieldFocusNode;
  TextEditingController? oTPFieldTextController;
  late bool oTPFieldVisibility;
  String? Function(BuildContext, String?)? oTPFieldTextControllerValidator;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  ApplicationRecord? queryUrl;
  // Stores action output result for [Backend Call - API (Send an otp to user)] action in Container widget.
  ApiCallResponse? otpAPIOutput;

  @override
  void initState(BuildContext context) {
    oTPFieldVisibility = false;
  }

  @override
  void dispose() {
    phonenumberFieldFocusNode?.dispose();
    phonenumberFieldTextController?.dispose();

    oTPFieldFocusNode?.dispose();
    oTPFieldTextController?.dispose();
  }
}
