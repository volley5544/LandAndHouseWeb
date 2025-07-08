import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'saved_lead_called_status_widget.dart' show SavedLeadCalledStatusWidget;
import 'package:flutter/material.dart';

class SavedLeadCalledStatusModel
    extends FlutterFlowModel<SavedLeadCalledStatusWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for callStatusDropDown widget.
  String? callStatusDropDownValue;
  FormFieldController<String>? callStatusDropDownValueController;
  // Stores action output result for [Backend Call - API (getLeadReasonCallDropdownAPI)] action in callStatusDropDown widget.
  ApiCallResponse? getReasonCall;
  // State field(s) for reasonDropDown widget.
  String? reasonDropDownValue;
  FormFieldController<String>? reasonDropDownValueController;
  // State field(s) for calledRemarkTextField widget.
  FocusNode? calledRemarkTextFieldFocusNode;
  TextEditingController? calledRemarkTextFieldTextController;
  String? Function(BuildContext, String?)?
      calledRemarkTextFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (saveCallStatusAPI)] action in Button widget.
  ApiCallResponse? saveCallOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    calledRemarkTextFieldFocusNode?.dispose();
    calledRemarkTextFieldTextController?.dispose();
  }
}
