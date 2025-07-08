import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_location_component_widget.dart'
    show SearchLocationComponentWidget;
import 'package:flutter/material.dart';

class SearchLocationComponentModel
    extends FlutterFlowModel<SearchLocationComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (GetMasterAddress)] action in SearchLocationComponent widget.
  ApiCallResponse? aPImasterOutput;
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
