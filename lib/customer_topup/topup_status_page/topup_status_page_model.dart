import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/customer_topup/loan_detail_card_component/loan_detail_card_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'topup_status_page_widget.dart' show TopupStatusPageWidget;
import 'package:flutter/material.dart';

class TopupStatusPageModel extends FlutterFlowModel<TopupStatusPageWidget> {
  ///  Local state fields for this page.

  TopupStatusModelStruct? topupStatusData;
  void updateTopupStatusDataStruct(Function(TopupStatusModelStruct) updateFn) {
    updateFn(topupStatusData ??= TopupStatusModelStruct());
  }

  FFUploadedFile? request;

  FFUploadedFile? receipt;

  FFUploadedFile? agreement;

  int? loopCountTemp = 0;

  bool boolTemp = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (get topup status detail )] action in TopupStatusPage widget.
  ApiCallResponse? getTopupStatusApiOutput;
  // Stores action output result for [Custom Action - convertBase64ToFFFiles] action in TopupStatusPage widget.
  FFUploadedFile? requestPdfByteFileOutput;
  // Stores action output result for [Custom Action - convertBase64ToFFFiles] action in TopupStatusPage widget.
  FFUploadedFile? receiptPdfByteFileOutput;
  // Stores action output result for [Custom Action - convertBase64ToFFFiles] action in TopupStatusPage widget.
  FFUploadedFile? agreementPdfByteFileOutput;
  // Stores action output result for [Custom Action - convertBase64ToFFFiles] action in TopupStatusPage widget.
  FFUploadedFile? bankIconFFFileOutput;
  // Model for LoanDetailCardComponent component.
  late LoanDetailCardComponentModel loanDetailCardComponentModel;

  @override
  void initState(BuildContext context) {
    loanDetailCardComponentModel =
        createModel(context, () => LoanDetailCardComponentModel());
  }

  @override
  void dispose() {
    loanDetailCardComponentModel.dispose();
  }

  /// Action blocks.
  Future checkIdCardPhotoBlock(BuildContext context) async {}
}
