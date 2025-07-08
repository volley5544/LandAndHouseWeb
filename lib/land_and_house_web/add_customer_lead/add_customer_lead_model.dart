import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loan_data_component_widget.dart';
import '/components/p_c_banner_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'add_customer_lead_widget.dart' show AddCustomerLeadWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AddCustomerLeadModel extends FlutterFlowModel<AddCustomerLeadWidget> {
  ///  Local state fields for this page.

  bool isSearchByChanod = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in AddCustomerLead widget.
  ApplicationRecord? queryAPIUrl;
  // Model for PCBannerComponent component.
  late PCBannerComponentModel pCBannerComponentModel;
  // State field(s) for NameTextField widget.
  FocusNode? nameTextFieldFocusNode;
  TextEditingController? nameTextFieldTextController;
  String? Function(BuildContext, String?)? nameTextFieldTextControllerValidator;
  // State field(s) for lastNameTextField widget.
  FocusNode? lastNameTextFieldFocusNode;
  TextEditingController? lastNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      lastNameTextFieldTextControllerValidator;
  // State field(s) for phoneTextField widget.
  FocusNode? phoneTextFieldFocusNode;
  TextEditingController? phoneTextFieldTextController;
  late MaskTextInputFormatter phoneTextFieldMask;
  String? Function(BuildContext, String?)?
      phoneTextFieldTextControllerValidator;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // Stores action output result for [Backend Call - API (saveRateApiWeb)] action in Button widget.
  ApiCallResponse? saveLeadStep1;
  // Model for loanDataComponent component.
  late LoanDataComponentModel loanDataComponentModel;

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
    nameTextFieldFocusNode?.dispose();
    nameTextFieldTextController?.dispose();

    lastNameTextFieldFocusNode?.dispose();
    lastNameTextFieldTextController?.dispose();

    phoneTextFieldFocusNode?.dispose();
    phoneTextFieldTextController?.dispose();

    loanDataComponentModel.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
