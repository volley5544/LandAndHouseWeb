import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/m_g_m_agent/web_app_bar_component/web_app_bar_component_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AgentConfirmOtpPageModel
    extends FlutterFlowModel<AgentConfirmOtpPageWidget> {
  ///  Local state fields for this page.

  int? otpCounting = 600;

  String otpCode = 'x';

  String otpRef = 'x';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Send an otp to user)] action in AgentConfirmOtpPage widget.
  ApiCallResponse? otpApiOutput;
  // Model for WebAppBarComponent component.
  late WebAppBarComponentModel webAppBarComponentModel;
  // Stores action output result for [Backend Call - API (Send an otp to user)] action in Text widget.
  ApiCallResponse? otpApiOutputRetry;
  // State field(s) for otpTextField widget.
  FocusNode? otpTextFieldFocusNode;
  TextEditingController? otpTextFieldTextController;
  late MaskTextInputFormatter otpTextFieldMask;
  String? Function(BuildContext, String?)? otpTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    webAppBarComponentModel =
        createModel(context, () => WebAppBarComponentModel());
  }

  @override
  void dispose() {
    webAppBarComponentModel.dispose();
    otpTextFieldFocusNode?.dispose();
    otpTextFieldTextController?.dispose();
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
