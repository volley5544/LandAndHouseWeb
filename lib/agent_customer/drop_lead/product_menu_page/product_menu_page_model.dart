import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/m_g_m_agent/web_app_bar_component/web_app_bar_component_widget.dart';
import '/index.dart';
import 'product_menu_page_widget.dart' show ProductMenuPageWidget;
import 'package:flutter/material.dart';

class ProductMenuPageModel extends FlutterFlowModel<ProductMenuPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in ProductMenuPage widget.
  ApplicationRecord? queryUrl;
  // Stores action output result for [Backend Call - API (AgentProfileAPI)] action in ProductMenuPage widget.
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
