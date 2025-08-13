import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/customer_loan_detail/loan_detail_card_component/loan_detail_card_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'loan_detail_page_widget.dart' show LoanDetailPageWidget;
import 'package:flutter/material.dart';

class LoanDetailPageModel extends FlutterFlowModel<LoanDetailPageWidget> {
  ///  Local state fields for this page.

  List<String> choicechipTextList = [
    'ข้อมูลสินเชื่อ',
    'ข้อมูลการชำระ',
    'ประวัติการชำระ'
  ];
  void addToChoicechipTextList(String item) => choicechipTextList.add(item);
  void removeFromChoicechipTextList(String item) =>
      choicechipTextList.remove(item);
  void removeAtIndexFromChoicechipTextList(int index) =>
      choicechipTextList.removeAt(index);
  void insertAtIndexInChoicechipTextList(int index, String item) =>
      choicechipTextList.insert(index, item);
  void updateChoicechipTextListAtIndex(int index, Function(String) updateFn) =>
      choicechipTextList[index] = updateFn(choicechipTextList[index]);

  List<PaymentHistoryModelStruct> paymentHistoryPageState = [];
  void addToPaymentHistoryPageState(PaymentHistoryModelStruct item) =>
      paymentHistoryPageState.add(item);
  void removeFromPaymentHistoryPageState(PaymentHistoryModelStruct item) =>
      paymentHistoryPageState.remove(item);
  void removeAtIndexFromPaymentHistoryPageState(int index) =>
      paymentHistoryPageState.removeAt(index);
  void insertAtIndexInPaymentHistoryPageState(
          int index, PaymentHistoryModelStruct item) =>
      paymentHistoryPageState.insert(index, item);
  void updatePaymentHistoryPageStateAtIndex(
          int index, Function(PaymentHistoryModelStruct) updateFn) =>
      paymentHistoryPageState[index] = updateFn(paymentHistoryPageState[index]);

  CarDetailsStruct? carDetailLoanPageState;
  void updateCarDetailLoanPageStateStruct(Function(CarDetailsStruct) updateFn) {
    updateFn(carDetailLoanPageState ??= CarDetailsStruct());
  }

  ContractDetailsStruct? contractDetailLoanPageState;
  void updateContractDetailLoanPageStateStruct(
      Function(ContractDetailsStruct) updateFn) {
    updateFn(contractDetailLoanPageState ??= ContractDetailsStruct());
  }

  String? dataDate;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in LoanDetailPage widget.
  ApplicationRecord? configOutput;
  // Stores action output result for [Backend Call - API (get list of loan.)] action in LoanDetailPage widget.
  ApiCallResponse? getLoanListOutput;
  // Stores action output result for [Backend Call - API (get detail of loan.)] action in LoanDetailPage widget.
  ApiCallResponse? detailLoanOutput;
  // Model for LoanDetailCardComponent component.
  late LoanDetailCardComponentModel loanDetailCardComponentModel;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {
    loanDetailCardComponentModel =
        createModel(context, () => LoanDetailCardComponentModel());
  }

  @override
  void dispose() {
    loanDetailCardComponentModel.dispose();
  }

  /// Action blocks.
  Future checkIdCardPhotoBlock(BuildContext context) async {}
}
