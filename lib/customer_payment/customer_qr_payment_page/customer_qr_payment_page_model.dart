import '/customer_topup/loan_detail_card_topup_component/loan_detail_card_topup_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'customer_qr_payment_page_widget.dart' show CustomerQrPaymentPageWidget;
import 'package:flutter/material.dart';

class CustomerQrPaymentPageModel
    extends FlutterFlowModel<CustomerQrPaymentPageWidget> {
  ///  Local state fields for this page.

  String fullVehicleImageUrl = 'url';

  String circleImageUrl = 'url';

  String amount = '0';

  ///  State fields for stateful widgets in this page.

  // Model for LoanDetailCardTopupComponent component.
  late LoanDetailCardTopupComponentModel loanDetailCardTopupComponentModel;

  @override
  void initState(BuildContext context) {
    loanDetailCardTopupComponentModel =
        createModel(context, () => LoanDetailCardTopupComponentModel());
  }

  @override
  void dispose() {
    loanDetailCardTopupComponentModel.dispose();
  }
}
