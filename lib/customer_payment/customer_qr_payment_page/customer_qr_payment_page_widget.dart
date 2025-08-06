import '/customer_topup/loan_detail_card_topup_component/loan_detail_card_topup_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/loading/loading_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'customer_qr_payment_page_model.dart';
export 'customer_qr_payment_page_model.dart';

class CustomerQrPaymentPageWidget extends StatefulWidget {
  const CustomerQrPaymentPageWidget({
    super.key,
    this.amount,
  });

  final String? amount;

  static String routeName = 'CustomerQrPaymentPage';
  static String routePath = '/CustomerQrPaymentPage';

  @override
  State<CustomerQrPaymentPageWidget> createState() =>
      _CustomerQrPaymentPageWidgetState();
}

class _CustomerQrPaymentPageWidgetState
    extends State<CustomerQrPaymentPageWidget> {
  late CustomerQrPaymentPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomerQrPaymentPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondary,
          automaticallyImplyLeading: false,
          leading: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.goNamed(
                TopupDetailDataPageWidget.routeName,
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.leftToRight,
                  ),
                },
              );
            },
            child: Icon(
              Icons.arrow_back,
              color: FlutterFlowTheme.of(context).primary,
              size: 24.0,
            ),
          ),
          actions: [],
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              'ชำระด้วย QR',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Noto San Thai',
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 18.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            centerTitle: true,
            expandedTitleScale: 1.0,
          ),
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                wrapWithModel(
                  model: _model.loanDetailCardTopupComponentModel,
                  updateCallback: () => safeSetState(() {}),
                  child: LoanDetailCardTopupComponentWidget(
                    contNo: FFAppState().getLoanListSelected.contractNo,
                    assetCode: FFAppState()
                        .getLoanListSelected
                        .contractDetails
                        .collateralInformation,
                    productTypeCode: FFAppState()
                        .getLoanListSelected
                        .contractDetails
                        .loanTypeCode,
                    assetName: valueOrDefault<String>(
                      FFAppState()
                          .getLoanListSelected
                          .contractDetails
                          .loanTypeName,
                      'loan_type_code',
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 80.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'เลขทะเบียน',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Noto San Thai',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              FFAppState()
                                  .getLoanListSelected
                                  .contractDetails
                                  .collateralInformation,
                              'collateral_information',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Noto San Thai',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'จำนวนเงินค่างวด',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Noto San Thai',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              functions.returnNumberWithComma2Decimal(
                                  widget.amount),
                              '0.0',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Noto San Thai',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Divider(
                            thickness: 2.0,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Text(
                                  '*กรุณาชำระเงินภายในวัน 00:05 ถึง 22:45 เท่านั้น\nเพื่อหลีกเลี่ยงการเสียดอกเบี้ยเพิ่มเติม',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto San Thai',
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: Container(
                                width: 200.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  'คิวอาร์โค้ด',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto San Thai',
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Container(
                              width: 250.0,
                              height: 250.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: BarcodeWidget(
                                data: functions.genQRCodePayment(
                                    FFAppState()
                                        .getLoanListSelected
                                        .barcodeDetails
                                        .suffix,
                                    FFAppState()
                                        .getLoanListSelected
                                        .barcodeDetails
                                        .ref1,
                                    FFAppState()
                                        .getLoanListSelected
                                        .barcodeDetails
                                        .ref2,
                                    widget.amount,
                                    FFAppState()
                                        .getLoanListSelected
                                        .barcodeDetails
                                        .taxId)!,
                                barcode: Barcode.qrCode(),
                                width: 200.0,
                                height: 200.0,
                                color: Colors.black,
                                backgroundColor: Colors.transparent,
                                errorBuilder: (_context, _error) => SizedBox(
                                  width: 200.0,
                                  height: 200.0,
                                ),
                                drawText: true,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Text(
                              'R1 : ${FFAppState().getLoanListSelected.barcodeDetails.ref1}',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto San Thai',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Text(
                              'R2 : ${FFAppState().getLoanListSelected.barcodeDetails.ref2}',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto San Thai',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Text(
                              'สามารถสแกนชำระค่างวด ผ่านโมบายแอปได้ทุกธนาคาร',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto San Thai',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Text(
                            'ยกเว้นธนาคาร ธ.ก.ส. และ ออมสิน',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Noto San Thai',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Text(
                            'หลังชำระสำเร็จยอดบัญชีจะถูกปรับภายใน 30 นาที',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Noto San Thai',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Builder(
                              builder: (context) => FFButtonWidget(
                                onPressed: () async {
                                  showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: GestureDetector(
                                          onTap: () {
                                            FocusScope.of(dialogContext)
                                                .unfocus();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          child: LoadingWidget(),
                                        ),
                                      );
                                    },
                                  );

                                  await actions.saveQrImage(
                                    context,
                                    functions.removeCommaFromNumText(
                                        FFAppState()
                                            .qrCodeDataTypeAppState
                                            .topupAmountWithComma),
                                    FFAppState().qrCodeDataTypeAppState.suffix,
                                    FFAppState().qrCodeDataTypeAppState.ref1,
                                    FFAppState().qrCodeDataTypeAppState.ref2,
                                    FFAppState().qrCodeDataTypeAppState.taxId,
                                    FFAppState().qrCodeDataTypeAppState.contNo,
                                    FFAppState()
                                        .qrCodeDataTypeAppState
                                        .topupAmountWithComma,
                                    FFAppState()
                                        .qrCodeDataTypeAppState
                                        .carRegistration,
                                    FFAppState()
                                        .qrCodeDataTypeAppState
                                        .currentDate,
                                  );
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        content: Text('บันทึกภาพสำเร็จ'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  Navigator.pop(context);
                                },
                                text: 'บันทึกรูปภาพ',
                                options: FFButtonOptions(
                                  width: 140.0,
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
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]
                  .addToStart(SizedBox(height: 8.0))
                  .addToEnd(SizedBox(height: 30.0)),
            ),
          ),
        ),
      ),
    );
  }
}
