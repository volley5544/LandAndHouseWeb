import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'review_detail_l_h_component_model.dart';
export 'review_detail_l_h_component_model.dart';

class ReviewDetailLHComponentWidget extends StatefulWidget {
  const ReviewDetailLHComponentWidget({
    super.key,
    this.chanodNO,
    this.landNO,
    required this.rai,
    required this.ngan,
    required this.wa,
    required this.ltv1Amount,
    required this.ltv2Amount,
    required this.utmmap1,
  });

  final String? chanodNO;
  final String? landNO;
  final String? rai;
  final String? ngan;
  final String? wa;
  final String? ltv1Amount;
  final String? ltv2Amount;
  final String? utmmap1;

  @override
  State<ReviewDetailLHComponentWidget> createState() =>
      _ReviewDetailLHComponentWidgetState();
}

class _ReviewDetailLHComponentWidgetState
    extends State<ReviewDetailLHComponentWidget> {
  late ReviewDetailLHComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReviewDetailLHComponentModel());

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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 22.0,
                    child: VerticalDivider(
                      thickness: 4.0,
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                  Text(
                    'ประเมินราคาที่ดิน',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Noto San Thai',
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ].divide(SizedBox(width: 8.0)),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (widget.chanodNO != null && widget.chanodNO != '')
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Text(
                      'ค้นหาโดยเลขโฉนด',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Noto San Thai',
                            color: FlutterFlowTheme.of(context).primary,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                if (widget.landNO != null && widget.landNO != '')
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Text(
                      'ค้นหาโดยเลขที่ดิน',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Noto San Thai',
                            color: FlutterFlowTheme.of(context).primary,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
              child: Container(
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            widget.chanodNO != null && widget.chanodNO != ''
                                ? 'เลขที่โฉนด'
                                : 'เลขที่ดิน',
                            'เลขที่โฉนด',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Noto San Thai',
                                    color: Color(0xB2646464),
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Text(
                          '*',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Noto San Thai',
                                    color: FlutterFlowTheme.of(context).error,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ].divide(SizedBox(width: 5.0)),
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
                            widget.chanodNO != null && widget.chanodNO != ''
                                ? widget.chanodNO
                                : widget.landNO,
                            '-',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
            ),
            if (widget.landNO != null && widget.landNO != '')
              Container(
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'ระวาง',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Noto San Thai',
                                    color: Color(0xB2646464),
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Text(
                          '*',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Noto San Thai',
                                    color: FlutterFlowTheme.of(context).error,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ].divide(SizedBox(width: 5.0)),
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
                            widget.utmmap1,
                            'utmmap',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'ตำบล/แขวง',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Noto San Thai',
                              color: Color(0xB2646464),
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Text(
                        '*',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Noto San Thai',
                              color: FlutterFlowTheme.of(context).error,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ].divide(SizedBox(width: 5.0)),
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
                        '',
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
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'อำเภอ/เขต',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Noto San Thai',
                              color: Color(0xB2646464),
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Text(
                        '*',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Noto San Thai',
                              color: FlutterFlowTheme.of(context).error,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ].divide(SizedBox(width: 5.0)),
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
                        '',
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
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'จังหวัด',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Noto San Thai',
                              color: Color(0xB2646464),
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Text(
                        '*',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Noto San Thai',
                              color: FlutterFlowTheme.of(context).error,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ].divide(SizedBox(width: 5.0)),
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
                        '',
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
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'ไร่',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Noto San Thai',
                              color: Color(0xB2646464),
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Text(
                        '*',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Noto San Thai',
                              color: FlutterFlowTheme.of(context).error,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ].divide(SizedBox(width: 5.0)),
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
                          widget.rai,
                          'rai',
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
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'งาน',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Noto San Thai',
                              color: Color(0xB2646464),
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Text(
                        '*',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Noto San Thai',
                              color: FlutterFlowTheme.of(context).error,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ].divide(SizedBox(width: 5.0)),
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
                          widget.ngan,
                          'ngan',
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
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'ตารางวา',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Noto San Thai',
                              color: Color(0xB2646464),
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Text(
                        '*',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Noto San Thai',
                              color: FlutterFlowTheme.of(context).error,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ].divide(SizedBox(width: 5.0)),
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
                          widget.wa,
                          'wa',
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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ราคาประเมินเบื้องต้น ไม่รวมสิ่งปลูกสร้าง (ไม่จดจำนอง)',
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
                    ].divide(SizedBox(width: 12.0)),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          widget.ltv1Amount,
                          'ltv1Amount',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Noto San Thai',
                              color: Color(0xFF003063),
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Text(
                        'บาท',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Noto San Thai',
                              color: Color(0xFF003063),
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ราคาประเมินเบื้องต้น ไม่รวมสิ่งปลูกสร้าง (จดจำนอง)',
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
                    ].divide(SizedBox(width: 12.0)),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          widget.ltv2Amount,
                          'ltv2amount',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Noto San Thai',
                              color: Color(0xFF003063),
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Text(
                        'บาท',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Noto San Thai',
                              color: Color(0xFF003063),
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                ],
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
