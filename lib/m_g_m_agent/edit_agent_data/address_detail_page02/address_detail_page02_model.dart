import '/flutter_flow/flutter_flow_util.dart';
import '/m_g_m_agent/web_app_bar_component/web_app_bar_component_widget.dart';
import '/index.dart';
import 'address_detail_page02_widget.dart' show AddressDetailPage02Widget;
import 'package:flutter/material.dart';

class AddressDetailPage02Model
    extends FlutterFlowModel<AddressDetailPage02Widget> {
  ///  Local state fields for this page.

  String? idCardBase64;

  FFUploadedFile? idCardFile;

  String? bookbankBase64;

  FFUploadedFile? bookbankFile;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Action Block - checkAuth] action in AddressDetailPage02 widget.
  bool? checkAuthOutput;
  // Model for WebAppBarComponent component.
  late WebAppBarComponentModel webAppBarComponentModel;
  // State field(s) for addressTextfield widget.
  FocusNode? addressTextfieldFocusNode;
  TextEditingController? addressTextfieldTextController;
  String? Function(BuildContext, String?)?
      addressTextfieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    webAppBarComponentModel =
        createModel(context, () => WebAppBarComponentModel());
  }

  @override
  void dispose() {
    webAppBarComponentModel.dispose();
    addressTextfieldFocusNode?.dispose();
    addressTextfieldTextController?.dispose();
  }
}
