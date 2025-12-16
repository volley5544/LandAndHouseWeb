import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/land_and_house_app/imgdetails_rawang/imgdetails_rawang_widget.dart';
import '/pages/loading/loading_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'check_rate_l_h_form_component_model.dart';
export 'check_rate_l_h_form_component_model.dart';

class CheckRateLHFormComponentWidget extends StatefulWidget {
  const CheckRateLHFormComponentWidget({
    super.key,
    required this.updateFormState,
    bool? isOnlyCheckRate,
  }) : this.isOnlyCheckRate = isOnlyCheckRate ?? true;

  final Future Function(bool isFormState)? updateFormState;
  final bool isOnlyCheckRate;

  @override
  State<CheckRateLHFormComponentWidget> createState() =>
      _CheckRateLHFormComponentWidgetState();
}

class _CheckRateLHFormComponentWidgetState
    extends State<CheckRateLHFormComponentWidget>
    with TickerProviderStateMixin {
  late CheckRateLHFormComponentModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckRateLHFormComponentModel());

    _model.chanodNumberTextFieldTextController ??= TextEditingController();
    _model.chanodNumberTextFieldFocusNode ??= FocusNode();

    _model.rawangTextFieldTextController ??= TextEditingController();
    _model.rawangTextFieldFocusNode ??= FocusNode();
    _model.rawangTextFieldFocusNode!.addListener(
      () async {
        if (_model.rawangTextFieldTextController.text != '') {
          if ((_model.rawangTextFieldFocusNode?.hasFocus ?? false)) {
            safeSetState(() {
              _model.rawangTextFieldTextController?.text =
                  functions.replaceSpaceInText(
                      _model.rawangTextFieldTextController.text)!;
            });
          } else {
            safeSetState(() {
              _model.rawangTextFieldTextController?.text =
                  functions.rawangFormattedFunction(
                      _model.rawangTextFieldTextController.text)!;
            });
          }
        }
      },
    );
    _model.raiTextFieldTextController ??= TextEditingController();
    _model.raiTextFieldFocusNode ??= FocusNode();
    _model.raiTextFieldFocusNode!.addListener(
      () async {
        if (_model.raiTextFieldTextController.text != '') {
          if ((_model.raiTextFieldFocusNode?.hasFocus ?? false)) {
            safeSetState(() {
              _model.raiTextFieldTextController?.text =
                  functions.removeCommaFromNumText(
                      _model.raiTextFieldTextController.text)!;
            });
          } else {
            safeSetState(() {
              _model.raiTextFieldTextController?.text =
                  functions.returnNumberWithCommaFullNumber(
                      _model.raiTextFieldTextController.text, '0')!;
            });
          }
        }
      },
    );
    _model.nganTextFieldTextController ??= TextEditingController();
    _model.nganTextFieldFocusNode ??= FocusNode();
    _model.nganTextFieldFocusNode!.addListener(
      () async {
        if (_model.nganTextFieldTextController.text != '') {
          if ((_model.nganTextFieldFocusNode?.hasFocus ?? false)) {
            safeSetState(() {
              _model.nganTextFieldTextController?.text =
                  functions.removeCommaFromNumText(
                      _model.nganTextFieldTextController.text)!;
            });
          } else {
            safeSetState(() {
              _model.nganTextFieldTextController?.text =
                  functions.returnNumberWithCommaFullNumber(
                      _model.nganTextFieldTextController.text, '0')!;
            });
          }
        }
      },
    );
    _model.tarangWaTextFieldTextController ??= TextEditingController();
    _model.tarangWaTextFieldFocusNode ??= FocusNode();
    _model.tarangWaTextFieldFocusNode!.addListener(
      () async {
        if (_model.tarangWaTextFieldTextController.text != '') {
          if ((_model.tarangWaTextFieldFocusNode?.hasFocus ?? false)) {
            safeSetState(() {
              _model.tarangWaTextFieldTextController?.text =
                  functions.removeCommaFromNumText(
                      _model.tarangWaTextFieldTextController.text)!;
            });
          } else {
            safeSetState(() {
              _model.tarangWaTextFieldTextController?.text =
                  functions.returnNumberWithCommaFullNumber(
                      _model.tarangWaTextFieldTextController.text, '0')!;
            });
          }
        }
      },
    );
    _model.textController6 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(
      () async {
        if ((_model.textFieldFocusNode?.hasFocus ?? false)) {
          safeSetState(() {
            _model.textController6?.text =
                functions.removeCommaFromNumText(_model.textController6.text)!;
          });
        } else {
          if (_model.textController6.text != '0') {
            safeSetState(() {
              _model.textController6?.text = functions
                  .returnNumberWithComma2Decimal(_model.textController6.text)!;
            });
          } else {
            safeSetState(() {
              _model.textController6?.text = '0';
            });
          }
        }
      },
    );
    animationsMap.addAll({
      'imageOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, -30.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'imageOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, -30.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Builder(
              builder: (context) {
                if (_model.isFormState) {
                  return Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: () {
                            if (MediaQuery.sizeOf(context).width <
                                kBreakpointSmall) {
                              return 25.0;
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointMedium) {
                              return 40.0;
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointLarge) {
                              return 40.0;
                            } else {
                              return 40.0;
                            }
                          }(),
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 100.0,
                                child: VerticalDivider(
                                  width: 3.0,
                                  thickness: 3.0,
                                  color: Color(0x7FDB771A),
                                ),
                              ),
                              Text(
                                'ประเมินราคาที่ดิน',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Noto San Thai',
                                      fontSize: () {
                                        if (MediaQuery.sizeOf(context).width <
                                            kBreakpointSmall) {
                                          return 18.0;
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointMedium) {
                                          return 24.0;
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointLarge) {
                                          return 24.0;
                                        } else {
                                          return 24.0;
                                        }
                                      }(),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: Container(
                            width: () {
                              if (MediaQuery.sizeOf(context).width <
                                  kBreakpointSmall) {
                                return MediaQuery.sizeOf(context).width;
                              } else if (MediaQuery.sizeOf(context).width <
                                  kBreakpointMedium) {
                                return MediaQuery.sizeOf(context).width;
                              } else if (MediaQuery.sizeOf(context).width <
                                  kBreakpointLarge) {
                                return 600.0;
                              } else {
                                return 600.0;
                              }
                            }(),
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.isSearchByChanod = true;
                                      safeSetState(() {});
                                    },
                                    child: Container(
                                      width: () {
                                        if (MediaQuery.sizeOf(context).width <
                                            kBreakpointSmall) {
                                          return MediaQuery.sizeOf(context)
                                              .width;
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointMedium) {
                                          return MediaQuery.sizeOf(context)
                                              .width;
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointLarge) {
                                          return 600.0;
                                        } else {
                                          return 600.0;
                                        }
                                      }(),
                                      height: () {
                                        if (MediaQuery.sizeOf(context).width <
                                            kBreakpointSmall) {
                                          return 50.0;
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointMedium) {
                                          return 70.0;
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointLarge) {
                                          return 70.0;
                                        } else {
                                          return 70.0;
                                        }
                                      }(),
                                      decoration: BoxDecoration(
                                        color: _model.isSearchByChanod
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(12.0),
                                          bottomRight: Radius.circular(0.0),
                                          topLeft: Radius.circular(12.0),
                                          topRight: Radius.circular(0.0),
                                        ),
                                        border: Border.all(
                                          color: _model.isSearchByChanod
                                              ? Colors.transparent
                                              : FlutterFlowTheme.of(context)
                                                  .primary,
                                          width: _model.isSearchByChanod
                                              ? 0.0
                                              : 2.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'ค้นหาโดยเลขโฉนด',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Noto San Thai',
                                                    color: _model
                                                            .isSearchByChanod
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .secondary
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    fontSize: () {
                                                      if (MediaQuery.sizeOf(
                                                                  context)
                                                              .width <
                                                          kBreakpointSmall) {
                                                        return 16.0;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width <
                                                          kBreakpointMedium) {
                                                        return 22.0;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width <
                                                          kBreakpointLarge) {
                                                        return 22.0;
                                                      } else {
                                                        return 22.0;
                                                      }
                                                    }(),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.isSearchByChanod = false;
                                      safeSetState(() {});
                                    },
                                    child: Container(
                                      width: () {
                                        if (MediaQuery.sizeOf(context).width <
                                            kBreakpointSmall) {
                                          return MediaQuery.sizeOf(context)
                                              .width;
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointMedium) {
                                          return MediaQuery.sizeOf(context)
                                              .width;
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointLarge) {
                                          return 600.0;
                                        } else {
                                          return 600.0;
                                        }
                                      }(),
                                      height: () {
                                        if (MediaQuery.sizeOf(context).width <
                                            kBreakpointSmall) {
                                          return 50.0;
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointMedium) {
                                          return 70.0;
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointLarge) {
                                          return 70.0;
                                        } else {
                                          return 70.0;
                                        }
                                      }(),
                                      decoration: BoxDecoration(
                                        color: !_model.isSearchByChanod
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(0.0),
                                          bottomRight: Radius.circular(12.0),
                                          topLeft: Radius.circular(0.0),
                                          topRight: Radius.circular(12.0),
                                        ),
                                        border: Border.all(
                                          color: !_model.isSearchByChanod
                                              ? Colors.transparent
                                              : FlutterFlowTheme.of(context)
                                                  .primary,
                                          width: !_model.isSearchByChanod
                                              ? 0.0
                                              : 2.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'ค้นหาโดยเลขที่ดิน',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Noto San Thai',
                                                    color: !_model
                                                            .isSearchByChanod
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .secondary
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    fontSize: () {
                                                      if (MediaQuery.sizeOf(
                                                                  context)
                                                              .width <
                                                          kBreakpointSmall) {
                                                        return 16.0;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width <
                                                          kBreakpointMedium) {
                                                        return 22.0;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width <
                                                          kBreakpointLarge) {
                                                        return 22.0;
                                                      } else {
                                                        return 22.0;
                                                      }
                                                    }(),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'กรุณาเลือกรายการที่ต้องการค้นหา',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Noto San Thai',
                                      fontSize: () {
                                        if (MediaQuery.sizeOf(context).width <
                                            kBreakpointSmall) {
                                          return 16.0;
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointMedium) {
                                          return 22.0;
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointLarge) {
                                          return 22.0;
                                        } else {
                                          return 22.0;
                                        }
                                      }(),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(),
                                  child: Text(
                                    '*ไม่รองรับการประเมินราคาห้องชุดและนส.3 ก',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Noto San Thai',
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          fontSize: () {
                                            if (MediaQuery.sizeOf(context)
                                                    .width <
                                                kBreakpointSmall) {
                                              return 18.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointMedium) {
                                              return 24.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointLarge) {
                                              return 24.0;
                                            } else {
                                              return 24.0;
                                            }
                                          }(),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(),
                                child: Text(
                                  'ราคาประเมินเบื้องต้นเท่านั้น ไม่รวมสิ่งปลูกสร้าง',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto San Thai',
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        fontSize: () {
                                          if (MediaQuery.sizeOf(context).width <
                                              kBreakpointSmall) {
                                            return 16.0;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointMedium) {
                                            return 22.0;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointLarge) {
                                            return 22.0;
                                          } else {
                                            return 22.0;
                                          }
                                        }(),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      _model.isSearchByChanod
                                          ? 'เลขโฉนด'
                                          : 'เลขที่ดิน',
                                      'เลขโฉนดที่ดิน',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Noto San Thai',
                                          fontSize: () {
                                            if (MediaQuery.sizeOf(context)
                                                    .width <
                                                kBreakpointSmall) {
                                              return 14.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointMedium) {
                                              return 20.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointLarge) {
                                              return 20.0;
                                            } else {
                                              return 20.0;
                                            }
                                          }(),
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      '*',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Noto San Thai',
                                            color: Color(0xFFFF0004),
                                            fontSize: () {
                                              if (MediaQuery.sizeOf(context)
                                                      .width <
                                                  kBreakpointSmall) {
                                                return 18.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointMedium) {
                                                return 22.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointLarge) {
                                                return 22.0;
                                              } else {
                                                return 22.0;
                                              }
                                            }(),
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: Container(
                                  width: () {
                                    if (MediaQuery.sizeOf(context).width <
                                        kBreakpointSmall) {
                                      return MediaQuery.sizeOf(context).width;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointMedium) {
                                      return MediaQuery.sizeOf(context).width;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointLarge) {
                                      return 600.0;
                                    } else {
                                      return 600.0;
                                    }
                                  }(),
                                  height: () {
                                    if (MediaQuery.sizeOf(context).width <
                                        kBreakpointSmall) {
                                      return 50.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointMedium) {
                                      return 70.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointLarge) {
                                      return 70.0;
                                    } else {
                                      return 70.0;
                                    }
                                  }(),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    child: TextFormField(
                                      controller: _model
                                          .chanodNumberTextFieldTextController,
                                      focusNode:
                                          _model.chanodNumberTextFieldFocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: false,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Noto San Thai',
                                              letterSpacing: 0.0,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Noto San Thai',
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Noto San Thai',
                                            color: Colors.black,
                                            fontSize: () {
                                              if (MediaQuery.sizeOf(context)
                                                      .width <
                                                  kBreakpointSmall) {
                                                return 14.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointMedium) {
                                                return 20.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointLarge) {
                                                return 20.0;
                                              } else {
                                                return 20.0;
                                              }
                                            }(),
                                            letterSpacing: 0.0,
                                          ),
                                      keyboardType: TextInputType.number,
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      validator: _model
                                          .chanodNumberTextFieldTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (!_model.isSearchByChanod)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'ระวาง',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Noto San Thai',
                                            fontSize: () {
                                              if (MediaQuery.sizeOf(context)
                                                      .width <
                                                  kBreakpointSmall) {
                                                return 14.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointMedium) {
                                                return 20.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointLarge) {
                                                return 20.0;
                                              } else {
                                                return 20.0;
                                              }
                                            }(),
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        '*',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto San Thai',
                                              color: Color(0xFFFF0004),
                                              fontSize: () {
                                                if (MediaQuery.sizeOf(context)
                                                        .width <
                                                    kBreakpointSmall) {
                                                  return 18.0;
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointMedium) {
                                                  return 22.0;
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointLarge) {
                                                  return 22.0;
                                                } else {
                                                  return 22.0;
                                                }
                                              }(),
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) => InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await showDialog(
                                            barrierColor: Color(0xB2000000),
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
                                                child: ImgdetailsRawangWidget(),
                                              );
                                            },
                                          );
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Builder(
                                              builder: (context) =>
                                                  FlutterFlowIconButton(
                                                borderRadius: 8.0,
                                                buttonSize: 40.0,
                                                icon: Icon(
                                                  Icons
                                                      .content_paste_search_outlined,
                                                  color: Color(0xCC000000),
                                                  size: () {
                                                    if (MediaQuery.sizeOf(
                                                                context)
                                                            .width <
                                                        kBreakpointSmall) {
                                                      return 20.0;
                                                    } else if (MediaQuery
                                                                .sizeOf(context)
                                                            .width <
                                                        kBreakpointMedium) {
                                                      return 24.0;
                                                    } else if (MediaQuery
                                                                .sizeOf(context)
                                                            .width <
                                                        kBreakpointLarge) {
                                                      return 24.0;
                                                    } else {
                                                      return 24.0;
                                                    }
                                                  }(),
                                                ),
                                                onPressed: () async {
                                                  await showDialog(
                                                    barrierColor:
                                                        Color(0xB2000000),
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
                                                        child:
                                                            ImgdetailsRawangWidget(),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                            Text(
                                              'ดูตัวอย่าง',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Noto San Thai',
                                                    color: Colors.black,
                                                    fontSize: () {
                                                      if (MediaQuery.sizeOf(
                                                                  context)
                                                              .width <
                                                          kBreakpointSmall) {
                                                        return 14.0;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width <
                                                          kBreakpointMedium) {
                                                        return 20.0;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width <
                                                          kBreakpointLarge) {
                                                        return 20.0;
                                                      } else {
                                                        return 20.0;
                                                      }
                                                    }(),
                                                    letterSpacing: 0.0,
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: Container(
                                    width: () {
                                      if (MediaQuery.sizeOf(context).width <
                                          kBreakpointSmall) {
                                        return MediaQuery.sizeOf(context).width;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointMedium) {
                                        return MediaQuery.sizeOf(context).width;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointLarge) {
                                        return 600.0;
                                      } else {
                                        return 600.0;
                                      }
                                    }(),
                                    height: () {
                                      if (MediaQuery.sizeOf(context).width <
                                          kBreakpointSmall) {
                                        return 50.0;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointMedium) {
                                        return 70.0;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointLarge) {
                                        return 70.0;
                                      } else {
                                        return 70.0;
                                      }
                                    }(),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller: _model
                                            .rawangTextFieldTextController,
                                        focusNode:
                                            _model.rawangTextFieldFocusNode,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: false,
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Noto San Thai',
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Noto San Thai',
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto San Thai',
                                              color: Colors.black,
                                              fontSize: () {
                                                if (MediaQuery.sizeOf(context)
                                                        .width <
                                                    kBreakpointSmall) {
                                                  return 14.0;
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointMedium) {
                                                  return 20.0;
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointLarge) {
                                                  return 20.0;
                                                } else {
                                                  return 20.0;
                                                }
                                              }(),
                                              letterSpacing: 0.0,
                                            ),
                                        maxLength: 13,
                                        maxLengthEnforcement:
                                            MaxLengthEnforcement.enforced,
                                        buildCounter: (context,
                                                {required currentLength,
                                                required isFocused,
                                                maxLength}) =>
                                            null,
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        validator: _model
                                            .rawangTextFieldTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'ตำบล/แขวง',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Noto San Thai',
                                          fontSize: () {
                                            if (MediaQuery.sizeOf(context)
                                                    .width <
                                                kBreakpointSmall) {
                                              return 14.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointMedium) {
                                              return 20.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointLarge) {
                                              return 20.0;
                                            } else {
                                              return 20.0;
                                            }
                                          }(),
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      '*',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Noto San Thai',
                                            color: Color(0xFFFF0004),
                                            fontSize: () {
                                              if (MediaQuery.sizeOf(context)
                                                      .width <
                                                  kBreakpointSmall) {
                                                return 18.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointMedium) {
                                                return 22.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointLarge) {
                                                return 22.0;
                                              } else {
                                                return 22.0;
                                              }
                                            }(),
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                        SearchLocationWidget.routeName);
                                  },
                                  child: Container(
                                    width: () {
                                      if (MediaQuery.sizeOf(context).width <
                                          kBreakpointSmall) {
                                        return MediaQuery.sizeOf(context).width;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointMedium) {
                                        return MediaQuery.sizeOf(context).width;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointLarge) {
                                        return 600.0;
                                      } else {
                                        return 600.0;
                                      }
                                    }(),
                                    height: () {
                                      if (MediaQuery.sizeOf(context).width <
                                          kBreakpointSmall) {
                                        return 50.0;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointMedium) {
                                        return 70.0;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointLarge) {
                                        return 70.0;
                                      } else {
                                        return 70.0;
                                      }
                                    }(),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                    ),
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        FFAppState()
                                            .addressOutput
                                            .subdistrictName,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto San Thai',
                                              fontSize: () {
                                                if (MediaQuery.sizeOf(context)
                                                        .width <
                                                    kBreakpointSmall) {
                                                  return 14.0;
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointMedium) {
                                                  return 20.0;
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointLarge) {
                                                  return 20.0;
                                                } else {
                                                  return 20.0;
                                                }
                                              }(),
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'อำเภอ/เขต',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Noto San Thai',
                                          fontSize: () {
                                            if (MediaQuery.sizeOf(context)
                                                    .width <
                                                kBreakpointSmall) {
                                              return 14.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointMedium) {
                                              return 20.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointLarge) {
                                              return 20.0;
                                            } else {
                                              return 20.0;
                                            }
                                          }(),
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      '*',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Noto San Thai',
                                            color: Color(0xFFFF0004),
                                            fontSize: () {
                                              if (MediaQuery.sizeOf(context)
                                                      .width <
                                                  kBreakpointSmall) {
                                                return 18.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointMedium) {
                                                return 22.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointLarge) {
                                                return 22.0;
                                              } else {
                                                return 22.0;
                                              }
                                            }(),
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                        SearchLocationWidget.routeName);
                                  },
                                  child: Container(
                                    width: () {
                                      if (MediaQuery.sizeOf(context).width <
                                          kBreakpointSmall) {
                                        return MediaQuery.sizeOf(context).width;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointMedium) {
                                        return MediaQuery.sizeOf(context).width;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointLarge) {
                                        return 600.0;
                                      } else {
                                        return 600.0;
                                      }
                                    }(),
                                    height: () {
                                      if (MediaQuery.sizeOf(context).width <
                                          kBreakpointSmall) {
                                        return 50.0;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointMedium) {
                                        return 70.0;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointLarge) {
                                        return 70.0;
                                      } else {
                                        return 70.0;
                                      }
                                    }(),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                    ),
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        FFAppState().addressOutput.districtName,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto San Thai',
                                              fontSize: () {
                                                if (MediaQuery.sizeOf(context)
                                                        .width <
                                                    kBreakpointSmall) {
                                                  return 14.0;
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointMedium) {
                                                  return 20.0;
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointLarge) {
                                                  return 20.0;
                                                } else {
                                                  return 20.0;
                                                }
                                              }(),
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'จังหวัด',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Noto San Thai',
                                          fontSize: () {
                                            if (MediaQuery.sizeOf(context)
                                                    .width <
                                                kBreakpointSmall) {
                                              return 14.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointMedium) {
                                              return 20.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointLarge) {
                                              return 20.0;
                                            } else {
                                              return 20.0;
                                            }
                                          }(),
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      '*',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Noto San Thai',
                                            color: Color(0xFFFF0004),
                                            fontSize: () {
                                              if (MediaQuery.sizeOf(context)
                                                      .width <
                                                  kBreakpointSmall) {
                                                return 18.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointMedium) {
                                                return 22.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointLarge) {
                                                return 22.0;
                                              } else {
                                                return 22.0;
                                              }
                                            }(),
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                        SearchLocationWidget.routeName);
                                  },
                                  child: Container(
                                    width: () {
                                      if (MediaQuery.sizeOf(context).width <
                                          kBreakpointSmall) {
                                        return MediaQuery.sizeOf(context).width;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointMedium) {
                                        return MediaQuery.sizeOf(context).width;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointLarge) {
                                        return 600.0;
                                      } else {
                                        return 600.0;
                                      }
                                    }(),
                                    height: () {
                                      if (MediaQuery.sizeOf(context).width <
                                          kBreakpointSmall) {
                                        return 50.0;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointMedium) {
                                        return 70.0;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointLarge) {
                                        return 70.0;
                                      } else {
                                        return 70.0;
                                      }
                                    }(),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFAppState()
                                              .addressOutput
                                              .provinceName,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto San Thai',
                                                fontSize: () {
                                                  if (MediaQuery.sizeOf(context)
                                                          .width <
                                                      kBreakpointSmall) {
                                                    return 14.0;
                                                  } else if (MediaQuery.sizeOf(
                                                              context)
                                                          .width <
                                                      kBreakpointMedium) {
                                                    return 20.0;
                                                  } else if (MediaQuery.sizeOf(
                                                              context)
                                                          .width <
                                                      kBreakpointLarge) {
                                                    return 20.0;
                                                  } else {
                                                    return 20.0;
                                                  }
                                                }(),
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'ไร่',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Noto San Thai',
                                          fontSize: () {
                                            if (MediaQuery.sizeOf(context)
                                                    .width <
                                                kBreakpointSmall) {
                                              return 14.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointMedium) {
                                              return 20.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointLarge) {
                                              return 20.0;
                                            } else {
                                              return 20.0;
                                            }
                                          }(),
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      '*',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Noto San Thai',
                                            color: Color(0xFFFF0004),
                                            fontSize: () {
                                              if (MediaQuery.sizeOf(context)
                                                      .width <
                                                  kBreakpointSmall) {
                                                return 18.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointMedium) {
                                                return 22.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointLarge) {
                                                return 22.0;
                                              } else {
                                                return 22.0;
                                              }
                                            }(),
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: Container(
                                  width: () {
                                    if (MediaQuery.sizeOf(context).width <
                                        kBreakpointSmall) {
                                      return MediaQuery.sizeOf(context).width;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointMedium) {
                                      return MediaQuery.sizeOf(context).width;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointLarge) {
                                      return 600.0;
                                    } else {
                                      return 600.0;
                                    }
                                  }(),
                                  height: () {
                                    if (MediaQuery.sizeOf(context).width <
                                        kBreakpointSmall) {
                                      return 50.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointMedium) {
                                      return 70.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointLarge) {
                                      return 70.0;
                                    } else {
                                      return 70.0;
                                    }
                                  }(),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    child: TextFormField(
                                      controller:
                                          _model.raiTextFieldTextController,
                                      focusNode: _model.raiTextFieldFocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: false,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Noto San Thai',
                                              letterSpacing: 0.0,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Noto San Thai',
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Noto San Thai',
                                            color: Colors.black,
                                            fontSize: () {
                                              if (MediaQuery.sizeOf(context)
                                                      .width <
                                                  kBreakpointSmall) {
                                                return 14.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointMedium) {
                                                return 20.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointLarge) {
                                                return 20.0;
                                              } else {
                                                return 20.0;
                                              }
                                            }(),
                                            letterSpacing: 0.0,
                                          ),
                                      maxLength: 5,
                                      maxLengthEnforcement:
                                          MaxLengthEnforcement.enforced,
                                      buildCounter: (context,
                                              {required currentLength,
                                              required isFocused,
                                              maxLength}) =>
                                          null,
                                      keyboardType: TextInputType.phone,
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      validator: _model
                                          .raiTextFieldTextControllerValidator
                                          .asValidator(context),
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp('[0-9]'))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'งาน',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Noto San Thai',
                                          fontSize: () {
                                            if (MediaQuery.sizeOf(context)
                                                    .width <
                                                kBreakpointSmall) {
                                              return 14.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointMedium) {
                                              return 20.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointLarge) {
                                              return 20.0;
                                            } else {
                                              return 20.0;
                                            }
                                          }(),
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      '*',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Noto San Thai',
                                            color: Color(0xFFFF0004),
                                            fontSize: () {
                                              if (MediaQuery.sizeOf(context)
                                                      .width <
                                                  kBreakpointSmall) {
                                                return 18.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointMedium) {
                                                return 22.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointLarge) {
                                                return 22.0;
                                              } else {
                                                return 22.0;
                                              }
                                            }(),
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: Container(
                                  width: () {
                                    if (MediaQuery.sizeOf(context).width <
                                        kBreakpointSmall) {
                                      return MediaQuery.sizeOf(context).width;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointMedium) {
                                      return MediaQuery.sizeOf(context).width;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointLarge) {
                                      return 600.0;
                                    } else {
                                      return 600.0;
                                    }
                                  }(),
                                  height: () {
                                    if (MediaQuery.sizeOf(context).width <
                                        kBreakpointSmall) {
                                      return 50.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointMedium) {
                                      return 70.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointLarge) {
                                      return 70.0;
                                    } else {
                                      return 70.0;
                                    }
                                  }(),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    child: TextFormField(
                                      controller:
                                          _model.nganTextFieldTextController,
                                      focusNode: _model.nganTextFieldFocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: false,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Noto San Thai',
                                              letterSpacing: 0.0,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Noto San Thai',
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Noto San Thai',
                                            color: Colors.black,
                                            fontSize: () {
                                              if (MediaQuery.sizeOf(context)
                                                      .width <
                                                  kBreakpointSmall) {
                                                return 14.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointMedium) {
                                                return 20.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointLarge) {
                                                return 20.0;
                                              } else {
                                                return 20.0;
                                              }
                                            }(),
                                            letterSpacing: 0.0,
                                          ),
                                      maxLength: 1,
                                      maxLengthEnforcement:
                                          MaxLengthEnforcement.enforced,
                                      buildCounter: (context,
                                              {required currentLength,
                                              required isFocused,
                                              maxLength}) =>
                                          null,
                                      keyboardType: TextInputType.phone,
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      validator: _model
                                          .nganTextFieldTextControllerValidator
                                          .asValidator(context),
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp('[0-9]'))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'ตารางวา',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Noto San Thai',
                                          fontSize: () {
                                            if (MediaQuery.sizeOf(context)
                                                    .width <
                                                kBreakpointSmall) {
                                              return 14.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointMedium) {
                                              return 20.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointLarge) {
                                              return 20.0;
                                            } else {
                                              return 20.0;
                                            }
                                          }(),
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      '*',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Noto San Thai',
                                            color: Color(0xFFFF0004),
                                            fontSize: () {
                                              if (MediaQuery.sizeOf(context)
                                                      .width <
                                                  kBreakpointSmall) {
                                                return 18.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointMedium) {
                                                return 22.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointLarge) {
                                                return 22.0;
                                              } else {
                                                return 22.0;
                                              }
                                            }(),
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: Container(
                                  width: () {
                                    if (MediaQuery.sizeOf(context).width <
                                        kBreakpointSmall) {
                                      return MediaQuery.sizeOf(context).width;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointMedium) {
                                      return MediaQuery.sizeOf(context).width;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointLarge) {
                                      return 600.0;
                                    } else {
                                      return 600.0;
                                    }
                                  }(),
                                  height: () {
                                    if (MediaQuery.sizeOf(context).width <
                                        kBreakpointSmall) {
                                      return 50.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointMedium) {
                                      return 70.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointLarge) {
                                      return 70.0;
                                    } else {
                                      return 70.0;
                                    }
                                  }(),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    child: TextFormField(
                                      controller: _model
                                          .tarangWaTextFieldTextController,
                                      focusNode:
                                          _model.tarangWaTextFieldFocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: false,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Noto San Thai',
                                              letterSpacing: 0.0,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Noto San Thai',
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Noto San Thai',
                                            color: Colors.black,
                                            fontSize: () {
                                              if (MediaQuery.sizeOf(context)
                                                      .width <
                                                  kBreakpointSmall) {
                                                return 14.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointMedium) {
                                                return 20.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointLarge) {
                                                return 20.0;
                                              } else {
                                                return 20.0;
                                              }
                                            }(),
                                            letterSpacing: 0.0,
                                          ),
                                      maxLength: 3,
                                      maxLengthEnforcement:
                                          MaxLengthEnforcement.enforced,
                                      buildCounter: (context,
                                              {required currentLength,
                                              required isFocused,
                                              maxLength}) =>
                                          null,
                                      keyboardType: TextInputType.number,
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      validator: _model
                                          .tarangWaTextFieldTextControllerValidator
                                          .asValidator(context),
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp('[0-9]'))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'กรุณาอัพโหลดรูปภาพโฉนดที่ดิน (ด้านหน้า)',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto San Thai',
                                              fontSize: () {
                                                if (MediaQuery.sizeOf(context)
                                                        .width <
                                                    kBreakpointSmall) {
                                                  return 14.0;
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointMedium) {
                                                  return 20.0;
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointLarge) {
                                                  return 20.0;
                                                } else {
                                                  return 20.0;
                                                }
                                              }(),
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          '*',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto San Thai',
                                                color: Color(0xFFFF0004),
                                                fontSize: () {
                                                  if (MediaQuery.sizeOf(context)
                                                          .width <
                                                      kBreakpointSmall) {
                                                    return 18.0;
                                                  } else if (MediaQuery.sizeOf(
                                                              context)
                                                          .width <
                                                      kBreakpointMedium) {
                                                    return 22.0;
                                                  } else if (MediaQuery.sizeOf(
                                                              context)
                                                          .width <
                                                      kBreakpointLarge) {
                                                    return 22.0;
                                                  } else {
                                                    return 22.0;
                                                  }
                                                }(),
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  if ((_model.uploadedLocalFile_uploadDataSqdComponent
                                              .bytes?.isNotEmpty ??
                                          false))
                                    Align(
                                      alignment: AlignmentDirectional(
                                          valueOrDefault<double>(
                                            () {
                                              if (MediaQuery.sizeOf(context)
                                                      .width <
                                                  kBreakpointSmall) {
                                                return 0.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointMedium) {
                                                return 0.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointLarge) {
                                                return -1.0;
                                              } else {
                                                return -1.0;
                                              }
                                            }(),
                                            0.0,
                                          ),
                                          0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType.fade,
                                                child:
                                                    FlutterFlowExpandedImageView(
                                                  image: Image.memory(
                                                    _model.uploadedLocalFile_uploadDataSqdComponent
                                                            .bytes ??
                                                        Uint8List.fromList([]),
                                                    fit: BoxFit.contain,
                                                  ),
                                                  allowRotation: false,
                                                  tag: 'imageTag1',
                                                  useHeroAnimation: true,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Hero(
                                            tag: 'imageTag1',
                                            transitionOnUserGestures: true,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.memory(
                                                _model.uploadedLocalFile_uploadDataSqdComponent
                                                        .bytes ??
                                                    Uint8List.fromList([]),
                                                width: () {
                                                  if (MediaQuery.sizeOf(context)
                                                          .width <
                                                      kBreakpointSmall) {
                                                    return 200.0;
                                                  } else if (MediaQuery.sizeOf(
                                                              context)
                                                          .width <
                                                      kBreakpointMedium) {
                                                    return 300.0;
                                                  } else if (MediaQuery.sizeOf(
                                                              context)
                                                          .width <
                                                      kBreakpointLarge) {
                                                    return 300.0;
                                                  } else {
                                                    return 300.0;
                                                  }
                                                }(),
                                                height: () {
                                                  if (MediaQuery.sizeOf(context)
                                                          .width <
                                                      kBreakpointSmall) {
                                                    return 200.0;
                                                  } else if (MediaQuery.sizeOf(
                                                              context)
                                                          .width <
                                                      kBreakpointMedium) {
                                                    return 300.0;
                                                  } else if (MediaQuery.sizeOf(
                                                              context)
                                                          .width <
                                                      kBreakpointLarge) {
                                                    return 300.0;
                                                  } else {
                                                    return 300.0;
                                                  }
                                                }(),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'imageOnPageLoadAnimation1']!),
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        final selectedMedia = await selectMedia(
                                          imageQuality: 30,
                                          mediaSource: MediaSource.photoGallery,
                                          multiImage: false,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          safeSetState(() => _model
                                                  .isDataUploading_uploadDataSqdComponent =
                                              true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                          originalFilename: m
                                                              .originalFilename,
                                                        ))
                                                    .toList();
                                          } finally {
                                            _model.isDataUploading_uploadDataSqdComponent =
                                                false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                              selectedMedia.length) {
                                            safeSetState(() {
                                              _model.uploadedLocalFile_uploadDataSqdComponent =
                                                  selectedUploadedFiles.first;
                                            });
                                          } else {
                                            safeSetState(() {});
                                            return;
                                          }
                                        }

                                        if ((_model.uploadedLocalFile_uploadDataSqdComponent
                                                    .bytes?.isNotEmpty ??
                                                false)) {
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพสำเร็จ!',
                                                style: TextStyle(
                                                  fontFamily: 'Noto San Thai',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 3000),
                                              backgroundColor:
                                                  Color(0xBE000000),
                                            ),
                                          );
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพไม่สำเร็จ กรุณาลองใหม่อีกครั้ง',
                                                style: TextStyle(
                                                  fontFamily: 'Noto San Thai',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 3000),
                                              backgroundColor:
                                                  Color(0xBE000000),
                                            ),
                                          );
                                          return;
                                        }
                                      },
                                      text: 'อัพโหลดรูปภาพ',
                                      icon: Icon(
                                        Icons.camera_alt_outlined,
                                        size: () {
                                          if (MediaQuery.sizeOf(context).width <
                                              kBreakpointSmall) {
                                            return 25.0;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointMedium) {
                                            return 30.0;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointLarge) {
                                            return 30.0;
                                          } else {
                                            return 30.0;
                                          }
                                        }(),
                                      ),
                                      options: FFButtonOptions(
                                        width: () {
                                          if (MediaQuery.sizeOf(context).width <
                                              kBreakpointSmall) {
                                            return MediaQuery.sizeOf(context)
                                                .width;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointMedium) {
                                            return MediaQuery.sizeOf(context)
                                                .width;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointLarge) {
                                            return 600.0;
                                          } else {
                                            return 600.0;
                                          }
                                        }(),
                                        height: () {
                                          if (MediaQuery.sizeOf(context).width <
                                              kBreakpointSmall) {
                                            return 70.0;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointMedium) {
                                            return 90.0;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointLarge) {
                                            return 90.0;
                                          } else {
                                            return 90.0;
                                          }
                                        }(),
                                        padding: EdgeInsets.all(0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        iconColor: Color(0xFF1D71B8),
                                        color: Color(0xFFD9EBFF),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Noto San Thai',
                                              color: Color(0xFF1D71B8),
                                              fontSize: () {
                                                if (MediaQuery.sizeOf(context)
                                                        .width <
                                                    kBreakpointSmall) {
                                                  return 16.0;
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointMedium) {
                                                  return 22.0;
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointLarge) {
                                                  return 22.0;
                                                } else {
                                                  return 22.0;
                                                }
                                              }(),
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'กรุณาอัพโหลดรูปภาพโฉนดที่ดิน (ด้านหลัง)',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto San Thai',
                                              fontSize: () {
                                                if (MediaQuery.sizeOf(context)
                                                        .width <
                                                    kBreakpointSmall) {
                                                  return 14.0;
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointMedium) {
                                                  return 20.0;
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointLarge) {
                                                  return 20.0;
                                                } else {
                                                  return 20.0;
                                                }
                                              }(),
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          '*',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto San Thai',
                                                color: Color(0xFFFF0004),
                                                fontSize: () {
                                                  if (MediaQuery.sizeOf(context)
                                                          .width <
                                                      kBreakpointSmall) {
                                                    return 18.0;
                                                  } else if (MediaQuery.sizeOf(
                                                              context)
                                                          .width <
                                                      kBreakpointMedium) {
                                                    return 22.0;
                                                  } else if (MediaQuery.sizeOf(
                                                              context)
                                                          .width <
                                                      kBreakpointLarge) {
                                                    return 22.0;
                                                  } else {
                                                    return 22.0;
                                                  }
                                                }(),
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  if ((_model.uploadedLocalFile_uploadDataSqd2Component
                                              .bytes?.isNotEmpty ??
                                          false))
                                    Align(
                                      alignment: AlignmentDirectional(
                                          valueOrDefault<double>(
                                            () {
                                              if (MediaQuery.sizeOf(context)
                                                      .width <
                                                  kBreakpointSmall) {
                                                return 0.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointMedium) {
                                                return 0.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointLarge) {
                                                return -1.0;
                                              } else {
                                                return -1.0;
                                              }
                                            }(),
                                            0.0,
                                          ),
                                          0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType.fade,
                                                child:
                                                    FlutterFlowExpandedImageView(
                                                  image: Image.memory(
                                                    _model.uploadedLocalFile_uploadDataSqd2Component
                                                            .bytes ??
                                                        Uint8List.fromList([]),
                                                    fit: BoxFit.contain,
                                                  ),
                                                  allowRotation: false,
                                                  tag: 'imageTag2',
                                                  useHeroAnimation: true,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Hero(
                                            tag: 'imageTag2',
                                            transitionOnUserGestures: true,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.memory(
                                                _model.uploadedLocalFile_uploadDataSqd2Component
                                                        .bytes ??
                                                    Uint8List.fromList([]),
                                                width: () {
                                                  if (MediaQuery.sizeOf(context)
                                                          .width <
                                                      kBreakpointSmall) {
                                                    return 200.0;
                                                  } else if (MediaQuery.sizeOf(
                                                              context)
                                                          .width <
                                                      kBreakpointMedium) {
                                                    return 300.0;
                                                  } else if (MediaQuery.sizeOf(
                                                              context)
                                                          .width <
                                                      kBreakpointLarge) {
                                                    return 300.0;
                                                  } else {
                                                    return 300.0;
                                                  }
                                                }(),
                                                height: () {
                                                  if (MediaQuery.sizeOf(context)
                                                          .width <
                                                      kBreakpointSmall) {
                                                    return 200.0;
                                                  } else if (MediaQuery.sizeOf(
                                                              context)
                                                          .width <
                                                      kBreakpointMedium) {
                                                    return 300.0;
                                                  } else if (MediaQuery.sizeOf(
                                                              context)
                                                          .width <
                                                      kBreakpointLarge) {
                                                    return 300.0;
                                                  } else {
                                                    return 300.0;
                                                  }
                                                }(),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'imageOnPageLoadAnimation2']!),
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        final selectedMedia = await selectMedia(
                                          imageQuality: 30,
                                          mediaSource: MediaSource.photoGallery,
                                          multiImage: false,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          safeSetState(() => _model
                                                  .isDataUploading_uploadDataSqd2Component =
                                              true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                          originalFilename: m
                                                              .originalFilename,
                                                        ))
                                                    .toList();
                                          } finally {
                                            _model.isDataUploading_uploadDataSqd2Component =
                                                false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                              selectedMedia.length) {
                                            safeSetState(() {
                                              _model.uploadedLocalFile_uploadDataSqd2Component =
                                                  selectedUploadedFiles.first;
                                            });
                                          } else {
                                            safeSetState(() {});
                                            return;
                                          }
                                        }

                                        if ((_model.uploadedLocalFile_uploadDataSqd2Component
                                                    .bytes?.isNotEmpty ??
                                                false)) {
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพสำเร็จ!',
                                                style: TextStyle(
                                                  fontFamily: 'Noto San Thai',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 3000),
                                              backgroundColor:
                                                  Color(0xBE000000),
                                            ),
                                          );
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพไม่สำเร็จ กรุณาลองใหม่อีกครั้ง',
                                                style: TextStyle(
                                                  fontFamily: 'Noto San Thai',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 3000),
                                              backgroundColor:
                                                  Color(0xBE000000),
                                            ),
                                          );
                                          return;
                                        }
                                      },
                                      text: 'อัพโหลดรูปภาพ',
                                      icon: Icon(
                                        Icons.camera_alt_outlined,
                                        size: () {
                                          if (MediaQuery.sizeOf(context).width <
                                              kBreakpointSmall) {
                                            return 25.0;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointMedium) {
                                            return 30.0;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointLarge) {
                                            return 30.0;
                                          } else {
                                            return 30.0;
                                          }
                                        }(),
                                      ),
                                      options: FFButtonOptions(
                                        width: () {
                                          if (MediaQuery.sizeOf(context).width <
                                              kBreakpointSmall) {
                                            return MediaQuery.sizeOf(context)
                                                .width;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointMedium) {
                                            return MediaQuery.sizeOf(context)
                                                .width;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointLarge) {
                                            return 600.0;
                                          } else {
                                            return 600.0;
                                          }
                                        }(),
                                        height: () {
                                          if (MediaQuery.sizeOf(context).width <
                                              kBreakpointSmall) {
                                            return 70.0;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointMedium) {
                                            return 90.0;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointLarge) {
                                            return 90.0;
                                          } else {
                                            return 90.0;
                                          }
                                        }(),
                                        padding: EdgeInsets.all(0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        iconColor: Color(0xFF1D71B8),
                                        color: Color(0xFFD9EBFF),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Noto San Thai',
                                              color: Color(0xFF1D71B8),
                                              fontSize: () {
                                                if (MediaQuery.sizeOf(context)
                                                        .width <
                                                    kBreakpointSmall) {
                                                  return 16.0;
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointMedium) {
                                                  return 22.0;
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointLarge) {
                                                  return 22.0;
                                                } else {
                                                  return 22.0;
                                                }
                                              }(),
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ].addToStart(SizedBox(height: 12.0)),
                    ),
                  );
                } else {
                  return Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 0.0, 0.0),
                            child: Container(
                              height: 25.0,
                              decoration: BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 100.0,
                                    child: VerticalDivider(
                                      width: 3.0,
                                      thickness: 3.0,
                                      color: Color(0x7FDB771A),
                                    ),
                                  ),
                                  Text(
                                    'ประเมินราคาที่ดิน',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Noto San Thai',
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 3.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 10.0, 16.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(),
                                              child: Text(
                                                FFAppState()
                                                            .chanodOutput
                                                            .chanodNo !=
                                                        ''
                                                    ? 'เลขโฉนด ${FFAppState().chanodOutput.chanodNo}'
                                                    : 'เลขที่ดิน${FFAppState().chanodOutput.landNo}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto San Thai',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: () {
                                                            if (MediaQuery.sizeOf(
                                                                        context)
                                                                    .width <
                                                                kBreakpointSmall) {
                                                              return 16.0;
                                                            } else if (MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width <
                                                                kBreakpointMedium) {
                                                              return 22.0;
                                                            } else if (MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width <
                                                                kBreakpointLarge) {
                                                              return 22.0;
                                                            } else {
                                                              return 22.0;
                                                            }
                                                          }(),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) {
                                        if (FFAppState()
                                                .chanodOutput
                                                .ltv1Amount !=
                                            0) {
                                          return Container(
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 20.0,
                                                          16.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Text(
                                                            'ราคาประเมินเบื้องต้น ไม่รวมสิ่งปลูกสร้าง (ไม่จดจำนอง) ${FFAppState().addressOutput.keyword}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto San Thai',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize: () {
                                                                    if (MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointSmall) {
                                                                      return 16.0;
                                                                    } else if (MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointMedium) {
                                                                      return 22.0;
                                                                    } else if (MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointLarge) {
                                                                      return 22.0;
                                                                    } else {
                                                                      return 22.0;
                                                                    }
                                                                  }(),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    20.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                functions.returnNumberWithCommaFullNumber(
                                                                    FFAppState()
                                                                        .chanodOutput
                                                                        .ltv1Amount
                                                                        .toString(),
                                                                    '0'),
                                                                '-',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto San Thai',
                                                                    color: Color(
                                                                        0xFF003063),
                                                                    fontSize:
                                                                        () {
                                                                      if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointSmall) {
                                                                        return 26.0;
                                                                      } else if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointMedium) {
                                                                        return 32.0;
                                                                      } else if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointLarge) {
                                                                        return 32.0;
                                                                      } else {
                                                                        return 32.0;
                                                                      }
                                                                    }(),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                              child: Text(
                                                                'บาท',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto San Thai',
                                                                      fontSize:
                                                                          () {
                                                                        if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointSmall) {
                                                                          return 16.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointMedium) {
                                                                          return 22.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointLarge) {
                                                                          return 22.0;
                                                                        } else {
                                                                          return 22.0;
                                                                        }
                                                                      }(),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
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
                                                  thickness: 2.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                ),
                                              ],
                                            ),
                                          );
                                        } else {
                                          return Container(
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 20.0,
                                                          16.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Text(
                                                            'ราคาประเมินเบื้องต้น ไม่รวมสิ่งปลูกสร้าง (ไม่จดจำนอง) ${FFAppState().addressOutput.keyword}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto San Thai',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize: () {
                                                                    if (MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointSmall) {
                                                                      return 16.0;
                                                                    } else if (MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointMedium) {
                                                                      return 22.0;
                                                                    } else if (MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointLarge) {
                                                                      return 22.0;
                                                                    } else {
                                                                      return 22.0;
                                                                    }
                                                                  }(),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                12.0,
                                                                20.0,
                                                                12.0,
                                                                0.0),
                                                    child: Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Expanded(
                                                            child: RichText(
                                                              textScaler:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text:
                                                                        'ไม่พบราคาประเมิน',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto San Thai',
                                                                          fontSize:
                                                                              () {
                                                                            if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointSmall) {
                                                                              return 16.0;
                                                                            } else if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointMedium) {
                                                                              return 20.0;
                                                                            } else if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointLarge) {
                                                                              return 20.0;
                                                                            } else {
                                                                              return 20.0;
                                                                            }
                                                                          }(),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                  TextSpan(
                                                                    text:
                                                                        '  เจ้าหน้าที่จะติดต่อกลับโดยเร็วที่สุด',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto San Thai',
                                                                          fontSize:
                                                                              () {
                                                                            if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointSmall) {
                                                                              return 16.0;
                                                                            } else if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointMedium) {
                                                                              return 20.0;
                                                                            } else if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointLarge) {
                                                                              return 20.0;
                                                                            } else {
                                                                              return 20.0;
                                                                            }
                                                                          }(),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  )
                                                                ],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto San Thai',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 8.0)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Divider(
                                                  thickness: 2.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                ),
                                              ],
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                    Builder(
                                      builder: (context) {
                                        if (FFAppState()
                                                .chanodOutput
                                                .ltv2Amount !=
                                            0) {
                                          return Container(
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(15.0, 20.0,
                                                          15.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Text(
                                                            'ราคาประเมินเบื้องต้น ไม่รวมสิ่งปลูกสร้าง (จดจำนอง) ${FFAppState().addressOutput.keyword}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto San Thai',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize: () {
                                                                    if (MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointSmall) {
                                                                      return 16.0;
                                                                    } else if (MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointMedium) {
                                                                      return 22.0;
                                                                    } else if (MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointLarge) {
                                                                      return 22.0;
                                                                    } else {
                                                                      return 22.0;
                                                                    }
                                                                  }(),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Builder(
                                                        builder: (context) {
                                                          if (true) {
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: () {
                                                                  if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointSmall) {
                                                                    return 70.0;
                                                                  } else if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointMedium) {
                                                                    return 90.0;
                                                                  } else if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointLarge) {
                                                                    return 90.0;
                                                                  } else {
                                                                    return 90.0;
                                                                  }
                                                                }(),
                                                                height: () {
                                                                  if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointSmall) {
                                                                    return 25.0;
                                                                  } else if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointMedium) {
                                                                    return 35.0;
                                                                  } else if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointLarge) {
                                                                    return 35.0;
                                                                  } else {
                                                                    return 35.0;
                                                                  }
                                                                }(),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFFF0000),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            40.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            40.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            40.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            40.0),
                                                                  ),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'เริ่มต้นที่',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto San Thai',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          fontSize:
                                                                              () {
                                                                            if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointSmall) {
                                                                              return 14.0;
                                                                            } else if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointMedium) {
                                                                              return 18.0;
                                                                            } else if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointLarge) {
                                                                              return 18.0;
                                                                            } else {
                                                                              return 18.0;
                                                                            }
                                                                          }(),
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          } else {
                                                            return Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  width: 70.0,
                                                                  height: 25.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              40.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              40.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              40.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              40.0),
                                                                    ),
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        '*',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Noto San Thai',
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              fontSize: 18.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'เริ่มต้นที่',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Noto San Thai',
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              functions.returnNumberWithCommaFullNumber(
                                                                  FFAppState()
                                                                      .chanodOutput
                                                                      .ltv2Amount
                                                                      .toString(),
                                                                  '0'),
                                                              '-',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto San Thai',
                                                                  color: Color(
                                                                      0xFF003063),
                                                                  fontSize: () {
                                                                    if (MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointSmall) {
                                                                      return 26.0;
                                                                    } else if (MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointMedium) {
                                                                      return 32.0;
                                                                    } else if (MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointLarge) {
                                                                      return 32.0;
                                                                    } else {
                                                                      return 32.0;
                                                                    }
                                                                  }(),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        8.0,
                                                                        0.0),
                                                            child: Text(
                                                              'บาท',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto San Thai',
                                                                    fontSize:
                                                                        () {
                                                                      if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointSmall) {
                                                                        return 16.0;
                                                                      } else if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointMedium) {
                                                                        return 22.0;
                                                                      } else if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointLarge) {
                                                                        return 22.0;
                                                                      } else {
                                                                        return 22.0;
                                                                      }
                                                                    }(),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Divider(
                                                        thickness: 2.0,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        } else {
                                          return Container(
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(15.0, 20.0,
                                                          15.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Text(
                                                            'ราคาประเมินเบื้องต้น ไม่รวมสิ่งปลูกสร้าง (จดจำนอง) ${FFAppState().addressOutput.keyword}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto San Thai',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize: () {
                                                                    if (MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointSmall) {
                                                                      return 16.0;
                                                                    } else if (MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointMedium) {
                                                                      return 22.0;
                                                                    } else if (MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointLarge) {
                                                                      return 22.0;
                                                                    } else {
                                                                      return 22.0;
                                                                    }
                                                                  }(),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                12.0,
                                                                20.0,
                                                                12.0,
                                                                0.0),
                                                    child: Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Expanded(
                                                            child: RichText(
                                                              textScaler:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text:
                                                                        'ไม่พบราคาประเมิน',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto San Thai',
                                                                          fontSize:
                                                                              () {
                                                                            if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointSmall) {
                                                                              return 16.0;
                                                                            } else if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointMedium) {
                                                                              return 20.0;
                                                                            } else if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointLarge) {
                                                                              return 20.0;
                                                                            } else {
                                                                              return 20.0;
                                                                            }
                                                                          }(),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                  TextSpan(
                                                                    text:
                                                                        '  เจ้าหน้าที่จะติดต่อกลับโดยเร็วที่สุด',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto San Thai',
                                                                          fontSize:
                                                                              () {
                                                                            if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointSmall) {
                                                                              return 16.0;
                                                                            } else if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointMedium) {
                                                                              return 20.0;
                                                                            } else if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointLarge) {
                                                                              return 20.0;
                                                                            } else {
                                                                              return 20.0;
                                                                            }
                                                                          }(),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  )
                                                                ],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto San Thai',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 8.0)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Divider(
                                                  thickness: 2.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                ),
                                              ],
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                    if (!widget.isOnlyCheckRate)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 24.0, 0.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  child: Container(
                                                    height: () {
                                                      if (MediaQuery.sizeOf(
                                                                  context)
                                                              .width <
                                                          kBreakpointSmall) {
                                                        return 25.0;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width <
                                                          kBreakpointMedium) {
                                                        return 40.0;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width <
                                                          kBreakpointLarge) {
                                                        return 40.0;
                                                      } else {
                                                        return 40.0;
                                                      }
                                                    }(),
                                                    decoration: BoxDecoration(),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          height: 100.0,
                                                          child:
                                                              VerticalDivider(
                                                            width: 3.0,
                                                            thickness: 3.0,
                                                            color: Color(
                                                                0x7FDB771A),
                                                          ),
                                                        ),
                                                        Text(
                                                          'ข้อมูลเพิ่มเติม',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto San Thai',
                                                                fontSize: () {
                                                                  if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointSmall) {
                                                                    return 18.0;
                                                                  } else if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointMedium) {
                                                                    return 24.0;
                                                                  } else if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointLarge) {
                                                                    return 24.0;
                                                                  } else {
                                                                    return 24.0;
                                                                  }
                                                                }(),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: 12.0)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 16.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'วงเงินที่ต้องการ',
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto San Thai',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            '*',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto San Thai',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      width: double.infinity,
                                                      height: 50.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        child: TextFormField(
                                                          controller: _model
                                                              .textController6,
                                                          focusNode: _model
                                                              .textFieldFocusNode,
                                                          autofocus: false,
                                                          textCapitalization:
                                                              TextCapitalization
                                                                  .words,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto San Thai',
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            hintText:
                                                                'ระบุวงเงินที่ต้องการ',
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto San Thai',
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            enabledBorder:
                                                                UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        4.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        4.0),
                                                              ),
                                                            ),
                                                            focusedBorder:
                                                                UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        4.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        4.0),
                                                              ),
                                                            ),
                                                            errorBorder:
                                                                UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        4.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        4.0),
                                                              ),
                                                            ),
                                                            focusedErrorBorder:
                                                                UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        4.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        4.0),
                                                              ),
                                                            ),
                                                            contentPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        16.0,
                                                                        16.0,
                                                                        8.0),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Noto San Thai',
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                lineHeight: 1.0,
                                                              ),
                                                          maxLines: null,
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          validator: _model
                                                              .textController6Validator
                                                              .asValidator(
                                                                  context),
                                                          inputFormatters: [
                                                            if (!isAndroid &&
                                                                !isiOS)
                                                              TextInputFormatter
                                                                  .withFunction(
                                                                      (oldValue,
                                                                          newValue) {
                                                                return TextEditingValue(
                                                                  selection:
                                                                      newValue
                                                                          .selection,
                                                                  text: newValue
                                                                      .text
                                                                      .toCapitalization(
                                                                          TextCapitalization
                                                                              .words),
                                                                );
                                                              }),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              if (FFAppState().platform ==
                                                  'mobile')
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 16.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'วิธีการรับเงิน',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto San Thai',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '*',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto San Thai',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        width: double.infinity,
                                                        height: 50.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      16.0,
                                                                      0.0,
                                                                      0.0),
                                                          child:
                                                              FlutterFlowChoiceChips(
                                                            options: [
                                                              ChipData(
                                                                  'รับทันที'),
                                                              ChipData(
                                                                  'รับแบบแบ่งจ่าย')
                                                            ],
                                                            onChanged:
                                                                (val) async {
                                                              safeSetState(() =>
                                                                  _model.choiceChipsValue =
                                                                      val?.firstOrNull);
                                                              if (_model
                                                                      .choiceChipsValue ==
                                                                  'รับทันที') {
                                                                FFAppState()
                                                                    .updateAgentProfileDataTypeStruct(
                                                                  (e) => e
                                                                    ..paymentMethod =
                                                                        'one_time'
                                                                    ..actualPercent =
                                                                        '${FFAppState().agentProfileDataType.percentOnetime}'
                                                                    ..defaultPercent =
                                                                        '${FFAppState().agentProfileDataType.percentOnetime}',
                                                                );
                                                                safeSetState(
                                                                    () {});
                                                              } else {
                                                                FFAppState()
                                                                    .updateAgentProfileDataTypeStruct(
                                                                  (e) => e
                                                                    ..paymentMethod =
                                                                        'installment'
                                                                    ..actualPercent =
                                                                        '${FFAppState().agentProfileDataType.percentInstallment}'
                                                                    ..defaultPercent =
                                                                        '${FFAppState().agentProfileDataType.percentInstallment}',
                                                                );
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                            },
                                                            selectedChipStyle:
                                                                ChipStyle(
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto San Thai',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              iconColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                              iconSize: 16.0,
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            unselectedChipStyle:
                                                                ChipStyle(
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto San Thai',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              iconColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              iconSize: 16.0,
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            chipSpacing: 8.0,
                                                            rowSpacing: 8.0,
                                                            multiselect: false,
                                                            initialized: _model
                                                                    .choiceChipsValue !=
                                                                null,
                                                            alignment:
                                                                WrapAlignment
                                                                    .spaceEvenly,
                                                            controller: _model
                                                                    .choiceChipsValueController ??=
                                                                FormFieldController<
                                                                    List<
                                                                        String>>(
                                                              [
                                                                'รับแบบแบ่งจ่าย'
                                                              ],
                                                            ),
                                                            wrapped: true,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 16.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'เวลาที่สะดวกให้ติดต่อ',
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto San Thai',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        final _datePickedTime =
                                                            await showTimePicker(
                                                          context: context,
                                                          initialTime: TimeOfDay
                                                              .fromDateTime(
                                                                  getCurrentTimestamp),
                                                          builder:
                                                              (context, child) {
                                                            return wrapInMaterialTimePickerTheme(
                                                              context,
                                                              child!,
                                                              headerBackgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              headerForegroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                              headerTextStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto San Thai',
                                                                        fontSize:
                                                                            32.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                              pickerBackgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                              pickerForegroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              selectedDateTimeBackgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              selectedDateTimeForegroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                              actionButtonForegroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              iconSize: 24.0,
                                                            );
                                                          },
                                                        );
                                                        if (_datePickedTime !=
                                                            null) {
                                                          safeSetState(() {
                                                            _model.datePicked =
                                                                DateTime(
                                                              getCurrentTimestamp
                                                                  .year,
                                                              getCurrentTimestamp
                                                                  .month,
                                                              getCurrentTimestamp
                                                                  .day,
                                                              _datePickedTime
                                                                  .hour,
                                                              _datePickedTime
                                                                  .minute,
                                                            );
                                                          });
                                                        } else if (_model
                                                                .datePicked !=
                                                            null) {
                                                          safeSetState(() {
                                                            _model.datePicked =
                                                                getCurrentTimestamp;
                                                          });
                                                        }
                                                      },
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 50.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        32.0,
                                                                        0.0,
                                                                        32.0,
                                                                        0.0),
                                                            child: Text(
                                                              _model.datePicked !=
                                                                      null
                                                                  ? dateTimeFormat(
                                                                      "Hm",
                                                                      _model
                                                                          .datePicked)
                                                                  : 'ระบุเวลาที่สะดวกให้ติดต่อ',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto San Thai',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 2.0,
                                                      indent: 16.0,
                                                      endIndent: 16.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              if ((_model.textController6
                                                              .text !=
                                                          '') &&
                                                  (FFAppState().platform ==
                                                      'mobile'))
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 12.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        child: Container(
                                                          height: () {
                                                            if (MediaQuery.sizeOf(
                                                                        context)
                                                                    .width <
                                                                kBreakpointSmall) {
                                                              return 25.0;
                                                            } else if (MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width <
                                                                kBreakpointMedium) {
                                                              return 40.0;
                                                            } else if (MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width <
                                                                kBreakpointLarge) {
                                                              return 40.0;
                                                            } else {
                                                              return 40.0;
                                                            }
                                                          }(),
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 100.0,
                                                                child:
                                                                    VerticalDivider(
                                                                  width: 3.0,
                                                                  thickness:
                                                                      3.0,
                                                                  color: Color(
                                                                      0x7FDB771A),
                                                                ),
                                                              ),
                                                              Text(
                                                                'ค่าคอมที่คาดว่าจะได้รับ',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto San Thai',
                                                                      fontSize:
                                                                          () {
                                                                        if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointSmall) {
                                                                          return 18.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointMedium) {
                                                                          return 24.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointLarge) {
                                                                          return 24.0;
                                                                        } else {
                                                                          return 24.0;
                                                                        }
                                                                      }(),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 12.0)),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    16.0,
                                                                    0.0,
                                                                    16.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    '${valueOrDefault<String>(
                                                                      functions.returnNumberWithComma2Decimal(FFAppState().agentProfileDataType.paymentMethod ==
                                                                              'installment'
                                                                          ? (FFAppState().maxCommissionAmountInstallment < 0.0
                                                                              ? (((double.parse((functions.removeCommaFromNumText(_model.textController6.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.defaultPercent : '0')))) / 100).toString())
                                                                              : (double.parse((((double.parse((functions.removeCommaFromNumText(_model.textController6.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString())) < FFAppState().maxCommissionAmountInstallment ? (((double.parse((functions.removeCommaFromNumText(_model.textController6.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.defaultPercent : '0')))) / 100).toString()) : '${FFAppState().maxCommissionAmountInstallment.toString()}'))
                                                                          : (FFAppState().maxCommissionAmountOnetime < 0.0 ? (((double.parse((functions.removeCommaFromNumText(_model.textController6.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.defaultPercent : '0')))) / 100).toString()) : (double.parse((((double.parse((functions.removeCommaFromNumText(_model.textController6.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.defaultPercent : '0')))) / 100).toString())) < FFAppState().maxCommissionAmountOnetime ? (((double.parse((functions.removeCommaFromNumText(_model.textController6.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString()) : '${FFAppState().maxCommissionAmountOnetime.toString()}'))),
                                                                      '0',
                                                                    )} บาท',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto San Thai',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          fontSize:
                                                                              24.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            if (FFAppState()
                                                                        .agentProfileDataType
                                                                        .paymentMethod ==
                                                                    'installment'
                                                                ? ((double
                                                                    maxCommission) {
                                                                    return maxCommission >=
                                                                        0.0;
                                                                  }(FFAppState()
                                                                    .maxCommissionAmountInstallment))
                                                                : ((double
                                                                    maxCommission) {
                                                                    return maxCommission >=
                                                                        0.0;
                                                                  }(FFAppState()
                                                                    .maxCommissionAmountOnetime)))
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            24.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      FFAppState().agentProfileDataType.paymentMethod ==
                                                                              'installment'
                                                                          ? '${FFAppState().maxCommissionTextInstallment}${functions.returnNumberWithComma2Decimal('${FFAppState().maxCommissionAmountInstallment.toString()}')} บาท'
                                                                          : '${FFAppState().maxCommissionTextOnetime}${functions.returnNumberWithComma2Decimal('${FFAppState().maxCommissionAmountOnetime.toString()}')} บาท',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto San Thai',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Text(
                                            'หมายเหตุ : \n\n*ถ้าต้องการมากกว่าราคาประเมิน กรุณาติดต่อสาขาใกล้ท่าน\n*วงเงินจริงขึ้นอยู่กับเงื่อนไขของบริษัท ตามคุณสมบัติผู้ขอสินเชื่อ\n*ราคาประเมินเบื้องต้นเท่านั้น อาจมีการเปลี่ยนตามเงื่อนไขของบริษัทฯ\n*สินเชื่อบ้านและที่ดิน อัตราดอกเบี้ยที่แท้จริง 14.61% - 15.00% ต่อปี ระยะเวลาผ่อนสูงสุด 72 งวด\n*กู้เท่าที่จำเป็นและชำระคืนไหว\n*เงื่อนไขอนุมัติสินเชื่อเป็นไปตามที่บริษัทฯ กำหนด',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto San Thai',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  fontSize: () {
                                                    if (MediaQuery.sizeOf(
                                                                context)
                                                            .width <
                                                        kBreakpointSmall) {
                                                      return 12.0;
                                                    } else if (MediaQuery
                                                                .sizeOf(context)
                                                            .width <
                                                        kBreakpointMedium) {
                                                      return 16.0;
                                                    } else if (MediaQuery
                                                                .sizeOf(context)
                                                            .width <
                                                        kBreakpointLarge) {
                                                      return 16.0;
                                                    } else {
                                                      return 16.0;
                                                    }
                                                  }(),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ]
                            .addToStart(SizedBox(height: 12.0))
                            .addToEnd(SizedBox(height: 30.0)),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          SizedBox(
            width: () {
              if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                return MediaQuery.sizeOf(context).width;
              } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                return MediaQuery.sizeOf(context).width;
              } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                return 600.0;
              } else {
                return 600.0;
              }
            }(),
            child: Divider(
              thickness: 2.0,
              color: FlutterFlowTheme.of(context).alternate,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
            child: Container(
              width: () {
                if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                  return MediaQuery.sizeOf(context).width;
                } else if (MediaQuery.sizeOf(context).width <
                    kBreakpointMedium) {
                  return MediaQuery.sizeOf(context).width;
                } else if (MediaQuery.sizeOf(context).width <
                    kBreakpointLarge) {
                  return 600.0;
                } else {
                  return 600.0;
                }
              }(),
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (!_model.isFormState)
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () async {
                            _model.isFormState = true;
                            safeSetState(() {});
                            await widget.updateFormState?.call(
                              _model.isFormState,
                            );
                          },
                          text: 'ย้อนกลับ',
                          options: FFButtonOptions(
                            width: () {
                              if (MediaQuery.sizeOf(context).width <
                                  kBreakpointSmall) {
                                return MediaQuery.sizeOf(context).width;
                              } else if (MediaQuery.sizeOf(context).width <
                                  kBreakpointMedium) {
                                return MediaQuery.sizeOf(context).width;
                              } else if (MediaQuery.sizeOf(context).width <
                                  kBreakpointLarge) {
                                return 600.0;
                              } else {
                                return 600.0;
                              }
                            }(),
                            height: () {
                              if (MediaQuery.sizeOf(context).width <
                                  kBreakpointSmall) {
                                return 60.0;
                              } else if (MediaQuery.sizeOf(context).width <
                                  kBreakpointMedium) {
                                return 80.0;
                              } else if (MediaQuery.sizeOf(context).width <
                                  kBreakpointLarge) {
                                return 80.0;
                              } else {
                                return 80.0;
                              }
                            }(),
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).info,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Noto San Thai',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: () {
                                    if (MediaQuery.sizeOf(context).width <
                                        kBreakpointSmall) {
                                      return 16.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointMedium) {
                                      return 22.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointLarge) {
                                      return 22.0;
                                    } else {
                                      return 22.0;
                                    }
                                  }(),
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                      ),
                    if (!widget.isOnlyCheckRate ? true : _model.isFormState)
                      Expanded(
                        child: Builder(
                          builder: (context) => FFButtonWidget(
                            onPressed: (_model.isFormState
                                    ? !(((_model.uploadedLocalFile_uploadDataSqdComponent
                                                    .bytes?.isNotEmpty ??
                                                false)) &&
                                        ((_model.uploadedLocalFile_uploadDataSqd2Component
                                                    .bytes?.isNotEmpty ??
                                                false)))
                                    : (_model.textController6.text != ''
                                        ? false
                                        : true))
                                ? null
                                : () async {
                                    var _shouldSetState = false;
                                    if (_model.isFormState) {
                                      if (_model.isSearchByChanod) {
                                        if (_model
                                                .chanodNumberTextFieldTextController
                                                .text ==
                                            '') {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                content:
                                                    Text('กรุณากรอกเลขโฉนด'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                        if (FFAppState().addressOutput ==
                                            AddressDataModelStruct()) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                content: Text(
                                                    'กรุณาเลือกตำบล / อำเภอ / จังหวัด'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                        if (_model.raiTextFieldTextController
                                                .text ==
                                            '') {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                content:
                                                    Text('กรุณากรอกจำนวนไร่'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                        if (_model.nganTextFieldTextController
                                                .text ==
                                            '') {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                content:
                                                    Text('กรุณากรอกจำนวนงาน'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                        if (_model
                                                .tarangWaTextFieldTextController
                                                .text ==
                                            '') {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                content: Text(
                                                    'กรุณากรอกจำนวนตารางวา'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                      } else {
                                        if (_model
                                                .chanodNumberTextFieldTextController
                                                .text ==
                                            '') {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                content:
                                                    Text('กรุณากรอกเลขที่ดิน'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                        if (_model.rawangTextFieldTextController
                                                .text !=
                                            '') {
                                          if (!functions.checkRawang(_model
                                              .rawangTextFieldTextController
                                              .text)!) {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  content: Text(
                                                      'เลขระวางไม่ถูกต้อง กรุณาตรวจสอบใหม่อีกครั้ง'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          }
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                content: Text('กรุณากรอกระวาง'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }

                                        if (FFAppState().addressOutput ==
                                            AddressDataModelStruct()) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                content: Text(
                                                    'กรุณาเลือกตำบล / อำเภอ / จังหวัด'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                        if (_model.raiTextFieldTextController
                                                .text ==
                                            '') {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                content:
                                                    Text('กรุณากรอกจำนวนไร่'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                        if (_model.nganTextFieldTextController
                                                .text ==
                                            '') {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                content:
                                                    Text('กรุณากรอกจำนวนงาน'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                        if (_model
                                                .tarangWaTextFieldTextController
                                                .text ==
                                            '') {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                content: Text(
                                                    'กรุณากรอกจำนวนตารางวา'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                      }

                                      if (!((_model.uploadedLocalFile_uploadDataSqdComponent
                                                  .bytes?.isNotEmpty ??
                                              false))) {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              content: Text(
                                                  'กรุณาอัพโหลดรูปภาพโฉนดที่ดิน (ด้านหน้า)'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }
                                      if (!((_model.uploadedLocalFile_uploadDataSqd2Component
                                                  .bytes?.isNotEmpty ??
                                              false))) {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              content: Text(
                                                  'กรุณาอัพโหลดรูปภาพโฉนดที่ดิน (ด้านหลัง)'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }
                                      FFAppState().chanodOutput =
                                          ChanodDataModelStruct();
                                      safeSetState(() {});
                                      FFAppState().updateChanodOutputStruct(
                                        (e) => e
                                          ..utmmap = _model.isSearchByChanod
                                              ? ''
                                              : _model
                                                  .rawangTextFieldTextController
                                                  .text
                                          ..landNo = _model.isSearchByChanod
                                              ? ''
                                              : _model
                                                  .chanodNumberTextFieldTextController
                                                  .text
                                          ..chanodNo = _model.isSearchByChanod
                                              ? _model
                                                  .chanodNumberTextFieldTextController
                                                  .text
                                              : ''
                                          ..changwatName = FFAppState()
                                              .addressOutput
                                              .provinceName
                                          ..amphurName = FFAppState()
                                              .addressOutput
                                              .districtName
                                          ..tumbonName = FFAppState()
                                              .addressOutput
                                              .subdistrictName
                                          ..changwatCode = FFAppState()
                                              .addressOutput
                                              .provinceId
                                          ..amphurCode = FFAppState()
                                              .addressOutput
                                              .districtId
                                              .toString(),
                                      );
                                      safeSetState(() {});
                                      FFAppState().updateChanodOutputStruct(
                                        (e) => e
                                          ..landAreaRai = functions
                                              .removeCommaFromNumText(_model
                                                  .raiTextFieldTextController
                                                  .text)
                                          ..landAreaNgan = functions
                                              .removeCommaFromNumText(_model
                                                  .nganTextFieldTextController
                                                  .text)
                                          ..landAreaWa = functions
                                              .removeCommaFromNumText(_model
                                                  .tarangWaTextFieldTextController
                                                  .text),
                                      );
                                      safeSetState(() {});
                                      FFAppState().AppStateAREARAI = functions
                                          .removeCommaFromNumText(_model
                                              .raiTextFieldTextController
                                              .text)!;
                                      FFAppState().AppStateAREANGAN = functions
                                          .removeCommaFromNumText(_model
                                              .nganTextFieldTextController
                                              .text)!;
                                      FFAppState().AppStateAREAWA = functions
                                          .removeCommaFromNumText(_model
                                              .tarangWaTextFieldTextController
                                              .text)!;
                                      safeSetState(() {});
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
                                              width: double.infinity,
                                              child: LoadingWidget(),
                                            ),
                                          );
                                        },
                                      );

                                      _model.aPIcheckRateOutput =
                                          await CheckRateApiCall.call(
                                        chanodNo: FFAppState()
                                                    .chanodOutput
                                                    .chanodNo !=
                                                ''
                                            ? FFAppState().chanodOutput.chanodNo
                                            : '',
                                        changwatName: FFAppState()
                                            .addressOutput
                                            .provinceName,
                                        amphurName: FFAppState()
                                            .addressOutput
                                            .districtName,
                                        landAreaRai: FFAppState()
                                                .chanodOutput
                                                .hasLandAreaRai()
                                            ? FFAppState()
                                                .chanodOutput
                                                .landAreaRai
                                            : '',
                                        landAreaNgan: FFAppState()
                                                .chanodOutput
                                                .hasLandAreaNgan()
                                            ? FFAppState()
                                                .chanodOutput
                                                .landAreaNgan
                                            : '',
                                        landAreaWa: FFAppState()
                                                .chanodOutput
                                                .hasLandAreaWa()
                                            ? FFAppState()
                                                .chanodOutput
                                                .landAreaWa
                                            : '',
                                        utmmap: FFAppState()
                                                    .chanodOutput
                                                    .utmmap !=
                                                ''
                                            ? FFAppState().chanodOutput.utmmap
                                            : '',
                                        landNo: FFAppState()
                                                .chanodOutput
                                                .hasLandNo()
                                            ? FFAppState().chanodOutput.landNo
                                            : '',
                                        surveyNo: '',
                                        apiUrl: FFAppState().landAndHouseAPIUrl,
                                      );

                                      _shouldSetState = true;
                                      if ((_model.aPIcheckRateOutput
                                                  ?.statusCode ??
                                              200) !=
                                          200) {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              content: Text(
                                                  'พบข้อผิดพลาด Connection (${(_model.aPIcheckRateOutput?.statusCode ?? 200).toString()})'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                        Navigator.pop(context);
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }
                                      if (CheckRateApiCall.statuscode(
                                            (_model.aPIcheckRateOutput
                                                    ?.jsonBody ??
                                                ''),
                                          ) ==
                                          '200') {
                                        FFAppState().chanodOutput =
                                            CheckRateApiCall.results(
                                          (_model.aPIcheckRateOutput
                                                  ?.jsonBody ??
                                              ''),
                                        )!;
                                        safeSetState(() {});
                                        FFAppState().updateChanodOutputStruct(
                                          (e) => e
                                            ..landAreaRai =
                                                FFAppState().AppStateAREARAI
                                            ..landAreaNgan =
                                                FFAppState().AppStateAREANGAN
                                            ..landAreaWa =
                                                FFAppState().AppStateAREAWA,
                                        );
                                        safeSetState(() {});
                                        FFAppState().isSearchByChanodNo =
                                            _model.isSearchByChanod;
                                        safeSetState(() {});
                                      }
                                      _model.isFormState = false;
                                      safeSetState(() {});
                                      await widget.updateFormState?.call(
                                        _model.isFormState,
                                      );
                                      Navigator.pop(context);
                                    } else {
                                      if (!(_model.textController6.text != '')) {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              content: Text(
                                                  'กรุณากรอกวงเงินที่ต้องการ'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }
                                      _model.isFormState = true;
                                      safeSetState(() {});
                                      await widget.updateFormState?.call(
                                        _model.isFormState,
                                      );
                                      FFAppState()
                                          .updateSaveLeadAgentDataStruct(
                                        (e) => e
                                          ..landDistrict = FFAppState()
                                              .addressOutput
                                              .districtName
                                          ..landSubdistrict = FFAppState()
                                              .addressOutput
                                              .subdistrictName
                                          ..landProvince = FFAppState()
                                              .addressOutput
                                              .provinceName
                                          ..landPostcode =
                                              FFAppState().addressOutput.zipCode
                                          ..landAreaRai = FFAppState()
                                                  .chanodOutput
                                                  .hasLandAreaRai()
                                              ? FFAppState()
                                                  .chanodOutput
                                                  .landAreaRai
                                              : ''
                                          ..landAreaNgan = FFAppState()
                                                  .chanodOutput
                                                  .hasLandAreaNgan()
                                              ? FFAppState()
                                                  .chanodOutput
                                                  .landAreaNgan
                                              : ''
                                          ..landAreaWa = FFAppState()
                                                  .chanodOutput
                                                  .hasLandAreaWa()
                                              ? FFAppState()
                                                  .chanodOutput
                                                  .landAreaWa
                                              : ''
                                          ..landNo = FFAppState()
                                                      .chanodOutput
                                                      .landNo !=
                                                  ''
                                              ? FFAppState().chanodOutput.landNo
                                              : ''
                                          ..utmmap = FFAppState()
                                                      .chanodOutput
                                                      .utmmap !=
                                                  ''
                                              ? FFAppState().chanodOutput.utmmap
                                              : ''
                                          ..surveyNo = ''
                                          ..ltv1Amount = FFAppState()
                                              .chanodOutput
                                              .ltv1Amount
                                              .toString()
                                          ..ltv2Amount = FFAppState()
                                              .chanodOutput
                                              .ltv2Amount
                                              .toString()
                                          ..carRegistration = FFAppState()
                                                      .chanodOutput
                                                      .chanodNo !=
                                                  ''
                                              ? FFAppState()
                                                  .chanodOutput
                                                  .chanodNo
                                              : ''
                                          ..loanAmount =
                                              functions.removeCommaFromNumText(
                                                  _model.textController6.text)
                                          ..contactTime = _model.datePicked !=
                                                  null
                                              ? _model.datePicked?.toString()
                                              : ''
                                          ..comEstimateAmt =
                                              '${FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().maxCommissionAmountInstallment < 0.0 ? (((double.parse((functions.removeCommaFromNumText(_model.textController6.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString()) : (double.parse((((double.parse((functions.removeCommaFromNumText(_model.textController6.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString())) < FFAppState().maxCommissionAmountInstallment ? (((double.parse((functions.removeCommaFromNumText(_model.textController6.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString()) : '${FFAppState().maxCommissionAmountInstallment.toString()}')) : (FFAppState().maxCommissionAmountOnetime < 0.0 ? (((double.parse((functions.removeCommaFromNumText(_model.textController6.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString()) : (double.parse((((double.parse((functions.removeCommaFromNumText(_model.textController6.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString())) < FFAppState().maxCommissionAmountOnetime ? (((double.parse((functions.removeCommaFromNumText(_model.textController6.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString()) : '${FFAppState().maxCommissionAmountOnetime.toString()}'))}'
                                          ..comEstimateVat = FFAppState()
                                              .agentProfileDataType
                                              .agentWht
                                          ..comEstimateNetAmt = ((double.parse((FFAppState()
                                                              .agentProfileDataType
                                                              .paymentMethod ==
                                                          'installment'
                                                      ? (FFAppState().maxCommissionAmountInstallment < 0.0
                                                          ? (((double.parse((functions.removeCommaFromNumText(_model.textController6.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100)
                                                              .toString())
                                                          : (double.parse((((double.parse((functions.removeCommaFromNumText(_model.textController6.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString())) < FFAppState().maxCommissionAmountInstallment
                                                              ? (((double.parse((functions.removeCommaFromNumText(_model.textController6.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100)
                                                                  .toString())
                                                              : '${FFAppState().maxCommissionAmountInstallment.toString()}'))
                                                      : (FFAppState().maxCommissionAmountOnetime < 0.0
                                                          ? (((double.parse((functions.removeCommaFromNumText(_model.textController6.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100)
                                                              .toString())
                                                          : (double.parse((((double.parse((functions.removeCommaFromNumText(_model.textController6.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString())) < FFAppState().maxCommissionAmountOnetime
                                                              ? (((double.parse((functions.removeCommaFromNumText(_model.textController6.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100)
                                                                  .toString())
                                                              : '${FFAppState().maxCommissionAmountOnetime.toString()}'))))) -
                                                  (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().maxCommissionAmountInstallment < 0.0 ? (((double.parse((functions.removeCommaFromNumText(_model.textController6.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString()) : (double.parse((((double.parse((functions.removeCommaFromNumText(_model.textController6.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString())) < FFAppState().maxCommissionAmountInstallment ? (((double.parse((functions.removeCommaFromNumText(_model.textController6.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString()) : '${FFAppState().maxCommissionAmountInstallment.toString()}')) : (FFAppState().maxCommissionAmountOnetime < 0.0 ? (((double.parse((functions.removeCommaFromNumText(_model.textController6.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString()) : (double.parse((((double.parse((functions.removeCommaFromNumText(_model.textController6.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString())) < FFAppState().maxCommissionAmountOnetime ? (((double.parse((functions.removeCommaFromNumText(_model.textController6.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString()) : '${FFAppState().maxCommissionAmountOnetime.toString()}')))) *
                                                      double.parse((FFAppState().agentProfileDataType.agentWht != '' ? FFAppState().agentProfileDataType.agentWht : '0')) /
                                                      100))
                                              .toString()
                                          ..comEstimateVatAmt =
                                              '${(double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().maxCommissionAmountInstallment < 0.0 ? (((double.parse((functions.removeCommaFromNumText(_model.textController6.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString()) : (double.parse((((double.parse((functions.removeCommaFromNumText(_model.textController6.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString())) < FFAppState().maxCommissionAmountInstallment ? (((double.parse((functions.removeCommaFromNumText(_model.textController6.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString()) : '${FFAppState().maxCommissionAmountInstallment.toString()}')) : (FFAppState().maxCommissionAmountOnetime < 0.0 ? (((double.parse((functions.removeCommaFromNumText(_model.textController6.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString()) : (double.parse((((double.parse((functions.removeCommaFromNumText(_model.textController6.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString())) < FFAppState().maxCommissionAmountOnetime ? (((double.parse((functions.removeCommaFromNumText(_model.textController6.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString()) : '${FFAppState().maxCommissionAmountOnetime.toString()}')))) * double.parse((FFAppState().agentProfileDataType.agentWht != '' ? FFAppState().agentProfileDataType.agentWht : '0')) / 100).toString()}'
                                          ..agentGroupId = FFAppState()
                                              .agentProfileDataType
                                              .agentGroupId
                                          ..defaultComPercent = FFAppState()
                                              .agentProfileDataType
                                              .defaultPercent
                                          ..actualComPercent = FFAppState()
                                              .agentProfileDataType
                                              .actualPercent
                                          ..agentCode = FFAppState().agentCode,
                                      );
                                      safeSetState(() {});

                                      context.pushNamed(
                                        LeadAgentReviewDetailPageWidget
                                            .routeName,
                                        queryParameters: {
                                          'chanodFrontFile': serializeParam(
                                            _model
                                                .uploadedLocalFile_uploadDataSqdComponent,
                                            ParamType.FFUploadedFile,
                                          ),
                                          'chanodBackFile': serializeParam(
                                            _model
                                                .uploadedLocalFile_uploadDataSqd2Component,
                                            ParamType.FFUploadedFile,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.rightToLeft,
                                          ),
                                        },
                                      );
                                    }

                                    if (_shouldSetState) safeSetState(() {});
                                  },
                            text: _model.isFormState ? 'ประเมินราคา' : 'ถัดไป',
                            options: FFButtonOptions(
                              width: () {
                                if (MediaQuery.sizeOf(context).width <
                                    kBreakpointSmall) {
                                  return MediaQuery.sizeOf(context).width;
                                } else if (MediaQuery.sizeOf(context).width <
                                    kBreakpointMedium) {
                                  return MediaQuery.sizeOf(context).width;
                                } else if (MediaQuery.sizeOf(context).width <
                                    kBreakpointLarge) {
                                  return 600.0;
                                } else {
                                  return 600.0;
                                }
                              }(),
                              height: () {
                                if (MediaQuery.sizeOf(context).width <
                                    kBreakpointSmall) {
                                  return 60.0;
                                } else if (MediaQuery.sizeOf(context).width <
                                    kBreakpointMedium) {
                                  return 80.0;
                                } else if (MediaQuery.sizeOf(context).width <
                                    kBreakpointLarge) {
                                  return 80.0;
                                } else {
                                  return 80.0;
                                }
                              }(),
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
                                    fontSize: () {
                                      if (MediaQuery.sizeOf(context).width <
                                          kBreakpointSmall) {
                                        return 16.0;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointMedium) {
                                        return 22.0;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointLarge) {
                                        return 22.0;
                                      } else {
                                        return 22.0;
                                      }
                                    }(),
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(16.0),
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
    );
  }
}
