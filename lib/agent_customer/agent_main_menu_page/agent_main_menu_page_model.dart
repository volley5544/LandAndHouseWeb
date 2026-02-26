import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/m_g_m_agent/web_app_bar_component/web_app_bar_component_widget.dart';
import '/index.dart';
import 'agent_main_menu_page_widget.dart' show AgentMainMenuPageWidget;
import 'package:flutter/material.dart';

class AgentMainMenuPageModel extends FlutterFlowModel<AgentMainMenuPageWidget> {
  ///  Local state fields for this page.

  String? base64;

  FFUploadedFile? idCardFilehome;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Action Block - checkAuth] action in AgentMainMenuPage widget.
  bool? checkAuthOutput;
  // Stores action output result for [Backend Call - Read Document] action in AgentMainMenuPage widget.
  ApplicationRecord? queryUrl;
  // Stores action output result for [Backend Call - API (AgentProfileAPI)] action in AgentMainMenuPage widget.
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
