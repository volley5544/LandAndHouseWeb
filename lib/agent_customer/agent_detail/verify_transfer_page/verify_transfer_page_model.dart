import '/agent_customer/agent_detail/user_agent_detail_component/user_agent_detail_component_widget.dart';
import '/agent_customer/select_payment_transfer_component/select_payment_transfer_component_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/banner_agent_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'verify_transfer_page_widget.dart' show VerifyTransferPageWidget;
import 'package:flutter/material.dart';

class VerifyTransferPageModel
    extends FlutterFlowModel<VerifyTransferPageWidget> {
  ///  Local state fields for this page.

  String paymentMethod = 'paymentMethod';

  String paymentChannel = 'paymentChannel';

  ///  State fields for stateful widgets in this page.

  // Model for BannerAgentComponent component.
  late BannerAgentComponentModel bannerAgentComponentModel;
  // Model for userAgentDetailComponent component.
  late UserAgentDetailComponentModel userAgentDetailComponentModel;
  // Model for SelectPaymentTransferComponent component.
  late SelectPaymentTransferComponentModel selectPaymentTransferComponentModel;
  // Stores action output result for [Backend Call - API (AgentLeadSave)] action in Button widget.
  ApiCallResponse? apiResultyyt;

  @override
  void initState(BuildContext context) {
    bannerAgentComponentModel =
        createModel(context, () => BannerAgentComponentModel());
    userAgentDetailComponentModel =
        createModel(context, () => UserAgentDetailComponentModel());
    selectPaymentTransferComponentModel =
        createModel(context, () => SelectPaymentTransferComponentModel());
  }

  @override
  void dispose() {
    bannerAgentComponentModel.dispose();
    userAgentDetailComponentModel.dispose();
    selectPaymentTransferComponentModel.dispose();
  }
}
