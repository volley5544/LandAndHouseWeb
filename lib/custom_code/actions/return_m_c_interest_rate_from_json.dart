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

import 'package:expressions/expressions.dart';

Future<String> returnMCInterestRateFromJson(
    dynamic? interestRateData, String? requestAmount) async {
  // Add your function code here!
  print('returnMCInterestRateFromJson1');
  print('interestRateData : ${interestRateData!}');
  print('requestAmount : ${requestAmount!}');
  Map<String, dynamic> mapDataInterestRate =
      Map<String, dynamic>.from(interestRateData!);
  // jsonDecode(interestRateData!);
  print('returnMCInterestRateFromJson2');
  for (int i = 0; i < mapDataInterestRate['interest_condition'].length; i++) {
    print('returnMCInterestRateFromJson3');
    if (evaluate(
        '${requestAmount!} ${mapDataInterestRate['interest_condition'][i]['operator']} ${mapDataInterestRate['${mapDataInterestRate['interest_condition'][i]['compare_fields']}']}')) {
      print('returnMCInterestRateFromJson4');
      return '${mapDataInterestRate['interest_condition'][i]['interest_rate']}';
    }
  }
  print('returnMCInterestRateFromJson5');
  return '${mapDataInterestRate['interest_rate_default']}';
}

bool evaluate(String input) {
  final expression = Expression.parse(input);
  final evaluator = const ExpressionEvaluator();
  final result = evaluator.eval(expression, {});

  return result == true;
}

// void main() {
//   print(evaluate('1 + 2 >= 3')); // true
// }
