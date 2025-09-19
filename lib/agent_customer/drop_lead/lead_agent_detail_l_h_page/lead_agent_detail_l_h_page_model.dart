import '/agent_customer/check_rate/check_rate_l_h_form_component/check_rate_l_h_form_component_widget.dart';
import '/agent_customer/drop_lead/progress_bar_component/progress_bar_component_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'lead_agent_detail_l_h_page_widget.dart'
    show LeadAgentDetailLHPageWidget;
import 'package:flutter/material.dart';

class LeadAgentDetailLHPageModel
    extends FlutterFlowModel<LeadAgentDetailLHPageWidget> {
  ///  Local state fields for this page.

  bool isFormState = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in LeadAgentDetailLHPage widget.
  ApplicationRecord? queryAPIUrl;
  // Model for progressBarComponent component.
  late ProgressBarComponentModel progressBarComponentModel;
  // Model for CheckRateLHFormComponent component.
  late CheckRateLHFormComponentModel checkRateLHFormComponentModel;

  @override
  void initState(BuildContext context) {
    progressBarComponentModel =
        createModel(context, () => ProgressBarComponentModel());
    checkRateLHFormComponentModel =
        createModel(context, () => CheckRateLHFormComponentModel());
  }

  @override
  void dispose() {
    progressBarComponentModel.dispose();
    checkRateLHFormComponentModel.dispose();
  }
}
