import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/customer_topup/loan_detail_card_component/loan_detail_card_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'topup_detail_data_page_widget.dart' show TopupDetailDataPageWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TopupDetailDataPageModel
    extends FlutterFlowModel<TopupDetailDataPageWidget> {
  ///  Local state fields for this page.

  int? yieldTemp = 0;

  SaveTopupLHModelStruct? saveTopupLHData;
  void updateSaveTopupLHDataStruct(Function(SaveTopupLHModelStruct) updateFn) {
    updateFn(saveTopupLHData ??= SaveTopupLHModelStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get topup detail )] action in TopupDetailDataPage widget.
  ApiCallResponse? getTopupDetailAPIOutput;
  // Stores action output result for [Backend Call - API (post to calculator to get new topup)] action in TopupDetailDataPage widget.
  ApiCallResponse? inittopupCalculateAPIOutput;
  // Model for LoanDetailCardComponent component.
  late LoanDetailCardComponentModel loanDetailCardComponentModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  late MaskTextInputFormatter textFieldMask;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (post to calculator to get new topup)] action in TextField widget.
  ApiCallResponse? topupCalculateAPIOutput;
  // State field(s) for Slider widget.
  double? sliderValue;
  // Stores action output result for [Backend Call - API (post to calculator to get new topup)] action in Slider widget.
  ApiCallResponse? topupCalculateAPIOutputSlider;
  // Stores action output result for [Backend Call - API (interestpaymentAPI)] action in Button widget.
  ApiCallResponse? interestPayment;
  // Stores action output result for [Backend Call - API (topupLeadLHMobileApp)] action in Button widget.
  ApiCallResponse? saveLeadLHOutput;
  // Stores action output result for [Backend Call - API (Get topup detail )] action in Button widget.
  ApiCallResponse? getTopupDetailAPIRefresh;

  @override
  void initState(BuildContext context) {
    loanDetailCardComponentModel =
        createModel(context, () => LoanDetailCardComponentModel());
  }

  @override
  void dispose() {
    loanDetailCardComponentModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
