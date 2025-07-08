import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/customer_topup/loan_detail_card_component/loan_detail_card_component_widget.dart';
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

  bool skipCurrentIndexLoop = false;

  ///  State fields for stateful widgets in this page.

  // Model for LoanDetailCardComponent component.
  late LoanDetailCardComponentModel loanDetailCardComponentModel;
  bool isDataUploading_idCardImageUploadAction = false;
  FFUploadedFile uploadedLocalFile_idCardImageUploadAction =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - uploadFileFirebaseStorage] action in Button widget.
  String? idCardImageUrlOutput;
  bool isDataUploading_selfieImageUploadAction = false;
  FFUploadedFile uploadedLocalFile_selfieImageUploadAction =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - uploadFileFirebaseStorage] action in Button widget.
  String? circleImageUrlOutput;
  bool isDataUploading_uploadImageConfirmButton = false;
  FFUploadedFile uploadedLocalFile_uploadImageConfirmButton =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - uploadFileFirebaseStorage] action in Button widget.
  String? uploadImageUrlConfirmButton;
  // Stores action output result for [Custom Action - checkLocationServicePermission] action in Button widget.
  bool? checkLocationServicePermission;

  @override
  void initState(BuildContext context) {
    loanDetailCardComponentModel =
        createModel(context, () => LoanDetailCardComponentModel());
  }

  @override
  void dispose() {
    loanDetailCardComponentModel.dispose();
  }
}
