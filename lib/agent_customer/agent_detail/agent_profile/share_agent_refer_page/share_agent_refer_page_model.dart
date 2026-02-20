import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/m_g_m_agent/web_app_bar_component/web_app_bar_component_widget.dart';
import '/index.dart';
import 'share_agent_refer_page_widget.dart' show ShareAgentReferPageWidget;
import 'package:flutter/material.dart';

class ShareAgentReferPageModel
    extends FlutterFlowModel<ShareAgentReferPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in ShareAgentReferPage widget.
  ApplicationRecord? queryUrl;
  // Stores action output result for [Backend Call - API (AgentProfileAPI)] action in ShareAgentReferPage widget.
  ApiCallResponse? agentAPIOutput;
  // Model for WebAppBarComponent component.
  late WebAppBarComponentModel webAppBarComponentModel;

  @override
  void initState(BuildContext context) {
    webAppBarComponentModel =
        createModel(context, () => WebAppBarComponentModel());
  }

  @override
  void dispose() {
    webAppBarComponentModel.dispose();
  }
}
