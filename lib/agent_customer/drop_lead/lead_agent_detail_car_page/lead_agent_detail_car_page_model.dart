import '/agent_customer/drop_lead/progress_bar_component/progress_bar_component_widget.dart';
import '/agent_customer/drop_lead/review_detail_customer_component/review_detail_customer_component_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'lead_agent_detail_car_page_widget.dart'
    show LeadAgentDetailCarPageWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LeadAgentDetailCarPageModel
    extends FlutterFlowModel<LeadAgentDetailCarPageWidget> {
  ///  Local state fields for this page.

  List<MasterAgentVehicleDataModelStruct> vehicelMasterPageState = [];
  void addToVehicelMasterPageState(MasterAgentVehicleDataModelStruct item) =>
      vehicelMasterPageState.add(item);
  void removeFromVehicelMasterPageState(
          MasterAgentVehicleDataModelStruct item) =>
      vehicelMasterPageState.remove(item);
  void removeAtIndexFromVehicelMasterPageState(int index) =>
      vehicelMasterPageState.removeAt(index);
  void insertAtIndexInVehicelMasterPageState(
          int index, MasterAgentVehicleDataModelStruct item) =>
      vehicelMasterPageState.insert(index, item);
  void updateVehicelMasterPageStateAtIndex(
          int index, Function(MasterAgentVehicleDataModelStruct) updateFn) =>
      vehicelMasterPageState[index] = updateFn(vehicelMasterPageState[index]);

  List<MasterAgentGearModelStruct> gearMasterPageState = [];
  void addToGearMasterPageState(MasterAgentGearModelStruct item) =>
      gearMasterPageState.add(item);
  void removeFromGearMasterPageState(MasterAgentGearModelStruct item) =>
      gearMasterPageState.remove(item);
  void removeAtIndexFromGearMasterPageState(int index) =>
      gearMasterPageState.removeAt(index);
  void insertAtIndexInGearMasterPageState(
          int index, MasterAgentGearModelStruct item) =>
      gearMasterPageState.insert(index, item);
  void updateGearMasterPageStateAtIndex(
          int index, Function(MasterAgentGearModelStruct) updateFn) =>
      gearMasterPageState[index] = updateFn(gearMasterPageState[index]);

  List<MasterAgentBrandModelStruct> brandMasterPageState = [];
  void addToBrandMasterPageState(MasterAgentBrandModelStruct item) =>
      brandMasterPageState.add(item);
  void removeFromBrandMasterPageState(MasterAgentBrandModelStruct item) =>
      brandMasterPageState.remove(item);
  void removeAtIndexFromBrandMasterPageState(int index) =>
      brandMasterPageState.removeAt(index);
  void insertAtIndexInBrandMasterPageState(
          int index, MasterAgentBrandModelStruct item) =>
      brandMasterPageState.insert(index, item);
  void updateBrandMasterPageStateAtIndex(
          int index, Function(MasterAgentBrandModelStruct) updateFn) =>
      brandMasterPageState[index] = updateFn(brandMasterPageState[index]);

  List<MasterAgentModelModelStruct> modelMasterPageState = [];
  void addToModelMasterPageState(MasterAgentModelModelStruct item) =>
      modelMasterPageState.add(item);
  void removeFromModelMasterPageState(MasterAgentModelModelStruct item) =>
      modelMasterPageState.remove(item);
  void removeAtIndexFromModelMasterPageState(int index) =>
      modelMasterPageState.removeAt(index);
  void insertAtIndexInModelMasterPageState(
          int index, MasterAgentModelModelStruct item) =>
      modelMasterPageState.insert(index, item);
  void updateModelMasterPageStateAtIndex(
          int index, Function(MasterAgentModelModelStruct) updateFn) =>
      modelMasterPageState[index] = updateFn(modelMasterPageState[index]);

  List<MasterAgentCCModelStruct> ccMasterPageState = [];
  void addToCcMasterPageState(MasterAgentCCModelStruct item) =>
      ccMasterPageState.add(item);
  void removeFromCcMasterPageState(MasterAgentCCModelStruct item) =>
      ccMasterPageState.remove(item);
  void removeAtIndexFromCcMasterPageState(int index) =>
      ccMasterPageState.removeAt(index);
  void insertAtIndexInCcMasterPageState(
          int index, MasterAgentCCModelStruct item) =>
      ccMasterPageState.insert(index, item);
  void updateCcMasterPageStateAtIndex(
          int index, Function(MasterAgentCCModelStruct) updateFn) =>
      ccMasterPageState[index] = updateFn(ccMasterPageState[index]);

  bool canNextButton = false;

  AgentCarRateDataModelStruct? carRateData;
  void updateCarRateDataStruct(Function(AgentCarRateDataModelStruct) updateFn) {
    updateFn(carRateData ??= AgentCarRateDataModelStruct());
  }

  int? stateNumber = 1;

  String? bluebookBase64;

  FFUploadedFile? bluebookFile;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - convertBase64ToFFFiles] action in LeadAgentDetailCarPage widget.
  FFUploadedFile? generateBluebookFile;
  // Stores action output result for [Backend Call - API (get Province)] action in LeadAgentDetailCarPage widget.
  ApiCallResponse? provinceApiOutput;
  // Stores action output result for [Backend Call - API (rateGetVehicle)] action in LeadAgentDetailCarPage widget.
  ApiCallResponse? getVehicleMaster;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // Model for progressBarComponent component.
  late ProgressBarComponentModel progressBarComponentModel;
  // Model for ReviewDetailCustomerComponent component.
  late ReviewDetailCustomerComponentModel reviewDetailCustomerComponentModel;
  // State field(s) for DropDownVehicle widget.
  String? dropDownVehicleValue;
  FormFieldController<String>? dropDownVehicleValueController;
  // Stores action output result for [Backend Call - API (AgentRateSearch)] action in DropDownVehicle widget.
  ApiCallResponse? apiResultGear;
  // State field(s) for DropDownGear widget.
  String? dropDownGearValue;
  FormFieldController<String>? dropDownGearValueController;
  // Stores action output result for [Backend Call - API (AgentRateSearch)] action in DropDownGear widget.
  ApiCallResponse? apiResultBrand;
  // State field(s) for DropDownBrand11 widget.
  String? dropDownBrand11Value;
  FormFieldController<String>? dropDownBrand11ValueController;
  // State field(s) for DropDownYear widget.
  String? dropDownYearValue;
  FormFieldController<String>? dropDownYearValueController;
  // Stores action output result for [Backend Call - API (AgentRateSearch)] action in DropDownYear widget.
  ApiCallResponse? apiResultModel;
  // State field(s) for DropDownModel widget.
  String? dropDownModelValue;
  FormFieldController<String>? dropDownModelValueController;
  // Stores action output result for [Backend Call - API (AgentRateSearch)] action in DropDownModel widget.
  ApiCallResponse? apiResultCC;
  // State field(s) for DropDownCC widget.
  String? dropDownCCValue;
  FormFieldController<String>? dropDownCCValueController;
  // State field(s) for rateFromApi widget.
  FocusNode? rateFromApiFocusNode;
  TextEditingController? rateFromApiTextController;
  String? Function(BuildContext, String?)? rateFromApiTextControllerValidator;
  // Stores action output result for [Backend Call - API (AgentCheckRate)] action in Button widget.
  ApiCallResponse? apiResultCheckRate;
  // State field(s) for carregis widget.
  FocusNode? carregisFocusNode;
  TextEditingController? carregisTextController;
  String? Function(BuildContext, String?)? carregisTextControllerValidator;
  // State field(s) for DropDownProvince widget.
  String? dropDownProvinceValue;
  FormFieldController<String>? dropDownProvinceValueController;
  // State field(s) for loanAmount widget.
  FocusNode? loanAmountFocusNode;
  TextEditingController? loanAmountTextController;
  String? Function(BuildContext, String?)? loanAmountTextControllerValidator;
  DateTime? datePicked;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  FFUploadedFile? bluebookFileOutput;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    progressBarComponentModel =
        createModel(context, () => ProgressBarComponentModel());
    reviewDetailCustomerComponentModel =
        createModel(context, () => ReviewDetailCustomerComponentModel());
  }

  @override
  void dispose() {
    columnController?.dispose();
    progressBarComponentModel.dispose();
    reviewDetailCustomerComponentModel.dispose();
    rateFromApiFocusNode?.dispose();
    rateFromApiTextController?.dispose();

    carregisFocusNode?.dispose();
    carregisTextController?.dispose();

    loanAmountFocusNode?.dispose();
    loanAmountTextController?.dispose();
  }
}
