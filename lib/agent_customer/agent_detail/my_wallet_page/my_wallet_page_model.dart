import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'my_wallet_page_widget.dart' show MyWalletPageWidget;
import 'package:flutter/material.dart';

class MyWalletPageModel extends FlutterFlowModel<MyWalletPageWidget> {
  ///  Local state fields for this page.

  MyWalletDataModelStruct? walletData;
  void updateWalletDataStruct(Function(MyWalletDataModelStruct) updateFn) {
    updateFn(walletData ??= MyWalletDataModelStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (CommissionMonthlyApi)] action in MyWalletPage widget.
  ApiCallResponse? commissionMonthlyApiOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
