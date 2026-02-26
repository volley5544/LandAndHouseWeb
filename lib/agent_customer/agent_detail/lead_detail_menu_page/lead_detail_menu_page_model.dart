import '/flutter_flow/flutter_flow_util.dart';
import '/m_g_m_agent/web_app_bar_component/web_app_bar_component_widget.dart';
import '/index.dart';
import 'lead_detail_menu_page_widget.dart' show LeadDetailMenuPageWidget;
import 'package:flutter/material.dart';

class LeadDetailMenuPageModel
    extends FlutterFlowModel<LeadDetailMenuPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Action Block - checkAuth] action in LeadDetailMenuPage widget.
  bool? checkAuthOutput;
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
