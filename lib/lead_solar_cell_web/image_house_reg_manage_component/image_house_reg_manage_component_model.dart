import '/flutter_flow/flutter_flow_util.dart';
import 'image_house_reg_manage_component_widget.dart'
    show ImageHouseRegManageComponentWidget;
import 'package:flutter/material.dart';

class ImageHouseRegManageComponentModel
    extends FlutterFlowModel<ImageHouseRegManageComponentWidget> {
  ///  Local state fields for this component.

  List<FFUploadedFile> houseRegImageFileList = [];
  void addToHouseRegImageFileList(FFUploadedFile item) =>
      houseRegImageFileList.add(item);
  void removeFromHouseRegImageFileList(FFUploadedFile item) =>
      houseRegImageFileList.remove(item);
  void removeAtIndexFromHouseRegImageFileList(int index) =>
      houseRegImageFileList.removeAt(index);
  void insertAtIndexInHouseRegImageFileList(int index, FFUploadedFile item) =>
      houseRegImageFileList.insert(index, item);
  void updateHouseRegImageFileListAtIndex(
          int index, Function(FFUploadedFile) updateFn) =>
      houseRegImageFileList[index] = updateFn(houseRegImageFileList[index]);

  ///  State fields for stateful widgets in this component.

  bool isDataUploading_uploadDataSqdHouseRegWebPC = false;
  FFUploadedFile uploadedLocalFile_uploadDataSqdHouseRegWebPC =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
