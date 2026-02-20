import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/m_g_m_agent/web_app_bar_component/web_app_bar_component_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';

class AgentSettingPage03Model
    extends FlutterFlowModel<AgentSettingPage03Widget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in AgentSettingPage03 widget.
  ApplicationRecord? queryAPIUrl;
  // Model for WebAppBarComponent component.
  late WebAppBarComponentModel webAppBarComponentModel;
  // State field(s) for passwordTextField widget.
  FocusNode? passwordTextFieldFocusNode;
  TextEditingController? passwordTextFieldTextController;
  late bool passwordTextFieldVisibility;
  String? Function(BuildContext, String?)?
      passwordTextFieldTextControllerValidator;
  // State field(s) for confirmPasswordTextField widget.
  FocusNode? confirmPasswordTextFieldFocusNode;
  TextEditingController? confirmPasswordTextFieldTextController;
  late bool confirmPasswordTextFieldVisibility;
  String? Function(BuildContext, String?)?
      confirmPasswordTextFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (password reset agent)] action in Button widget.
  ApiCallResponse? changePassAPIOutput;
  // Stores action output result for [Backend Call - API (create agent )] action in Button widget.
  ApiCallResponse? createAgentAPIOutput;

  @override
  void initState(BuildContext context) {
    webAppBarComponentModel =
        createModel(context, () => WebAppBarComponentModel());
    passwordTextFieldVisibility = false;
    confirmPasswordTextFieldVisibility = false;
  }

  @override
  void dispose() {
    webAppBarComponentModel.dispose();
    passwordTextFieldFocusNode?.dispose();
    passwordTextFieldTextController?.dispose();

    confirmPasswordTextFieldFocusNode?.dispose();
    confirmPasswordTextFieldTextController?.dispose();
  }

  /// Action blocks.
  Future checkFromAddCustomerPage(BuildContext context) async {
    if (!(('${FFAppState().customerDetailJson.toString()}' != '') &&
        ('${FFAppState().customerDetailJson.toString()}' != 'null'))) {
      context.goNamed(
        AddCustomerLeadWidget.routeName,
        extra: <String, dynamic>{
          '__transition_info__': TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.fade,
            duration: Duration(milliseconds: 0),
          ),
        },
      );

      return;
    }
    if (!(('${FFAppState().leadsID}' != '') &&
        ('${FFAppState().leadsID}' != 'null'))) {
      context.goNamed(
        AddCustomerLeadWidget.routeName,
        extra: <String, dynamic>{
          '__transition_info__': TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.fade,
            duration: Duration(milliseconds: 0),
          ),
        },
      );

      return;
    }
  }

  Future checkTempParam(BuildContext context) async {
    if (!(('test' != 'null') &&
        ('test' != '') &&
        ('test' != '') &&
        ('test' != 'null'))) {
      context.goNamed(
        AddCustomerLeadWidget.routeName,
        extra: <String, dynamic>{
          '__transition_info__': TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.fade,
            duration: Duration(milliseconds: 0),
          ),
        },
      );

      return;
    }
  }
}
