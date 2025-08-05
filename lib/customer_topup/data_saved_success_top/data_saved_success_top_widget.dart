import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'data_saved_success_top_model.dart';
export 'data_saved_success_top_model.dart';

class DataSavedSuccessTopWidget extends StatefulWidget {
  const DataSavedSuccessTopWidget({
    super.key,
    this.fromPage,
  });

  final String? fromPage;

  @override
  State<DataSavedSuccessTopWidget> createState() =>
      _DataSavedSuccessTopWidgetState();
}

class _DataSavedSuccessTopWidgetState extends State<DataSavedSuccessTopWidget> {
  late DataSavedSuccessTopModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DataSavedSuccessTopModel());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16.0),
                bottomRight: Radius.circular(16.0),
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'ยืนคำขอเพิ่มวงเงินเรียบร้อยแล้ว',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Noto San Thai',
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Container(
                          width: 200.0,
                          height: 200.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: SvgPicture.asset(
                              'assets/images/success-icon.svg',
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'โปรดรอรับการอนุมัติจากทางศรีสวัสดิ์',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto San Thai',
                                    color: Color(0x80646464),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            Text(
                              'หากได้รับการอนุมัติและมีการโอนเงินแล้วจะส่ง',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto San Thai',
                                    color: Color(0x80646464),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 20.0),
                              child: Text(
                                'SMS ไปยังหมายเลข ${functions.maskPhone(FFAppState().customerDetailData.phoneNumber)}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Noto San Thai',
                                      color: Color(0x80646464),
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 5.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  context.goNamed(
                                    TopupStatusPageWidget.routeName,
                                    queryParameters: {
                                      'fromPage': serializeParam(
                                        'saveTopup',
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                text: 'ดูสถานะการขอเพิ่มวงเงิน',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 60.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFFDB771A),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Noto San Thai',
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                  elevation: 2.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(14.0),
                                    bottomRight: Radius.circular(14.0),
                                    topLeft: Radius.circular(14.0),
                                    topRight: Radius.circular(14.0),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 5.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (widget.fromPage == 'LH') {
                                    context.goNamed(
                                      AssignBranchPageWidget.routeName,
                                      queryParameters: {
                                        'employeeId': serializeParam(
                                          FFAppState()
                                              .saveBranchDataTemp
                                              .empCode,
                                          ParamType.String,
                                        ),
                                        'token': serializeParam(
                                          FFAppState().saveBranchDataTemp.token,
                                          ParamType.String,
                                        ),
                                        'branchCodeSearch': serializeParam(
                                          FFAppState()
                                              .saveBranchDataTemp
                                              .regionCode,
                                          ParamType.String,
                                        ),
                                        'mode': serializeParam(
                                          FFAppState().saveBranchDataTemp.level,
                                          ParamType.String,
                                        ),
                                        'fromPage': serializeParam(
                                          'หน้าส่งไปสาขา',
                                          ParamType.String,
                                        ),
                                        'level': serializeParam(
                                          FFAppState()
                                              .saveBranchDataTemp
                                              .level2,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  } else {
                                    context.goNamed(
                                      AssignGrocerystorePageWidget.routeName,
                                      queryParameters: {
                                        'employeeId': serializeParam(
                                          FFAppState()
                                              .saveBranchDataTemp
                                              .empCode,
                                          ParamType.String,
                                        ),
                                        'token': serializeParam(
                                          FFAppState().saveBranchDataTemp.token,
                                          ParamType.String,
                                        ),
                                        'branchCodeSearch': serializeParam(
                                          FFAppState()
                                              .saveBranchDataTemp
                                              .regionCode,
                                          ParamType.String,
                                        ),
                                        'mode': serializeParam(
                                          FFAppState().saveBranchDataTemp.level,
                                          ParamType.String,
                                        ),
                                        'fromPage': serializeParam(
                                          'หน้าส่งไปสาขา',
                                          ParamType.String,
                                        ),
                                        'level': serializeParam(
                                          FFAppState()
                                              .saveBranchDataTemp
                                              .level2,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  }
                                },
                                text: 'กลับสู่หน้าแรก',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 60.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFFFCEFE4),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Noto San Thai',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                  elevation: 2.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(14.0),
                                    bottomRight: Radius.circular(14.0),
                                    topLeft: Radius.circular(14.0),
                                    topRight: Radius.circular(14.0),
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
            ),
          ),
        ),
      ],
    );
  }
}
