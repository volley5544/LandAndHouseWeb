import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/land_and_house_app/user_info/user_info_widget.dart';
import '/index.dart';
import 'serch_chanod_page_widget.dart' show SerchChanodPageWidget;
import 'package:flutter/material.dart';

class SerchChanodPageModel extends FlutterFlowModel<SerchChanodPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (checkRateApi)] action in SerchChanodPage widget.
  ApiCallResponse? aPIcheckRateOutput;
  // Model for userInfo component.
  late UserInfoModel userInfoModel;
  // Stores action output result for [Backend Call - API (saveRateApi )] action in Button widget.
  ApiCallResponse? saveAPIOutput;

  @override
  void initState(BuildContext context) {
    userInfoModel = createModel(context, () => UserInfoModel());
  }

  @override
  void dispose() {
    userInfoModel.dispose();
  }
}
