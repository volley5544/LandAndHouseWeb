import '/agent_customer/drop_lead/progress_bar_component/progress_bar_component_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
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

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (rateGetVehicle)] action in LeadAgentDetailCustomerPage widget.
  ApiCallResponse? apiResult3so;
  // Model for progressBarComponent component.
  late ProgressBarComponentModel progressBarComponentModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  late MaskTextInputFormatter textFieldMask3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  late MaskTextInputFormatter textFieldMask4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for DropDownLoanType widget.
  String? dropDownLoanTypeValue;
  FormFieldController<String>? dropDownLoanTypeValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode6;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  DateTime? datePicked;
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
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    textFieldFocusNode5?.dispose();
    textController5?.dispose();

    textFieldFocusNode6?.dispose();
    textController6?.dispose();
  }
}
