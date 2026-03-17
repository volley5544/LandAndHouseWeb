import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';

Future<bool?> checkAuth(BuildContext context) async {
  ApiCallResponse? apiResultjxr;

  if ('${FFAppState().platform}' != 'mobile') {
    if (loggedIn) {
      if (currentAuthTokenExpiration!.secondsSinceEpoch <
          getCurrentTimestamp.secondsSinceEpoch) {
        apiResultjxr = await AgentAPIGroup.logoutAgentCall.call(
          username: FFAppState().agentCode,
          url: FFDevEnvironmentValues().isProduction
              ? FFAppState().apiUrlDocData.agentWebApiUrl
              : FFAppState().apiUrlDocData.agentWebApiUrlUat,
          tokenHeader: FFDevEnvironmentValues().isProduction
              ? FFAppState().apiUrlDocData.agentWebApiToken
              : FFAppState().apiUrlDocData.agentWebApiTokenUat,
        );

        GoRouter.of(context).prepareAuthEvent();
        await authManager.signOut();
        GoRouter.of(context).clearRedirectLocation();
      }
    } else {
      if (!FFAppState().isShareLink) {
        FFAppState().agentCode = '';
        FFAppState().agentProfileDataType = AgentProfileModelStruct();

        context.goNamedAuth(AgentLoginPageWidget.routeName, context.mounted);

        return false;
      }
    }
  }
  return true;
}

Future<bool> dropLeadStepCheck(BuildContext context) async {
  if (!FFAppState().isGuest) {
    if (!FFAppState().isShareLink) {
      context.goNamed(
        LeadAgentDetailCustomerPageWidget.routeName,
        queryParameters: {
          'product': serializeParam(
            FFAppState().initialProduct,
            ParamType.String,
          ),
          'func': serializeParam(
            FFAppState().func,
            ParamType.String,
          ),
        }.withoutNulls,
      );

      return false;
    }
  }
  if (!FFAppState().dropLeadStepCheck) {
    if (loggedIn || (FFAppState().platform == 'mobile')) {
      FFAppState().saveLeadAgentData = SaveLeadAgentDataModelStruct();

      context.goNamed(
        ProductMenuPageWidget.routeName,
        queryParameters: {
          'agentCode': serializeParam(
            currentUserUid,
            ParamType.String,
          ),
        }.withoutNulls,
      );

      return false;
    }
    FFAppState().saveLeadAgentData = SaveLeadAgentDataModelStruct();
    FFAppState().agentCode = '';
    FFAppState().agentProfileDataType = AgentProfileModelStruct();

    context.goNamed(
      TimeoutPageWidget.routeName,
      queryParameters: {
        'text': serializeParam(
          'ลิงค์หมดอายุ กรุณาเปิดลิงค์จากเพื่อนของคุณเพื่อทำรายการอีกครั้ง',
          ParamType.String,
        ),
        'code': serializeParam(
          '504',
          ParamType.String,
        ),
      }.withoutNulls,
    );

    return false;
  }
  return true;
}
