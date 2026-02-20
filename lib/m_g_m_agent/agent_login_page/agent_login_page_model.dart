import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'agent_login_page_widget.dart' show AgentLoginPageWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AgentLoginPageModel extends FlutterFlowModel<AgentLoginPageWidget> {
  ///  Local state fields for this page.

  FFUploadedFile? tempFile;

  ///  State fields for stateful widgets in this page.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for agentCode widget.
  FocusNode? agentCodeFocusNode;
  TextEditingController? agentCodeTextController;
  String? Function(BuildContext, String?)? agentCodeTextControllerValidator;
  // State field(s) for thaiIdTextField widget.
  FocusNode? thaiIdTextFieldFocusNode;
  TextEditingController? thaiIdTextFieldTextController;
  late MaskTextInputFormatter thaiIdTextFieldMask;
  String? Function(BuildContext, String?)?
      thaiIdTextFieldTextControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ApplicationRecord? queryUrl;
  // Stores action output result for [Backend Call - API (login agent)] action in Button widget.
  ApiCallResponse? loginAPIOutput;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    agentCodeFocusNode?.dispose();
    agentCodeTextController?.dispose();

    thaiIdTextFieldFocusNode?.dispose();
    thaiIdTextFieldTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
