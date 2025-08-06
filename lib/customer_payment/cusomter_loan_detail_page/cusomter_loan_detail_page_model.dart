import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/customer_loan_detail/loan_detail_card_component/loan_detail_card_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'cusomter_loan_detail_page_widget.dart'
    show CusomterLoanDetailPageWidget;
import 'package:flutter/material.dart';

class CusomterLoanDetailPageModel
    extends FlutterFlowModel<CusomterLoanDetailPageWidget> {
  ///  Local state fields for this page.

  String idCardImageUrl = 'url';

  String selfiePlusIdCardImageUrl = 'url';

  PdfLoanDocDataModelStruct? pdfDocData;
  void updatePdfDocDataStruct(Function(PdfLoanDocDataModelStruct) updateFn) {
    updateFn(pdfDocData ??= PdfLoanDocDataModelStruct());
  }

  FFUploadedFile? request;

  FFUploadedFile? receipt;

  FFUploadedFile? agreement;

  int? loopCountTemp = 0;

  FFUploadedFile? idCardFile;

  FFUploadedFile? selfiePlusIdCardFile;

  bool isSecondTime = false;

  SavePdfDataModelStruct? savePdfData;
  void updateSavePdfDataStruct(Function(SavePdfDataModelStruct) updateFn) {
    updateFn(savePdfData ??= SavePdfDataModelStruct());
  }

  bool boolTemp = true;

  bool uploadingImage = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (get list of loan.)] action in CusomterLoanDetailPage widget.
  ApiCallResponse? getLoanListOutput;
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
