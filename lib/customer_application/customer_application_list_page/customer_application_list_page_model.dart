import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/m_g_m_agent/web_app_bar_component/web_app_bar_component_widget.dart';
import '/index.dart';
import 'customer_application_list_page_widget.dart'
    show CustomerApplicationListPageWidget;
import 'package:flutter/material.dart';

class CustomerApplicationListPageModel
    extends FlutterFlowModel<CustomerApplicationListPageWidget> {
  ///  Local state fields for this page.

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

  List<LeadAgentCategoryDataModelStruct> categoryData = [];
  void addToCategoryData(LeadAgentCategoryDataModelStruct item) =>
      categoryData.add(item);
  void removeFromCategoryData(LeadAgentCategoryDataModelStruct item) =>
      categoryData.remove(item);
  void removeAtIndexFromCategoryData(int index) => categoryData.removeAt(index);
  void insertAtIndexInCategoryData(
          int index, LeadAgentCategoryDataModelStruct item) =>
      categoryData.insert(index, item);
  void updateCategoryDataAtIndex(
          int index, Function(LeadAgentCategoryDataModelStruct) updateFn) =>
      categoryData[index] = updateFn(categoryData[index]);

  String? dataDate;

  List<String> listStringApprove = [
    'รายชื่อใหม่',
    'อยู่ระหว่างติดต่อลูกค้า',
    'อยู่ระหว่างการทำสัญญา',
    'ทำสัญญาแล้ว'
  ];
  void addToListStringApprove(String item) => listStringApprove.add(item);
  void removeFromListStringApprove(String item) =>
      listStringApprove.remove(item);
  void removeAtIndexFromListStringApprove(int index) =>
      listStringApprove.removeAt(index);
  void insertAtIndexInListStringApprove(int index, String item) =>
      listStringApprove.insert(index, item);
  void updateListStringApproveAtIndex(int index, Function(String) updateFn) =>
      listStringApprove[index] = updateFn(listStringApprove[index]);

  List<String> listStringReject = [
    'รายชื่อหมดอายุดำเนินการ',
    'รายชื่อซ้ำ',
    'ไม่เข้าเงื่อนไข/ไม่สนใจ'
  ];
  void addToListStringReject(String item) => listStringReject.add(item);
  void removeFromListStringReject(String item) => listStringReject.remove(item);
  void removeAtIndexFromListStringReject(int index) =>
      listStringReject.removeAt(index);
  void insertAtIndexInListStringReject(int index, String item) =>
      listStringReject.insert(index, item);
  void updateListStringRejectAtIndex(int index, Function(String) updateFn) =>
      listStringReject[index] = updateFn(listStringReject[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Action Block - checkAuth] action in CustomerApplicationListPage widget.
  bool? checkAuthOutput;
  // Stores action output result for [Backend Call - API (GetLeadAgentByTypeNew)] action in CustomerApplicationListPage widget.
  ApiCallResponse? getLeadAgentApiOutput;
  // Stores action output result for [Firestore Query - Query a collection] action in CustomerApplicationListPage widget.
  ApplicationRecord? appConfig;
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
  // Stores action output result for [Bottom Sheet - SelectPaymentByLead] action in Button widget.
  String? paymentMethodSelected;
  // Stores action output result for [Backend Call - API (GetLeadAgentByTypeNew)] action in Button widget.
  ApiCallResponse? getLeadAgentApiPaymentButtonOutput;

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
