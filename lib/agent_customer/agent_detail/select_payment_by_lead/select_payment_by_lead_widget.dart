import '/backend/api_requests/api_calls.dart';
import '/components/error_message_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'select_payment_by_lead_model.dart';
export 'select_payment_by_lead_model.dart';

class SelectPaymentByLeadWidget extends StatefulWidget {
  const SelectPaymentByLeadWidget({
    super.key,
    required this.reductPercent,
    required this.bankAccount,
    String? paymentMethodDefault,
    this.id,
    required this.loanAmount,
    required this.defaultComPercent,
    required this.agentWht,
    required this.actualComPercent,
    required this.percentOnetime,
    required this.percentInstallment,
  }) : this.paymentMethodDefault =
            paymentMethodDefault ?? 'paymentMethodDefault';

  final String? reductPercent;
  final String? bankAccount;
  final String paymentMethodDefault;
  final int? id;
  final String? loanAmount;
  final String? defaultComPercent;
  final String? agentWht;
  final String? actualComPercent;
  final String? percentOnetime;
  final String? percentInstallment;

  @override
  State<SelectPaymentByLeadWidget> createState() =>
      _SelectPaymentByLeadWidgetState();
}

class _SelectPaymentByLeadWidgetState extends State<SelectPaymentByLeadWidget> {
  late SelectPaymentByLeadModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectPaymentByLeadModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.paymentMethodState = widget.paymentMethodDefault;
      _model.defaultPaymentState = widget.paymentMethodDefault;
      safeSetState(() {});
    });

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
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Icons.format_list_bulleted_outlined,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 20.0,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: Text(
                    'วิธีการรับเงิน',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Noto San Thai',
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
            child: Material(
              color: Colors.transparent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                width: double.infinity,
                height: 200.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).secondaryText,
                    width: 0.5,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.paymentMethodState = 'one_time';
                          safeSetState(() {});
                        },
                        child: Container(
                          width: double.infinity,
                          height: 80.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1.5,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 0.0, 12.0),
                                child: Builder(
                                  builder: (context) {
                                    if (_model.paymentMethodState ==
                                        'one_time') {
                                      return FaIcon(
                                        FontAwesomeIcons.dotCircle,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      );
                                    } else {
                                      return Icon(
                                        Icons.circle_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      );
                                    }
                                  },
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'รับทันที ค่าตอบแทน ${widget.percentOnetime} %',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto San Thai',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 0.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 8.0, 0.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(),
                                                    child: Text(
                                                      'ค่าตอบแทนที่คาดว่าจะได้',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto San Thai',
                                                            color: Colors.black,
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                '${'${valueOrDefault<String>(
                                                  functions.returnNumberWithComma2Decimal(FFAppState()
                                                              .maxCommissionAmountOnetime <
                                                          0.0
                                                      ? (((double.parse((functions.removeCommaFromNumText(widget.loanAmount)!))) *
                                                              (double.parse((widget
                                                                  .percentOnetime!))) /
                                                              100)
                                                          .toString())
                                                      : (double.parse((((double.parse((functions.removeCommaFromNumText(widget.loanAmount)!))) * (double.parse((widget.percentOnetime!))) / 100)
                                                                  .toString())) <
                                                              FFAppState()
                                                                  .maxCommissionAmountOnetime
                                                          ? (((double.parse((functions.removeCommaFromNumText(widget.loanAmount)!))) *
                                                                  (double.parse((widget.percentOnetime!))) /
                                                                  100)
                                                              .toString())
                                                          : '${FFAppState().maxCommissionAmountOnetime.toString()}')),
                                                  '0',
                                                )} บาท'}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto San Thai',
                                                          color: Colors.black,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 4.0)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.paymentMethodState = 'installment';
                          safeSetState(() {});
                        },
                        child: Container(
                          width: double.infinity,
                          height: 80.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1.5,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 0.0, 12.0),
                                child: Builder(
                                  builder: (context) {
                                    if (_model.paymentMethodState ==
                                        'installment') {
                                      return FaIcon(
                                        FontAwesomeIcons.dotCircle,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      );
                                    } else {
                                      return Icon(
                                        Icons.circle_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      );
                                    }
                                  },
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'รับแบบแบ่งจ่าย ค่าตอบแทน ${widget.percentInstallment} %',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto San Thai',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 0.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 8.0, 0.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(),
                                                    child: Text(
                                                      'ค่าตอบแทนที่คาดว่าจะได้ ',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto San Thai',
                                                            color: Colors.black,
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                '${'${valueOrDefault<String>(
                                                  functions.returnNumberWithComma2Decimal(FFAppState()
                                                              .maxCommissionAmountInstallment <
                                                          0.0
                                                      ? (((double.parse((functions.removeCommaFromNumText(widget.loanAmount)!))) *
                                                              (double.parse((widget
                                                                  .percentInstallment!))) /
                                                              100)
                                                          .toString())
                                                      : (double.parse((((double.parse((functions.removeCommaFromNumText(widget.loanAmount)!))) * (double.parse((widget.percentInstallment!))) / 100)
                                                                  .toString())) <
                                                              FFAppState()
                                                                  .maxCommissionAmountInstallment
                                                          ? (((double.parse((functions.removeCommaFromNumText(widget.loanAmount)!))) *
                                                                  (double.parse((widget.percentInstallment!))) /
                                                                  100)
                                                              .toString())
                                                          : '${FFAppState().maxCommissionAmountInstallment.toString()}')),
                                                  '0',
                                                )} บาท'}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto San Thai',
                                                          color: Colors.black,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 4.0)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Builder(
                    builder: (context) => Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 5.0),
                      child: FFButtonWidget(
                        onPressed: (_model.paymentMethodState ==
                                _model.defaultPaymentState)
                            ? null
                            : () async {
                                var _shouldSetState = false;
                                _model.apiResultyyt = await AgentAPIGroup
                                    .agentLeadSaveByLeadCall
                                    .call(
                                  agentCode: FFAppState()
                                      .agentProfileDataType
                                      .agentCode,
                                  paymentMethod: _model.paymentMethodState,
                                  deductionPercent: widget.reductPercent,
                                  id: widget.id,
                                  loanAmount: widget.loanAmount,
                                  defaultComPercent: widget.defaultComPercent,
                                  agentWht: widget.agentWht,
                                  url: FFDevEnvironmentValues().isProduction
                                      ? FFAppState()
                                          .apiUrlDocData
                                          .agentWebApiUrl
                                      : FFAppState()
                                          .apiUrlDocData
                                          .agentWebApiUrlUat,
                                  actualComPercent: widget.actualComPercent,
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
                                if ('${(_model.apiResultyyt?.statusCode ?? 200).toString()}' !=
                                    '200') {
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: ErrorMessageComponentWidget(
                                          textMessage:
                                              'พบข้อผิดพลาด(${(_model.apiResultyyt?.statusCode ?? 200).toString()})',
                                        ),
                                      );
                                    },
                                  );

                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }
                                if ('${getJsonField(
                                      (_model.apiResultyyt?.jsonBody ?? ''),
                                      r'''$.code''',
                                    ).toString()}' !=
                                    '200') {
                                  if ('${getJsonField(
                                        (_model.apiResultyyt?.jsonBody ?? ''),
                                        r'''$.code''',
                                      ).toString()}' ==
                                      '409') {
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
                                          child: ErrorMessageComponentWidget(
                                            textMessage:
                                                '${AgentAPIGroup.agentLeadSaveByLeadCall.message(
                                              (_model.apiResultyyt?.jsonBody ??
                                                  ''),
                                            )}',
                                          ),
                                        );
                                      },
                                    );

                                    Navigator.pop(
                                        context,
                                        '${getJsonField(
                                          (_model.apiResultyyt?.jsonBody ?? ''),
                                          r'''$.code''',
                                        ).toString()}');
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  } else {
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
                                          child: ErrorMessageComponentWidget(
                                            textMessage: AgentAPIGroup
                                                .agentLeadSaveByLeadCall
                                                .message(
                                              (_model.apiResultyyt?.jsonBody ??
                                                  ''),
                                            )!,
                                          ),
                                        );
                                      },
                                    );

                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  }
                                }
                                Navigator.pop(
                                    context, _model.paymentMethodState);
                                if (_shouldSetState) safeSetState(() {});
                              },
                        text: 'บันทึกข้อมูล',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Noto San Thai',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                          elevation: 2.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(14.0),
                            topRight: Radius.circular(14.0),
                            bottomLeft: Radius.circular(14.0),
                            bottomRight: Radius.circular(14.0),
                          ),
                          disabledColor: Color(0x7FDB771A),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ].addToStart(SizedBox(height: 8.0)).addToEnd(SizedBox(height: 12.0)),
      ),
    );
  }
}
