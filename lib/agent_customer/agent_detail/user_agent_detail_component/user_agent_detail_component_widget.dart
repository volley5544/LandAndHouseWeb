import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'user_agent_detail_component_model.dart';
export 'user_agent_detail_component_model.dart';

class UserAgentDetailComponentWidget extends StatefulWidget {
  const UserAgentDetailComponentWidget({
    super.key,
    required this.name,
    required this.lastName,
    required this.idCard,
    required this.phoneNumber,
    required this.backAccount,
    required this.bankName,
  });

  final String? name;
  final String? lastName;
  final String? idCard;
  final String? phoneNumber;
  final String? backAccount;
  final String? bankName;

  @override
  State<UserAgentDetailComponentWidget> createState() =>
      _UserAgentDetailComponentWidgetState();
}

class _UserAgentDetailComponentWidgetState
    extends State<UserAgentDetailComponentWidget> {
  late UserAgentDetailComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserAgentDetailComponentModel());

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
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x3416202A),
            offset: Offset(
              2.0,
              4.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(12.0),
        shape: BoxShape.rectangle,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ชื่อ',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Noto San Thai',
                          color: Color(0xB2646464),
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text(
                    ':',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Noto San Thai',
                          color: Color(0xB2646464),
                          fontSize: () {
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
                          letterSpacing: 0.0,
                        ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Text(
                        valueOrDefault<String>(
                          widget.name,
                          'name',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Noto San Thai',
                              color: Color(0xFF003063),
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ),
                ].divide(SizedBox(width: 12.0)),
              ),
            ),
            Container(
              decoration: BoxDecoration(),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'นามสกุล',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Noto San Thai',
                          color: Color(0xB2646464),
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text(
                    ':',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Noto San Thai',
                          color: Color(0xB2646464),
                          fontSize: () {
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
                          letterSpacing: 0.0,
                        ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Text(
                        valueOrDefault<String>(
                          widget.lastName,
                          'lastName',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Noto San Thai',
                              color: Color(0xFF003063),
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ),
                ].divide(SizedBox(width: 12.0)),
              ),
            ),
            Container(
              decoration: BoxDecoration(),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'เลขบัตรประชาชน',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Noto San Thai',
                          color: Color(0xB2646464),
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text(
                    ':',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Noto San Thai',
                          color: Color(0xB2646464),
                          fontSize: () {
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
                          letterSpacing: 0.0,
                        ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Text(
                        valueOrDefault<String>(
                          widget.idCard,
                          'idCard',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Noto San Thai',
                              color: Color(0xFF003063),
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ),
                ].divide(SizedBox(width: 12.0)),
              ),
            ),
            Container(
              decoration: BoxDecoration(),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'เบอร์โทรศัพท์',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Noto San Thai',
                          color: Color(0xB2646464),
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text(
                    ':',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Noto San Thai',
                          color: Color(0xB2646464),
                          fontSize: () {
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
                          letterSpacing: 0.0,
                        ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Text(
                        valueOrDefault<String>(
                          functions.formatPhoneNumber(widget.phoneNumber),
                          'phoneNumber',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Noto San Thai',
                              color: Color(0xFF003063),
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ),
                ].divide(SizedBox(width: 12.0)),
              ),
            ),
            Container(
              decoration: BoxDecoration(),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'เลขที่บัญชี',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Noto San Thai',
                          color: Color(0xB2646464),
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text(
                    ':',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Noto San Thai',
                          color: Color(0xB2646464),
                          fontSize: () {
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
                          letterSpacing: 0.0,
                        ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Text(
                        valueOrDefault<String>(
                          widget.backAccount,
                          'bankAccount',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Noto San Thai',
                              color: Color(0xFF003063),
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ),
                ].divide(SizedBox(width: 12.0)),
              ),
            ),
            Container(
              decoration: BoxDecoration(),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ธนาคาร',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Noto San Thai',
                          color: Color(0xB2646464),
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text(
                    ':',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Noto San Thai',
                          color: Color(0xB2646464),
                          fontSize: () {
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
                          letterSpacing: 0.0,
                        ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Text(
                        valueOrDefault<String>(
                          widget.bankName,
                          'bankName',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Noto San Thai',
                              color: Color(0xFF003063),
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ),
                ].divide(SizedBox(width: 12.0)),
              ),
            ),
          ]
              .divide(SizedBox(height: 8.0))
              .addToStart(SizedBox(height: 8.0))
              .addToEnd(SizedBox(height: 12.0)),
        ),
      ),
    );
  }
}
