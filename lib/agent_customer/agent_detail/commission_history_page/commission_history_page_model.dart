import '/agent_customer/agent_detail/commission_history_component/commission_history_component_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'commission_history_page_widget.dart' show CommissionHistoryPageWidget;
import 'package:flutter/material.dart';

class CommissionHistoryPageModel
    extends FlutterFlowModel<CommissionHistoryPageWidget> {
  ///  Local state fields for this page.

  List<AgentCommisionHistoryDataModelStruct> comissionHistoryPage = [];
  void addToComissionHistoryPage(AgentCommisionHistoryDataModelStruct item) =>
      comissionHistoryPage.add(item);
  void removeFromComissionHistoryPage(
          AgentCommisionHistoryDataModelStruct item) =>
      comissionHistoryPage.remove(item);
  void removeAtIndexFromComissionHistoryPage(int index) =>
      comissionHistoryPage.removeAt(index);
  void insertAtIndexInComissionHistoryPage(
          int index, AgentCommisionHistoryDataModelStruct item) =>
      comissionHistoryPage.insert(index, item);
  void updateComissionHistoryPageAtIndex(
          int index, Function(AgentCommisionHistoryDataModelStruct) updateFn) =>
      comissionHistoryPage[index] = updateFn(comissionHistoryPage[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (commission history)] action in commissionHistoryPage widget.
  ApiCallResponse? commissionOutput;
  // Model for commissionHistoryComponent component.
  late CommissionHistoryComponentModel commissionHistoryComponentModel;

  @override
  void initState(BuildContext context) {
    commissionHistoryComponentModel =
        createModel(context, () => CommissionHistoryComponentModel());
  }

  @override
  void dispose() {
    commissionHistoryComponentModel.dispose();
  }
}
