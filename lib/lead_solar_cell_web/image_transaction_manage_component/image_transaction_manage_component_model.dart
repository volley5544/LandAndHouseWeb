import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'image_transaction_manage_component_widget.dart'
    show ImageTransactionManageComponentWidget;
import 'package:flutter/material.dart';

class ImageTransactionManageComponentModel
    extends FlutterFlowModel<ImageTransactionManageComponentWidget> {
  ///  Local state fields for this component.

  FFUploadedFile? transactionPdfFile;

  List<FFUploadedFile> transactionImageFileList = [];
  void addToTransactionImageFileList(FFUploadedFile item) =>
      transactionImageFileList.add(item);
  void removeFromTransactionImageFileList(FFUploadedFile item) =>
      transactionImageFileList.remove(item);
  void removeAtIndexFromTransactionImageFileList(int index) =>
      transactionImageFileList.removeAt(index);
  void insertAtIndexInTransactionImageFileList(
          int index, FFUploadedFile item) =>
      transactionImageFileList.insert(index, item);
  void updateTransactionImageFileListAtIndex(
          int index, Function(FFUploadedFile) updateFn) =>
      transactionImageFileList[index] =
          updateFn(transactionImageFileList[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  bool isDataUploading_uploadData1qgPdfTransaction = false;
  FFUploadedFile uploadedLocalFile_uploadData1qgPdfTransaction =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  bool isDataUploading_uploadDataSqdImageTransactionWebPC = false;
  FFUploadedFile uploadedLocalFile_uploadDataSqdImageTransactionWebPC =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
