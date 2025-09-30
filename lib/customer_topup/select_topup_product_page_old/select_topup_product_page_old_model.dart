import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'select_topup_product_page_old_widget.dart'
    show SelectTopupProductPageOldWidget;
import 'package:flutter/material.dart';

class SelectTopupProductPageOldModel
    extends FlutterFlowModel<SelectTopupProductPageOldWidget> {
  ///  Local state fields for this page.

  int? checkBoxSelected = 999;

  List<String> tempListPageState = ['1', '2', '3', '4', '5', '6', '7'];
  void addToTempListPageState(String item) => tempListPageState.add(item);
  void removeFromTempListPageState(String item) =>
      tempListPageState.remove(item);
  void removeAtIndexFromTempListPageState(int index) =>
      tempListPageState.removeAt(index);
  void insertAtIndexInTempListPageState(int index, String item) =>
      tempListPageState.insert(index, item);
  void updateTempListPageStateAtIndex(int index, Function(String) updateFn) =>
      tempListPageState[index] = updateFn(tempListPageState[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
