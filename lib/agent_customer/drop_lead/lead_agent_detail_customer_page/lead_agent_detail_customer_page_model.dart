import '/agent_customer/drop_lead/progress_bar_component/progress_bar_component_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'lead_agent_detail_customer_page_widget.dart'
    show LeadAgentDetailCustomerPageWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LeadAgentDetailCustomerPageModel
    extends FlutterFlowModel<LeadAgentDetailCustomerPageWidget> {
  ///  Local state fields for this page.

  List<MasterAgentVehicleDataModelStruct> masterLoanTypeData = [];
  void addToMasterLoanTypeData(MasterAgentVehicleDataModelStruct item) =>
      masterLoanTypeData.add(item);
  void removeFromMasterLoanTypeData(MasterAgentVehicleDataModelStruct item) =>
      masterLoanTypeData.remove(item);
  void removeAtIndexFromMasterLoanTypeData(int index) =>
      masterLoanTypeData.removeAt(index);
  void insertAtIndexInMasterLoanTypeData(
          int index, MasterAgentVehicleDataModelStruct item) =>
      masterLoanTypeData.insert(index, item);
  void updateMasterLoanTypeDataAtIndex(
          int index, Function(MasterAgentVehicleDataModelStruct) updateFn) =>
      masterLoanTypeData[index] = updateFn(masterLoanTypeData[index]);

  MasterAgentVehicleDataModelStruct? productSelected;
  void updateProductSelectedStruct(
      Function(MasterAgentVehicleDataModelStruct) updateFn) {
    updateFn(productSelected ??= MasterAgentVehicleDataModelStruct());
  }

  String idCardBase64 = 'base64';

  FFUploadedFile? idCardFile;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in LeadAgentDetailCustomerPage widget.
  ApplicationRecord? appConfig;
  // Stores action output result for [Backend Call - API (visionThaiId)] action in LeadAgentDetailCustomerPage widget.
  ApiCallResponse? visionOutputThaiIdmobile;
  // Stores action output result for [Custom Action - uploadFileFirebaseStorage] action in LeadAgentDetailCustomerPage widget.
  String? idCardImageUrlCallback;
  // Stores action output result for [Custom Action - convertBase64ToFFFiles] action in LeadAgentDetailCustomerPage widget.
  FFUploadedFile? generateIdCardFile;
  // Model for progressBarComponent component.
  late ProgressBarComponentModel progressBarComponentModel;
  // State field(s) for firstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameTextController;
  String? Function(BuildContext, String?)? firstNameTextControllerValidator;
  // Stores action output result for [Bottom Sheet - CapturePictureComponent] action in Icon widget.
  FFUploadedFile? cameraTriggerComponentReturn;
  // Stores action output result for [Backend Call - API (visionThaiId)] action in Icon widget.
  ApiCallResponse? visionOutputThaiId;
  // State field(s) for lastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameTextController;
  String? Function(BuildContext, String?)? lastNameTextControllerValidator;
  // State field(s) for idcard widget.
  FocusNode? idcardFocusNode;
  TextEditingController? idcardTextController;
  late MaskTextInputFormatter idcardMask;
  String? Function(BuildContext, String?)? idcardTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController4;
  late MaskTextInputFormatter textFieldMask1;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  DateTime? datePicked;
  // State field(s) for DropDownLoanType widget.
  String? dropDownLoanTypeValue;
  FormFieldController<String>? dropDownLoanTypeValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  bool? confirmOutput;

  @override
  void initState(BuildContext context) {
    progressBarComponentModel =
        createModel(context, () => ProgressBarComponentModel());
  }

  @override
  void dispose() {
    progressBarComponentModel.dispose();
    firstNameFocusNode?.dispose();
    firstNameTextController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameTextController?.dispose();

    idcardFocusNode?.dispose();
    idcardTextController?.dispose();

    textFieldFocusNode1?.dispose();
    textController4?.dispose();

    textFieldFocusNode2?.dispose();
    textController5?.dispose();

    textFieldFocusNode3?.dispose();
    textController6?.dispose();
  }
}
