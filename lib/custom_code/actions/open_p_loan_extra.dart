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

import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'package:web/web.dart' as web;

/// Where the SawadLoanUniversal web build is hosted.
/// Prod: https://sawad-loan-universal.web.app
const String _kLoanUniversalBaseUrl =
    'https://sawad-loan-universal-uat.web.app';

/// Browser-testing overrides. Leave both empty to use FFAppState.
const String _kTestHashThaiId = '';
const String _kTestToken = '';

/// True when running inside the srisawad app's `InAppWebView`.
bool get _isInsideNativeHost => globalContext.has('flutter_inappwebview');

Future openPLoanExtra(
  String? dbName,
  String? contractNo,
) async {
  final db = (dbName ?? '').trim();
  final contract = (contractNo ?? '').trim();

  // A card with no db_name/contract_no cannot identify a contract. Both targets
  // would "succeed" straight into an error screen, so stop here and say why.
  if (db.isEmpty || contract.isEmpty) {
    print('openPLoanExtra: missing contract key — '
        'dbName="$db", contractNo="$contract"');
    return;
  }

  if (_isInsideNativeHost) {
    final query = _queryString({'dbName': db, 'contractNo': contract});
    web.window.location.href = 'srisawad://ploan-extra?$query';
    return;
  }

  final hash = _kTestHashThaiId.isNotEmpty
      ? _kTestHashThaiId
      : FFAppState().hashThaiIdAppState;
  final token = _kTestToken.isNotEmpty ? _kTestToken : FFAppState().accessToken;

  if (hash.isEmpty) {
    print('openPLoanExtra: no hashThaiId — /pLoan/resume will report '
        '"ไม่พบข้อมูลผู้ใช้". Set _kTestHashThaiId to test without a login.');
  }

  final url = '$_kLoanUniversalBaseUrl/pLoan/resume?'
      '${_queryString({
        'hashThaiId': hash,
        'token': token,
        'dbName': db,
        'contractNo': contract,
      })}';

  print('openPLoanExtra -> $url');
  web.window.location.href = url;
  // Prefer a new tab while testing? Swap the line above for:
  //   web.window.open(url, '_blank');
}

/// Percent-encodes and joins, dropping empty values.
String _queryString(Map<String, String> params) => params.entries
    .where((e) => e.value.isNotEmpty)
    .map((e) => '${e.key}=${Uri.encodeQueryComponent(e.value)}')
    .join('&');

// import 'package:web/web.dart' as web;

// Future openPLoanExtra(
//   String? dbName,
//   String? contractNo,
// ) async {
//   // Add your function code here!
//   final params = {'dbName': dbName!, 'contractNo': contractNo!};
//   final query = params.entries
//       .map((e) => '${e.key}=${Uri.encodeQueryComponent(e.value)}')
//       .join('&');
//   web.window.location.href = 'srisawad://ploan-extra?$query';
// }
