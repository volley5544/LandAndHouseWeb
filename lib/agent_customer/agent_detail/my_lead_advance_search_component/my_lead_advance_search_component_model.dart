import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'my_lead_advance_search_component_widget.dart'
    show MyLeadAdvanceSearchComponentWidget;
import 'package:flutter/material.dart';

class MyLeadAdvanceSearchComponentModel
    extends FlutterFlowModel<MyLeadAdvanceSearchComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for LeadStatusDropDown widget.
  String? leadStatusDropDownValue;
  FormFieldController<String>? leadStatusDropDownValueController;
  // State field(s) for ProductDropDown widget.
  String? productDropDownValue;
  FormFieldController<String>? productDropDownValueController;
  // State field(s) for LoanTypeNameDropDown widget.
  String? loanTypeNameDropDownValue;
  FormFieldController<String>? loanTypeNameDropDownValueController;
  // State field(s) for PaymentMethodDropDown widget.
  String? paymentMethodDropDownValue;
  FormFieldController<String>? paymentMethodDropDownValueController;
  // State field(s) for PaymentChannelDropDown widget.
  String? paymentChannelDropDownValue;
  FormFieldController<String>? paymentChannelDropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
