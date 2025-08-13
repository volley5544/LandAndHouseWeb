import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/customer_topup/loan_detail_card_topup_component/loan_detail_card_topup_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'topup_conclusion_page_widget.dart' show TopupConclusionPageWidget;
import 'package:flutter/material.dart';

class TopupConclusionPageModel
    extends FlutterFlowModel<TopupConclusionPageWidget> {
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

  // Stores action output result for [Backend Call - API (Send an pdf to user)] action in TopupConclusionPage widget.
  ApiCallResponse? getPdfLoanDocApiOutput;
  // Stores action output result for [Custom Action - convertBase64ToFFFiles] action in TopupConclusionPage widget.
  FFUploadedFile? requestPdfByteFileOutput;
  // Stores action output result for [Custom Action - convertBase64ToFFFiles] action in TopupConclusionPage widget.
  FFUploadedFile? receiptPdfByteFileOutput;
  // Stores action output result for [Custom Action - convertBase64ToFFFiles] action in TopupConclusionPage widget.
  FFUploadedFile? agreementPdfByteFileOutput;
  // Model for LoanDetailCardTopupComponent component.
  late LoanDetailCardTopupComponentModel loanDetailCardTopupComponentModel;
  bool isDataUploading_uploadIdCardAction = false;
  FFUploadedFile uploadedLocalFile_uploadIdCardAction =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (visionThaiId)] action in Button widget.
  ApiCallResponse? visionOutputThaiId;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  bool? changeDateOutput;
  // Stores action output result for [Custom Action - uploadFileFirebaseStorage] action in Button widget.
  String? idCardImageUrlOutput;
  bool isDataUploading_uploadSelfieAction = false;
  FFUploadedFile uploadedLocalFile_uploadSelfieAction =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - uploadFileFirebaseStorage] action in Button widget.
  String? selfieImageUrlOutput;
  // Stores action output result for [Bottom Sheet - CapturePictureComponent] action in Button widget.
  FFUploadedFile? cameraTriggerComponentReturn;
  // Stores action output result for [Backend Call - API (visionThaiId)] action in Button widget.
  ApiCallResponse? visionThaiIdOutputButton;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  bool? changeDateOutputButton;
  // Stores action output result for [Bottom Sheet - CapturePictureComponent] action in Button widget.
  FFUploadedFile? cameraTriggerComponentReturn2;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  bool? saveTopupConfirm;
  // Stores action output result for [Custom Action - encodeBase64FromFFFile] action in Button widget.
  String? idCardImageBase64;
  // Stores action output result for [Custom Action - encodeBase64FromFFFile] action in Button widget.
  String? selfieImageBase64;
  // Stores action output result for [Backend Call - API (Save new topup)] action in Button widget.
  ApiCallResponse? saveTopupOutput;

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
