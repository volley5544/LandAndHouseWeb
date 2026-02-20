import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/m_g_m_agent/web_app_bar_component/web_app_bar_component_widget.dart';
import '/index.dart';
import 'agent_register_consent_page02_widget.dart'
    show AgentRegisterConsentPage02Widget;
import 'package:flutter/material.dart';

class AgentRegisterConsentPage02Model
    extends FlutterFlowModel<AgentRegisterConsentPage02Widget> {
  ///  Local state fields for this page.

  String linkidPageState = '0';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in AgentRegisterConsentPage02 widget.
  ApplicationRecord? queryUrl;
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
