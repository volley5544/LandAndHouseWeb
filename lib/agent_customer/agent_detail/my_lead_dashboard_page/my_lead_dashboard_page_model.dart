import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'my_lead_dashboard_page_widget.dart' show MyLeadDashboardPageWidget;
import 'package:flutter/material.dart';

class MyLeadDashboardPageModel
    extends FlutterFlowModel<MyLeadDashboardPageWidget> {
  ///  Local state fields for this page.

  LeadAgentMainCatagoryStruct? doneDealLeadData;
  void updateDoneDealLeadDataStruct(
      Function(LeadAgentMainCatagoryStruct) updateFn) {
    updateFn(doneDealLeadData ??= LeadAgentMainCatagoryStruct());
  }

  LeadAgentMainCatagoryStruct? newCustomerLeadData;
  void updateNewCustomerLeadDataStruct(
      Function(LeadAgentMainCatagoryStruct) updateFn) {
    updateFn(newCustomerLeadData ??= LeadAgentMainCatagoryStruct());
  }

  LeadAgentMainCatagoryStruct? onProcessLeadData;
  void updateOnProcessLeadDataStruct(
      Function(LeadAgentMainCatagoryStruct) updateFn) {
    updateFn(onProcessLeadData ??= LeadAgentMainCatagoryStruct());
  }

  List<LeadAgentDataModelStruct> showingLeadData = [];
  void addToShowingLeadData(LeadAgentDataModelStruct item) =>
      showingLeadData.add(item);
  void removeFromShowingLeadData(LeadAgentDataModelStruct item) =>
      showingLeadData.remove(item);
  void removeAtIndexFromShowingLeadData(int index) =>
      showingLeadData.removeAt(index);
  void insertAtIndexInShowingLeadData(
          int index, LeadAgentDataModelStruct item) =>
      showingLeadData.insert(index, item);
  void updateShowingLeadDataAtIndex(
          int index, Function(LeadAgentDataModelStruct) updateFn) =>
      showingLeadData[index] = updateFn(showingLeadData[index]);

  List<LeadAgentMainCatagoryStruct> allLeadData = [];
  void addToAllLeadData(LeadAgentMainCatagoryStruct item) =>
      allLeadData.add(item);
  void removeFromAllLeadData(LeadAgentMainCatagoryStruct item) =>
      allLeadData.remove(item);
  void removeAtIndexFromAllLeadData(int index) => allLeadData.removeAt(index);
  void insertAtIndexInAllLeadData(
          int index, LeadAgentMainCatagoryStruct item) =>
      allLeadData.insert(index, item);
  void updateAllLeadDataAtIndex(
          int index, Function(LeadAgentMainCatagoryStruct) updateFn) =>
      allLeadData[index] = updateFn(allLeadData[index]);

  List<LeadAgentDataModelStruct> allLeadList = [];
  void addToAllLeadList(LeadAgentDataModelStruct item) => allLeadList.add(item);
  void removeFromAllLeadList(LeadAgentDataModelStruct item) =>
      allLeadList.remove(item);
  void removeAtIndexFromAllLeadList(int index) => allLeadList.removeAt(index);
  void insertAtIndexInAllLeadList(int index, LeadAgentDataModelStruct item) =>
      allLeadList.insert(index, item);
  void updateAllLeadListAtIndex(
          int index, Function(LeadAgentDataModelStruct) updateFn) =>
      allLeadList[index] = updateFn(allLeadList[index]);

  List<LeadAgentDataModelStruct> temp = [];
  void addToTemp(LeadAgentDataModelStruct item) => temp.add(item);
  void removeFromTemp(LeadAgentDataModelStruct item) => temp.remove(item);
  void removeAtIndexFromTemp(int index) => temp.removeAt(index);
  void insertAtIndexInTemp(int index, LeadAgentDataModelStruct item) =>
      temp.insert(index, item);
  void updateTempAtIndex(
          int index, Function(LeadAgentDataModelStruct) updateFn) =>
      temp[index] = updateFn(temp[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetLeadAgentByType)] action in MyLeadDashboardPage widget.
  ApiCallResponse? getLeadAgentApiOutput;
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
  // Stores action output result for [Bottom Sheet - SelectPaymentByLead] action in Button widget.
  String? paymentMethodSelected;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchTextFieldFocusNode?.dispose();
    searchTextFieldTextController?.dispose();
  }
}
