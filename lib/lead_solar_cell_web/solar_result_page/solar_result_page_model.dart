import '/components/loan_data_component_widget.dart';
import '/components/p_c_banner_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';

class SolarResultPageModel extends FlutterFlowModel<SolarResultPageWidget> {
  ///  Local state fields for this page.

  bool isSearchByChanod = true;

  ///  State fields for stateful widgets in this page.

  // Model for PCBannerComponent component.
  late PCBannerComponentModel pCBannerComponentModel;
  // Model for loanDataComponent component.
  late LoanDataComponentModel loanDataComponentModel;

  @override
  void initState(BuildContext context) {
    pCBannerComponentModel =
        createModel(context, () => PCBannerComponentModel());
    loanDataComponentModel =
        createModel(context, () => LoanDataComponentModel());
  }

  @override
  void dispose() {
    pCBannerComponentModel.dispose();
    loanDataComponentModel.dispose();
  }

  /// Action blocks.
  Future checkIsFromChanodPage(BuildContext context) async {
    if (!(('${FFAppState().ltv1AmountWeb}' != '') &&
        ('${FFAppState().ltv1AmountWeb}' != 'null'))) {
      context.goNamed(AddCustomerLeadWidget.routeName);

      return;
    }
    if (!(('${FFAppState().ltv2AmountWeb}' != '') &&
        ('${FFAppState().ltv2AmountWeb}' != 'null'))) {
      context.goNamed(AddCustomerLeadWidget.routeName);

      return;
    }
  }
}
