import '/agent_customer/drop_lead/progress_bar_component/progress_bar_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'lead_agent_detail_customer_page_widget.dart'
    show LeadAgentDetailCustomerPageWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LeadAgentDetailCustomerPageModel
    extends FlutterFlowModel<LeadAgentDetailCustomerPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for progressBarComponent component.
  late ProgressBarComponentModel progressBarComponentModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  late MaskTextInputFormatter textFieldMask3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  late MaskTextInputFormatter textFieldMask4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for TextField widget.
  final textFieldKey6 = GlobalKey();
  FocusNode? textFieldFocusNode6;
  TextEditingController? textController6;
  String? textFieldSelectedOption6;
  String? Function(BuildContext, String?)? textController6Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode7;
  TextEditingController? textController7;
  String? Function(BuildContext, String?)? textController7Validator;
  DateTime? datePicked;
  // State field(s) for TextFieldTime widget.
  FocusNode? textFieldTimeFocusNode;
  TextEditingController? textFieldTimeTextController;
  String? Function(BuildContext, String?)? textFieldTimeTextControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;

  @override
  void initState(BuildContext context) {
    progressBarComponentModel =
        createModel(context, () => ProgressBarComponentModel());
  }

  @override
  void dispose() {
    progressBarComponentModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    textFieldFocusNode5?.dispose();
    textController5?.dispose();

    textFieldFocusNode6?.dispose();

    textFieldFocusNode7?.dispose();
    textController7?.dispose();

    textFieldTimeFocusNode?.dispose();
    textFieldTimeTextController?.dispose();
  }
}
