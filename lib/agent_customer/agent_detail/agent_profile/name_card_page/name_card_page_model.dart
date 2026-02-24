import '/flutter_flow/flutter_flow_util.dart';
import '/m_g_m_agent/web_app_bar_component/web_app_bar_component_widget.dart';
import '/index.dart';
import 'name_card_page_widget.dart' show NameCardPageWidget;
import 'package:flutter/material.dart';

class NameCardPageModel extends FlutterFlowModel<NameCardPageWidget> {
  ///  State fields for stateful widgets in this page.

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
