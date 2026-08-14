import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/customer_topup/empty_component_topup/empty_component_topup_widget.dart';
import '/customer_topup/navigate_topup_component/navigate_topup_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'ploan_card_page01_widget.dart' show PloanCardPage01Widget;
import 'package:flutter/material.dart';

class PloanCardPage01Model extends FlutterFlowModel<PloanCardPage01Widget> {
  ///  Local state fields for this page.

  bool isLoadFirestoreCompleted = false;

  String videoPath = 'nodata1';

  int? tabSelested = 1;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - saveVideoFile] action in PloanCardPage01 widget.
  String? resultText;
  // Stores action output result for [Custom Action - getFFUploadFileFromFilePath] action in PloanCardPage01 widget.
  FFUploadedFile? fileVideoOutput;
  // Stores action output result for [Backend Call - Read Document] action in PloanCardPage01 widget.
  ApplicationRecord? configOutput;
  // Stores action output result for [Backend Call - API (userDetail)] action in PloanCardPage01 widget.
  ApiCallResponse? userDetailOutput;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Model for NavigateTopupComponent component.
  late NavigateTopupComponentModel navigateTopupComponentModel;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 0;

  // Model for EmptyComponentTopup component.
  late EmptyComponentTopupModel emptyComponentTopupModel;

  @override
  void initState(BuildContext context) {
    navigateTopupComponentModel =
        createModel(context, () => NavigateTopupComponentModel());
    emptyComponentTopupModel =
        createModel(context, () => EmptyComponentTopupModel());
  }

  @override
  void dispose() {
    navigateTopupComponentModel.dispose();
    emptyComponentTopupModel.dispose();
  }

  /// Action blocks.
  Future listenCameraActionEventBlock(BuildContext context) async {
    await actions.listenWebviewEventCamera(
      context,
      (cameraBase64, actionNameOutput) async {
        if (actionNameOutput == 'VideoRecord') {
          videoPath = cameraBase64;
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                content: Text(cameraBase64),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              );
            },
          );
        }
      },
    );
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
