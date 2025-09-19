import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'review_detail_customer_component_model.dart';
export 'review_detail_customer_component_model.dart';

class ReviewDetailCustomerComponentWidget extends StatefulWidget {
  const ReviewDetailCustomerComponentWidget({
    super.key,
    required this.name,
    required this.lastname,
    required this.idcard,
    required this.phonenumber,
    required this.amount,
    required this.product,
    required this.carregister,
    required this.time,
  });

  final String? name;
  final String? lastname;
  final String? idcard;
  final String? phonenumber;
  final String? amount;
  final String? product;
  final String? carregister;
  final String? time;

  @override
  State<ReviewDetailCustomerComponentWidget> createState() =>
      _ReviewDetailCustomerComponentWidgetState();
}

class _ReviewDetailCustomerComponentWidgetState
    extends State<ReviewDetailCustomerComponentWidget> {
  late ReviewDetailCustomerComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReviewDetailCustomerComponentModel());

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
                    'ข้อมูลของลูกค้า',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Noto San Thai',
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ].divide(SizedBox(width: 8.0)),
              ),
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
                          'ชื่อ',
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
                            widget.name,
                            'name',
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
                          widget.lastname,
                          'lastname',
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
                          widget.idcard,
                          'idcard',
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
                          functions.formatPhoneNumber(widget.phonenumber),
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
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'วงเงินที่ต้องการ',
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
                          widget.amount,
                          'amount',
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
                        'ประเภทสินทรัพย์',
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
                          widget.product,
                          'product',
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
                    'ทะเบียนรถ',
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
                          widget.carregister,
                          'carregister',
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
                    'เวลาที่สะดวกให้ติดต่อ',
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
                          widget.time,
                          'time',
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: RichText(
                      textScaler: MediaQuery.of(context).textScaler,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                'ข้าพเจ้าให้ความยินยอมกับบริษัทฯ ในการเก็บรวบรวม ใช้และเปิดเผยข้อมูลส่วนบุคคลของข้าพเจ้าในการติดต่อเพื่อเสนอผลิตภัณฑ์และบริการของบริษัทฯและรับรองว่าได้อ่านและรับทราบประกาศความเป็นส่วนตัวแล้ว \n',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Noto San Thai',
                                  letterSpacing: 0.0,
                                ),
                          ),
                          TextSpan(
                            text: 'ประกาศความเป็นส่วนตัวแล้ว ',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Noto San Thai',
                                  letterSpacing: 0.0,
                                  decoration: TextDecoration.underline,
                                ),
                          )
                        ],
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Noto San Thai',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: 50.0,
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Theme(
                                  data: ThemeData(
                                    checkboxTheme: CheckboxThemeData(
                                      visualDensity: VisualDensity.compact,
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                    ),
                                    unselectedWidgetColor:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  child: Checkbox(
                                    value: _model.checkboxValue1 ??= true,
                                    onChanged: (newValue) async {
                                      safeSetState(() =>
                                          _model.checkboxValue1 = newValue!);
                                    },
                                    side: (FlutterFlowTheme.of(context)
                                                .alternate !=
                                            null)
                                        ? BorderSide(
                                            width: 2,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          )
                                        : null,
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    checkColor:
                                        FlutterFlowTheme.of(context).info,
                                  ),
                                ),
                                Text(
                                  'ยินยอม',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto San Thai',
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Theme(
                                  data: ThemeData(
                                    checkboxTheme: CheckboxThemeData(
                                      visualDensity: VisualDensity.compact,
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                    ),
                                    unselectedWidgetColor:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  child: Checkbox(
                                    value: _model.checkboxValue2 ??= true,
                                    onChanged: (newValue) async {
                                      safeSetState(() =>
                                          _model.checkboxValue2 = newValue!);
                                    },
                                    side: (FlutterFlowTheme.of(context)
                                                .alternate !=
                                            null)
                                        ? BorderSide(
                                            width: 2,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          )
                                        : null,
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    checkColor:
                                        FlutterFlowTheme.of(context).info,
                                  ),
                                ),
                                Text(
                                  'ไม่ยินยอม',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto San Thai',
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
