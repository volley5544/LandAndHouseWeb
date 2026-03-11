import '/backend/api_requests/api_calls.dart';
import '/components/message_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/loading/loading_widget.dart';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'confirm_agent_register_model.dart';
export 'confirm_agent_register_model.dart';

class ConfirmAgentRegisterWidget extends StatefulWidget {
  const ConfirmAgentRegisterWidget({
    super.key,
    required this.textMessage,
    this.titleMessage,
    this.typeButton,
    this.textMessage2,
    this.referrerCode,
    this.referrerName,
  });

  final String? textMessage;
  final String? titleMessage;
  final String? typeButton;
  final String? textMessage2;
  final String? referrerCode;
  final String? referrerName;

  @override
  State<ConfirmAgentRegisterWidget> createState() =>
      _ConfirmAgentRegisterWidgetState();
}

class _ConfirmAgentRegisterWidgetState
    extends State<ConfirmAgentRegisterWidget> {
  late ConfirmAgentRegisterModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmAgentRegisterModel());

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

    return Container(
      width: () {
        if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
          return (MediaQuery.sizeOf(context).width * 0.95);
        } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
          return (MediaQuery.sizeOf(context).width * 0.95);
        } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
          return (MediaQuery.sizeOf(context).width * 0.95);
        } else {
          return (MediaQuery.sizeOf(context).width * 0.25);
        }
      }(),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Builder(
            builder: (context) {
              if (widget.typeButton == 'Y') {
                return Icon(
                  Icons.check_circle,
                  color: Color(0xFF0DED45),
                  size: () {
                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                      return 45.0;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointMedium) {
                      return 45.0;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointLarge) {
                      return 60.0;
                    } else {
                      return 60.0;
                    }
                  }(),
                );
              } else {
                return Icon(
                  Icons.report_problem,
                  color: FlutterFlowTheme.of(context).error,
                  size: () {
                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                      return 45.0;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointMedium) {
                      return 45.0;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointLarge) {
                      return 60.0;
                    } else {
                      return 60.0;
                    }
                  }(),
                );
              }
            },
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 50.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: AutoSizeText(
                            valueOrDefault<String>(
                              widget.titleMessage,
                              '-',
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  font: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                                  color: widget.typeButton == 'Y'
                                      ? FlutterFlowTheme.of(context).primaryText
                                      : FlutterFlowTheme.of(context).error,
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 0.0),
                            child: AutoSizeText(
                              valueOrDefault<String>(
                                widget.textMessage,
                                '-',
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    font: GoogleFonts.plusJakartaSans(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF606A85),
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 12.0)),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: FFButtonWidget(
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    text: 'ตรวจสอบอีกครั้ง',
                    options: FFButtonOptions(
                      width: 150.0,
                      height: 50.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).info,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Noto San Thai',
                                color: FlutterFlowTheme.of(context).primary,
                                letterSpacing: 0.0,
                              ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                Expanded(
                  child: Builder(
                    builder: (context) => FFButtonWidget(
                      onPressed: () async {
                        var _shouldSetState = false;
                        showDialog(
                          context: context,
                          builder: (dialogContext) {
                            return Dialog(
                              elevation: 0,
                              insetPadding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              alignment: AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              child: LoadingWidget(),
                            );
                          },
                        );

                        _model.apiResults3n =
                            await AgentAPIGroup.agentsConfirmMGMCall.call(
                          agentCode:
                              FFAppState().agentProfileDataType.agentCode,
                          isConfirmed: widget.typeButton,
                          url: FFDevEnvironmentValues().isProduction
                              ? FFAppState().apiUrlDocData.agentWebApiUrl
                              : FFAppState().apiUrlDocData.agentWebApiUrlUat,
                          referrerCode: widget.referrerCode,
                          referrerName: widget.referrerName,
                          tokenHeader: FFDevEnvironmentValues().isProduction
                              ? FFAppState().apiUrlDocData.agentWebApiToken
                              : FFAppState().apiUrlDocData.agentWebApiTokenUat,
                        );

                        _shouldSetState = true;
                        if ((_model.apiResults3n?.statusCode ?? 200) != 200) {
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
                                      'พบข้อผิดพลาด status​ (${(_model.apiResults3n?.statusCode ?? 200).toString()})',
                                ),
                              );
                            },
                          );

                          Navigator.pop(context);
                          if (_shouldSetState) safeSetState(() {});
                          return;
                        }
                        if (!((AgentAPIGroup.agentsConfirmMGMCall.statusCode(
                                  (_model.apiResults3n?.jsonBody ?? ''),
                                ) ==
                                200) ||
                            (AgentAPIGroup.agentsConfirmMGMCall.statusCode(
                                  (_model.apiResults3n?.jsonBody ?? ''),
                                ) ==
                                201))) {
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
                                      '${AgentAPIGroup.agentsConfirmMGMCall.message(
                                    (_model.apiResults3n?.jsonBody ?? ''),
                                  )}',
                                ),
                              );
                            },
                          );

                          Navigator.pop(context);
                          if (_shouldSetState) safeSetState(() {});
                          return;
                        }
                        Navigator.pop(context);

                        context.goNamed(
                          AgentConfirmSuccesPageWidget.routeName,
                          queryParameters: {
                            'confirm': serializeParam(
                              widget.typeButton,
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );

                        if (_shouldSetState) safeSetState(() {});
                      },
                      text: 'ยืนยัน',
                      options: FFButtonOptions(
                        width: 150.0,
                        height: 50.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Noto San Thai',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ].divide(SizedBox(width: 16.0)),
            ),
          ),
        ].addToStart(SizedBox(height: 30.0)).addToEnd(SizedBox(height: 30.0)),
      ),
    );
  }
}
