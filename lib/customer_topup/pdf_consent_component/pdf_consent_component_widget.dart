import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'pdf_consent_component_model.dart';
export 'pdf_consent_component_model.dart';

class PdfConsentComponentWidget extends StatefulWidget {
  const PdfConsentComponentWidget({
    super.key,
    required this.title,
    required this.pdfFileByte,
    int? index,
  }) : this.index = index ?? -1;

  final String? title;
  final FFUploadedFile? pdfFileByte;
  final int index;

  @override
  State<PdfConsentComponentWidget> createState() =>
      _PdfConsentComponentWidgetState();
}

class _PdfConsentComponentWidgetState extends State<PdfConsentComponentWidget> {
  late PdfConsentComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PdfConsentComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.toggleValue =
          FFAppState().pdfDocListConsent.elementAtOrNull(widget.index)!;
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
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Material(
            color: Colors.transparent,
            elevation: 3.0,
            child: Container(
              width: double.infinity,
              height: 70.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        widget.title,
                        'title',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Noto San Thai',
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: FlutterFlowPdfViewer(
                fileBytes: widget.pdfFileByte?.bytes,
                height: 300.0,
                horizontalScroll: false,
              ),
            ),
          ),
          if (widget.index != -1)
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Divider(
                      thickness: 2.0,
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ToggleIcon(
                            onPressed: () async {
                              safeSetState(() =>
                                  _model.toggleValue = !_model.toggleValue);
                              if (!_model.toggleValue) {
                                _model.toggleValue = false;
                                safeSetState(() {});
                              } else {
                                _model.toggleValue = true;
                                safeSetState(() {});
                              }
                            },
                            value: _model.toggleValue,
                            onIcon: Icon(
                              Icons.check_circle,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 30.0,
                            ),
                            offIcon: Icon(
                              Icons.radio_button_off_outlined,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 30.0,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Text(
                                'ฉันยอมรับและได้อ่านเนื้อหาของเอกสารฉบับนี้ทั้งหมดแล้ว',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Noto San Thai',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(width: 12.0)),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: FFButtonWidget(
                              onPressed: !_model.toggleValue
                                  ? null
                                  : () async {
                                      FFAppState()
                                          .updatePdfDocListConsentAtIndex(
                                        widget.index,
                                        (_) => true,
                                      );
                                      safeSetState(() {});
                                      Navigator.pop(context);
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
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(12.0),
                                disabledColor: Color(0x80DB771A),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(width: 12.0)),
                      ),
                    ),
                  ].divide(SizedBox(height: 8.0)),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
