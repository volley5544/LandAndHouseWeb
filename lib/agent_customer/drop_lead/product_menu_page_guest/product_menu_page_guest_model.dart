import '/flutter_flow/flutter_flow_util.dart';
import '/m_g_m_agent/web_app_bar_component/web_app_bar_component_widget.dart';
import '/index.dart';
import 'product_menu_page_guest_widget.dart' show ProductMenuPageGuestWidget;
import 'package:flutter/material.dart';

class ProductMenuPageGuestModel
    extends FlutterFlowModel<ProductMenuPageGuestWidget> {
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
