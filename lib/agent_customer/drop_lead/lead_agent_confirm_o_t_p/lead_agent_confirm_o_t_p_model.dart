import '/flutter_flow/flutter_flow_util.dart';
import 'lead_agent_confirm_o_t_p_widget.dart' show LeadAgentConfirmOTPWidget;
import 'package:flutter/material.dart';

class LeadAgentConfirmOTPModel
    extends FlutterFlowModel<LeadAgentConfirmOTPWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  FocusNode? pinCodeFocusNode;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    pinCodeFocusNode?.dispose();
    pinCodeController?.dispose();
  }
}
