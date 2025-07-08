import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'assign_grocerystore_page_widget.dart' show AssignGrocerystorePageWidget;
import 'package:flutter/material.dart';

class AssignGrocerystorePageModel
    extends FlutterFlowModel<AssignGrocerystorePageWidget> {
  ///  Local state fields for this page.

  List<ChanodData3Struct> chanodlist = [];
  void addToChanodlist(ChanodData3Struct item) => chanodlist.add(item);
  void removeFromChanodlist(ChanodData3Struct item) => chanodlist.remove(item);
  void removeAtIndexFromChanodlist(int index) => chanodlist.removeAt(index);
  void insertAtIndexInChanodlist(int index, ChanodData3Struct item) =>
      chanodlist.insert(index, item);
  void updateChanodlistAtIndex(
          int index, Function(ChanodData3Struct) updateFn) =>
      chanodlist[index] = updateFn(chanodlist[index]);

  List<ChanodData3Struct> chanodlistto = [];
  void addToChanodlistto(ChanodData3Struct item) => chanodlistto.add(item);
  void removeFromChanodlistto(ChanodData3Struct item) =>
      chanodlistto.remove(item);
  void removeAtIndexFromChanodlistto(int index) => chanodlistto.removeAt(index);
  void insertAtIndexInChanodlistto(int index, ChanodData3Struct item) =>
      chanodlistto.insert(index, item);
  void updateChanodlisttoAtIndex(
          int index, Function(ChanodData3Struct) updateFn) =>
      chanodlistto[index] = updateFn(chanodlistto[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in AssignGrocerystorePage widget.
  ApplicationRecord? queryAPIUrl;
  // Stores action output result for [Backend Call - API (GetListGrocery)] action in AssignGrocerystorePage widget.
  ApiCallResponse? getListGrocery;
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
