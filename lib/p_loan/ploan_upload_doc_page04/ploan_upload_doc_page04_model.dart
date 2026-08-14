import '/customer_topup/loan_detail_card_topup_component/loan_detail_card_topup_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'ploan_upload_doc_page04_widget.dart' show PloanUploadDocPage04Widget;
import 'package:flutter/material.dart';

class PloanUploadDocPage04Model
    extends FlutterFlowModel<PloanUploadDocPage04Widget> {
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

  String? fullVehicleBase64;

  String? circleBase64;

  String? rightBase64;

  String? leftBase64;

  String? frontBase64;

  String? backBase64;

  String? mileBase64;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - uploadFileFirebaseStorage] action in PloanUploadDocPage04 widget.
  String? fullVehicleImageUrlCallback;
  // Stores action output result for [Custom Action - convertBase64ToFFFiles] action in PloanUploadDocPage04 widget.
  FFUploadedFile? generateFullVehicleFile;
  // Stores action output result for [Custom Action - uploadFileFirebaseStorage] action in PloanUploadDocPage04 widget.
  String? circleImageUrlCallback;
  // Stores action output result for [Custom Action - convertBase64ToFFFiles] action in PloanUploadDocPage04 widget.
  FFUploadedFile? generateCircleFile;
  // Stores action output result for [Custom Action - uploadFileFirebaseStorage] action in PloanUploadDocPage04 widget.
  String? leftImageUrlCallback;
  // Stores action output result for [Custom Action - convertBase64ToFFFiles] action in PloanUploadDocPage04 widget.
  FFUploadedFile? generateLeftFile;
  // Stores action output result for [Custom Action - uploadFileFirebaseStorage] action in PloanUploadDocPage04 widget.
  String? rightImageUrlCallback;
  // Stores action output result for [Custom Action - convertBase64ToFFFiles] action in PloanUploadDocPage04 widget.
  FFUploadedFile? generateRightFile;
  // Stores action output result for [Custom Action - uploadFileFirebaseStorage] action in PloanUploadDocPage04 widget.
  String? frontImageUrlCallback;
  // Stores action output result for [Custom Action - convertBase64ToFFFiles] action in PloanUploadDocPage04 widget.
  FFUploadedFile? generateFrontFile;
  // Stores action output result for [Custom Action - uploadFileFirebaseStorage] action in PloanUploadDocPage04 widget.
  String? backImageUrlCallback;
  // Stores action output result for [Custom Action - convertBase64ToFFFiles] action in PloanUploadDocPage04 widget.
  FFUploadedFile? generateBackFile;
  // Stores action output result for [Custom Action - uploadFileFirebaseStorage] action in PloanUploadDocPage04 widget.
  String? mileImageUrlCallback;
  // Stores action output result for [Custom Action - convertBase64ToFFFiles] action in PloanUploadDocPage04 widget.
  FFUploadedFile? generateMileFile;
  // Model for LoanDetailCardTopupComponent component.
  late LoanDetailCardTopupComponentModel loanDetailCardTopupComponentModel;
  bool isDataUploading_fullVehicleImageUploadActionPL = false;
  FFUploadedFile uploadedLocalFile_fullVehicleImageUploadActionPL =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - uploadFileFirebaseStorage] action in Button widget.
  String? fullVehicleImageUrlOutput;
  bool isDataUploading_imageRightUploadActionPL = false;
  FFUploadedFile uploadedLocalFile_imageRightUploadActionPL =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - uploadFileFirebaseStorage] action in Button widget.
  String? imageRightUrlOutput;
  bool isDataUploading_imageLeftUploadActionPL = false;
  FFUploadedFile uploadedLocalFile_imageLeftUploadActionPL =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - uploadFileFirebaseStorage] action in Button widget.
  String? leftImageUrlOutput;
  bool isDataUploading_imageFrontUploadActionPL = false;
  FFUploadedFile uploadedLocalFile_imageFrontUploadActionPL =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - uploadFileFirebaseStorage] action in Button widget.
  String? imageFrontUrlOutput;
  bool isDataUploading_imageBackUploadActionPL = false;
  FFUploadedFile uploadedLocalFile_imageBackUploadActionPL =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - uploadFileFirebaseStorage] action in Button widget.
  String? imageBackUrlOutput;
  bool isDataUploading_imageMileUploadActionPL = false;
  FFUploadedFile uploadedLocalFile_imageMileUploadActionPL =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - uploadFileFirebaseStorage] action in Button widget.
  String? imageMileUrlOutput;
  bool isDataUploading_circleImageUploadActionPL = false;
  FFUploadedFile uploadedLocalFile_circleImageUploadActionPL =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

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
    loanDetailCardTopupComponentModel =
        createModel(context, () => LoanDetailCardTopupComponentModel());
  }

  @override
  void dispose() {
    loanDetailCardTopupComponentModel.dispose();
  }
}
