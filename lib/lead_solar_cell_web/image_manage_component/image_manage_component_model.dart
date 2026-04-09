import '/flutter_flow/flutter_flow_util.dart';
import 'image_manage_component_widget.dart' show ImageManageComponentWidget;
import 'package:flutter/material.dart';

class ImageManageComponentModel
    extends FlutterFlowModel<ImageManageComponentWidget> {
  ///  Local state fields for this component.

  FFUploadedFile? chanodFrontFile;

  FFUploadedFile? chanodBackFile;

  FFUploadedFile? chanodFrontFileTemp;

  FFUploadedFile? chanodBackFileTemp;

  ///  State fields for stateful widgets in this component.

  bool isDataUploading_uploadDataSqdChanodFrontWebPC = false;
  FFUploadedFile uploadedLocalFile_uploadDataSqdChanodFrontWebPC =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  bool isDataUploading_uploadDataSqdChanodBackWebPC = false;
  FFUploadedFile uploadedLocalFile_uploadDataSqdChanodBackWebPC =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
