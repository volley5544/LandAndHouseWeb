import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/m_g_m_agent/web_app_bar_component/web_app_bar_component_widget.dart';
import '/index.dart';
import 'my_wallet_page_widget.dart' show MyWalletPageWidget;
import 'package:flutter/material.dart';

class MyWalletPageModel extends FlutterFlowModel<MyWalletPageWidget> {
  ///  Local state fields for this page.

  MyWalletDataModelStruct? walletData;
  void updateWalletDataStruct(Function(MyWalletDataModelStruct) updateFn) {
    updateFn(walletData ??= MyWalletDataModelStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Action Block - checkAuth] action in MyWalletPage widget.
  bool? checkAuthOutput;
  // Stores action output result for [Backend Call - API (CommissionMonthlyApi)] action in MyWalletPage widget.
  ApiCallResponse? commissionMonthlyApiOutput;
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
