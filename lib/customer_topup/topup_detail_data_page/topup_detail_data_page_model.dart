import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/customer_topup/loan_detail_card_topup_component/loan_detail_card_topup_component_widget.dart';
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

  List<dynamic> listInsurance = [];
  void addToListInsurance(dynamic item) => listInsurance.add(item);
  void removeFromListInsurance(dynamic item) => listInsurance.remove(item);
  void removeAtIndexFromListInsurance(int index) =>
      listInsurance.removeAt(index);
  void insertAtIndexInListInsurance(int index, dynamic item) =>
      listInsurance.insert(index, item);
  void updateListInsuranceAtIndex(int index, Function(dynamic) updateFn) =>
      listInsurance[index] = updateFn(listInsurance[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get topup detail )] action in TopupDetailDataPage widget.
  ApiCallResponse? getTopupDetailAPIOutput;
  // Stores action output result for [Backend Call - API (post to calculator to get new topup)] action in TopupDetailDataPage widget.
  ApiCallResponse? inittopupCalculateAPIOutput;
  // Model for LoanDetailCardTopupComponent component.
  late LoanDetailCardTopupComponentModel loanDetailCardTopupComponentModel;
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
    loanDetailCardTopupComponentModel =
        createModel(context, () => LoanDetailCardTopupComponentModel());
  }

  @override
  void dispose() {
    loanDetailCardTopupComponentModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
