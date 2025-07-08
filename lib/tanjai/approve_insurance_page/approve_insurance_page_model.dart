import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'approve_insurance_page_widget.dart' show ApproveInsurancePageWidget;
import 'package:flutter/material.dart';

class ApproveInsurancePageModel
    extends FlutterFlowModel<ApproveInsurancePageWidget> {
  ///  Local state fields for this page.

  List<ChanodData3Struct> chanodlist = [];
  void addToChanodlist(ChanodData3Struct item) => chanodlist.add(item);
  void removeFromChanodlist(ChanodData3Struct item) => chanodlist.remove(item);
  void removeAtIndexFromChanodlist(int index) => chanodlist.removeAt(index);
  void insertAtIndexInChanodlist(int index, ChanodData3Struct item) =>
      chanodlist.insert(index, item);
  void updateChanodlistAtIndex(
          int index, Function(ChanodData3Struct) updateFn) =>
      chanodlist[index] = updateFn(chanodlist[index]);

  List<ChanodData3Struct> chanodlistto = [];
  void addToChanodlistto(ChanodData3Struct item) => chanodlistto.add(item);
  void removeFromChanodlistto(ChanodData3Struct item) =>
      chanodlistto.remove(item);
  void removeAtIndexFromChanodlistto(int index) => chanodlistto.removeAt(index);
  void insertAtIndexInChanodlistto(int index, ChanodData3Struct item) =>
      chanodlistto.insert(index, item);
  void updateChanodlisttoAtIndex(
          int index, Function(ChanodData3Struct) updateFn) =>
      chanodlistto[index] = updateFn(chanodlistto[index]);

  List<InsuranceInfoDataModelStruct> insuranceInfoWaitingPageState = [];
  void addToInsuranceInfoWaitingPageState(InsuranceInfoDataModelStruct item) =>
      insuranceInfoWaitingPageState.add(item);
  void removeFromInsuranceInfoWaitingPageState(
          InsuranceInfoDataModelStruct item) =>
      insuranceInfoWaitingPageState.remove(item);
  void removeAtIndexFromInsuranceInfoWaitingPageState(int index) =>
      insuranceInfoWaitingPageState.removeAt(index);
  void insertAtIndexInInsuranceInfoWaitingPageState(
          int index, InsuranceInfoDataModelStruct item) =>
      insuranceInfoWaitingPageState.insert(index, item);
  void updateInsuranceInfoWaitingPageStateAtIndex(
          int index, Function(InsuranceInfoDataModelStruct) updateFn) =>
      insuranceInfoWaitingPageState[index] =
          updateFn(insuranceInfoWaitingPageState[index]);

  List<InsuranceInfoDataModelStruct> insuranceInfoDonePageState = [];
  void addToInsuranceInfoDonePageState(InsuranceInfoDataModelStruct item) =>
      insuranceInfoDonePageState.add(item);
  void removeFromInsuranceInfoDonePageState(
          InsuranceInfoDataModelStruct item) =>
      insuranceInfoDonePageState.remove(item);
  void removeAtIndexFromInsuranceInfoDonePageState(int index) =>
      insuranceInfoDonePageState.removeAt(index);
  void insertAtIndexInInsuranceInfoDonePageState(
          int index, InsuranceInfoDataModelStruct item) =>
      insuranceInfoDonePageState.insert(index, item);
  void updateInsuranceInfoDonePageStateAtIndex(
          int index, Function(InsuranceInfoDataModelStruct) updateFn) =>
      insuranceInfoDonePageState[index] =
          updateFn(insuranceInfoDonePageState[index]);

  int? loopCountTempWaiting = 0;

  int? loopCountTempDone = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in ApproveInsurancePage widget.
  ApplicationRecord? tanjaiApi;
  // Stores action output result for [Backend Call - API (ApproveInstallmentListApi)] action in ApproveInsurancePage widget.
  ApiCallResponse? approveInstallmentApiOutput;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for textSearchWaiting widget.
  FocusNode? textSearchWaitingFocusNode;
  TextEditingController? textSearchWaitingTextController;
  String? Function(BuildContext, String?)?
      textSearchWaitingTextControllerValidator;
  // State field(s) for textSearchDone widget.
  FocusNode? textSearchDoneFocusNode;
  TextEditingController? textSearchDoneTextController;
  String? Function(BuildContext, String?)?
      textSearchDoneTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    textSearchWaitingFocusNode?.dispose();
    textSearchWaitingTextController?.dispose();

    textSearchDoneFocusNode?.dispose();
    textSearchDoneTextController?.dispose();
  }
}
