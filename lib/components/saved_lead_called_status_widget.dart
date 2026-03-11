import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/loading/loading_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'saved_lead_called_status_model.dart';
export 'saved_lead_called_status_model.dart';

class SavedLeadCalledStatusWidget extends StatefulWidget {
  const SavedLeadCalledStatusWidget({
    super.key,
    required this.leadChannel,
    required this.leadId,
    required this.callStatusId,
    required this.callStatussName,
    required this.customerName,
    required this.token,
    this.fromPage,
  });

  final String? leadChannel;
  final String? leadId;
  final List<String>? callStatusId;
  final List<String>? callStatussName;
  final String? customerName;
  final String? token;
  final String? fromPage;

  @override
  State<SavedLeadCalledStatusWidget> createState() =>
      _SavedLeadCalledStatusWidgetState();
}

class _SavedLeadCalledStatusWidgetState
    extends State<SavedLeadCalledStatusWidget> {
  late SavedLeadCalledStatusModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SavedLeadCalledStatusModel());

    _model.calledRemarkTextFieldTextController ??= TextEditingController();
    _model.calledRemarkTextFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 44.0, 0.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x25090F13),
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 60.0,
                    height: 4.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 44.0,
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'บันทึกการโทร',
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Noto San Thai',
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    '${() {
                                      if (widget.fromPage == 'LH') {
                                        return 'กรุณากรอกสถานะการโทรลีดบ้าน-ที่ดิน ลูกค้า ';
                                      } else if (widget.fromPage == 'store') {
                                        return 'กรุณากรอกสถานะการโทรลีดโชว์ห่วย ลูกค้า ';
                                      } else if (widget.fromPage == 'LeadMC') {
                                        return 'กรุณากรอกสถานะการโทรลีดรถ ลูกค้า ';
                                      } else {
                                        return 'กรุณากรอกสถานะการโทรลีดสินเชื่อ ลูกค้า ';
                                      }
                                    }()}${widget.customerName}',
                                    'กรุณากรอกสถานะการโทรของ',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Noto San Thai',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 24.0,
                thickness: 2.0,
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Builder(
                                builder: (context) =>
                                    FlutterFlowDropDown<String>(
                                  controller: _model
                                          .callStatusDropDownValueController ??=
                                      FormFieldController<String>(
                                    _model.callStatusDropDownValue ??= '',
                                  ),
                                  options:
                                      List<String>.from(widget.callStatusId!),
                                  optionLabels: widget.callStatussName!,
                                  onChanged: (val) async {
                                    safeSetState(() =>
                                        _model.callStatusDropDownValue = val);
                                    HapticFeedback.lightImpact();
                                    showDialog(
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: Container(
                                            height: double.infinity,
                                            child: LoadingWidget(),
                                          ),
                                        );
                                      },
                                    );

                                    _model.getReasonCall =
                                        await GetLeadReasonCallDropdownAPICall
                                            .call(
                                      apiUrl: FFAppState().arunsawadApiUrl,
                                      token: widget.token,
                                      callStatusId:
                                          _model.callStatusDropDownValue,
                                    );

                                    Navigator.pop(context);

                                    safeSetState(() {});
                                  },
                                  width: 180.0,
                                  height: 50.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto San Thai',
                                        color: Colors.black,
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: 'สถานะการโทร...',
                                  fillColor: Colors.white,
                                  elevation: 2.0,
                                  borderColor: Colors.transparent,
                                  borderWidth: 1.0,
                                  borderRadius: 0.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 4.0, 12.0, 4.0),
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (((_model.getReasonCall?.statusCode ?? 200) == 200) &&
                          (GetLeadReasonCallDropdownAPICall.statusLayer1(
                                (_model.getReasonCall?.jsonBody ?? ''),
                              ) ==
                              200) &&
                          (_model.callStatusDropDownValue != null &&
                              _model.callStatusDropDownValue != ''))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: FlutterFlowDropDown<String>(
                                  controller:
                                      _model.reasonDropDownValueController ??=
                                          FormFieldController<String>(
                                    _model.reasonDropDownValue ??= '',
                                  ),
                                  options: List<String>.from(
                                      GetLeadReasonCallDropdownAPICall.reasonID(
                                    (_model.getReasonCall?.jsonBody ?? ''),
                                  )!),
                                  optionLabels: GetLeadReasonCallDropdownAPICall
                                      .reasonName(
                                    (_model.getReasonCall?.jsonBody ?? ''),
                                  )!,
                                  onChanged: (val) async {
                                    safeSetState(
                                        () => _model.reasonDropDownValue = val);
                                    HapticFeedback.mediumImpact();
                                  },
                                  width: 180.0,
                                  height: 50.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto San Thai',
                                        color: Colors.black,
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: 'เหตุผล...',
                                  fillColor: Colors.white,
                                  elevation: 2.0,
                                  borderColor: Colors.transparent,
                                  borderWidth: 1.0,
                                  borderRadius: 0.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 4.0, 12.0, 4.0),
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ),
                            ],
                          ),
                        ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            14.0, 5.0, 14.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 130.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                          ),
                          child: Visibility(
                            visible: _model.reasonDropDownValue != null &&
                                _model.reasonDropDownValue != '',
                            child: Container(
                              width: double.infinity,
                              child: TextFormField(
                                controller:
                                    _model.calledRemarkTextFieldTextController,
                                focusNode:
                                    _model.calledRemarkTextFieldFocusNode,
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'จดบันทึกการโทร...',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Noto San Thai',
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Noto San Thai',
                                      letterSpacing: 0.0,
                                    ),
                                textAlign: TextAlign.start,
                                validator: _model
                                    .calledRemarkTextFieldTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        var _shouldSetState = false;
                        if (!(_model.callStatusDropDownValue != null &&
                            _model.callStatusDropDownValue != '')) {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                content: Text('กรุณาเลือก สถานะการโทร'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                          if (_shouldSetState) safeSetState(() {});
                          return;
                        }
                        if (!(_model.reasonDropDownValue != null &&
                            _model.reasonDropDownValue != '')) {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                content: Text('กรุณาเลือก เหตุผล'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                          if (_shouldSetState) safeSetState(() {});
                          return;
                        }
                        _model.saveCallOutput =
                            await SaveCallStatusAPICall.call(
                          apiUrl: FFAppState().arunsawadApiUrl,
                          token: widget.token,
                          leadID: widget.leadId,
                          statusCallID: _model.callStatusDropDownValue,
                          reasonID: _model.reasonDropDownValue,
                          reasonDetail: functions.replaceEnterInStringText(
                              _model.calledRemarkTextFieldTextController.text),
                        );

                        _shouldSetState = true;
                        if ((_model.saveCallOutput?.statusCode ?? 200) != 200) {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                content: Text(
                                    'พบข้อผิดพลาดConnection (${(_model.saveCallOutput?.statusCode ?? 200).toString()})'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                          if (_shouldSetState) safeSetState(() {});
                          return;
                        }
                        if ('${SaveCallStatusAPICall.statusLayer2(
                              (_model.saveCallOutput?.jsonBody ?? ''),
                            ).toString()}' !=
                            '202') {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                content: Text(
                                    '${'${SaveCallStatusAPICall.messageLayer2(
                                  (_model.saveCallOutput?.jsonBody ?? ''),
                                ).toString()}'}'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                          if (_shouldSetState) safeSetState(() {});
                          return;
                        }
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              content: Text('${SaveCallStatusAPICall.info(
                                (_model.saveCallOutput?.jsonBody ?? ''),
                              ).toString()}'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Ok'),
                                ),
                              ],
                            );
                          },
                        );
                        Navigator.pop(
                            context,
                            widget.callStatussName?.elementAtOrNull((widget
                                    .callStatusId!)
                                .toList()
                                .indexOf((_model.callStatusDropDownValue!))));
                        if (_shouldSetState) safeSetState(() {});
                      },
                      text: 'บันทึกการโทร',
                      options: FFButtonOptions(
                        width: 270.0,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFF24D200),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.outfit(
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                        elevation: 2.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
