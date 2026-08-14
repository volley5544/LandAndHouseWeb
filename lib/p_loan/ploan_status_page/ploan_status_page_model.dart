import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/customer_topup/loan_detail_card_topup_component/loan_detail_card_topup_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'ploan_status_page_widget.dart' show PloanStatusPageWidget;
import 'package:flutter/material.dart';

class PloanStatusPageModel extends FlutterFlowModel<PloanStatusPageWidget> {
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

  // Stores action output result for [Backend Call - API (get topup status detail )] action in PloanStatusPage widget.
  ApiCallResponse? getTopupStatusApiOutput;
  // Stores action output result for [Custom Action - convertBase64ToFFFiles] action in PloanStatusPage widget.
  FFUploadedFile? requestPdfByteFileOutput;
  // Stores action output result for [Custom Action - convertBase64ToFFFiles] action in PloanStatusPage widget.
  FFUploadedFile? receiptPdfByteFileOutput;
  // Stores action output result for [Custom Action - convertBase64ToFFFiles] action in PloanStatusPage widget.
  FFUploadedFile? agreementPdfByteFileOutput;
  // Stores action output result for [Custom Action - convertBase64ToFFFiles] action in PloanStatusPage widget.
  FFUploadedFile? bankIconFFFileOutput;
  // Model for LoanDetailCardTopupComponent component.
  late LoanDetailCardTopupComponentModel loanDetailCardTopupComponentModel;

  @override
  void initState(BuildContext context) {
    loanDetailCardTopupComponentModel =
        createModel(context, () => LoanDetailCardTopupComponentModel());
  }

  @override
  void dispose() {
    loanDetailCardTopupComponentModel.dispose();
  }

  /// Action blocks.
  Future checkIdCardPhotoBlock(BuildContext context) async {}
}
