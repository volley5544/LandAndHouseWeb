import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'lead_agent_consent_page_widget.dart' show LeadAgentConsentPageWidget;
import 'package:flutter/material.dart';

class LeadAgentConsentPageModel
    extends FlutterFlowModel<LeadAgentConsentPageWidget> {
  ///  Local state fields for this page.

  String linkidPageState = '0';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in LeadAgentConsentPage widget.
  ApplicationRecord? queryUrl;
  // Stores action output result for [Backend Call - API (CheckConsentStatusApi)] action in LeadAgentConsentPage widget.
  ApiCallResponse? checkConsentStatusApiOutputinti;
  // Stores action output result for [Backend Call - API (CheckConsentStatusApi)] action in Button widget.
  ApiCallResponse? checkConsentStatusApiOutputCancle;
  // Stores action output result for [Backend Call - API (Send an otp to user)] action in Button widget.
  ApiCallResponse? apiResultc6pCopy;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  dynamic confirmOtpNOutput;
  // Stores action output result for [Backend Call - API (CheckConsentStatusApi)] action in Button widget.
  ApiCallResponse? checkConsentStatusApiOutput;
  // Stores action output result for [Backend Call - API (Send an otp to user)] action in Button widget.
  ApiCallResponse? apiResultc6p;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  dynamic confirmOtpOutputData;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
