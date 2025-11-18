import '/flutter_flow/flutter_flow_util.dart';
import 'image_source_component_widget.dart' show ImageSourceComponentWidget;
import 'package:flutter/material.dart';

class ImageSourceComponentModel
    extends FlutterFlowModel<ImageSourceComponentWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading_uploadDataBluebook = false;
  FFUploadedFile uploadedLocalFile_uploadDataBluebook =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  bool isDataUploading_uploadDataBluebookCamera = false;
  FFUploadedFile uploadedLocalFile_uploadDataBluebookCamera =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
