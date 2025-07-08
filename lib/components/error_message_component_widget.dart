import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'error_message_component_model.dart';
export 'error_message_component_model.dart';

class ErrorMessageComponentWidget extends StatefulWidget {
  const ErrorMessageComponentWidget({
    super.key,
    required this.textMessage,
  });

  final String? textMessage;

  @override
  State<ErrorMessageComponentWidget> createState() =>
      _ErrorMessageComponentWidgetState();
}

class _ErrorMessageComponentWidgetState
    extends State<ErrorMessageComponentWidget> {
  late ErrorMessageComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ErrorMessageComponentModel());

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
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: () {
          if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
            return (MediaQuery.sizeOf(context).width * 0.85);
          } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
            return (MediaQuery.sizeOf(context).width * 0.85);
          } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
            return (MediaQuery.sizeOf(context).width * 0.25);
          } else {
            return (MediaQuery.sizeOf(context).width * 0.25);
          }
        }(),
        height: () {
          if (MediaQuery.sizeOf(context).height < kBreakpointSmall) {
            return 130.0;
          } else if (MediaQuery.sizeOf(context).height < kBreakpointMedium) {
            return 130.0;
          } else if (MediaQuery.sizeOf(context).height < kBreakpointLarge) {
            return 200.0;
          } else {
            return 200.0;
          }
        }(),
        constraints: BoxConstraints(
          minHeight: () {
            if (MediaQuery.sizeOf(context).height < kBreakpointSmall) {
              return 130.0;
            } else if (MediaQuery.sizeOf(context).height < kBreakpointMedium) {
              return 130.0;
            } else if (MediaQuery.sizeOf(context).height < kBreakpointLarge) {
              return (MediaQuery.sizeOf(context).height * 0.35);
            } else {
              return (MediaQuery.sizeOf(context).height * 0.35);
            }
          }(),
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.error_outline,
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
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
              child: AutoSizeText(
                valueOrDefault<String>(
                  widget.textMessage,
                  '-',
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                style: FlutterFlowTheme.of(context).labelMedium.override(
                      font: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w500,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelMedium.fontStyle,
                      ),
                      color: Color(0xFF606A85),
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelMedium.fontStyle,
                    ),
              ),
            ),
            FFButtonWidget(
              onPressed: () async {
                Navigator.pop(context);
              },
              text: 'ตกลง',
              options: FFButtonOptions(
                width: 150.0,
                height: 50.0,
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: Color(0xFFF46503),
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Noto San Thai',
                      color: Colors.white,
                      letterSpacing: 0.0,
                    ),
                elevation: 0.0,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
