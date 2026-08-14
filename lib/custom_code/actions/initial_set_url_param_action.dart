// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/app_events/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:web/web.dart' as html;

Future initialSetUrlParamAction() async {
  // Add your function code here!
  String currentUrl = html.window.location.href;
  final uri = Uri.parse(currentUrl);

  if ('${FFAppState().func}' == '' || '${FFAppState().func}' == 'null') {
    FFAppState().func = '${uri.queryParameters['func']}';
  }
  if ('${FFAppState().initialProduct}' == '' ||
      '${FFAppState().initialProduct}' == 'null') {
    FFAppState().initialProduct = '${uri.queryParameters['product']}';
  }

  if ('${uri.queryParameters['func']}' != '' &&
      '${uri.queryParameters['func']}' != 'null') {
    if ('${uri.queryParameters['func']}' == 'lead') {
      FFAppState().isGuest = true;

      FFAppState().utmSourceAppState =
          '${uri.queryParameters['utm_source']}' != 'null'
              ? '${uri.queryParameters['utm_source']}'
              : '${uri.queryParameters['utmSource']}';
      FFAppState().utmMediumAppState =
          '${uri.queryParameters['utm_medium']}' != 'null'
              ? '${uri.queryParameters['utm_medium']}'
              : '${uri.queryParameters['utmMedium']}';
      FFAppState().utmCampaignAppState =
          '${uri.queryParameters['utm_campaign']}' != 'null'
              ? '${uri.queryParameters['utm_campaign']}'
              : '${uri.queryParameters['utmCampaign']}';
    } else {
      FFAppState().isGuest = false;
    }

    return;
  }

  print('user doc ref is not set');
}
