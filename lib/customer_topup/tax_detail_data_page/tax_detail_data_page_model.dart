import '/customer_topup/loan_detail_card_component/loan_detail_card_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'tax_detail_data_page_widget.dart' show TaxDetailDataPageWidget;
import 'package:flutter/material.dart';

class TaxDetailDataPageModel extends FlutterFlowModel<TaxDetailDataPageWidget> {
  ///  Local state fields for this page.

  String fullVehicleImageUrl = 'url';

  String circleImageUrl = 'url';

  String imageFront = 'url';

  String imageBack = 'url';

  String imageLeft = 'url';

  String imageRight = 'url';

  String imageMile = 'url';

  FFUploadedFile? fullVehicleFile;

  FFUploadedFile? circleFile;

  bool isLoad = false;

  FFUploadedFile? rightFile;

  FFUploadedFile? leftFile;

  FFUploadedFile? frontFile;

  FFUploadedFile? backFile;

  FFUploadedFile? mileFile;

  ///  State fields for stateful widgets in this page.

  // Model for LoanDetailCardComponent component.
  late LoanDetailCardComponentModel loanDetailCardComponentModel;
  bool isDataUploading_fullVehicleImageUploadAction = false;
  FFUploadedFile uploadedLocalFile_fullVehicleImageUploadAction =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - uploadFileFirebaseStorage] action in Button widget.
  String? fullVehicleImageUrlOutput;
  bool isDataUploading_imageRightUploadAction = false;
  FFUploadedFile uploadedLocalFile_imageRightUploadAction =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - uploadFileFirebaseStorage] action in Button widget.
  String? imageRightUrlOutput;
  bool isDataUploading_imageLeftUploadAction = false;
  FFUploadedFile uploadedLocalFile_imageLeftUploadAction =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - uploadFileFirebaseStorage] action in Button widget.
  String? leftImageUrlOutput;
  bool isDataUploading_imageFrontUploadAction = false;
  FFUploadedFile uploadedLocalFile_imageFrontUploadAction =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - uploadFileFirebaseStorage] action in Button widget.
  String? imageFrontUrlOutput;
  bool isDataUploading_imageBackUploadAction = false;
  FFUploadedFile uploadedLocalFile_imageBackUploadAction =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - uploadFileFirebaseStorage] action in Button widget.
  String? imageBackUrlOutput;
  bool isDataUploading_imageMileUploadAction = false;
  FFUploadedFile uploadedLocalFile_imageMileUploadAction =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - uploadFileFirebaseStorage] action in Button widget.
  String? imageMileUrlOutput;
  bool isDataUploading_circleImageUploadAction = false;
  FFUploadedFile uploadedLocalFile_circleImageUploadAction =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - uploadFileFirebaseStorage] action in Button widget.
  String? circleImageUrlOutput;
  // Stores action output result for [Bottom Sheet - CameraTriggerComponent] action in Button widget.
  FFUploadedFile? vehicleImageFile;
  // Stores action output result for [Custom Action - uploadFileFirebaseStorage] action in Button widget.
  String? fullVehicleImageUrlOutputButton;
  // Stores action output result for [Bottom Sheet - CameraTriggerComponent] action in Button widget.
  FFUploadedFile? circleImageFile;
  // Stores action output result for [Custom Action - uploadFileFirebaseStorage] action in Button widget.
  String? circleImageImageUrlOutputButton;
  // Stores action output result for [Custom Action - encodeBase64FromFFFile] action in Button widget.
  String? fullVehicleImageBase64;
  // Stores action output result for [Custom Action - encodeBase64FromFFFile] action in Button widget.
  String? circleImageBase64;
  // Stores action output result for [Bottom Sheet - CameraTriggerComponent] action in Button widget.
  FFUploadedFile? circleCImageFile;
  // Stores action output result for [Custom Action - uploadFileFirebaseStorage] action in Button widget.
  String? circleCImageUrlOutputButton;
  // Stores action output result for [Bottom Sheet - CameraTriggerComponent] action in Button widget.
  FFUploadedFile? rightImageFile;
  // Stores action output result for [Custom Action - uploadFileFirebaseStorage] action in Button widget.
  String? rightImageUrlOutputButton;
  // Stores action output result for [Custom Action - encodeBase64FromFFFile] action in Button widget.
  String? circleImageBase64C;
  // Stores action output result for [Custom Action - encodeBase64FromFFFile] action in Button widget.
  String? rightImageBase64;
  // Stores action output result for [Custom Action - encodeBase64FromFFFile] action in Button widget.
  String? leftImageBase64;
  // Stores action output result for [Custom Action - encodeBase64FromFFFile] action in Button widget.
  String? frontImageBase64;
  // Stores action output result for [Custom Action - encodeBase64FromFFFile] action in Button widget.
  String? backImageBase64;
  // Stores action output result for [Custom Action - encodeBase64FromFFFile] action in Button widget.
  String? mileImageBase64;

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
