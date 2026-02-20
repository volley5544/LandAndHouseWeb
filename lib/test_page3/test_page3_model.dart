import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'test_page3_widget.dart' show TestPage3Widget;
import 'package:flutter/material.dart';

class TestPage3Model extends FlutterFlowModel<TestPage3Widget> {
  ///  Local state fields for this page.

  CheckinDataModelStruct? checkinData;
  void updateCheckinDataStruct(Function(CheckinDataModelStruct) updateFn) {
    updateFn(checkinData ??= CheckinDataModelStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (checkinStreamingAPI)] action in TestPage3 widget.
  ApiCallResponse? streamApiResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
