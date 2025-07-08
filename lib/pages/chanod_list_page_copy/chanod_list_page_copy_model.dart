import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chanod_list_page_copy_widget.dart' show ChanodListPageCopyWidget;
import 'package:flutter/material.dart';

class ChanodListPageCopyModel
    extends FlutterFlowModel<ChanodListPageCopyWidget> {
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

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
