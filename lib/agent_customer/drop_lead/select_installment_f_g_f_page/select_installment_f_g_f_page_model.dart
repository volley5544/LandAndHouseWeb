import '/flutter_flow/flutter_flow_util.dart';
import '/m_g_m_agent/web_app_bar_component/web_app_bar_component_widget.dart';
import 'select_installment_f_g_f_page_widget.dart'
    show SelectInstallmentFGFPageWidget;
import 'package:flutter/material.dart';

class SelectInstallmentFGFPageModel
    extends FlutterFlowModel<SelectInstallmentFGFPageWidget> {
  ///  Local state fields for this page.

  int checkBoxSelected = 999;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Action Block - dropLeadStepCheck] action in selectInstallmentFGFPage widget.
  bool? dropLeadStepCheckOutput;
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
