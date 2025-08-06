import '/customer_loan_detail/loan_detail_card_component/loan_detail_card_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
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

  ///  State fields for stateful widgets in this page.

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
