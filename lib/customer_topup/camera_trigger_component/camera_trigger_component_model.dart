import '/flutter_flow/flutter_flow_util.dart';
import '/pages/loading/loading_widget.dart';
import 'camera_trigger_component_widget.dart' show CameraTriggerComponentWidget;
import 'package:flutter/material.dart';

class CameraTriggerComponentModel
    extends FlutterFlowModel<CameraTriggerComponentWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading_idCardImageUploadActionAuto = false;
  FFUploadedFile uploadedLocalFile_idCardImageUploadActionAuto =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - uploadFileFirebaseStorage] action in CameraTriggerComponent widget.
  String? idCardImageUrlOutput;
  // Model for loading component.
  late LoadingModel loadingModel;

  @override
  void initState(BuildContext context) {
    loadingModel = createModel(context, () => LoadingModel());
  }

  @override
  void dispose() {
    loadingModel.dispose();
  }
}
