import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'agent_main_menu_page_widget.dart' show AgentMainMenuPageWidget;
import 'package:flutter/material.dart';

class AgentMainMenuPageModel extends FlutterFlowModel<AgentMainMenuPageWidget> {
  ///  Local state fields for this page.

  String? base64;

  FFUploadedFile? idCardFilehome;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - convertBase64ToFFFiles] action in AgentMainMenuPage widget.
  FFUploadedFile? generateFFUploadFile;
  // Stores action output result for [Backend Call - Read Document] action in AgentMainMenuPage widget.
  ApplicationRecord? queryUrl;
  // Stores action output result for [Backend Call - API (AgentProfileAPI)] action in AgentMainMenuPage widget.
  ApiCallResponse? agentAPIOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
