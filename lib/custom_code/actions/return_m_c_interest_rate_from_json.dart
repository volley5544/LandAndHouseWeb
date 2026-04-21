// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:expressions/expressions.dart';

Future<String> returnMCInterestRateFromJson(
    dynamic? interestRateData, String? requestAmount) async {
  // Add your function code here!

  Map<String, dynamic> mapDataInterestRate = jsonDecode(interestRateData!);
  for (int i = 0; i < mapDataInterestRate['interest_condition'].length; i++) {
    if (evaluate(
        '${requestAmount!} ${mapDataInterestRate['interest_condition'][i]['operator']} ${mapDataInterestRate['${mapDataInterestRate['interest_condition'][i]['compare_fields']}']}')) {
      return '${mapDataInterestRate['interest_condition'][i]['interest_rate']}';
    }
  }

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
