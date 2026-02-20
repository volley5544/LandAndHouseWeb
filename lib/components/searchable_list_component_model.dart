import '/flutter_flow/flutter_flow_util.dart';
import 'searchable_list_component_widget.dart'
    show SearchableListComponentWidget;
import 'package:flutter/material.dart';

class SearchableListComponentModel
    extends FlutterFlowModel<SearchableListComponentWidget> {
  ///  Local state fields for this component.

  List<String> searchingDataList = [];
  void addToSearchingDataList(String item) => searchingDataList.add(item);
  void removeFromSearchingDataList(String item) =>
      searchingDataList.remove(item);
  void removeAtIndexFromSearchingDataList(int index) =>
      searchingDataList.removeAt(index);
  void insertAtIndexInSearchingDataList(int index, String item) =>
      searchingDataList.insert(index, item);
  void updateSearchingDataListAtIndex(int index, Function(String) updateFn) =>
      searchingDataList[index] = updateFn(searchingDataList[index]);

  ///  State fields for stateful widgets in this component.

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
