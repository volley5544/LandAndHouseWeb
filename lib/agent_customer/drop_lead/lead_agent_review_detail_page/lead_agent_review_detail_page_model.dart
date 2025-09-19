import '/agent_customer/drop_lead/progress_bar_component/progress_bar_component_widget.dart';
import '/agent_customer/drop_lead/review_detail_car_component/review_detail_car_component_widget.dart';
import '/agent_customer/drop_lead/review_detail_customer_component/review_detail_customer_component_widget.dart';
import '/agent_customer/drop_lead/review_detail_l_h_component/review_detail_l_h_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'lead_agent_review_detail_page_widget.dart'
    show LeadAgentReviewDetailPageWidget;
import 'package:flutter/material.dart';

class LeadAgentReviewDetailPageModel
    extends FlutterFlowModel<LeadAgentReviewDetailPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for progressBarComponent component.
  late ProgressBarComponentModel progressBarComponentModel;
  // Model for ReviewDetailCustomerComponent component.
  late ReviewDetailCustomerComponentModel reviewDetailCustomerComponentModel;
  // Model for ReviewDetailCarComponent component.
  late ReviewDetailCarComponentModel reviewDetailCarComponentModel;
  // Model for ReviewDetailLHComponent component.
  late ReviewDetailLHComponentModel reviewDetailLHComponentModel;

  @override
  void initState(BuildContext context) {
    progressBarComponentModel =
        createModel(context, () => ProgressBarComponentModel());
    reviewDetailCustomerComponentModel =
        createModel(context, () => ReviewDetailCustomerComponentModel());
    reviewDetailCarComponentModel =
        createModel(context, () => ReviewDetailCarComponentModel());
    reviewDetailLHComponentModel =
        createModel(context, () => ReviewDetailLHComponentModel());
  }

  @override
  void dispose() {
    progressBarComponentModel.dispose();
    reviewDetailCustomerComponentModel.dispose();
    reviewDetailCarComponentModel.dispose();
    reviewDetailLHComponentModel.dispose();
  }
}
