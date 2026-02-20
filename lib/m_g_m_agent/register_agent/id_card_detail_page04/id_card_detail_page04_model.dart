import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/m_g_m_agent/web_app_bar_component/web_app_bar_component_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class IdCardDetailPage04Model
    extends FlutterFlowModel<IdCardDetailPage04Widget> {
  ///  Local state fields for this page.

  FFUploadedFile? idCardFile;

  FFUploadedFile? emptyFileBytes;

  ///  State fields for stateful widgets in this page.

  // Model for WebAppBarComponent component.
  late WebAppBarComponentModel webAppBarComponentModel;
  // State field(s) for ThaiIdTextField widget.
  FocusNode? thaiIdTextFieldFocusNode;
  TextEditingController? thaiIdTextFieldTextController;
  late MaskTextInputFormatter thaiIdTextFieldMask;
  String? Function(BuildContext, String?)?
      thaiIdTextFieldTextControllerValidator;
  // Stores action output result for [Bottom Sheet - CapturePictureComponent] action in Icon widget.
  FFUploadedFile? cameraTriggerComponentReturn;
  // Stores action output result for [Backend Call - API (visionThaiId)] action in Icon widget.
  ApiCallResponse? visionOutputThaiId;
  DateTime? datePicked;
  // Stores action output result for [Backend Call - API (check blacklist thai id)] action in Button widget.
  ApiCallResponse? blacklistAPIoutput;
  // Stores action output result for [Backend Call - API (update agent)] action in Button widget.
  ApiCallResponse? updateAgentAPIOutput;
  bool isDataUploading_uploadData36j = false;
  FFUploadedFile uploadedLocalFile_uploadData36j =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  @override
  void initState(BuildContext context) {
    webAppBarComponentModel =
        createModel(context, () => WebAppBarComponentModel());
  }

  @override
  void dispose() {
    webAppBarComponentModel.dispose();
    thaiIdTextFieldFocusNode?.dispose();
    thaiIdTextFieldTextController?.dispose();
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
