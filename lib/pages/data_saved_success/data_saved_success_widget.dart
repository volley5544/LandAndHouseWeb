import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'data_saved_success_model.dart';
export 'data_saved_success_model.dart';

class DataSavedSuccessWidget extends StatefulWidget {
  const DataSavedSuccessWidget({
    super.key,
    this.fromPage,
  });

  final String? fromPage;

  @override
  State<DataSavedSuccessWidget> createState() => _DataSavedSuccessWidgetState();
}

class _DataSavedSuccessWidgetState extends State<DataSavedSuccessWidget> {
  late DataSavedSuccessModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DataSavedSuccessModel());

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
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
                bottomLeft: Radius.circular(16.0),
                bottomRight: Radius.circular(16.0),
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
                    Expanded(
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).width * 1.0,
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
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 20.0),
                              child: Text(
                                'บันทึกข้อมูลสำเร็จ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Noto San Thai',
                                      color: Colors.black,
                                      fontSize: 22.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 10.0),
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
                                  } else if (widget.fromPage == 'store') {
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
                                  } else if (widget.fromPage == 'LeadMC') {
                                    context.goNamed(
                                      AssignMCLeadPageWidget.routeName,
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
                                    Navigator.pop(context);
                                  }
                                },
                                text: () {
                                  if (widget.fromPage == 'LH') {
                                    return 'กลับหน้ารายการโฉนดที่ดิน';
                                  } else if (widget.fromPage == 'store') {
                                    return 'กลับหน้ารายการโชว์ห่วย';
                                  } else if (widget.fromPage == 'LeadMC') {
                                    return 'กลับหน้ารายการสินเชื่อรถ';
                                  } else {
                                    return '';
                                  }
                                }(),
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 40.0,
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
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                  elevation: 2.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(14.0),
                                    topRight: Radius.circular(14.0),
                                    bottomLeft: Radius.circular(14.0),
                                    bottomRight: Radius.circular(14.0),
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
