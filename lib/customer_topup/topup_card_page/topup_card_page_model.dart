import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/customer_topup/empty_component_topup/empty_component_topup_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/index.dart';
import 'topup_card_page_widget.dart' show TopupCardPageWidget;
import 'package:flutter/material.dart';

class TopupCardPageModel extends FlutterFlowModel<TopupCardPageWidget> {
  ///  Local state fields for this page.

  bool isLoadFirestoreCompleted = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in topupCardPage widget.
  ApplicationRecord? configOutput;
  // Stores action output result for [Backend Call - API (userDetail)] action in topupCardPage widget.
  ApiCallResponse? userDetailOutput;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // Model for EmptyComponentTopup component.
  late EmptyComponentTopupModel emptyComponentTopupModel;

  @override
  void initState(BuildContext context) {
    emptyComponentTopupModel =
        createModel(context, () => EmptyComponentTopupModel());
  }

  @override
  void dispose() {
    emptyComponentTopupModel.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
