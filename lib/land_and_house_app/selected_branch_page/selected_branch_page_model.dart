import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'selected_branch_page_widget.dart' show SelectedBranchPageWidget;
import 'package:flutter/material.dart';

class SelectedBranchPageModel
    extends FlutterFlowModel<SelectedBranchPageWidget> {
  ///  Local state fields for this page.

  List<BranchLocationModelStruct> branchData = [];
  void addToBranchData(BranchLocationModelStruct item) => branchData.add(item);
  void removeFromBranchData(BranchLocationModelStruct item) =>
      branchData.remove(item);
  void removeAtIndexFromBranchData(int index) => branchData.removeAt(index);
  void insertAtIndexInBranchData(int index, BranchLocationModelStruct item) =>
      branchData.insert(index, item);
  void updateBranchDataAtIndex(
          int index, Function(BranchLocationModelStruct) updateFn) =>
      branchData[index] = updateFn(branchData[index]);

  List<bool> selectList = [];
  void addToSelectList(bool item) => selectList.add(item);
  void removeFromSelectList(bool item) => selectList.remove(item);
  void removeAtIndexFromSelectList(int index) => selectList.removeAt(index);
  void insertAtIndexInSelectList(int index, bool item) =>
      selectList.insert(index, item);
  void updateSelectListAtIndex(int index, Function(bool) updateFn) =>
      selectList[index] = updateFn(selectList[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetlocationAPI)] action in selectedBranchPage widget.
  ApiCallResponse? getlocationAPI;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Backend Call - API (SaveAssignBranchApi)] action in Button widget.
  ApiCallResponse? saveAssignBranchApi2;
  // Stores action output result for [Backend Call - API (SaveAssignGroceryApi)] action in Button widget.
  ApiCallResponse? saveAssignGroceryApi;
  // Stores action output result for [Backend Call - API (SaveAssignLeadMCApi)] action in Button widget.
  ApiCallResponse? saveAssignLeadMCApi;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
