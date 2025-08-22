import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/customer_loan_detail/loan_detail_card_component/loan_detail_card_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/index.dart';
import 'select_payment_page_widget.dart' show SelectPaymentPageWidget;
import 'package:flutter/material.dart';

class SelectPaymentPageModel extends FlutterFlowModel<SelectPaymentPageWidget> {
  ///  Local state fields for this page.

  List<bool> installmentTypeSelectedList = [true, false, false];
  void addToInstallmentTypeSelectedList(bool item) =>
      installmentTypeSelectedList.add(item);
  void removeFromInstallmentTypeSelectedList(bool item) =>
      installmentTypeSelectedList.remove(item);
  void removeAtIndexFromInstallmentTypeSelectedList(int index) =>
      installmentTypeSelectedList.removeAt(index);
  void insertAtIndexInInstallmentTypeSelectedList(int index, bool item) =>
      installmentTypeSelectedList.insert(index, item);
  void updateInstallmentTypeSelectedListAtIndex(
          int index, Function(bool) updateFn) =>
      installmentTypeSelectedList[index] =
          updateFn(installmentTypeSelectedList[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in SelectPaymentPage widget.
  ApplicationRecord? configOutput;
  // Stores action output result for [Backend Call - API (get list of loan.)] action in SelectPaymentPage widget.
  ApiCallResponse? getLoanListOutput;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // Model for LoanDetailCardComponent component.
  late LoanDetailCardComponentModel loanDetailCardComponentModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    loanDetailCardComponentModel =
        createModel(context, () => LoanDetailCardComponentModel());
  }

  @override
  void dispose() {
    columnController?.dispose();
    loanDetailCardComponentModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks.
  Future checkIdCardPhotoBlock(BuildContext context) async {}
}
