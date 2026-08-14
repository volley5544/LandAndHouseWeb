import '/flutter_flow/flutter_flow_util.dart';
import 'input_topup_reason_component_widget.dart'
    show InputTopupReasonComponentWidget;
import 'package:flutter/material.dart';

class InputTopupReasonComponentModel
    extends FlutterFlowModel<InputTopupReasonComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for ReasonTextField widget.
  FocusNode? reasonTextFieldFocusNode;
  TextEditingController? reasonTextFieldTextController;
  String? Function(BuildContext, String?)?
      reasonTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    reasonTextFieldFocusNode?.dispose();
    reasonTextFieldTextController?.dispose();
  }
}
