import '/agent_customer/drop_lead/review_detail_agent_component/review_detail_agent_component_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/banner_agent_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'verify_agent_widget.dart' show VerifyAgentWidget;
import 'package:flutter/material.dart';

class VerifyAgentModel extends FlutterFlowModel<VerifyAgentWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (AgentProfileAPI)] action in VerifyAgent widget.
  ApiCallResponse? agentAPIOutput;
  // Model for BannerAgentComponent component.
  late BannerAgentComponentModel bannerAgentComponentModel;
  // Model for ReviewDetailAgentComponent component.
  late ReviewDetailAgentComponentModel reviewDetailAgentComponentModel;

  @override
  void initState(BuildContext context) {
    bannerAgentComponentModel =
        createModel(context, () => BannerAgentComponentModel());
    reviewDetailAgentComponentModel =
        createModel(context, () => ReviewDetailAgentComponentModel());
  }

  @override
  void dispose() {
    bannerAgentComponentModel.dispose();
    reviewDetailAgentComponentModel.dispose();
  }
}
