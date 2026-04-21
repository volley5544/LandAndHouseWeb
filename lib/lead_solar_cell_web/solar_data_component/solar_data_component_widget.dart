import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:styled_divider/styled_divider.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'solar_data_component_model.dart';
export 'solar_data_component_model.dart';

class SolarDataComponentWidget extends StatefulWidget {
  const SolarDataComponentWidget({super.key});

  @override
  State<SolarDataComponentWidget> createState() =>
      _SolarDataComponentWidgetState();
}

class _SolarDataComponentWidgetState extends State<SolarDataComponentWidget> {
  late SolarDataComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SolarDataComponentModel());

    _model.expandableExpandableController =
        ExpandableController(initialExpanded: false)
          ..addListener(() => safeSetState(() {}));
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
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 20.0),
                child: SelectionArea(
                    child: Text(
                  'สินเชื่อโซลาร์รูฟท็อป \n(solar rooftop)',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Noto San Thai',
                        color: FlutterFlowTheme.of(context).backgroundColor,
                        fontSize: 24.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                )),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  color: Color(0x00000000),
                  child: ExpandableNotifier(
                    controller: _model.expandableExpandableController,
                    child: ExpandablePanel(
                      header: RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  'ไม่ว่าจะเป็นบ้านพักอาศัย อาคารพาณิชย์ หรือธุรกิจขนาดเล็ก ก็สามารถเข้าถึงโซลาร์ได้ง่ายขึ้น ด้วย สินเชื่อโซลาร์รูฟท็อป จากศรีสวัสดิ์ เงินสดทันใจ  ช่วยให้คุณติดตั้ง Solar Rooftop ได้ทันที โดยไม่ต้องจ่ายเงินก้อนใหญ่ ผ่อนสบาย วางแผนค่าใช้จ่ายได้ง่าย พร้อมช่วยลดค่าไฟ คุมต้นทุน และเพิ่มความคุ้มค่าให้กับบ้านหรือธุรกิจของคุณ  ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto San Thai',
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w900,
                                  ),
                            ),
                            TextSpan(
                              text: _model
                                      .expandableExpandableController.expanded
                                  ? ''
                                  : 'อ่านต่อ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto San Thai',
                                    color: FlutterFlowTheme.of(context)
                                        .backgroundColor,
                                    fontSize: 22.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w900,
                                    decoration: TextDecoration.underline,
                                  ),
                              mouseCursor: SystemMouseCursors.click,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  _model.expandableExpandableController
                                      .toggle();
                                },
                            )
                          ],
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Noto San Thai',
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w900,
                                  ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      collapsed: Container(),
                      expanded: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 10.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.8,
                              decoration: BoxDecoration(),
                              child: RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          '       •    ให้วงเงินสูงจัดเต็ม ครอบคลุมค่าติดตั้ง\n       •    อนุมัติไว รู้ผลเร็ว\n       •    เลือกผ่อนสบายได้นานสูงสุด 84 งวด',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Noto San Thai',
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w900,
                                          ),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto San Thai',
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w900,
                                      ),
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 10.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.8,
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'สินเชื่อนี้เหมาะกับใคร',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Noto San Thai',
                                          color: FlutterFlowTheme.of(context)
                                              .backgroundColor,
                                          fontSize: 24.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w900,
                                        ),
                                  ),
                                  Text(
                                    'สินเชื่อนี้เหมาะสำหรับผู้ที่ต้องการติดตั้งโซลาร์ แต่ไม่อยากแบกรับค่าใช้จ่ายก้อนใหญ่ในครั้งเดียว เช่น',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Noto San Thai',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w900,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 10.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.8,
                              decoration: BoxDecoration(),
                              child: RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          '       •    เจ้าของธุรกิจ SME ที่ต้องการลดต้นทุนค่าไฟ\n       •    ร้านค้า / โรงงานที่ใช้ไฟสูงในช่วงกลางวัน\n       •    เจ้าของบ้านที่ต้องการประหยัดค่าไฟระยะยาว\n       •    ผู้ที่ต้องการลงทุนพลังงานสะอาด เพิ่มมูลค่าอสังหาฯ\n',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Noto San Thai',
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w900,
                                          ),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto San Thai',
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w900,
                                      ),
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.expandableExpandableController.toggle();
                            },
                            child: Text(
                              'ย่อลง',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto San Thai',
                                    color: FlutterFlowTheme.of(context)
                                        .backgroundColor,
                                    fontSize: 22.0,
                                    letterSpacing: 0.0,
                                    decoration: TextDecoration.underline,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      theme: ExpandableThemeData(
                        tapHeaderToExpand:
                            !_model.expandableExpandableController.expanded,
                        tapBodyToExpand: false,
                        tapBodyToCollapse:
                            _model.expandableExpandableController.expanded,
                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                        hasIcon: false,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 20.0),
                child: SelectionArea(
                    child: Text(
                  'ทำไมต้องสินเชื่อโซลาร์ที่ศรีสวัสดิ์ เงินสดทันใจ?',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Noto San Thai',
                        color: FlutterFlowTheme.of(context).backgroundColor,
                        fontSize: 24.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w900,
                      ),
                )),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(),
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Wrap(
                    spacing: 20.0,
                    runSpacing: 0.0,
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.center,
                    verticalDirection: VerticalDirection.down,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: () {
                          if (MediaQuery.sizeOf(context).width <
                              kBreakpointSmall) {
                            return 130.0;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointMedium) {
                            return 130.0;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointLarge) {
                            return 130.0;
                          } else {
                            return 360.0;
                          }
                        }(),
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/loan-motorcycle-process08.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            SelectionArea(
                                child: Text(
                              'ครอบคลุมค่าติดตั้ง',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto San Thai',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: () {
                                      if (MediaQuery.sizeOf(context).width <
                                          kBreakpointSmall) {
                                        return 12.0;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointMedium) {
                                        return 12.0;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointLarge) {
                                        return 12.0;
                                      } else {
                                        return 18.0;
                                      }
                                    }(),
                                    letterSpacing: 0.0,
                                  ),
                            )),
                            SelectionArea(
                                child: Text(
                              'วงเงินสูงสุด',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto San Thai',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: () {
                                      if (MediaQuery.sizeOf(context).width <
                                          kBreakpointSmall) {
                                        return 12.0;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointMedium) {
                                        return 12.0;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointLarge) {
                                        return 12.0;
                                      } else {
                                        return 18.0;
                                      }
                                    }(),
                                    letterSpacing: 0.0,
                                  ),
                            )),
                          ],
                        ),
                      ),
                      Container(
                        width: () {
                          if (MediaQuery.sizeOf(context).width <
                              kBreakpointSmall) {
                            return 130.0;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointMedium) {
                            return 130.0;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointLarge) {
                            return 130.0;
                          } else {
                            return 360.0;
                          }
                        }(),
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/loan-motorcycle-process11_(1).png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            SelectionArea(
                                child: Text(
                              'ดอกเบี้ยต่ำ',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto San Thai',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: () {
                                      if (MediaQuery.sizeOf(context).width <
                                          kBreakpointSmall) {
                                        return 14.0;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointMedium) {
                                        return 14.0;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointLarge) {
                                        return 14.0;
                                      } else {
                                        return 18.0;
                                      }
                                    }(),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            )),
                            SelectionArea(
                                child: Text(
                              'ระยะเวลาการผ่อนสูงสุด 84 งวด',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto San Thai',
                                    fontSize: () {
                                      if (MediaQuery.sizeOf(context).width <
                                          kBreakpointSmall) {
                                        return 12.0;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointMedium) {
                                        return 12.0;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointLarge) {
                                        return 12.0;
                                      } else {
                                        return 16.0;
                                      }
                                    }(),
                                    letterSpacing: 0.0,
                                  ),
                            )),
                          ],
                        ),
                      ),
                      Container(
                        width: () {
                          if (MediaQuery.sizeOf(context).width <
                              kBreakpointSmall) {
                            return 130.0;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointMedium) {
                            return 130.0;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointLarge) {
                            return 130.0;
                          } else {
                            return 360.0;
                          }
                        }(),
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/loan-motorcycle-process03.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            SelectionArea(
                                child: Text(
                              'ไม่ต้องใช้คนค้ำประกัน',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto San Thai',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: () {
                                      if (MediaQuery.sizeOf(context).width <
                                          kBreakpointSmall) {
                                        return 12.0;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointMedium) {
                                        return 12.0;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointLarge) {
                                        return 12.0;
                                      } else {
                                        return 18.0;
                                      }
                                    }(),
                                    letterSpacing: 0.0,
                                  ),
                            )),
                          ],
                        ),
                      ),
                      Container(
                        width: () {
                          if (MediaQuery.sizeOf(context).width <
                              kBreakpointSmall) {
                            return 130.0;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointMedium) {
                            return 130.0;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointLarge) {
                            return 130.0;
                          } else {
                            return 360.0;
                          }
                        }(),
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/loan-motorcycle-process07_(1).png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            SelectionArea(
                                child: Text(
                              'สาขา พร้อมให้บริการกว่า\n6000 สาขา ทั่วประเทศ',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto San Thai',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: () {
                                      if (MediaQuery.sizeOf(context).width <
                                          kBreakpointSmall) {
                                        return 12.0;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointMedium) {
                                        return 12.0;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointLarge) {
                                        return 12.0;
                                      } else {
                                        return 18.0;
                                      }
                                    }(),
                                    letterSpacing: 0.0,
                                  ),
                            )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    valueOrDefault<double>(
                      MediaQuery.sizeOf(context).width * 0.15,
                      0.0,
                    ),
                    0.0,
                    valueOrDefault<double>(
                      MediaQuery.sizeOf(context).width * 0.15,
                      0.0,
                    ),
                    0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                      child: SelectionArea(
                          child: Text(
                        '*กู้เท่าที่จำเป็นและชำระคืนไหว\n*สินเชื่อโซลาร์รูฟท็อป อัตราดอกเบี้ยที่แท้จริง 10% ต่อปี ระยะเวลาผ่อนสูงสุด 84 งวด\n*เงื่อนไขอนุมัติสินเชื่อเป็นไปตามที่บริษัทฯ กำหนด',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Noto San Thai',
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                            ),
                      )),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                      child: SelectionArea(
                          child: Text(
                        'ศรีสวัสดิ์ เป็นสินเชื่อบ้านแลกเงิน แต่ให้วงเงินสูงกว่า เพียงขอสินเชื่อบ้านกับเรา อนุมัติเร็ว เพื่อให้ตรงตามความสามารถ รายได้ และวัตถุประสงค์ในการขอกู้เงิน เรารับจำนองโฉนดที่ดิน โดยคุณสามารถยื่นสมัครจากต่างพื้นที่ได้ ไม่จำเป็นต้องมีทะเบียนบ้านอยู่ในจังหวัดเดียวกับสาขาที่ใช้บริการ',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Noto San Thai',
                              color: Color(0x8D000000),
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w100,
                            ),
                      )),
                    ),
                  ],
                ),
              ),
              StyledDivider(
                thickness: 2.0,
                color: Colors.black,
                lineStyle: DividerLineStyle.dotted,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    valueOrDefault<double>(
                      MediaQuery.sizeOf(context).width * 0.05,
                      0.0,
                    ),
                    0.0,
                    valueOrDefault<double>(
                      MediaQuery.sizeOf(context).width * 0.05,
                      0.0,
                    ),
                    0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: SelectionArea(
                          child: Text(
                        'เอกสารเบื้องต้นในการสมัคร\nสินเชื่อโซลาร์รูฟท็อป กับศรีสวีสดิ์',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Noto San Thai',
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      )),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 20.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(),
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              valueOrDefault<double>(
                                MediaQuery.sizeOf(context).width * 0.05,
                                0.0,
                              ),
                              0.0,
                              valueOrDefault<double>(
                                MediaQuery.sizeOf(context).width * 0.05,
                                0.0,
                              ),
                              0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SelectionArea(
                                  child: Text(
                                'เอกสารอื่นๆ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Noto San Thai',
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w900,
                                    ),
                              )),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: SelectionArea(
                                    child: Text(
                                  '• บัตรประชาชน',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto San Thai',
                                        color: Color(0x8D000000),
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                )),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: SelectionArea(
                                    child: Text(
                                  '• ทะเบียนบ้าน',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto San Thai',
                                        color: Color(0x8D000000),
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                )),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: SelectionArea(
                                    child: Text(
                                  '• โฉนดที่ดิน / ใบประเมิน',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto San Thai',
                                        color: Color(0x8D000000),
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                )),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: SelectionArea(
                                    child: Text(
                                  '• ใบเสนอราคาโซลาร์เซล',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto San Thai',
                                        color: Color(0x8D000000),
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                )),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: SelectionArea(
                                    child: Text(
                                  '• เอกสารแสดงรายได้ 6 เดือน',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto San Thai',
                                        color: Color(0x8D000000),
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              valueOrDefault<double>(
                                MediaQuery.sizeOf(context).width * 0.05,
                                0.0,
                              ),
                              0.0,
                              valueOrDefault<double>(
                                MediaQuery.sizeOf(context).width * 0.05,
                                0.0,
                              ),
                              0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              MarkdownBody(
                                data:
                                    '''## คุณสมบัติผู้กู้\n\n### • สัญชาติไทย อายุ 20 - 65 ปี\n### • เพื่อซื้อและติดตั้งโซลาร์รูฟท็อป\n### • มีบ้านหรือที่ดินเป็นของตัวเองและโอนกรรมสิทธิ์เรียบร้อยแล้ว\n\n### สอบถามเพิ่มเติม\n- โทร: [1652](tel:1652)\n- Line: [@srisawad](https://line.me/R/ti/p/@srisawad)\n\n---\n\n## *กู้เท่าที่จำเป็นและชำระคืนไหว\n## *สินเชื่อโซลาร์รูฟท็อป อัตราดอกเบี้ยที่แท้จริง 10% ต่อปี ระยะเวลาผ่อนสูงสุด 84 งวด\n## *เงื่อนไขอนุมัติสินเชื่อเป็นไปตามที่บริษัทฯ กำหนด\n\n\n\n---''',
                                selectable: true,
                                onTapLink: (_, url, __) => launchURL(url!),
                              ),
                            ]
                                .addToStart(SizedBox(height: 30.0))
                                .addToEnd(SizedBox(height: 50.0)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]
                .addToStart(SizedBox(height: 30.0))
                .addToEnd(SizedBox(height: 50.0)),
          ),
        ),
      ),
    );
  }
}
