import '/agent_customer/drop_lead/lead_agent_confirm_o_t_p/lead_agent_confirm_o_t_p_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/error_message_component_widget.dart';
import '/components/message_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/loading/loading_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'lead_agent_consent_page_model.dart';
export 'lead_agent_consent_page_model.dart';

class LeadAgentConsentPageWidget extends StatefulWidget {
  const LeadAgentConsentPageWidget({
    super.key,
    this.ref,
    this.phone,
    this.fromPage,
    this.product,
    this.agent,
    this.linkId,
  });

  final String? ref;
  final String? phone;
  final String? fromPage;
  final String? product;
  final String? agent;
  final String? linkId;

  static String routeName = 'LeadAgentConsentPage';
  static String routePath = '/leadAgentConsentPage';

  @override
  State<LeadAgentConsentPageWidget> createState() =>
      _LeadAgentConsentPageWidgetState();
}

class _LeadAgentConsentPageWidgetState
    extends State<LeadAgentConsentPageWidget> {
  late LeadAgentConsentPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LeadAgentConsentPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setDarkModeSetting(context, ThemeMode.light);
      _model.queryUrl =
          await ApplicationRecord.getDocumentOnce(FFAppState().configDocument!);
      FFAppState().apiUrlDocData = _model.queryUrl!.apiUrl;
      safeSetState(() {});
      FFAppState().readConsent = false;
      safeSetState(() {});
      _model.linkidPageState = '${widget.linkId}';
      safeSetState(() {});
      if ('${widget.fromPage}' == 'customer') {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              content: Text('${FFAppState().saveLeadAgentData.agentCode}'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
        if (FFAppState().saveLeadAgentData.agentCode == '') {
          context.goNamed(
            TimeoutPageWidget.routeName,
            queryParameters: {
              'text': serializeParam(
                'พบข้อผิดพลาด',
                ParamType.String,
              ),
              'code': serializeParam(
                '410',
                ParamType.String,
              ),
            }.withoutNulls,
          );
        }
      } else {
        showDialog(
          context: context,
          builder: (dialogContext) {
            return Dialog(
              elevation: 0,
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              alignment: AlignmentDirectional(0.0, 0.0)
                  .resolve(Directionality.of(context)),
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(dialogContext).unfocus();
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: LoadingWidget(),
              ),
            );
          },
        );

        _model.checkConsentStatusApiOutputinti =
            await AgentAPIGroup.checkConsentStatusApiCall.call(
          agentCode: widget.agent,
          phoneNumber: functions.removeDash(widget.phone),
          token: widget.ref,
          url: FFDevEnvironmentValues().isProduction
              ? FFAppState().apiUrlDocData.agentWebApiUrl
              : FFAppState().apiUrlDocData.agentWebApiUrlUat,
          tokenHeader: FFDevEnvironmentValues().isProduction
              ? FFAppState().apiUrlDocData.agentWebApiToken
              : FFAppState().apiUrlDocData.agentWebApiTokenUat,
        );

        if ((_model.checkConsentStatusApiOutputinti?.statusCode ?? 200) ==
            200) {
        } else {
          await showDialog(
            context: context,
            builder: (dialogContext) {
              return Dialog(
                elevation: 0,
                insetPadding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                alignment: AlignmentDirectional(0.0, 0.0)
                    .resolve(Directionality.of(context)),
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(dialogContext).unfocus();
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: ErrorMessageComponentWidget(
                    textMessage:
                        'พบข้อผิดพลาด Connection(${(_model.checkConsentStatusApiOutputinti?.statusCode ?? 200).toString()})',
                  ),
                ),
              );
            },
          );

          Navigator.pop(context);
          return;
        }

        if (!(('${getJsonField(
                  (_model.checkConsentStatusApiOutputinti?.jsonBody ?? ''),
                  r'''$.code''',
                ).toString()}' !=
                '410') &&
            ('${getJsonField(
                  (_model.checkConsentStatusApiOutputinti?.jsonBody ?? ''),
                  r'''$.code''',
                ).toString()}' !=
                '410') &&
            ('${getJsonField(
                  (_model.checkConsentStatusApiOutputinti?.jsonBody ?? ''),
                  r'''$.code''',
                ).toString()}' !=
                '409'))) {
          if ('${getJsonField(
                (_model.checkConsentStatusApiOutputinti?.jsonBody ?? ''),
                r'''$.code''',
              ).toString()}' ==
              '410') {
            Navigator.pop(context);

            context.goNamed(
              TimeoutPageWidget.routeName,
              queryParameters: {
                'text': serializeParam(
                  'ลิงค์ยืนยันตัวตนหมดอายุ กรุณาให้ตัวแทนของท่านส่งลิงค์ยืนยันตัวตนใหม่อีกครั้ง',
                  ParamType.String,
                ),
                'code': serializeParam(
                  '${getJsonField(
                    (_model.checkConsentStatusApiOutputinti?.jsonBody ?? ''),
                    r'''$.code''',
                  ).toString()}',
                  ParamType.String,
                ),
              }.withoutNulls,
            );

            return;
          } else {
            if ('${getJsonField(
                  (_model.checkConsentStatusApiOutputinti?.jsonBody ?? ''),
                  r'''$.code''',
                ).toString()}' ==
                '409') {
              Navigator.pop(context);

              context.goNamed(
                TimeoutPageWidget.routeName,
                queryParameters: {
                  'text': serializeParam(
                    '${AgentAPIGroup.checkConsentStatusApiCall.isConsent(
                          (_model.checkConsentStatusApiOutputinti?.jsonBody ??
                              ''),
                        ) == 'Y' ? 'ท่านได้ทำการยืนยันความยินยอมเรียบร้อยแล้ว กรุณารอให้ตัวแทนของท่านทำรายการต่อ' : 'ท่านได้ทำการปฏิเสธคำยินยอม กรุณาให้ตัวแทนของท่านทำรายการใหม่'}',
                    ParamType.String,
                  ),
                  'code': serializeParam(
                    '${getJsonField(
                      (_model.checkConsentStatusApiOutputinti?.jsonBody ?? ''),
                      r'''$.code''',
                    ).toString()}',
                    ParamType.String,
                  ),
                }.withoutNulls,
              );

              return;
            } else {
              Navigator.pop(context);

              context.goNamed(
                TimeoutPageWidget.routeName,
                queryParameters: {
                  'text': serializeParam(
                    '${getJsonField(
                      (_model.checkConsentStatusApiOutputinti?.jsonBody ?? ''),
                      r'''$.message''',
                    ).toString()}',
                    ParamType.String,
                  ),
                  'code': serializeParam(
                    '${getJsonField(
                      (_model.checkConsentStatusApiOutputinti?.jsonBody ?? ''),
                      r'''$.code''',
                    ).toString()}',
                    ParamType.String,
                  ),
                }.withoutNulls,
              );

              return;
            }
          }
        }
        Navigator.pop(context);
      }

      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) => Title(
          title: 'โครงการเพื่อนแนะนำเพื่อน',
          color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              appBar: AppBar(
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                automaticallyImplyLeading: false,
                actions: [],
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    'ข้อกำหนดและเงื่อนไข${FFDevEnvironmentValues().isProduction ? '' : ' (UAT V.${FFAppState().webUatVersion.toString()})'}',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Noto San Thai',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  centerTitle: true,
                  expandedTitleScale: 1.0,
                ),
                elevation: 2.0,
              ),
              body: SafeArea(
                top: true,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: custom_widgets.MarkdownViewerWidget(
                              width: double.infinity,
                              height: double.infinity,
                              rebuildPage: (isBottom) async {
                                FFAppState().readConsent = isBottom!;
                                safeSetState(() {});
                                safeSetState(() {});
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Builder(
                                  builder: (context) => FFButtonWidget(
                                    onPressed: () async {
                                      var _shouldSetState = false;
                                      var confirmDialogResponse =
                                          await showDialog<bool>(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    content: Text(
                                                        'ระบบจะทำการส่ง OTP ไปยังเบอร์โทรศัพท์เพื่อยืนยันตัวตน'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                false),
                                                        child: Text('ยกเลิก'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                true),
                                                        child: Text('ตกลง'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ) ??
                                              false;
                                      if (confirmDialogResponse) {
                                        if (widget.fromPage != 'customer') {
                                          showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(dialogContext)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: LoadingWidget(),
                                                ),
                                              );
                                            },
                                          );

                                          _model.checkConsentStatusApiOutputCancle =
                                              await AgentAPIGroup
                                                  .checkConsentStatusApiCall
                                                  .call(
                                            agentCode: widget.agent,
                                            phoneNumber: functions
                                                .removeDash(widget.phone),
                                            token: widget.ref,
                                            url: FFDevEnvironmentValues()
                                                    .isProduction
                                                ? FFAppState()
                                                    .apiUrlDocData
                                                    .agentWebApiUrl
                                                : FFAppState()
                                                    .apiUrlDocData
                                                    .agentWebApiUrlUat,
                                            tokenHeader:
                                                FFDevEnvironmentValues()
                                                        .isProduction
                                                    ? FFAppState()
                                                        .apiUrlDocData
                                                        .agentWebApiToken
                                                    : FFAppState()
                                                        .apiUrlDocData
                                                        .agentWebApiTokenUat,
                                          );

                                          _shouldSetState = true;
                                          if ((_model.checkConsentStatusApiOutputCancle
                                                      ?.statusCode ??
                                                  200) !=
                                              200) {
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      FocusScope.of(
                                                              dialogContext)
                                                          .unfocus();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child:
                                                        ErrorMessageComponentWidget(
                                                      textMessage:
                                                          'พบข้อผิดพลาด Connection(${(_model.checkConsentStatusApiOutputCancle?.statusCode ?? 200).toString()})',
                                                    ),
                                                  ),
                                                );
                                              },
                                            );

                                            Navigator.pop(context);
                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          }
                                          if (('${getJsonField(
                                                    (_model.checkConsentStatusApiOutputCancle
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.code''',
                                                  ).toString()}' !=
                                                  '404') &&
                                              ('${getJsonField(
                                                    (_model.checkConsentStatusApiOutputCancle
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.code''',
                                                  ).toString()}' !=
                                                  '410') &&
                                              ('${getJsonField(
                                                    (_model.checkConsentStatusApiOutputCancle
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.code''',
                                                  ).toString()}' !=
                                                  '409')) {
                                            _model.linkidPageState =
                                                AgentAPIGroup
                                                    .checkConsentStatusApiCall
                                                    .consentLinkId(
                                                      (_model.checkConsentStatusApiOutputCancle
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!
                                                    .toString();
                                            safeSetState(() {});
                                          } else {
                                            if ('${getJsonField(
                                                  (_model.checkConsentStatusApiOutputCancle
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.code''',
                                                ).toString()}' ==
                                                '410') {
                                              Navigator.pop(context);

                                              context.goNamed(
                                                TimeoutPageWidget.routeName,
                                                queryParameters: {
                                                  'text': serializeParam(
                                                    'ลิงค์ยืนยันตัวตนหมดอายุ กรุณาให้ตัวแทนของท่านส่งลิงค์ยืนยันตัวตนใหม่อีกครั้ง',
                                                    ParamType.String,
                                                  ),
                                                  'code': serializeParam(
                                                    getJsonField(
                                                      (_model.checkConsentStatusApiOutputCancle
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.code''',
                                                    ).toString(),
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );

                                              if (_shouldSetState)
                                                safeSetState(() {});
                                              return;
                                            } else {
                                              if ('${getJsonField(
                                                    (_model.checkConsentStatusApiOutputCancle
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.code''',
                                                  ).toString()}' ==
                                                  '409') {
                                                Navigator.pop(context);

                                                context.goNamed(
                                                  TimeoutPageWidget.routeName,
                                                  queryParameters: {
                                                    'text': serializeParam(
                                                      '${AgentAPIGroup.checkConsentStatusApiCall.isConsent(
                                                            (_model.checkConsentStatusApiOutputCancle
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) == 'Y' ? 'ท่านได้ทำการยืนยันความยินยอมเรียบร้อยแล้ว กรุณารอให้ตัวแทนของท่านทำรายการต่อ' : 'ท่านได้ทำการปฏิเสธคำยินยอม กรุณาให้ตัวแทนของท่านทำรายการใหม่'}',
                                                      ParamType.String,
                                                    ),
                                                    'code': serializeParam(
                                                      getJsonField(
                                                        (_model.checkConsentStatusApiOutputCancle
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$.code''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );

                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                                return;
                                              } else {
                                                Navigator.pop(context);

                                                context.goNamed(
                                                  TimeoutPageWidget.routeName,
                                                  queryParameters: {
                                                    'text': serializeParam(
                                                      '${getJsonField(
                                                        (_model.checkConsentStatusApiOutputCancle
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$.message''',
                                                      ).toString()}',
                                                      ParamType.String,
                                                    ),
                                                    'code': serializeParam(
                                                      getJsonField(
                                                        (_model.checkConsentStatusApiOutputCancle
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$.code''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );

                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                                return;
                                              }
                                            }
                                          }

                                          Navigator.pop(context);
                                        }
                                      }
                                      _model.apiResultc6pCopy =
                                          await SrisawadApiGroup
                                              .sendAnOtpToUserCall
                                              .call(
                                        phoneNumber: widget.phone,
                                        apiUrl: FFAppState()
                                            .apiUrlDocData
                                            .apiUrlProd,
                                      );

                                      _shouldSetState = true;
                                      if ((_model.apiResultc6pCopy
                                                  ?.statusCode ??
                                              200) !=
                                          200) {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(dialogContext)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child: MessageComponentWidget(
                                                  textMessage:
                                                      'พบข้อผิดพลาด statuscode (${(_model.apiResultc6pCopy?.statusCode ?? 200).toString()})',
                                                ),
                                              ),
                                            );
                                          },
                                        );

                                        Navigator.pop(context);
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }
                                      await showDialog(
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
                                            child: GestureDetector(
                                              onTap: () {
                                                FocusScope.of(dialogContext)
                                                    .unfocus();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              child: LeadAgentConfirmOTPWidget(
                                                consent: 'N',
                                                phoneNo: widget.phone,
                                                refLead: widget.ref,
                                                url: FFDevEnvironmentValues()
                                                        .isProduction
                                                    ? FFAppState()
                                                        .apiUrlDocData
                                                        .apiUrlProd
                                                    : FFAppState()
                                                        .apiUrlDocData
                                                        .apiUrlDev,
                                                otp: SrisawadApiGroup
                                                    .sendAnOtpToUserCall
                                                    .code(
                                                  (_model.apiResultc6pCopy
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                refotp: SrisawadApiGroup
                                                    .sendAnOtpToUserCall
                                                    .ref(
                                                  (_model.apiResultc6pCopy
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                fromPage: widget.fromPage,
                                                product: widget.product,
                                                agentCode: widget.agent,
                                                linkId: _model.linkidPageState,
                                              ),
                                            ),
                                          );
                                        },
                                      );

                                      if (_shouldSetState) safeSetState(() {});
                                    },
                                    text: valueOrDefault<String>(
                                      'ปฏิเสธ',
                                      'ย้อนกลับ',
                                    ),
                                    options: FFButtonOptions(
                                      height: 60.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context).info,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Noto San Thai',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                          ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Builder(
                                  builder: (context) => FFButtonWidget(
                                    onPressed: !FFAppState().readConsent
                                        ? null
                                        : () async {
                                            var _shouldSetState = false;
                                            var confirmDialogResponse =
                                                await showDialog<bool>(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          content: Text(
                                                              'ระบบจะทำการส่ง OTP ไปยังเบอร์โทรศัพท์เพื่อยืนยันตัวตน'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      false),
                                                              child: Text(
                                                                  'ยกเลิก'),
                                                            ),
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      true),
                                                              child:
                                                                  Text('ตกลง'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ) ??
                                                    false;
                                            if (confirmDialogResponse) {
                                              if (widget.fromPage !=
                                                  'customer') {
                                                showDialog(
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(
                                                                  dialogContext)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child: LoadingWidget(),
                                                      ),
                                                    );
                                                  },
                                                );

                                                _model.checkConsentStatusApiOutput =
                                                    await AgentAPIGroup
                                                        .checkConsentStatusApiCall
                                                        .call(
                                                  agentCode: widget.agent,
                                                  phoneNumber:
                                                      functions.removeDash(
                                                          widget.phone),
                                                  token: widget.ref,
                                                  url: FFDevEnvironmentValues()
                                                          .isProduction
                                                      ? FFAppState()
                                                          .apiUrlDocData
                                                          .agentWebApiUrl
                                                      : FFAppState()
                                                          .apiUrlDocData
                                                          .agentWebApiUrlUat,
                                                  tokenHeader:
                                                      FFDevEnvironmentValues()
                                                              .isProduction
                                                          ? FFAppState()
                                                              .apiUrlDocData
                                                              .agentWebApiToken
                                                          : FFAppState()
                                                              .apiUrlDocData
                                                              .agentWebApiTokenUat,
                                                );

                                                _shouldSetState = true;
                                                if ((_model.checkConsentStatusApiOutput
                                                            ?.statusCode ??
                                                        200) !=
                                                    200) {
                                                  await showDialog(
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        alignment:
                                                            AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            FocusScope.of(
                                                                    dialogContext)
                                                                .unfocus();
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child:
                                                              ErrorMessageComponentWidget(
                                                            textMessage:
                                                                'พบข้อผิดพลาด Connection(${(_model.checkConsentStatusApiOutput?.statusCode ?? 200).toString()})',
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );

                                                  Navigator.pop(context);
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                                if (('${getJsonField(
                                                          (_model.checkConsentStatusApiOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.code''',
                                                        ).toString()}' !=
                                                        '404') &&
                                                    ('${getJsonField(
                                                          (_model.checkConsentStatusApiOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.code''',
                                                        ).toString()}' !=
                                                        '410') &&
                                                    ('${getJsonField(
                                                          (_model.checkConsentStatusApiOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.code''',
                                                        ).toString()}' !=
                                                        '409')) {
                                                  _model.linkidPageState =
                                                      AgentAPIGroup
                                                          .checkConsentStatusApiCall
                                                          .consentLinkId(
                                                            (_model.checkConsentStatusApiOutput
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )!
                                                          .toString();
                                                  safeSetState(() {});
                                                } else {
                                                  if ('${getJsonField(
                                                        (_model.checkConsentStatusApiOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$.code''',
                                                      ).toString()}' ==
                                                      '410') {
                                                    Navigator.pop(context);

                                                    context.goNamed(
                                                      TimeoutPageWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'text': serializeParam(
                                                          'ลิงค์ยืนยันตัวตนหมดอายุ กรุณาให้ตัวแทนของท่านส่งลิงค์ยืนยันตัวตนใหม่อีกครั้ง',
                                                          ParamType.String,
                                                        ),
                                                        'code': serializeParam(
                                                          getJsonField(
                                                            (_model.checkConsentStatusApiOutput
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$.code''',
                                                          ).toString(),
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );

                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                    return;
                                                  } else {
                                                    if ('${getJsonField(
                                                          (_model.checkConsentStatusApiOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.code''',
                                                        ).toString()}' ==
                                                        '409') {
                                                      Navigator.pop(context);

                                                      context.goNamed(
                                                        TimeoutPageWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'text':
                                                              serializeParam(
                                                            '${AgentAPIGroup.checkConsentStatusApiCall.isConsent(
                                                                  (_model.checkConsentStatusApiOutput
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) == 'Y' ? 'ท่านได้ทำการยืนยันความยินยอมเรียบร้อยแล้ว กรุณารอให้ตัวแทนของท่านทำรายการต่อ' : 'ท่านได้ทำการปฏิเสธคำยินยอม กรุณาให้ตัวแทนของท่านทำรายการใหม่'}',
                                                            ParamType.String,
                                                          ),
                                                          'code':
                                                              serializeParam(
                                                            getJsonField(
                                                              (_model.checkConsentStatusApiOutput
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.code''',
                                                            ).toString(),
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );

                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                      return;
                                                    } else {
                                                      Navigator.pop(context);

                                                      context.goNamed(
                                                        TimeoutPageWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'text':
                                                              serializeParam(
                                                            '${getJsonField(
                                                              (_model.checkConsentStatusApiOutput
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.message''',
                                                            ).toString()}',
                                                            ParamType.String,
                                                          ),
                                                          'code':
                                                              serializeParam(
                                                            getJsonField(
                                                              (_model.checkConsentStatusApiOutput
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.code''',
                                                            ).toString(),
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );

                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                      return;
                                                    }
                                                  }
                                                }

                                                Navigator.pop(context);
                                              }
                                              _model.apiResultc6p =
                                                  await SrisawadApiGroup
                                                      .sendAnOtpToUserCall
                                                      .call(
                                                phoneNumber: widget.phone,
                                                apiUrl: FFAppState()
                                                    .apiUrlDocData
                                                    .apiUrlProd,
                                              );

                                              _shouldSetState = true;
                                              if ((_model.apiResultc6p
                                                          ?.statusCode ??
                                                      200) !=
                                                  200) {
                                                await showDialog(
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(
                                                                  dialogContext)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child:
                                                            MessageComponentWidget(
                                                          textMessage:
                                                              'พบข้อผิดพลาด statuscode (${(_model.apiResultc6p?.statusCode ?? 200).toString()})',
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );

                                                Navigator.pop(context);
                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                                return;
                                              }
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(
                                                                dialogContext)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child:
                                                          LeadAgentConfirmOTPWidget(
                                                        consent: 'Y',
                                                        phoneNo: widget.phone,
                                                        refLead: widget.ref,
                                                        url: FFDevEnvironmentValues()
                                                                .isProduction
                                                            ? FFAppState()
                                                                .apiUrlDocData
                                                                .apiUrlProd
                                                            : FFAppState()
                                                                .apiUrlDocData
                                                                .apiUrlDev,
                                                        otp: SrisawadApiGroup
                                                            .sendAnOtpToUserCall
                                                            .code(
                                                          (_model.apiResultc6p
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ),
                                                        refotp: SrisawadApiGroup
                                                            .sendAnOtpToUserCall
                                                            .ref(
                                                          (_model.apiResultc6p
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ),
                                                        fromPage:
                                                            widget.fromPage,
                                                        product:
                                                            widget.product,
                                                        agentCode:
                                                            widget.agent,
                                                        linkId: _model
                                                            .linkidPageState,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            }
                                            if (_shouldSetState)
                                              safeSetState(() {});
                                          },
                                    text: 'ยอมรับ',
                                    options: FFButtonOptions(
                                      height: 60.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Noto San Thai',
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                          ),
                                      borderRadius: BorderRadius.circular(12.0),
                                      disabledColor: Color(0x7FDB771A),
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
