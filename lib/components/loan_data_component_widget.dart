import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'loan_data_component_model.dart';
export 'loan_data_component_model.dart';

class LoanDataComponentWidget extends StatefulWidget {
  const LoanDataComponentWidget({super.key});

  @override
  State<LoanDataComponentWidget> createState() =>
      _LoanDataComponentWidgetState();
}

class _LoanDataComponentWidgetState extends State<LoanDataComponentWidget> {
  late LoanDataComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoanDataComponentModel());

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
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 20.0),
              child: SelectionArea(
                  child: Text(
                'สินเชื่อบ้านแลกเงิน จำนองโฉนดที่ดิน จากศรีสวัสดิ์ เงินสดทันใจ ดีอย่างไร?',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Noto San Thai',
                      fontSize: 20.0,
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
                              'assets/images/loan-motorcycle-process11_(1).png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          SelectionArea(
                              child: Text(
                            'ดอกเบี้ยเริ่มต้น 0.66% ต่อเดือน',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Noto San Thai',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
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
                            'ระยะเวลาการผ่อนสูงสุด 72 งวด',
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
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
                              'assets/images/loan-motorcycle-process05_(1).png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          SelectionArea(
                              child: Text(
                            'ไม่ต้องใช้สลิป',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Noto San Thai',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
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
                              'assets/images/loan-motorcycle-process10_(1).png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          SelectionArea(
                              child: Text(
                            'รับจัดต่างพื้นที่\nทะเบียนบ้านอยู่ไหนก็ขอสินเชื่อได้',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Noto San Thai',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
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
                      '*สินเชื่อบ้านและที่ดิน อัตราดอกเบี้ยที่แท้จริง 14.61% – 15.00% ต่อปี\n*กู้เท่าที่จำเป็นและชำระคืนไหว\n*เงื่อนไขอนุมัติสินเชื่อเป็นไปตามที่บริษัทฯ กำหนด',
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
                      'เอกสารเบื้องต้นในการสมัคร\nสินเชื่อบ้านหรือสินเชื่อที่ดินเปล่ากับศรีสวัสดิ์',
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
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: SelectionArea(
                        child: Text(
                      'เพื่อให้คุณสามารถสมัครสินเชื่อจำนองโฉนดที่ดินได้รวดเร็ว และประหยัดเวลามากที่สุด จึงควรเตรียมเอกสารที่เกี่ยวข้องกับสินเชื่อประเภทที่ต้องการให้ครบถ้วน ดังนี้',
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
                                '• ใบประเมิน',
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
                                '• ใบระวาง',
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
                                  '''## หากคุณต้องการขอสินเชื่อบ้านแลกเงินกับเรา\n\nสามารถใช้ที่ดินเปล่า หรือสิ่งปลูกสร้างอย่างบ้านเดี่ยว ทาวน์เฮาส์ ทาวน์โฮม และคอนโดมิเนียมเพื่อเป็นหลักทรัพย์ประกอบการยื่นกู้ได้เลย โดยบ้านหรือที่ดินนั้นจะต้องมีคุณสมบัติดังต่อไปนี้:\n\n- **สัญชาติไทย อายุ 20 – 65 ปี**\n- **มีบ้านหรือที่ดินเป็นของตัวเองและโอนกรรมสิทธิ์เรียบร้อยแล้ว**\n\nเมื่อคุณจำเป็นต้องใช้เงินก้อนใหญ่เพื่อมาเสริมสภาพคล่องในด้านต่าง ๆ รวมไปถึงการทำฝันให้กลายเป็นความจริง มาเปลี่ยนบ้านเป็นเงิน ด้วยสินเชื่อบ้านแลกเงินจาก **ศรีสวัสดิ์ เงินสดทันใจ** ไม่ว่าจะเป็นบ้านแบบไหน คอนโดขนาดเท่าไหร่ หรือแม้แต่ที่ดินเปล่า ก็สามารถนำมายื่นเป็นหลักประกันในการ **จำนองโฉนดที่ดิน** และนำเงินก้อนใหญ่ไปใช้จ่ายได้เลย โดยที่ยังมีที่อยู่อาศัย อุ่นใจยิ่งขึ้นด้วยบริการจากเจ้าหน้าที่มืออาชีพด้านสินเชื่อบ้านที่พร้อมดำเนินการอย่างรวดเร็วและถูกต้องแม่นยำ อยู่จังหวัดไหนก็สมัครได้ เพียงกรอกข้อมูลทางเว็บไซต์และรอเจ้าหน้าที่ตอบกลับ หรือติดต่อโดยตรงที่สาขาใกล้บ้าน\n\n### สอบถามเพิ่มเติม\n- โทร: [1652](tel:1652)\n- Line: [@srisawad](https://line.me/R/ti/p/@srisawad)\n\n---\n\n### **หมายเหตุ**\n- **สินเชื่อบ้านและที่ดิน** อัตราดอกเบี้ยที่แท้จริง **14.61% – 15.00% ต่อปี** ระยะเวลาผ่อนสูงสุด **72 งวด**\n- **กู้เท่าที่จำเป็นและชำระคืนไหว**\n- **เงื่อนไขอนุมัติสินเชื่อเป็นไปตามที่บริษัทฯ กำหนด**\n\n---''',
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
          ].addToStart(SizedBox(height: 30.0)).addToEnd(SizedBox(height: 50.0)),
        ),
      ),
    );
  }
}
