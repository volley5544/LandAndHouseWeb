import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'progress_bar_component_model.dart';
export 'progress_bar_component_model.dart';

class ProgressBarComponentWidget extends StatefulWidget {
  const ProgressBarComponentWidget({
    super.key,
    this.step,
  });

  final String? step;

  @override
  State<ProgressBarComponentWidget> createState() =>
      _ProgressBarComponentWidgetState();
}

class _ProgressBarComponentWidgetState
    extends State<ProgressBarComponentWidget> {
  late ProgressBarComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProgressBarComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(5.0, 12.0, 5.0, 12.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 0.12,
              height: MediaQuery.sizeOf(context).width * 0.12,
              decoration: BoxDecoration(
                color: valueOrDefault<Color>(
                  widget.step == '1'
                      ? FlutterFlowTheme.of(context).primary
                      : FlutterFlowTheme.of(context).secondaryBackground,
                  FlutterFlowTheme.of(context).primary,
                ),
                shape: BoxShape.circle,
                border: Border.all(
                  color: valueOrDefault<Color>(
                    widget.step == '1'
                        ? Color(0xFFFAFAFA)
                        : FlutterFlowTheme.of(context).primary,
                    FlutterFlowTheme.of(context).primary,
                  ),
                  width: valueOrDefault<double>(
                    widget.step == '1' ? 0.0 : 1.0,
                    0.0,
                  ),
                ),
              ),
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Text(
                '1',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Noto San Thai',
                      color: widget.step == '1'
                          ? FlutterFlowTheme.of(context).secondaryBackground
                          : FlutterFlowTheme.of(context).primary,
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
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
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StyledDivider(
                      thickness: 3.0,
                      color: widget.step != '1'
                          ? FlutterFlowTheme.of(context).primary
                          : Color(0x80646464),
                      lineStyle: DividerLineStyle.dotted,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width * 0.12,
              height: MediaQuery.sizeOf(context).width * 0.12,
              decoration: BoxDecoration(
                color: valueOrDefault<Color>(
                  widget.step == '2'
                      ? FlutterFlowTheme.of(context).primary
                      : FlutterFlowTheme.of(context).secondaryBackground,
                  FlutterFlowTheme.of(context).primary,
                ),
                shape: BoxShape.circle,
                border: Border.all(
                  color: valueOrDefault<Color>(
                    widget.step == '2'
                        ? Color(0xFFFAFAFA)
                        : FlutterFlowTheme.of(context).primary,
                    FlutterFlowTheme.of(context).primary,
                  ),
                  width: valueOrDefault<double>(
                    widget.step == '2' ? 0.0 : 1.0,
                    0.0,
                  ),
                ),
              ),
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Text(
                '2',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Noto San Thai',
                      color: widget.step == '2'
                          ? FlutterFlowTheme.of(context).secondaryBackground
                          : FlutterFlowTheme.of(context).primary,
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
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
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StyledDivider(
                      thickness: 3.0,
                      color: widget.step == '3'
                          ? FlutterFlowTheme.of(context).primary
                          : Color(0x80646464),
                      lineStyle: DividerLineStyle.dotted,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width * 0.12,
              height: MediaQuery.sizeOf(context).width * 0.12,
              decoration: BoxDecoration(
                color: valueOrDefault<Color>(
                  widget.step == '3'
                      ? FlutterFlowTheme.of(context).primary
                      : FlutterFlowTheme.of(context).secondaryBackground,
                  FlutterFlowTheme.of(context).primary,
                ),
                shape: BoxShape.circle,
                border: Border.all(
                  color: valueOrDefault<Color>(
                    widget.step == '3'
                        ? Color(0xFFFAFAFA)
                        : FlutterFlowTheme.of(context).primary,
                    FlutterFlowTheme.of(context).primary,
                  ),
                  width: valueOrDefault<double>(
                    widget.step == '3' ? 0.0 : 1.0,
                    0.0,
                  ),
                ),
              ),
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Text(
                '3',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Noto San Thai',
                      color: widget.step == '3'
                          ? FlutterFlowTheme.of(context).secondaryBackground
                          : FlutterFlowTheme.of(context).primary,
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          ].divide(SizedBox(width: 4.0)),
        ),
      ),
    );
  }
}
