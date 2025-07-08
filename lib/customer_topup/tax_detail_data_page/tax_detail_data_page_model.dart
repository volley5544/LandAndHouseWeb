import '/customer_topup/loan_detail_card_component/loan_detail_card_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'tax_detail_data_page_widget.dart' show TaxDetailDataPageWidget;
import 'package:flutter/material.dart';

class TaxDetailDataPageModel extends FlutterFlowModel<TaxDetailDataPageWidget> {
  ///  Local state fields for this page.

  String fullVehicleImageUrl = 'url';

  String circleImageUrl = 'url';

  ///  State fields for stateful widgets in this page.

  // Model for LoanDetailCardComponent component.
  late LoanDetailCardComponentModel loanDetailCardComponentModel;
  bool isDataUploading_fullVehicleImageUploadAction = false;
  FFUploadedFile uploadedLocalFile_fullVehicleImageUploadAction =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - uploadFileFirebaseStorage] action in Button widget.
  String? fullVehicleImageUrlOutput;
  bool isDataUploading_circleImageUploadAction = false;
  FFUploadedFile uploadedLocalFile_circleImageUploadAction =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - uploadFileFirebaseStorage] action in Button widget.
  String? circleImageUrlOutput;
  // Stores action output result for [Custom Action - encodeBase64FromFFFile] action in Button widget.
  String? fullVehicleImageBase64;
  // Stores action output result for [Custom Action - encodeBase64FromFFFile] action in Button widget.
  String? circleImageBase64;

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
