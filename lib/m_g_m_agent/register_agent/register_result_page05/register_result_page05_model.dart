import '/flutter_flow/flutter_flow_util.dart';
import '/m_g_m_agent/web_app_bar_component/web_app_bar_component_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';

class RegisterResultPage05Model
    extends FlutterFlowModel<RegisterResultPage05Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for WebAppBarComponent component.
  late WebAppBarComponentModel webAppBarComponentModel;

  @override
  void initState(BuildContext context) {
    webAppBarComponentModel =
        createModel(context, () => WebAppBarComponentModel());
  }

  @override
  void dispose() {
    webAppBarComponentModel.dispose();
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
