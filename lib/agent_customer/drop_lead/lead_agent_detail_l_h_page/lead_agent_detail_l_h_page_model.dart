import '/agent_customer/check_rate/check_rate_l_h_form_component/check_rate_l_h_form_component_widget.dart';
import '/agent_customer/drop_lead/progress_bar_component/progress_bar_component_widget.dart';
import '/agent_customer/drop_lead/review_detail_customer_component/review_detail_customer_component_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/m_g_m_agent/web_app_bar_component/web_app_bar_component_widget.dart';
import '/index.dart';
import 'lead_agent_detail_l_h_page_widget.dart'
    show LeadAgentDetailLHPageWidget;
import 'package:flutter/material.dart';

class LeadAgentDetailLHPageModel
    extends FlutterFlowModel<LeadAgentDetailLHPageWidget> {
  ///  Local state fields for this page.

  bool isFormState = true;

  List<MasterAgentVehicleDataModelStruct> assetMasterData = [];
  void addToAssetMasterData(MasterAgentVehicleDataModelStruct item) =>
      assetMasterData.add(item);
  void removeFromAssetMasterData(MasterAgentVehicleDataModelStruct item) =>
      assetMasterData.remove(item);
  void removeAtIndexFromAssetMasterData(int index) =>
      assetMasterData.removeAt(index);
  void insertAtIndexInAssetMasterData(
          int index, MasterAgentVehicleDataModelStruct item) =>
      assetMasterData.insert(index, item);
  void updateAssetMasterDataAtIndex(
          int index, Function(MasterAgentVehicleDataModelStruct) updateFn) =>
      assetMasterData[index] = updateFn(assetMasterData[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in LeadAgentDetailLHPage widget.
  ApplicationRecord? queryAPIUrl;
  // Stores action output result for [Backend Call - API (rateGetVehicle)] action in LeadAgentDetailLHPage widget.
  ApiCallResponse? getAssetTypeMaster;
  // Model for WebAppBarComponent component.
  late WebAppBarComponentModel webAppBarComponentModel;
  // State field(s) for primaryContainer widget.
  ScrollController? primaryContainerScrollController;
  // Model for progressBarComponent component.
  late ProgressBarComponentModel progressBarComponentModel;
  // Model for ReviewDetailCustomerComponent component.
  late ReviewDetailCustomerComponentModel reviewDetailCustomerComponentModel;
  // State field(s) for AssetDropDown widget.
  String? assetDropDownValue;
  FormFieldController<String>? assetDropDownValueController;
  // Model for CheckRateLHFormComponent component.
  late CheckRateLHFormComponentModel checkRateLHFormComponentModel;

  @override
  void initState(BuildContext context) {
    webAppBarComponentModel =
        createModel(context, () => WebAppBarComponentModel());
    primaryContainerScrollController = ScrollController();
    progressBarComponentModel =
        createModel(context, () => ProgressBarComponentModel());
    reviewDetailCustomerComponentModel =
        createModel(context, () => ReviewDetailCustomerComponentModel());
    checkRateLHFormComponentModel =
        createModel(context, () => CheckRateLHFormComponentModel());
  }

  @override
  void dispose() {
    webAppBarComponentModel.dispose();
    primaryContainerScrollController?.dispose();
    progressBarComponentModel.dispose();
    reviewDetailCustomerComponentModel.dispose();
    checkRateLHFormComponentModel.dispose();
  }
}
