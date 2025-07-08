import '/customer_topup/loan_detail_card_component/loan_detail_card_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'qr_payment_page_widget.dart' show QrPaymentPageWidget;
import 'package:flutter/material.dart';

class QrPaymentPageModel extends FlutterFlowModel<QrPaymentPageWidget> {
  ///  Local state fields for this page.

  String fullVehicleImageUrl = 'url';

  String circleImageUrl = 'url';

  ///  State fields for stateful widgets in this page.

  // Model for LoanDetailCardComponent component.
  late LoanDetailCardComponentModel loanDetailCardComponentModel;

  @override
  void initState(BuildContext context) {
    loanDetailCardComponentModel =
        createModel(context, () => LoanDetailCardComponentModel());
  }

  @override
  void dispose() {
    loanDetailCardComponentModel.dispose();
  }
}
