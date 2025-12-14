import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'progress_lead_component_new_model.dart';
export 'progress_lead_component_new_model.dart';

class ProgressLeadComponentNewWidget extends StatefulWidget {
  const ProgressLeadComponentNewWidget({
    super.key,
    this.step,
    this.progressStatusList,
  });

  final String? step;
  final List<String>? progressStatusList;

  @override
  State<ProgressLeadComponentNewWidget> createState() =>
      _ProgressLeadComponentNewWidgetState();
}

class _ProgressLeadComponentNewWidgetState
    extends State<ProgressLeadComponentNewWidget> {
  late ProgressLeadComponentNewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProgressLeadComponentNewModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (widget.progressStatusList!.length > 2) {
          return Container(
            height: 65.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: widget.step == '1' ? 25.0 : 15.0,
                          height: widget.step == '1' ? 25.0 : 15.0,
                          decoration: BoxDecoration(
                            color: widget.step == '1'
                                ? Color(0xFF4AC225)
                                : Color(0xFFDB771A),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.transparent,
                            ),
                          ),
                          child: Visibility(
                            visible: widget.step == '1',
                            child: Icon(
                              Icons.check_rounded,
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              size: 20.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 20.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Builder(
                              builder: (context) {
                                if (int.parse((widget.step!)) > 1) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Divider(
                                        thickness: 3.0,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ],
                                  );
                                } else {
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      StyledDivider(
                                        thickness: 3.0,
                                        color: Color(0x80646464),
                                        lineStyle: DividerLineStyle.dotted,
                                      ),
                                    ],
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                        Container(
                          width: widget.step == '2' ? 25.0 : 15.0,
                          height: widget.step == '2' ? 25.0 : 15.0,
                          decoration: BoxDecoration(
                            color: widget.step == '2'
                                ? Color(0xFF4AC225)
                                : (int.parse((widget.step!)) > 2
                                    ? Color(0xFFDB771A)
                                    : FlutterFlowTheme.of(context)
                                        .secondaryText),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.transparent,
                            ),
                          ),
                          child: Visibility(
                            visible: widget.step == '2',
                            child: Icon(
                              Icons.check_rounded,
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              size: 20.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 20.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Builder(
                              builder: (context) {
                                if (int.parse((widget.step!)) > 2) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Divider(
                                        thickness: 3.0,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ],
                                  );
                                } else {
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      StyledDivider(
                                        thickness: 3.0,
                                        color: Color(0x80646464),
                                        lineStyle: DividerLineStyle.dotted,
                                      ),
                                    ],
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                        Container(
                          width: widget.step == '3' ? 25.0 : 15.0,
                          height: widget.step == '3' ? 25.0 : 15.0,
                          decoration: BoxDecoration(
                            color: valueOrDefault<Color>(
                              widget.step == '3'
                                  ? Color(0xFF4AC225)
                                  : (int.parse((widget.step!)) > 3
                                      ? Color(0xFFDB771A)
                                      : FlutterFlowTheme.of(context)
                                          .secondaryText),
                              FlutterFlowTheme.of(context).primary,
                            ),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.transparent,
                            ),
                          ),
                          child: Visibility(
                            visible: widget.step == '3',
                            child: Icon(
                              Icons.check_rounded,
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              size: 20.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 20.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Builder(
                              builder: (context) {
                                if (int.parse((widget.step!)) > 3) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Divider(
                                        thickness: 3.0,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ],
                                  );
                                } else {
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      StyledDivider(
                                        thickness: 3.0,
                                        color: Color(0x80646464),
                                        lineStyle: DividerLineStyle.dotted,
                                      ),
                                    ],
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                        Container(
                          width: widget.step == '4' ? 25.0 : 15.0,
                          height: widget.step == '4' ? 25.0 : 15.0,
                          decoration: BoxDecoration(
                            color: valueOrDefault<Color>(
                              widget.step == '4'
                                  ? Color(0xFF4AC225)
                                  : (int.parse((widget.step!)) > 4
                                      ? Color(0xFFDB771A)
                                      : FlutterFlowTheme.of(context)
                                          .secondaryText),
                              FlutterFlowTheme.of(context).primary,
                            ),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.transparent,
                            ),
                          ),
                          child: Visibility(
                            visible: widget.step == '4',
                            child: Icon(
                              Icons.check_rounded,
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              size: 20.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          width: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Text(
                            valueOrDefault<String>(
                              widget.progressStatusList?.firstOrNull,
                              'status1',
                            ),
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Noto San Thai',
                                  color: widget.step == '1'
                                      ? Color(0xFF4AC225)
                                      : FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  fontSize: () {
                                    if (MediaQuery.sizeOf(context).width <
                                        kBreakpointSmall) {
                                      return 10.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointMedium) {
                                      return 12.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointLarge) {
                                      return 12.0;
                                    } else {
                                      return 12.0;
                                    }
                                  }(),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(
                          width: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget.progressStatusList?.elementAtOrNull(1),
                                'status2',
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto San Thai',
                                    color: widget.step == '2'
                                        ? Color(0xFF4AC225)
                                        : FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    fontSize: () {
                                      if (MediaQuery.sizeOf(context).width <
                                          kBreakpointSmall) {
                                        return 10.0;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointMedium) {
                                        return 12.0;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointLarge) {
                                        return 12.0;
                                      } else {
                                        return 12.0;
                                      }
                                    }(),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(
                          width: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget.progressStatusList?.elementAtOrNull(2),
                                'status3',
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto San Thai',
                                    color: valueOrDefault<Color>(
                                      widget.step == '3'
                                          ? Color(0xFF4AC225)
                                          : FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                    fontSize: () {
                                      if (MediaQuery.sizeOf(context).width <
                                          kBreakpointSmall) {
                                        return 10.0;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointMedium) {
                                        return 12.0;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointLarge) {
                                        return 12.0;
                                      } else {
                                        return 12.0;
                                      }
                                    }(),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          width: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget.progressStatusList?.lastOrNull,
                                'status4',
                              ),
                              textAlign: TextAlign.end,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto San Thai',
                                    color: valueOrDefault<Color>(
                                      widget.step == '4'
                                          ? Color(0xFF4AC225)
                                          : FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                    fontSize: () {
                                      if (MediaQuery.sizeOf(context).width <
                                          kBreakpointSmall) {
                                        return 10.0;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointMedium) {
                                        return 12.0;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointLarge) {
                                        return 12.0;
                                      } else {
                                        return 12.0;
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
              ],
            ),
          );
        } else {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                height: 65.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(0.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: widget.step == '1' ? 25.0 : 15.0,
                              height: widget.step == '1' ? 25.0 : 15.0,
                              decoration: BoxDecoration(
                                color: widget.step == '1'
                                    ? Color(0xFF4AC225)
                                    : Color(0xFFDB771A),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.transparent,
                                ),
                              ),
                              child: Visibility(
                                visible: widget.step == '1',
                                child: Icon(
                                  Icons.check_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  size: 20.0,
                                ),
                              ),
                            ),
                            Container(
                              width: 108.0,
                              height: 20.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Builder(
                                builder: (context) {
                                  if (int.parse((widget.step!)) > 1) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Divider(
                                          thickness: 3.0,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                        ),
                                      ],
                                    );
                                  } else {
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        StyledDivider(
                                          thickness: 3.0,
                                          color: Color(0x80646464),
                                          lineStyle: DividerLineStyle.dotted,
                                        ),
                                      ],
                                    );
                                  }
                                },
                              ),
                            ),
                            Container(
                              width: widget.step == '2' ? 25.0 : 15.0,
                              height: widget.step == '2' ? 25.0 : 15.0,
                              decoration: BoxDecoration(
                                color: widget.step == '2'
                                    ? Color(0xFFDA100B)
                                    : (int.parse((widget.step!)) > 2
                                        ? Color(0xFFDB771A)
                                        : FlutterFlowTheme.of(context)
                                            .secondaryText),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.transparent,
                                ),
                              ),
                              child: Visibility(
                                visible: widget.step == '2',
                                child: Icon(
                                  Icons.clear,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  size: 20.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.progressStatusList?.firstOrNull,
                                    'status1',
                                  ),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto San Thai',
                                        color: widget.step == '1'
                                            ? Color(0xFF4AC225)
                                            : FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        fontSize: () {
                                          if (MediaQuery.sizeOf(context).width <
                                              kBreakpointSmall) {
                                            return 10.0;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointMedium) {
                                            return 12.0;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointLarge) {
                                            return 12.0;
                                          } else {
                                            return 12.0;
                                          }
                                        }(),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                              Container(
                                width: 150.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget.progressStatusList?.lastOrNull,
                                      'status4',
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Noto San Thai',
                                          color: widget.step == '2'
                                              ? Color(0xFFDA100B)
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          fontSize: () {
                                            if (MediaQuery.sizeOf(context)
                                                    .width <
                                                kBreakpointSmall) {
                                              return 10.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointMedium) {
                                              return 12.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointLarge) {
                                              return 12.0;
                                            } else {
                                              return 12.0;
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
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
