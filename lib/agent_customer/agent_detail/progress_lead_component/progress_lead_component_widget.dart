import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'progress_lead_component_model.dart';
export 'progress_lead_component_model.dart';

class ProgressLeadComponentWidget extends StatefulWidget {
  const ProgressLeadComponentWidget({
    super.key,
    this.step,
    String? step5Status,
  }) : this.step5Status = step5Status ?? '';

  final String? step;
  final String step5Status;

  @override
  State<ProgressLeadComponentWidget> createState() =>
      _ProgressLeadComponentWidgetState();
}

class _ProgressLeadComponentWidgetState
    extends State<ProgressLeadComponentWidget> {
  late ProgressLeadComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProgressLeadComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(-1.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(0.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: widget.step == '1' ? 25.0 : 15.0,
                    height: widget.step == '1' ? 25.0 : 15.0,
                    decoration: BoxDecoration(
                      color: valueOrDefault<Color>(
                        (String step) {
                          return int.parse(step) >= 1;
                        }(widget.step!)
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).secondaryText,
                        FlutterFlowTheme.of(context).primary,
                      ),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                    ),
                    child: Visibility(
                      visible: widget.step == '1',
                      child: Icon(
                        Icons.check_rounded,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        size: 20.0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.24,
                      height: 20.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                  color: FlutterFlowTheme.of(context).primary,
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
                      color: valueOrDefault<Color>(
                        (String step) {
                          return int.parse(step) >= 2;
                        }(widget.step!)
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).secondaryText,
                        FlutterFlowTheme.of(context).primary,
                      ),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                    ),
                    child: Visibility(
                      visible: widget.step == '2',
                      child: Icon(
                        Icons.check_rounded,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        size: 20.0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.24,
                      height: 20.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                  color: FlutterFlowTheme.of(context).primary,
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
                        (String step) {
                          return int.parse(step) >= 3;
                        }(widget.step!)
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).secondaryText,
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
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        size: 20.0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.24,
                      height: 20.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                  color: FlutterFlowTheme.of(context).primary,
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
                        (String step) {
                          return int.parse(step) >= 4;
                        }(widget.step!)
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).secondaryText,
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
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        size: 20.0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.24,
                      height: 20.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Builder(
                        builder: (context) {
                          if (int.parse((widget.step!)) > 4) {
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Divider(
                                  thickness: 3.0,
                                  color: FlutterFlowTheme.of(context).primary,
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
                    width: widget.step == '5' ? 25.0 : 15.0,
                    height: widget.step == '5' ? 25.0 : 15.0,
                    decoration: BoxDecoration(
                      color: valueOrDefault<Color>(
                        (String step) {
                          return int.parse(step) >= 5;
                        }(widget.step!)
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).secondaryText,
                        FlutterFlowTheme.of(context).primary,
                      ),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                    ),
                    child: Visibility(
                      visible: widget.step == '5',
                      child: Icon(
                        Icons.check_rounded,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        size: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(-0.6, 0.0),
                          child: Text(
                            'ใหม่',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Noto San Thai',
                                  color: valueOrDefault<Color>(
                                    widget.step == '1'
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                  fontSize: 10.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0.0),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(-0.5, 0.0),
                          child: Text(
                            'อยู่ระหว่าง\nติดต่อลูกค้า',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Noto San Thai',
                                  color: valueOrDefault<Color>(
                                    widget.step == '2'
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                  fontSize: 10.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                        ),
                        child: Text(
                          'อยู่ระหว่าง\nทำสัญญา',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Noto San Thai',
                                    color: valueOrDefault<Color>(
                                      widget.step == '3'
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                    fontSize: 10.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.5, 0.0),
                          child: Text(
                            'อนุมัติวงเงิน',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Noto San Thai',
                                  color: valueOrDefault<Color>(
                                    widget.step == '4'
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                  fontSize: 10.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Text(
                            '${widget.step5Status}' != 'ทำสัญญาแล้ว'
                                ? 'ปิดการขาย'
                                : widget.step5Status,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Noto San Thai',
                                  color: valueOrDefault<Color>(
                                    widget.step == '5'
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                  fontSize: 10.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
