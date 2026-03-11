import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'assign_m_c_lead_page_widget.dart' show AssignMCLeadPageWidget;
import 'package:flutter/material.dart';

class AssignMCLeadPageModel extends FlutterFlowModel<AssignMCLeadPageWidget> {
  ///  Local state fields for this page.

  List<AssignLeadMCDataModelStruct> assignForList = [];
  void addToAssignForList(AssignLeadMCDataModelStruct item) =>
      assignForList.add(item);
  void removeFromAssignForList(AssignLeadMCDataModelStruct item) =>
      assignForList.remove(item);
  void removeAtIndexFromAssignForList(int index) =>
      assignForList.removeAt(index);
  void insertAtIndexInAssignForList(
          int index, AssignLeadMCDataModelStruct item) =>
      assignForList.insert(index, item);
  void updateAssignForListAtIndex(
          int index, Function(AssignLeadMCDataModelStruct) updateFn) =>
      assignForList[index] = updateFn(assignForList[index]);

  List<AssignLeadMCDataModelStruct> assignToList = [];
  void addToAssignToList(AssignLeadMCDataModelStruct item) =>
      assignToList.add(item);
  void removeFromAssignToList(AssignLeadMCDataModelStruct item) =>
      assignToList.remove(item);
  void removeAtIndexFromAssignToList(int index) => assignToList.removeAt(index);
  void insertAtIndexInAssignToList(
          int index, AssignLeadMCDataModelStruct item) =>
      assignToList.insert(index, item);
  void updateAssignToListAtIndex(
          int index, Function(AssignLeadMCDataModelStruct) updateFn) =>
      assignToList[index] = updateFn(assignToList[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in AssignMCLeadPage widget.
  ApplicationRecord? queryAPIUrl;
  // Stores action output result for [Backend Call - API (GetListChanod)] action in AssignMCLeadPage widget.
  ApiCallResponse? getListChanod;
  // Stores action output result for [Backend Call - API (GetListMCAssign)] action in AssignMCLeadPage widget.
  ApiCallResponse? getListLeadMC;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Stores action output result for [Custom Action - open3CXAction] action in IconButton widget.
  bool? open3cx1;
  // Stores action output result for [Backend Call - API (getLeadCalledStatusDropdownAPI)] action in Button widget.
  ApiCallResponse? getCalledStatusCodeAssign;
  // Stores action output result for [Bottom Sheet - savedLeadCalledStatus] action in Button widget.
  String? savedCallStatusAssign;
  // State field(s) for TextField23 widget.
  FocusNode? textField23FocusNode;
  TextEditingController? textField23TextController;
  String? Function(BuildContext, String?)? textField23TextControllerValidator;
  // Stores action output result for [Custom Action - open3CXAction] action in IconButton widget.
  bool? open3cx2;
  // Stores action output result for [Backend Call - API (getLeadCalledStatusDropdownAPI)] action in Button widget.
  ApiCallResponse? getCalledStatusCode;
  // Stores action output result for [Bottom Sheet - savedLeadCalledStatus] action in Button widget.
  String? savedCallStatus;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    textField23FocusNode?.dispose();
    textField23TextController?.dispose();
  }
}
