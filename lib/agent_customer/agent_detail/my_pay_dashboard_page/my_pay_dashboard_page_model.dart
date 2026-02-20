import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/m_g_m_agent/web_app_bar_component/web_app_bar_component_widget.dart';
import '/index.dart';
import 'my_pay_dashboard_page_widget.dart' show MyPayDashboardPageWidget;
import 'package:flutter/material.dart';

class MyPayDashboardPageModel
    extends FlutterFlowModel<MyPayDashboardPageWidget> {
  ///  Local state fields for this page.

  AgentCommissionDataModelStruct? commissionData;
  void updateCommissionDataStruct(
      Function(AgentCommissionDataModelStruct) updateFn) {
    updateFn(commissionData ??= AgentCommissionDataModelStruct());
  }

  List<AgentCommissionLeadDataModelStruct> showingLeadData = [];
  void addToShowingLeadData(AgentCommissionLeadDataModelStruct item) =>
      showingLeadData.add(item);
  void removeFromShowingLeadData(AgentCommissionLeadDataModelStruct item) =>
      showingLeadData.remove(item);
  void removeAtIndexFromShowingLeadData(int index) =>
      showingLeadData.removeAt(index);
  void insertAtIndexInShowingLeadData(
          int index, AgentCommissionLeadDataModelStruct item) =>
      showingLeadData.insert(index, item);
  void updateShowingLeadDataAtIndex(
          int index, Function(AgentCommissionLeadDataModelStruct) updateFn) =>
      showingLeadData[index] = updateFn(showingLeadData[index]);

  bool statusRowActive = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (logout agent)] action in MyPayDashboardPage widget.
  ApiCallResponse? apiResultjxr;
  // Stores action output result for [Backend Call - API (GetCommissionLead)] action in MyPayDashboardPage widget.
  ApiCallResponse? getCommissionLeadApiOutput;
  // Model for WebAppBarComponent component.
  late WebAppBarComponentModel webAppBarComponentModel;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Text widget.
  dynamic advanceSearchOutput;
  // State field(s) for SearchTextField widget.
  FocusNode? searchTextFieldFocusNode;
  TextEditingController? searchTextFieldTextController;
  String? Function(BuildContext, String?)?
      searchTextFieldTextControllerValidator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  List<String>? get choiceChipsValues => choiceChipsValueController?.value;
  set choiceChipsValues(List<String>? val) =>
      choiceChipsValueController?.value = val;

  @override
  void initState(BuildContext context) {
    webAppBarComponentModel =
        createModel(context, () => WebAppBarComponentModel());
  }

  @override
  void dispose() {
    webAppBarComponentModel.dispose();
    searchTextFieldFocusNode?.dispose();
    searchTextFieldTextController?.dispose();
  }
}
