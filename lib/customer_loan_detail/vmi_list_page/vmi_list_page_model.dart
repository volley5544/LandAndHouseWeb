import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'vmi_list_page_widget.dart' show VmiListPageWidget;
import 'package:flutter/material.dart';

class VmiListPageModel extends FlutterFlowModel<VmiListPageWidget> {
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

  dynamic wow;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future checkIdCardPhotoBlock(BuildContext context) async {}
}
