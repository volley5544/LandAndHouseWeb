import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/lead_solar_cell_web/solar_data_component/solar_data_component_widget.dart';
import '/lead_solar_cell_web/solar_p_c_banner_component/solar_p_c_banner_component_widget.dart';
import '/index.dart';
import 'add_customer_solar_lead_widget.dart' show AddCustomerSolarLeadWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AddCustomerSolarLeadModel
    extends FlutterFlowModel<AddCustomerSolarLeadWidget> {
  ///  Local state fields for this page.

  bool isSearchByChanod = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in AddCustomerSolarLead widget.
  ApplicationRecord? queryAPIUrl;
  // Model for SolarPCBannerComponent component.
  late SolarPCBannerComponentModel solarPCBannerComponentModel;
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
  // State field(s) for thaiIdTextField widget.
  FocusNode? thaiIdTextFieldFocusNode;
  TextEditingController? thaiIdTextFieldTextController;
  late MaskTextInputFormatter thaiIdTextFieldMask;
  String? Function(BuildContext, String?)?
      thaiIdTextFieldTextControllerValidator;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // Stores action output result for [Backend Call - API (solar get token)] action in Button widget.
  ApiCallResponse? getTokenAPIOutput;
  // Stores action output result for [Backend Call - API (lead save step one )] action in Button widget.
  ApiCallResponse? solarSaveStep1;
  // Model for SolarDataComponent component.
  late SolarDataComponentModel solarDataComponentModel;

  @override
  void initState(BuildContext context) {
    solarPCBannerComponentModel =
        createModel(context, () => SolarPCBannerComponentModel());
    solarDataComponentModel =
        createModel(context, () => SolarDataComponentModel());
  }

  @override
  void dispose() {
    solarPCBannerComponentModel.dispose();
    nameTextFieldFocusNode?.dispose();
    nameTextFieldTextController?.dispose();

    lastNameTextFieldFocusNode?.dispose();
    lastNameTextFieldTextController?.dispose();

    phoneTextFieldFocusNode?.dispose();
    phoneTextFieldTextController?.dispose();

    thaiIdTextFieldFocusNode?.dispose();
    thaiIdTextFieldTextController?.dispose();

    solarDataComponentModel.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
