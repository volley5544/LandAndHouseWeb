import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'my_pay_dashboard_page_widget.dart' show MyPayDashboardPageWidget;
import 'package:flutter/material.dart';

class MyPayDashboardPageModel
    extends FlutterFlowModel<MyPayDashboardPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for SearchTextField widget.
  FocusNode? searchTextFieldFocusNode;
  TextEditingController? searchTextFieldTextController;
  String? Function(BuildContext, String?)?
      searchTextFieldTextControllerValidator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  List<String>? get choiceChipsValues => choiceChipsValueController?.value;
  set choiceChipsValues(List<String>? val) =>
      choiceChipsValueController?.value = val;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchTextFieldFocusNode?.dispose();
    searchTextFieldTextController?.dispose();
  }
}
