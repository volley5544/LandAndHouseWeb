import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/m_g_m_agent/web_app_bar_component/web_app_bar_component_widget.dart';
import '/index.dart';
import 'agent_detail_page01_widget.dart' show AgentDetailPage01Widget;
import 'package:flutter/material.dart';

class AgentDetailPage01Model extends FlutterFlowModel<AgentDetailPage01Widget> {
  ///  Local state fields for this page.

  String? idCardBase64;

  FFUploadedFile? idCardFile;

  String? bookbankBase64;

  FFUploadedFile? bookbankFile;

  List<BankMasterModelStruct> bankMasterData = [];
  void addToBankMasterData(BankMasterModelStruct item) =>
      bankMasterData.add(item);
  void removeFromBankMasterData(BankMasterModelStruct item) =>
      bankMasterData.remove(item);
  void removeAtIndexFromBankMasterData(int index) =>
      bankMasterData.removeAt(index);
  void insertAtIndexInBankMasterData(int index, BankMasterModelStruct item) =>
      bankMasterData.insert(index, item);
  void updateBankMasterDataAtIndex(
          int index, Function(BankMasterModelStruct) updateFn) =>
      bankMasterData[index] = updateFn(bankMasterData[index]);

  BankMasterModelStruct? bankSelected;
  void updateBankSelectedStruct(Function(BankMasterModelStruct) updateFn) {
    updateFn(bankSelected ??= BankMasterModelStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (logout agent)] action in AgentDetailPage01 widget.
  ApiCallResponse? apiResultjxr;
  // Model for WebAppBarComponent component.
  late WebAppBarComponentModel webAppBarComponentModel;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for lastname widget.
  FocusNode? lastnameFocusNode;
  TextEditingController? lastnameTextController;
  String? Function(BuildContext, String?)? lastnameTextControllerValidator;
  // State field(s) for bankAccNo widget.
  FocusNode? bankAccNoFocusNode;
  TextEditingController? bankAccNoTextController;
  String? Function(BuildContext, String?)? bankAccNoTextControllerValidator;
  // State field(s) for bankAccName widget.
  FocusNode? bankAccNameFocusNode;
  TextEditingController? bankAccNameTextController;
  String? Function(BuildContext, String?)? bankAccNameTextControllerValidator;
  // Stores action output result for [Backend Call - API (GetBankMasterAPI)] action in Container widget.
  ApiCallResponse? getBankMasterOutput;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  FFUploadedFile? idCardFileOutput;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  FFUploadedFile? bookbankFileOutput;
  // Stores action output result for [Backend Call - API (update agent)] action in Button widget.
  ApiCallResponse? updateAgentAPIOutput;
  // Stores action output result for [Backend Call - API (AgentProfileAPI)] action in Button widget.
  ApiCallResponse? agentProfileAPIOutput;

  @override
  void initState(BuildContext context) {
    webAppBarComponentModel =
        createModel(context, () => WebAppBarComponentModel());
  }

  @override
  void dispose() {
    webAppBarComponentModel.dispose();
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    lastnameFocusNode?.dispose();
    lastnameTextController?.dispose();

    bankAccNoFocusNode?.dispose();
    bankAccNoTextController?.dispose();

    bankAccNameFocusNode?.dispose();
    bankAccNameTextController?.dispose();
  }
}
