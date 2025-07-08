import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'select_due_first_pay_widget.dart' show SelectDueFirstPayWidget;
import 'package:flutter/material.dart';

class SelectDueFirstPayModel extends FlutterFlowModel<SelectDueFirstPayWidget> {
  ///  Local state fields for this page.

  List<bool> falseList = [];
  void addToFalseList(bool item) => falseList.add(item);
  void removeFromFalseList(bool item) => falseList.remove(item);
  void removeAtIndexFromFalseList(int index) => falseList.removeAt(index);
  void insertAtIndexInFalseList(int index, bool item) =>
      falseList.insert(index, item);
  void updateFalseListAtIndex(int index, Function(bool) updateFn) =>
      falseList[index] = updateFn(falseList[index]);

  List<TenorListDataModelStruct> tenorListData = [];
  void addToTenorListData(TenorListDataModelStruct item) =>
      tenorListData.add(item);
  void removeFromTenorListData(TenorListDataModelStruct item) =>
      tenorListData.remove(item);
  void removeAtIndexFromTenorListData(int index) =>
      tenorListData.removeAt(index);
  void insertAtIndexInTenorListData(int index, TenorListDataModelStruct item) =>
      tenorListData.insert(index, item);
  void updateTenorListDataAtIndex(
          int index, Function(TenorListDataModelStruct) updateFn) =>
      tenorListData[index] = updateFn(tenorListData[index]);

  TenorListDataModelStruct? currentTenorListData;
  void updateCurrentTenorListDataStruct(
      Function(TenorListDataModelStruct) updateFn) {
    updateFn(currentTenorListData ??= TenorListDataModelStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in selectDueFirstPay widget.
  ApplicationRecord? tanjaiApi;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (ApproveInstallmentAPISave)] action in Button widget.
  ApiCallResponse? apiSaveInstallmentOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
