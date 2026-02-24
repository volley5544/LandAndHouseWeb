import '/backend/api_requests/api_calls.dart';
import '/components/error_message_component_widget.dart';
import '/components/message_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'lead_agent_confirm_o_t_p_model.dart';
export 'lead_agent_confirm_o_t_p_model.dart';

class LeadAgentConfirmOTPWidget extends StatefulWidget {
  const LeadAgentConfirmOTPWidget({
    super.key,
    this.consent,
    this.phoneNo,
    this.refLead,
    this.url,
    this.otp,
    this.refotp,
    this.fromPage,
    this.product,
    this.agentCode,
    this.linkId,
  });

  final String? consent;
  final String? phoneNo;
  final String? refLead;
  final String? url;
  final String? otp;
  final String? refotp;
  final String? fromPage;
  final String? product;
  final String? agentCode;
  final String? linkId;

  @override
  State<LeadAgentConfirmOTPWidget> createState() =>
      _LeadAgentConfirmOTPWidgetState();
}

class _LeadAgentConfirmOTPWidgetState extends State<LeadAgentConfirmOTPWidget> {
  late LeadAgentConfirmOTPModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LeadAgentConfirmOTPModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.onResetTimer();

      _model.timerController.onStartTimer();
      _model.otpPageState = widget.otp!;
      _model.refPageState = widget.refotp!;
      _model.otpTimer = true;
      safeSetState(() {});
    });

    _model.pinCodeFocusNode ??= FocusNode();

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
      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.consent == 'Y')
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: Container(
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'คุณยืนยันที่จะยอมรับข้อกำหนดและ',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Noto San Thai',
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                      Text(
                        'เงื่อนไขการในการขอสินเชื่อหรือไม่?',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Noto San Thai',
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            if (widget.consent == 'N')
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: Container(
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'คุณยืนยันที่จะปฏิเสธข้อกำหนดและ',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Noto San Thai',
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                      Text(
                        'เงื่อนไขการใช้งานแอปพลิเคชันใช่หรือไม่?',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Noto San Thai',
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            if (widget.consent == 'N')
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Container(
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'หากคุณ ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto San Thai',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            TextSpan(
                              text: '”ปฏิเสธ” ',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                              ),
                            ),
                            TextSpan(
                              text: 'คุณจะไม่สามารถ',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                              ),
                            )
                          ],
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Noto San Thai',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                        child: Text(
                          'ส่งข้อมูลขอสินเชื่อได้',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Noto San Thai',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            Divider(
              thickness: 2.0,
              color: FlutterFlowTheme.of(context).alternate,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
              child: Container(
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'กรุณายืนยันรหัส OTP ',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Noto San Thai',
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                    Text(
                      'ที่ส่งไปที่หมายเลข ${functions.maskPhone(widget.phoneNo)}',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Noto San Thai',
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                      child: PinCodeTextField(
                        autoDisposeControllers: false,
                        appContext: context,
                        length: 6,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyLarge.override(
                                  fontFamily: 'Noto San Thai',
                                  letterSpacing: 0.0,
                                ),
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        enableActiveFill: true,
                        autoFocus: true,
                        focusNode: _model.pinCodeFocusNode,
                        enablePinAutofill: false,
                        errorTextSpace: 16.0,
                        showCursor: true,
                        cursorColor: FlutterFlowTheme.of(context).primary,
                        obscureText: false,
                        hintCharacter: '*',
                        keyboardType: TextInputType.number,
                        pinTheme: PinTheme(
                          fieldHeight: 44.0,
                          fieldWidth: 44.0,
                          borderWidth: 2.0,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0),
                            topLeft: Radius.circular(12.0),
                            topRight: Radius.circular(12.0),
                          ),
                          shape: PinCodeFieldShape.box,
                          activeColor: FlutterFlowTheme.of(context).primaryText,
                          inactiveColor: Color(0x7FDB771A),
                          selectedColor: FlutterFlowTheme.of(context).primary,
                          activeFillColor:
                              FlutterFlowTheme.of(context).secondary,
                          inactiveFillColor:
                              FlutterFlowTheme.of(context).secondary,
                          selectedFillColor:
                              FlutterFlowTheme.of(context).secondary,
                        ),
                        controller: _model.pinCodeController,
                        onChanged: (_) {},
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: _model.pinCodeControllerValidator
                            .asValidator(context),
                      ),
                    ),
                    Text(
                      'รหัสอ้างอิง : ${_model.refPageState}',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Noto San Thai',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                          ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                      child: FlutterFlowTimer(
                        initialTime: _model.timerInitialTimeMs,
                        getDisplayTime: (value) =>
                            StopWatchTimer.getDisplayTime(
                          value,
                          hours: false,
                          milliSecond: false,
                        ),
                        controller: _model.timerController,
                        onChanged: (value, displayTime, shouldUpdate) {
                          _model.timerMilliseconds = value;
                          _model.timerValue = displayTime;
                          if (shouldUpdate) safeSetState(() {});
                        },
                        onEnded: () async {
                          _model.otpTimer = false;
                          safeSetState(() {});
                        },
                        textAlign: TextAlign.start,
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Noto San Thai',
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (!_model.otpTimer) {
                            _model.apiResultc6pre =
                                await SrisawadApiGroup.sendAnOtpToUserCall.call(
                              phoneNumber: widget.phoneNo,
                              apiUrl: FFAppState().apiUrlDocData.apiUrlProd,
                            );

                            _model.timerController.onResetTimer();

                            _model.timerController.onStartTimer();
                            _model.otpPageState =
                                SrisawadApiGroup.sendAnOtpToUserCall.code(
                              (_model.apiResultc6pre?.jsonBody ?? ''),
                            )!;
                            _model.refPageState =
                                SrisawadApiGroup.sendAnOtpToUserCall.ref(
                              (_model.apiResultc6pre?.jsonBody ?? ''),
                            )!;
                            _model.otpTimer = true;
                            safeSetState(() {});
                          }

                          safeSetState(() {});
                        },
                        child: Text(
                          'ส่งอีกครั้ง ',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Noto San Thai',
                                color: _model.otpTimer
                                    ? FlutterFlowTheme.of(context).secondaryText
                                    : Colors.black,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: FFButtonWidget(
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        text: valueOrDefault<String>(
                          'กลับ',
                          'ย้อนกลับ',
                        ),
                        options: FFButtonOptions(
                          height: 60.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).info,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Noto San Thai',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Builder(
                        builder: (context) => FFButtonWidget(
                          onPressed: () async {
                            var _shouldSetState = false;
                            if (widget.otp != _model.pinCodeController!.text) {
                              await showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return Dialog(
                                    elevation: 0,
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    alignment: AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    child: ErrorMessageComponentWidget(
                                      textMessage: 'OTP ไม่ถูกต้อง',
                                    ),
                                  );
                                },
                              );

                              if (_shouldSetState) safeSetState(() {});
                              return;
                            }
                            if (!_model.otpTimer) {
                              await showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return Dialog(
                                    elevation: 0,
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    alignment: AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    child: MessageComponentWidget(
                                      textMessage:
                                          'OTP หมดอายุกรุณาส่งใหม่อีกครั้ง',
                                    ),
                                  );
                                },
                              );

                              if (_shouldSetState) safeSetState(() {});
                              return;
                            }
                            unawaited(
                              () async {}(),
                            );
                            if (widget.fromPage != 'customer') {
                              _model.confirmOutput =
                                  await AgentAPIGroup.consentsConfirmCall.call(
                                agentCode: widget.agentCode,
                                consentLinkId: widget.linkId,
                                isConsent: widget.consent,
                                phoneNumber: widget.phoneNo,
                                token: widget.refLead,
                                url: FFDevEnvironmentValues().isProduction
                                    ? FFAppState().apiUrlDocData.agentWebApiUrl
                                    : FFAppState()
                                        .apiUrlDocData
                                        .agentWebApiUrlUat,
                                tokenHeader:
                                    FFDevEnvironmentValues().isProduction
                                        ? FFAppState()
                                            .apiUrlDocData
                                            .agentWebApiToken
                                        : FFAppState()
                                            .apiUrlDocData
                                            .agentWebApiTokenUat,
                              );

                              _shouldSetState = true;
                              if ((_model.confirmOutput?.statusCode ?? 200) !=
                                  200) {
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: MessageComponentWidget(
                                        textMessage:
                                            'พบข้อผิดพลาด status code (${(_model.confirmOutput?.statusCode ?? 200).toString()})',
                                      ),
                                    );
                                  },
                                );

                                if (_shouldSetState) safeSetState(() {});
                                return;
                              }
                              if (AgentAPIGroup.consentsConfirmCall.code(
                                    (_model.confirmOutput?.jsonBody ?? ''),
                                  ) !=
                                  '200') {
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: MessageComponentWidget(
                                        textMessage:
                                            '${AgentAPIGroup.consentsConfirmCall.message(
                                          (_model.confirmOutput?.jsonBody ??
                                              ''),
                                        )}',
                                      ),
                                    );
                                  },
                                );

                                if (_shouldSetState) safeSetState(() {});
                                return;
                              }
                            }
                            Navigator.pop(context, <String, String?>{
                              'fromPage': widget.fromPage,
                              'consent': widget.consent,
                              'product': widget.product,
                            });
                            if (_shouldSetState) safeSetState(() {});
                          },
                          text: 'ยืนยัน',
                          options: FFButtonOptions(
                            height: 60.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Noto San Thai',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(width: 12.0)),
                ),
              ),
            ),
          ].addToStart(SizedBox(height: 12.0)).addToEnd(SizedBox(height: 12.0)),
        ),
      ),
    );
  }
}
