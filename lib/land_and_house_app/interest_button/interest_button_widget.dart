import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/loading/loading_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'interest_button_model.dart';
export 'interest_button_model.dart';

class InterestButtonWidget extends StatefulWidget {
  const InterestButtonWidget({
    super.key,
    this.imageChanodFront,
    this.imageChanodBack,
  });

  final FFUploadedFile? imageChanodFront;
  final FFUploadedFile? imageChanodBack;

  @override
  State<InterestButtonWidget> createState() => _InterestButtonWidgetState();
}

class _InterestButtonWidgetState extends State<InterestButtonWidget> {
  late InterestButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InterestButtonModel());

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
      width: 307.0,
      height: 198.0,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Color(0x3B1D2429),
            offset: Offset(
              0.0,
              -3.0,
            ),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16.0),
          bottomRight: Radius.circular(16.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'ระบบไม่พบข้อมูลเลขโฉนด',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Noto San Thai',
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Text(
                      'กรุณาคลิกปุ่มสนใจ',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Noto San Thai',
                            color: Color(0xFF8B99A7),
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Text(
                      'เพื่อให้เจ้าหน้าที่ติดต่อกลับ',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Noto San Thai',
                            color: Color(0xFF8B99A7),
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Builder(
              builder: (context) => Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    var _shouldSetState = false;
                    showDialog(
                      context: context,
                      builder: (dialogContext) {
                        return Dialog(
                          elevation: 0,
                          insetPadding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent,
                          alignment: AlignmentDirectional(0.0, 0.0)
                              .resolve(Directionality.of(context)),
                          child: Container(
                            height: double.infinity,
                            width: double.infinity,
                            child: LoadingWidget(),
                          ),
                        );
                      },
                    );

                    _model.saveAPIOutput = await SaveRateApiCall.call(
                      chanodNo: FFAppState().chanodOutput.hasChanodNo()
                          ? FFAppState().chanodOutput.chanodNo
                          : '',
                      changwatName: FFAppState().addressOutput.provinceName,
                      amphurName: FFAppState().addressOutput.districtName,
                      landAreaRai: FFAppState().chanodOutput.hasLandAreaRai()
                          ? FFAppState().chanodOutput.landAreaRai
                          : '',
                      landAreaNgan: FFAppState().chanodOutput.hasLandAreaNgan()
                          ? FFAppState().chanodOutput.landAreaNgan
                          : '',
                      landAreaWa: FFAppState().chanodOutput.hasLandAreaWa()
                          ? FFAppState().chanodOutput.landAreaWa
                          : '',
                      utmmap: FFAppState().chanodOutput.hasUtmmap()
                          ? FFAppState().chanodOutput.utmmap
                          : '',
                      landNo: FFAppState().chanodOutput.hasLandNo()
                          ? FFAppState().chanodOutput.landNo
                          : '',
                      surveyNo: '',
                      firstName: FFAppState().customerDetailData.hasFirstName()
                          ? (FFAppState().customerDetailData.firstName.trim())
                          : '',
                      lastName: FFAppState().customerDetailData.hasLastName()
                          ? FFAppState().customerDetailData.lastName
                          : '',
                      phoneNumber:
                          FFAppState().customerDetailData.hasPhoneNumber()
                              ? FFAppState().customerDetailData.phoneNumber
                              : '',
                      birthDate: FFAppState().customerDetailData.hasDob()
                          ? '${dateTimeFormat(
                              "yyyy-MM-dd",
                              functions.parseStringDateToDateTime(
                                  FFAppState().customerDetailData.dob),
                              locale: FFLocalizations.of(context).languageCode,
                            )}'
                          : '',
                      email: FFAppState().customerDetailData.hasEmail()
                          ? FFAppState().customerDetailData.email
                          : '',
                      titleName: FFAppState().customerDetailData.hasTitle()
                          ? FFAppState().customerDetailData.title
                          : '',
                      hashId: FFAppState().customerDetailData.hasHashThaiId()
                          ? FFAppState().customerDetailData.hashThaiId
                          : '',
                      idNumber: FFAppState().customerDetailData.hasThaiId()
                          ? FFAppState().customerDetailData.thaiId
                          : '',
                      imageChanodFront: widget.imageChanodFront,
                      imageChanodBack: widget.imageChanodBack,
                      ratesDataJson: FFAppState().chanodOutput.toMap(),
                      apiUrl: FFAppState().landAndHouseAPIUrl,
                      consentDate: FFAppState().customerDetailData.consentDate,
                    );

                    _shouldSetState = true;
                    if ((_model.saveAPIOutput?.statusCode ?? 200) != 200) {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            content: Text(
                                'พบข้อผิดพลาด status code (${(_model.saveAPIOutput?.statusCode ?? 200).toString()})'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                      Navigator.pop(context);
                      if (_shouldSetState) safeSetState(() {});
                      return;
                    }
                    if ('${getJsonField(
                          (_model.saveAPIOutput?.jsonBody ?? ''),
                          r'''$.code''',
                        ).toString()}' ==
                        '200') {
                    } else {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            content: Text('พบข้อผิดพลาด  (${'${getJsonField(
                              (_model.saveAPIOutput?.jsonBody ?? ''),
                              r'''$.code''',
                            ).toString()}'})'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                      Navigator.pop(context);
                      if (_shouldSetState) safeSetState(() {});
                      return;
                    }

                    Navigator.pop(context);
                    Navigator.pop(context);

                    context.goNamed(InterestedPageWidget.routeName);

                    if (_shouldSetState) safeSetState(() {});
                  },
                  text: 'สนใจ',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 60.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFFDB771A),
                    textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                          font: GoogleFonts.plusJakartaSans(
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontStyle,
                          ),
                          color: Colors.white,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyLarge.fontStyle,
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
            ),
          ],
        ),
      ),
    );
  }
}
