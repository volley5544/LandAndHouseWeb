import '/agent_customer/check_rate/check_rate_l_h_form_component/check_rate_l_h_form_component_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'check_rate_l_h_page_widget.dart' show CheckRateLHPageWidget;
import 'package:flutter/material.dart';

class CheckRateLHPageModel extends FlutterFlowModel<CheckRateLHPageWidget> {
  ///  Local state fields for this page.

  bool isFormState = true;

  CheckRateDataModelStruct? checkRateData;
  void updateCheckRateDataStruct(Function(CheckRateDataModelStruct) updateFn) {
    updateFn(checkRateData ??= CheckRateDataModelStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in CheckRateLHPage widget.
  ApplicationRecord? queryAPIUrl;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // Model for CheckRateLHFormComponent component.
  late CheckRateLHFormComponentModel checkRateLHFormComponentModel;
  // Stores action output result for [Custom Action - requestCameraPermission] action in Text widget.
  String? test;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    checkRateLHFormComponentModel =
        createModel(context, () => CheckRateLHFormComponentModel());
  }

  @override
  void dispose() {
    columnController?.dispose();
    checkRateLHFormComponentModel.dispose();
  }
}
