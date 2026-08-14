import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/confirm_dialog_component_widget.dart';
import '/components/error_message_component_widget.dart';
import '/customer_topup/capture_picture_component/capture_picture_component_widget.dart';
import '/customer_topup/change_date_expire_component/change_date_expire_component_widget.dart';
import '/customer_topup/loan_detail_card_topup_component/loan_detail_card_topup_component_widget.dart';
import '/customer_topup/pdf_consent_component/pdf_consent_component_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/pages/loading/loading_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'topup_conclusion_page_model.dart';
export 'topup_conclusion_page_model.dart';

class TopupConclusionPageWidget extends StatefulWidget {
  const TopupConclusionPageWidget({
    super.key,
    this.bankIcon,
  });

  final FFUploadedFile? bankIcon;

  static String routeName = 'TopupConclusionPage';
  static String routePath = '/TopupConclusionPage';

  @override
  State<TopupConclusionPageWidget> createState() =>
      _TopupConclusionPageWidgetState();
}

class _TopupConclusionPageWidgetState extends State<TopupConclusionPageWidget> {
  late TopupConclusionPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TopupConclusionPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setDarkModeSetting(context, ThemeMode.light);
      await Future.wait([
        Future(() async {
          while (true) {
            safeSetState(() {});
            await Future.delayed(
              Duration(
                milliseconds: 1000,
              ),
            );
          }
        }),
        Future(() async {
          await actions.listenWebviewEventCamera(
            context,
            (cameraBase64, actionNameOutput) async {
              var _shouldSetState = false;
              if (actionNameOutput == 'idCardCamera') {
                _model.idCardBase64 = cameraBase64;
                safeSetState(() {});
                _model.generateIdCardFile =
                    await actions.convertBase64ToFFFiles(
                  _model.idCardBase64,
                  '11',
                );
                _shouldSetState = true;
                _model.visionOutputThaiIdNewCamera =
                    await SrisawadApiGroup.visionThaiIdCall.call(
                  file: _model.generateIdCardFile,
                  apiUrl: FFDevEnvironmentValues().isProduction
                      ? FFAppState().topupUrlProd
                      : FFAppState().topupUrlDev,
                );

                _shouldSetState = true;
                if ((_model.visionOutputThaiIdNewCamera?.statusCode ?? 200) ==
                    200) {
                  _model.thaiIdPageState = getJsonField(
                    (_model.visionOutputThaiIdNewCamera?.jsonBody ?? ''),
                    r'''$.thai_id''',
                  ).toString();
                  _model.expireDatePageState = getJsonField(
                    (_model.visionOutputThaiIdNewCamera?.jsonBody ?? ''),
                    r'''$.lastest_date''',
                  ).toString();
                  safeSetState(() {});
                  if (!(('1103000101931' == '${_model.thaiIdPageState}') ||
                      ('1103701967986' == '${_model.thaiIdPageState}') ||
                      ('1331400042203' == '${_model.thaiIdPageState}') ||
                      ('3401700351967' == '${_model.thaiIdPageState}') ||
                      ('${FFAppState().customerDetailData.thaiId}' ==
                          '${_model.thaiIdPageState}'))) {
                    _model.uploadingImage = false;
                    safeSetState(() {});
                    await showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (dialogContext) {
                        return Dialog(
                          elevation: 0,
                          insetPadding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent,
                          alignment: AlignmentDirectional(0.0, 0.0)
                              .resolve(Directionality.of(context)),
                          child: GestureDetector(
                            onTap: () {
                              FocusScope.of(dialogContext).unfocus();
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            child: ErrorMessageComponentWidget(
                              textMessage:
                                  'เลขบัตรไม่ตรงกับฐานข้อมูลโปรดลองอีกครั้ง',
                            ),
                          ),
                        );
                      },
                    );

                    return;
                  }
                  if (!(functions.isCurrentDateBeforeDateInput(
                          '${_model.expireDatePageState}',
                          FFAppState()
                              .getLoanListSelected
                              .paymentDetails
                              .currentDateTime)! ||
                      ('Y' ==
                          '${getJsonField(
                            (_model.visionOutputThaiIdNewCamera?.jsonBody ??
                                ''),
                            r'''$.exception_date''',
                          ).toString()}'))) {
                    await showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (dialogContext) {
                        return Dialog(
                          elevation: 0,
                          insetPadding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent,
                          alignment: AlignmentDirectional(0.0, 0.0)
                              .resolve(Directionality.of(context)),
                          child: GestureDetector(
                            onTap: () {
                              FocusScope.of(dialogContext).unfocus();
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            child: ChangeDateExpireComponentWidget(
                              textMessage: '-',
                              thaiId: _model.thaiIdPageState,
                            ),
                          ),
                        );
                      },
                    ).then((value) => safeSetState(
                        () => _model.changeDateOutputNewCamera = value));

                    _shouldSetState = true;
                    if (!_model.changeDateOutputNewCamera!) {
                      _model.uploadingImage = false;
                      safeSetState(() {});
                      return;
                    }
                  }
                } else {
                  _model.uploadingImage = false;
                  safeSetState(() {});
                  await showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (dialogContext) {
                      return Dialog(
                        elevation: 0,
                        insetPadding: EdgeInsets.zero,
                        backgroundColor: Colors.transparent,
                        alignment: AlignmentDirectional(0.0, 0.0)
                            .resolve(Directionality.of(context)),
                        child: GestureDetector(
                          onTap: () {
                            FocusScope.of(dialogContext).unfocus();
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          child: ErrorMessageComponentWidget(
                            textMessage: 'กรุณาถ่ายภาพบัตรประชาชนใหม่อีกครั้ง',
                          ),
                        ),
                      );
                    },
                  );

                  return;
                }

                _model.idCardImageUrlCallback =
                    await actions.uploadFileFirebaseStorage(
                  'Topup${FFAppState().getLoanListSelected.contractDetails.loanTypeCode}',
                  _model.generateIdCardFile,
                  FFAppState().getLoanListSelected.contractNo,
                  FFAppState().hashThaiIdAppState,
                );
                _shouldSetState = true;
                _model.idCardFile = _model.generateIdCardFile;
                safeSetState(() {});
                _model.idCardImageUrl =
                    functions.stringToImgPath(_model.idCardImageUrlCallback)!;
                safeSetState(() {});
                _model.uploadingImage = false;
                safeSetState(() {});
              } else if (actionNameOutput == 'selfieCamera') {
                _model.selfieBase64 = cameraBase64;
                safeSetState(() {});
                _model.generateSelfieFile =
                    await actions.convertBase64ToFFFiles(
                  _model.selfieBase64,
                  '12',
                );
                _shouldSetState = true;
                _model.selfieImageUrlCallback =
                    await actions.uploadFileFirebaseStorage(
                  'Topup${FFAppState().getLoanListSelected.contractDetails.loanTypeCode}',
                  _model.generateSelfieFile,
                  FFAppState().getLoanListSelected.contractNo,
                  FFAppState().hashThaiIdAppState,
                );
                _shouldSetState = true;
                _model.selfiePlusIdCardFile = _model.generateSelfieFile;
                safeSetState(() {});
                _model.selfiePlusIdCardImageUrl =
                    functions.stringToImgPath(_model.selfieImageUrlCallback)!;
                safeSetState(() {});
                _model.uploadingImage = false;
                safeSetState(() {});
              }
            },
          );
        }),
        Future(() async {
          showDialog(
            context: context,
            builder: (dialogContext) {
              return Dialog(
                elevation: 0,
                insetPadding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                alignment: AlignmentDirectional(0.0, 0.0)
                    .resolve(Directionality.of(context)),
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(dialogContext).unfocus();
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: Container(
                    height: double.infinity,
                    child: LoadingWidget(),
                  ),
                ),
              );
            },
          );

          _model.getPdfLoanDocApiOutput =
              await SrisawadApiGroup.sendAnPdfToUserCall.call(
            bearerAuth: FFAppState().accessToken,
            contractNo: FFAppState().getTopupDataAPIResultAppstate.contractNo,
            dbName: FFAppState().getTopupDataAPIResultAppstate.dbName,
            amount: FFAppState().getTopupCalculateAppState.amount,
            from: FFAppState().getLoanListSelected.contractDetails.comcode,
            vehicleType:
                FFAppState().getLoanListSelected.contractDetails.loanTypeName,
            contractBankAccount:
                FFAppState().getLoanListSelected.contractBankAccount,
            contractBankBrandname:
                FFAppState().getLoanListSelected.contractBankBrandname,
            contractBankBranch: '',
            contractBankType: FFAppState().getLoanListSelected.contractBankType,
            hashThaiId: FFAppState().customerDetailData.hashThaiId,
            interestRate:
                FFAppState().getTopupDataAPIResultAppstate.interestRate,
            installmentNumber: FFAppState().topupInstallmentSelected.tenor,
            amountPerInstallment: FFAppState()
                .topupInstallmentSelected
                .regularPeriodAmt
                .toDouble(),
            startInstallmentDate:
                FFAppState().getTopupCalculateAppState.firstDueDate,
            installmentDate: '',
            apiUrl: FFDevEnvironmentValues().isProduction
                ? FFAppState().topupUrlProd
                : FFAppState().topupUrlDev,
          );

          if ((_model.getPdfLoanDocApiOutput?.statusCode ?? 200) != 200) {
            Navigator.pop(context);
            await showDialog(
              barrierDismissible: false,
              context: context,
              builder: (dialogContext) {
                return Dialog(
                  elevation: 0,
                  insetPadding: EdgeInsets.zero,
                  backgroundColor: Colors.transparent,
                  alignment: AlignmentDirectional(0.0, 0.0)
                      .resolve(Directionality.of(context)),
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(dialogContext).unfocus();
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: ErrorMessageComponentWidget(
                      textMessage: 'ไม่สามารถสร้างเอกสารสัญญาได้ กรุณาลองใหม่',
                    ),
                  ),
                );
              },
            );

            context.safePop();
            return;
          }
          _model.pdfDocData =
              SrisawadApiGroup.sendAnPdfToUserCall.pdfLoanDataJson(
            (_model.getPdfLoanDocApiOutput?.jsonBody ?? ''),
          );
          safeSetState(() {});
          await Future.wait([
            Future(() async {
              _model.requestPdfByteFileOutput =
                  await actions.convertBase64ToFFFiles(
                _model.pdfDocData?.request,
                '01',
              );
              _model.request = _model.requestPdfByteFileOutput;
              safeSetState(() {});
            }),
            Future(() async {
              _model.receiptPdfByteFileOutput =
                  await actions.convertBase64ToFFFiles(
                _model.pdfDocData?.receipt,
                '02',
              );
              _model.receipt = _model.receiptPdfByteFileOutput;
              safeSetState(() {});
            }),
            Future(() async {
              _model.agreementPdfByteFileOutput =
                  await actions.convertBase64ToFFFiles(
                _model.pdfDocData?.agreement,
                '03',
              );
              _model.agreement = _model.agreementPdfByteFileOutput;
              safeSetState(() {});
            }),
          ]);
          _model.idCardFile = null;
          _model.selfiePlusIdCardFile = null;
          safeSetState(() {});
          logFirebaseEvent(
            'topup_step4_verify_allinfo',
            parameters: {
              'hash_id': FFAppState().hashThaiIdAppState,
            },
          );
          Navigator.pop(context);
        }),
      ]);
    });

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

    return Builder(
      builder: (context) => Title(
          title: 'TopupConclusionPage',
          color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              appBar: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).secondary,
                automaticallyImplyLeading: false,
                leading: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.safePop();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 24.0,
                  ),
                ),
                actions: [],
                flexibleSpace: FlexibleSpaceBar(
                  title: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      currentUserLocationValue = await getCurrentUserLocation(
                          defaultLocation: LatLng(0.0, 0.0));
                      await requestPermission(locationPermission);
                      if (!(await getPermissionStatus(locationPermission))) {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              content: Text('location permission failed'),
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
                        return;
                      }
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            content: Text(currentUserLocationValue!.toString()),
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
                    },
                    child: Text(
                      'สรุปรายละเอียดของสัญญา',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Noto San Thai',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 18.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                    ),
                  ),
                  centerTitle: true,
                  expandedTitleScale: 1.0,
                ),
                elevation: 2.0,
              ),
              body: SafeArea(
                top: true,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              wrapWithModel(
                                model: _model.loanDetailCardTopupComponentModel,
                                updateCallback: () => safeSetState(() {}),
                                child: LoanDetailCardTopupComponentWidget(
                                  contNo: '${valueOrDefault<String>(
                                    FFAppState()
                                        .getTopupDataAPIResultAppstate
                                        .contractNo,
                                    'contract_no',
                                  )}',
                                  assetCode: '${valueOrDefault<String>(
                                    FFAppState()
                                        .getTopupDataAPIResultAppstate
                                        .contractDetails
                                        .collateralInformation,
                                    'collateral_information',
                                  )}',
                                  productTypeCode: '${valueOrDefault<String>(
                                    FFAppState()
                                        .getLoanListSelected
                                        .contractDetails
                                        .loanTypeCode,
                                    'loan_type_code',
                                  )}',
                                  assetName: '${valueOrDefault<String>(
                                    FFAppState()
                                        .getLoanListSelected
                                        .contractDetails
                                        .loanTypeName,
                                    'loan_type_code',
                                  )}',
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 20.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 100.0,
                                              child: VerticalDivider(
                                                width: 3.0,
                                                thickness: 3.0,
                                                color: Color(0x7FDB771A),
                                              ),
                                            ),
                                            Text(
                                              'สรุปยอดสินเชื่อใหม่',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Noto San Thai',
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ].divide(SizedBox(width: 12.0)),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                24.0, 0.0),
                                                    child: Container(
                                                      width: 100.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Text(
                                                        'ยอดจัดสินเชื่อเดิม',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto San Thai',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  '${functions.returnNumberWithComma2Decimal('${valueOrDefault<String>(
                                                    FFAppState()
                                                        .getTopupDataAPIResultAppstate
                                                        .contractDetails
                                                        .creditLimit
                                                        .toString(),
                                                    'credit_limit',
                                                  )}')} บาท',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto San Thai',
                                                        color: Colors.black,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 2.0,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ],
                                    ),
                                    if ('${valueOrDefault<String>(
                                          FFAppState()
                                              .getTopupDataAPIResultAppstate
                                              .topupExtra
                                              .toString(),
                                          'topup_extra',
                                        )}' !=
                                        '0')
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 100.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Text(
                                                          'ยอดจัดสินเชื่อพิเศษ',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto San Thai',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    '${functions.returnNumberWithComma2Decimal('${valueOrDefault<String>(
                                                      FFAppState()
                                                          .getTopupDataAPIResultAppstate
                                                          .topupExtra
                                                          .toString(),
                                                      'topup_extra',
                                                    )}')} บาท',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto San Thai',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Divider(
                                            thickness: 2.0,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                        ],
                                      ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                24.0, 0.0),
                                                    child: Container(
                                                      width: 100.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Text(
                                                        'รวมยอดวงเงินที่อนุมัติ',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto San Thai',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  '${functions.returnNumberWithComma2Decimal('${valueOrDefault<String>(
                                                    FFAppState()
                                                        .getTopupDataAPIResultAppstate
                                                        .defaultTopupAmount
                                                        .toString(),
                                                    'default_topup_amount',
                                                  )}')} บาท',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto San Thai',
                                                        color: Colors.black,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 2.0,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                24.0, 0.0),
                                                    child: Container(
                                                      width: 100.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Text(
                                                        'วงเงินที่ต้องการกู้ใหม่',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto San Thai',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  '${functions.returnNumberWithComma2Decimal('${FFAppState().getTopupCalculateAppState.amount.toString()}')} บาท',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto San Thai',
                                                        color: Colors.black,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 2.0,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                24.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            'หักยอดเงินต้นสัญญาเก่า',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto San Thai',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            'เลขที่สัญญา ${valueOrDefault<String>(
                                                              FFAppState()
                                                                  .getTopupDataAPIResultAppstate
                                                                  .contractNo,
                                                              'contract_no',
                                                            )}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto San Thai',
                                                                  color: Color(
                                                                      0x99646464),
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  '${functions.returnNumberWithComma2Decimal('${valueOrDefault<String>(
                                                    FFAppState()
                                                        .getTopupDataAPIResultAppstate
                                                        .contractDetails
                                                        .closingBalance
                                                        .toString(),
                                                    'closing_balance',
                                                  )}')} บาท',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto San Thai',
                                                        color: Colors.black,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 2.0,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                24.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            'หักอากรสแตมป์',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto San Thai',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            'เลขที่สัญญา ${valueOrDefault<String>(
                                                              FFAppState()
                                                                  .getTopupDataAPIResultAppstate
                                                                  .contractNo,
                                                              'contract_no',
                                                            )}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto San Thai',
                                                                  color: Color(
                                                                      0x99646464),
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  '${functions.returnNumberWithComma2Decimal('${valueOrDefault<String>(
                                                    FFAppState()
                                                        .getTopupDataAPIResultAppstate
                                                        .feeAmount
                                                        .toString(),
                                                    'fee_amount',
                                                  )}')} บาท',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto San Thai',
                                                        color: Colors.black,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 2.0,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                24.0, 0.0),
                                                    child: Container(
                                                      width: 100.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Text(
                                                        'จำนวนเงินที่จะได้รับ',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto San Thai',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  '${functions.returnNumberWithComma2Decimal('${(FFAppState().getTopupCalculateAppState.amount - FFAppState().getTopupDataAPIResultAppstate.contractDetails.closingBalance - FFAppState().getTopupDataAPIResultAppstate.feeAmount).toString()}')} บาท',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto San Thai',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 2.0,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 20.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 100.0,
                                              child: VerticalDivider(
                                                width: 3.0,
                                                thickness: 3.0,
                                                color: Color(0x7FDB771A),
                                              ),
                                            ),
                                            Text(
                                              'รายละเอียดคำขอสินเชื่อใหม่',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Noto San Thai',
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ].divide(SizedBox(width: 12.0)),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                24.0, 0.0),
                                                    child: Container(
                                                      width: 100.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Text(
                                                        'ยอดจัดสินเชื่อ',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto San Thai',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  '${functions.returnNumberWithComma2Decimal('${FFAppState().getTopupCalculateAppState.amount.toString()}')} บาท',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto San Thai',
                                                        color: Colors.black,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 2.0,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                24.0, 0.0),
                                                    child: Container(
                                                      width: 100.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Text(
                                                        'ค่างวด',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto San Thai',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  '${functions.returnNumberWithComma2Decimal('${FFAppState().topupInstallmentSelected.regularPeriodAmt.toString()}')} บาท',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto San Thai',
                                                        color: Colors.black,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 2.0,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                24.0, 0.0),
                                                    child: Container(
                                                      width: 100.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Text(
                                                        'จำนวนงวด',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto San Thai',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  '${FFAppState().topupInstallmentSelected.tenor.toString()} งวด',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto San Thai',
                                                        color: Colors.black,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 2.0,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                24.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            'ดอกเบี้ย (ต่อเดือน)',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto San Thai',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            'เลขที่สัญญา ${valueOrDefault<String>(
                                                              FFAppState()
                                                                  .getTopupDataAPIResultAppstate
                                                                  .contractNo,
                                                              'contract_no',
                                                            )}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto San Thai',
                                                                  color: Color(
                                                                      0x99646464),
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  '${FFAppState().getTopupCalculateAppState.interestRate.toString()}%',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto San Thai',
                                                        color: Colors.black,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 2.0,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                24.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            'ชำระทุกวันที่',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto San Thai',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  '${FFAppState().getTopupDataAPIResultAppstate.dueDay.toString()}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto San Thai',
                                                        color: Colors.black,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 2.0,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 20.0, 24.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 20.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 100.0,
                                            child: VerticalDivider(
                                              width: 3.0,
                                              thickness: 3.0,
                                              color: Color(0x7FDB771A),
                                            ),
                                          ),
                                          Text(
                                            'ข้อมูลเลขที่บัญชี',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto San Thai',
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 12.0)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'เลขที่บัญชี',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto San Thai',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 80.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  border: Border.all(
                                                    color: Color(0x4D646464),
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.memory(
                                                          widget.bankIcon
                                                                  ?.bytes ??
                                                              Uint8List
                                                                  .fromList([]),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child: Text(
                                                                      '${valueOrDefault<String>(
                                                                        functions
                                                                            .returnBankName('${FFAppState().getLoanListSelected.contractBankBrandname}'),
                                                                        'contract_bank_brandname',
                                                                      )}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto San Thai',
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child: Text(
                                                                      '${FFAppState().getLoanListSelected.contractBankAccount}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto San Thai',
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 8.0)),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 16.0)),
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 20.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 100.0,
                                                child: VerticalDivider(
                                                  width: 3.0,
                                                  thickness: 3.0,
                                                  color: Color(0x7FDB771A),
                                                ),
                                              ),
                                              Text(
                                                'ยืนยันตัวตน',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto San Thai',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ].divide(SizedBox(width: 12.0)),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 0.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Text(
                                                    'บังคับถ่ายรูปภาพบัตรประชาชน*',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto San Thai',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 0.0, 0.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    if (_model.idCardFile ==
                                                            null ||
                                                        (_model
                                                                .idCardFile
                                                                ?.bytes
                                                                ?.isEmpty ??
                                                            true)) {
                                                      return Builder(
                                                        builder: (context) =>
                                                            FFButtonWidget(
                                                          onPressed: () async {
                                                            var _shouldSetState =
                                                                false;
                                                            if (_model
                                                                .uploadingImage) {
                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                              return;
                                                            }
                                                            _model.uploadingImage =
                                                                true;
                                                            safeSetState(() {});
                                                            if (FFAppState()
                                                                .useNewCameraAction) {
                                                              await actions
                                                                  .openCameraWebview(
                                                                'idCard',
                                                                'idCardCamera',
                                                              );
                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                              return;
                                                            }
                                                            final selectedMedia =
                                                                await selectMedia(
                                                              maxWidth: 1920.00,
                                                              maxHeight:
                                                                  1920.00,
                                                              imageQuality: 50,
                                                              multiImage: false,
                                                            );
                                                            if (selectedMedia !=
                                                                    null &&
                                                                selectedMedia.every((m) =>
                                                                    validateFileFormat(
                                                                        m.storagePath,
                                                                        context))) {
                                                              safeSetState(() =>
                                                                  _model.isDataUploading_uploadIdCardAction =
                                                                      true);
                                                              var selectedUploadedFiles =
                                                                  <FFUploadedFile>[];

                                                              try {
                                                                selectedUploadedFiles =
                                                                    selectedMedia
                                                                        .map((m) =>
                                                                            FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                              originalFilename: m.originalFilename,
                                                                            ))
                                                                        .toList();
                                                              } finally {
                                                                _model.isDataUploading_uploadIdCardAction =
                                                                    false;
                                                              }
                                                              if (selectedUploadedFiles
                                                                      .length ==
                                                                  selectedMedia
                                                                      .length) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.uploadedLocalFile_uploadIdCardAction =
                                                                      selectedUploadedFiles
                                                                          .first;
                                                                });
                                                              } else {
                                                                safeSetState(
                                                                    () {});
                                                                return;
                                                              }
                                                            }

                                                            if (!((_model
                                                                        .uploadedLocalFile_uploadIdCardAction
                                                                        .bytes
                                                                        ?.isNotEmpty ??
                                                                    false))) {
                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                              return;
                                                            }
                                                            if (true) {
                                                              _model.visionOutputThaiId =
                                                                  await SrisawadApiGroup
                                                                      .visionThaiIdCall
                                                                      .call(
                                                                file: _model
                                                                    .uploadedLocalFile_uploadIdCardAction,
                                                                apiUrl: FFDevEnvironmentValues().isProduction
                                                                    ? FFAppState()
                                                                        .topupUrlProd
                                                                    : FFAppState()
                                                                        .topupUrlDev,
                                                              );

                                                              _shouldSetState =
                                                                  true;
                                                              if ((_model.visionOutputThaiId
                                                                          ?.statusCode ??
                                                                      200) ==
                                                                  200) {
                                                                _model.thaiIdPageState =
                                                                    getJsonField(
                                                                  (_model.visionOutputThaiId
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                  r'''$.thai_id''',
                                                                ).toString();
                                                                _model.expireDatePageState =
                                                                    getJsonField(
                                                                  (_model.visionOutputThaiId
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                  r'''$.lastest_date''',
                                                                ).toString();
                                                                safeSetState(
                                                                    () {});
                                                              } else {
                                                                _model.uploadingImage =
                                                                    false;
                                                                safeSetState(
                                                                    () {});
                                                                await showDialog(
                                                                  barrierDismissible:
                                                                      false,
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (dialogContext) {
                                                                    return Dialog(
                                                                      elevation:
                                                                          0,
                                                                      insetPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          FocusScope.of(dialogContext)
                                                                              .unfocus();
                                                                          FocusManager
                                                                              .instance
                                                                              .primaryFocus
                                                                              ?.unfocus();
                                                                        },
                                                                        child:
                                                                            ErrorMessageComponentWidget(
                                                                          textMessage:
                                                                              'กรุณาถ่ายภาพบัตรประชาชนใหม่อีกครั้ง',
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );

                                                                if (_shouldSetState)
                                                                  safeSetState(
                                                                      () {});
                                                                return;
                                                              }
                                                            } else {
                                                              _model.oCResultsAPI =
                                                                  await SrisawadApiGroup
                                                                      .ocrThaiIdPythonCall
                                                                      .call(
                                                                file: _model
                                                                    .uploadedLocalFile_uploadIdCardAction,
                                                                apiUrl: FFDevEnvironmentValues().isProduction
                                                                    ? FFAppState()
                                                                        .ocrUrlProd
                                                                    : FFAppState()
                                                                        .ocrUrlDev,
                                                              );

                                                              _shouldSetState =
                                                                  true;
                                                              if ((_model.oCResultsAPI
                                                                          ?.statusCode ??
                                                                      200) !=
                                                                  200) {
                                                                _model.uploadingImage =
                                                                    false;
                                                                safeSetState(
                                                                    () {});
                                                                await showDialog(
                                                                  barrierDismissible:
                                                                      false,
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (dialogContext) {
                                                                    return Dialog(
                                                                      elevation:
                                                                          0,
                                                                      insetPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          FocusScope.of(dialogContext)
                                                                              .unfocus();
                                                                          FocusManager
                                                                              .instance
                                                                              .primaryFocus
                                                                              ?.unfocus();
                                                                        },
                                                                        child:
                                                                            ErrorMessageComponentWidget(
                                                                          textMessage:
                                                                              'กรุณาถ่ายภาพบัตรประชาชนใหม่อีกครั้ง',
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );

                                                                if (_shouldSetState)
                                                                  safeSetState(
                                                                      () {});
                                                                return;
                                                              }
                                                              _model.thaiIdPageState =
                                                                  (String
                                                                      thaiId) {
                                                                return thaiId
                                                                    .replaceAll(
                                                                        " ",
                                                                        "");
                                                              }(getJsonField(
                                                                (_model.oCResultsAPI
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.cards[*].ocr_results[0].text''',
                                                              ).toString());
                                                              _model.expireDatePageState =
                                                                  getJsonField(
                                                                (_model.oCResultsAPI
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.cards[*].ocr_results[1].text''',
                                                              ).toString();
                                                              safeSetState(
                                                                  () {});
                                                            }

                                                            if (!(('1103000101931' == '${_model.thaiIdPageState}') ||
                                                                ('1103701967986' ==
                                                                    '${_model.thaiIdPageState}') ||
                                                                ('1331400042203' ==
                                                                    '${_model.thaiIdPageState}') ||
                                                                ('3401700351967' ==
                                                                    '${_model.thaiIdPageState}') ||
                                                                ('${FFAppState().customerDetailData.thaiId}' ==
                                                                    '${_model.thaiIdPageState}'))) {
                                                              _model.uploadingImage =
                                                                  false;
                                                              safeSetState(
                                                                  () {});
                                                              await showDialog(
                                                                barrierDismissible:
                                                                    false,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (dialogContext) {
                                                                  return Dialog(
                                                                    elevation:
                                                                        0,
                                                                    insetPadding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0)
                                                                        .resolve(
                                                                            Directionality.of(context)),
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        FocusScope.of(dialogContext)
                                                                            .unfocus();
                                                                        FocusManager
                                                                            .instance
                                                                            .primaryFocus
                                                                            ?.unfocus();
                                                                      },
                                                                      child:
                                                                          ErrorMessageComponentWidget(
                                                                        textMessage:
                                                                            'เลขบัตรไม่ตรงกับฐานข้อมูลโปรดลองอีกครั้ง',
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );

                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                              return;
                                                            }
                                                            if (!(functions.isCurrentDateBeforeDateInput(
                                                                    '${_model.expireDatePageState}',
                                                                    FFAppState()
                                                                        .getLoanListSelected
                                                                        .paymentDetails
                                                                        .currentDateTime)! ||
                                                                ('Y' ==
                                                                    '${getJsonField(
                                                                      (_model.visionOutputThaiId
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                      r'''$.exception_date''',
                                                                    ).toString()}'))) {
                                                              await showDialog(
                                                                barrierDismissible:
                                                                    false,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (dialogContext) {
                                                                  return Dialog(
                                                                    elevation:
                                                                        0,
                                                                    insetPadding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0)
                                                                        .resolve(
                                                                            Directionality.of(context)),
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        FocusScope.of(dialogContext)
                                                                            .unfocus();
                                                                        FocusManager
                                                                            .instance
                                                                            .primaryFocus
                                                                            ?.unfocus();
                                                                      },
                                                                      child:
                                                                          ChangeDateExpireComponentWidget(
                                                                        textMessage:
                                                                            '-',
                                                                        thaiId:
                                                                            _model.thaiIdPageState,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(() =>
                                                                      _model.changeDateOutput =
                                                                          value));

                                                              _shouldSetState =
                                                                  true;
                                                              if (!_model
                                                                  .changeDateOutput!) {
                                                                _model.uploadingImage =
                                                                    false;
                                                                safeSetState(
                                                                    () {});
                                                                if (_shouldSetState)
                                                                  safeSetState(
                                                                      () {});
                                                                return;
                                                              }
                                                            }
                                                            _model.idCardImageUrlOutput =
                                                                await actions
                                                                    .uploadFileFirebaseStorage(
                                                              FFAppState()
                                                                          .getLoanListSelected
                                                                          .contractDetails
                                                                          .loanTypeCode ==
                                                                      'M'
                                                                  ? 'TopupM'
                                                                  : 'TopupC',
                                                              _model
                                                                  .uploadedLocalFile_uploadIdCardAction,
                                                              FFAppState()
                                                                  .getLoanListSelected
                                                                  .contractNo,
                                                              FFAppState()
                                                                  .customerDetailData
                                                                  .hashThaiId,
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            _model.idCardImageUrl =
                                                                functions
                                                                    .stringToImgPath(
                                                                        _model
                                                                            .idCardImageUrlOutput)!;
                                                            safeSetState(() {});
                                                            _model.uploadingImage =
                                                                false;
                                                            safeSetState(() {});
                                                            _model.idCardFile =
                                                                _model
                                                                    .uploadedLocalFile_uploadIdCardAction;
                                                            safeSetState(() {});
                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                          },
                                                          text: 'ถ่ายรูปภาพ',
                                                          icon: Icon(
                                                            Icons
                                                                .camera_alt_outlined,
                                                            size: 24.0,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            width:
                                                                double.infinity,
                                                            height: 60.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: Color(
                                                                0xFFE8F3FB),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto San Thai',
                                                                      color: Color(
                                                                          0xFF1D71B8),
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                      );
                                                    } else {
                                                      return Container(
                                                        width: 250.0,
                                                        height: 250.0,
                                                        child: Stack(
                                                          children: [
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                await Navigator
                                                                    .push(
                                                                  context,
                                                                  PageTransition(
                                                                    type: PageTransitionType
                                                                        .fade,
                                                                    child:
                                                                        FlutterFlowExpandedImageView(
                                                                      image: Image
                                                                          .memory(
                                                                        _model.idCardFile?.bytes ??
                                                                            Uint8List.fromList([]),
                                                                        fit: BoxFit
                                                                            .contain,
                                                                        errorBuilder: (context,
                                                                                error,
                                                                                stackTrace) =>
                                                                            Image.asset(
                                                                          'assets/images/error_image.png',
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                      ),
                                                                      allowRotation:
                                                                          false,
                                                                      tag:
                                                                          'imageTag1',
                                                                      useHeroAnimation:
                                                                          true,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                              child: Hero(
                                                                tag:
                                                                    'imageTag1',
                                                                transitionOnUserGestures:
                                                                    true,
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child: Image
                                                                      .memory(
                                                                    _model.idCardFile
                                                                            ?.bytes ??
                                                                        Uint8List.fromList(
                                                                            []),
                                                                    width: double
                                                                        .infinity,
                                                                    height: double
                                                                        .infinity,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    errorBuilder: (context,
                                                                            error,
                                                                            stackTrace) =>
                                                                        Image
                                                                            .asset(
                                                                      'assets/images/error_image.png',
                                                                      width: double
                                                                          .infinity,
                                                                      height: double
                                                                          .infinity,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1.0,
                                                                      -1.0),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderRadius:
                                                                    50.0,
                                                                buttonSize:
                                                                    35.0,
                                                                fillColor: Color(
                                                                    0x98000000),
                                                                icon: Icon(
                                                                  Icons
                                                                      .close_outlined,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  size: 20.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  _model.idCardImageUrl =
                                                                      'url';
                                                                  _model.idCardFile =
                                                                      null;
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    }
                                                  },
                                                ),
                                              ),
                                            ].addToEnd(SizedBox(height: 30.0)),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Text(
                                                  'บังคับถ่ายรูปภาพตนเองคู่กับบัตรประชาชน*',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto San Thai',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 0.0, 0.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    if (_model.selfiePlusIdCardFile ==
                                                            null ||
                                                        (_model
                                                                .selfiePlusIdCardFile
                                                                ?.bytes
                                                                ?.isEmpty ??
                                                            true)) {
                                                      return FFButtonWidget(
                                                        onPressed: () async {
                                                          var _shouldSetState =
                                                              false;
                                                          if (_model
                                                              .uploadingImage) {
                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                            return;
                                                          }
                                                          _model.uploadingImage =
                                                              true;
                                                          safeSetState(() {});
                                                          if (FFAppState()
                                                              .useNewCameraAction) {
                                                            await actions
                                                                .openCameraWebview(
                                                              'idCardPlusSelfie',
                                                              'selfieCamera',
                                                            );
                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                            return;
                                                          }
                                                          final selectedMedia =
                                                              await selectMedia(
                                                            maxWidth: 1920.00,
                                                            maxHeight: 1920.00,
                                                            imageQuality: 50,
                                                            multiImage: false,
                                                          );
                                                          if (selectedMedia !=
                                                                  null &&
                                                              selectedMedia.every((m) =>
                                                                  validateFileFormat(
                                                                      m.storagePath,
                                                                      context))) {
                                                            safeSetState(() =>
                                                                _model.isDataUploading_uploadSelfieAction =
                                                                    true);
                                                            var selectedUploadedFiles =
                                                                <FFUploadedFile>[];

                                                            try {
                                                              selectedUploadedFiles =
                                                                  selectedMedia
                                                                      .map((m) =>
                                                                          FFUploadedFile(
                                                                            name:
                                                                                m.storagePath.split('/').last,
                                                                            bytes:
                                                                                m.bytes,
                                                                            height:
                                                                                m.dimensions?.height,
                                                                            width:
                                                                                m.dimensions?.width,
                                                                            blurHash:
                                                                                m.blurHash,
                                                                            originalFilename:
                                                                                m.originalFilename,
                                                                          ))
                                                                      .toList();
                                                            } finally {
                                                              _model.isDataUploading_uploadSelfieAction =
                                                                  false;
                                                            }
                                                            if (selectedUploadedFiles
                                                                    .length ==
                                                                selectedMedia
                                                                    .length) {
                                                              safeSetState(() {
                                                                _model.uploadedLocalFile_uploadSelfieAction =
                                                                    selectedUploadedFiles
                                                                        .first;
                                                              });
                                                            } else {
                                                              safeSetState(
                                                                  () {});
                                                              return;
                                                            }
                                                          }

                                                          _model.selfieImageUrlOutput =
                                                              await actions
                                                                  .uploadFileFirebaseStorage(
                                                            FFAppState()
                                                                        .getLoanListSelected
                                                                        .contractDetails
                                                                        .loanTypeCode ==
                                                                    'M'
                                                                ? 'TopupM'
                                                                : 'TopupC',
                                                            _model
                                                                .uploadedLocalFile_uploadSelfieAction,
                                                            FFAppState()
                                                                .getLoanListSelected
                                                                .contractNo,
                                                            FFAppState()
                                                                .customerDetailData
                                                                .hashThaiId,
                                                          );
                                                          _shouldSetState =
                                                              true;
                                                          _model.selfiePlusIdCardImageUrl =
                                                              functions
                                                                  .stringToImgPath(
                                                                      _model
                                                                          .selfieImageUrlOutput)!;
                                                          safeSetState(() {});
                                                          _model.uploadingImage =
                                                              false;
                                                          safeSetState(() {});
                                                          _model.selfiePlusIdCardFile =
                                                              _model
                                                                  .uploadedLocalFile_uploadSelfieAction;
                                                          safeSetState(() {});
                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                        },
                                                        text: 'ถ่ายรูปภาพ',
                                                        icon: Icon(
                                                          Icons
                                                              .camera_alt_outlined,
                                                          size: 24.0,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          width:
                                                              double.infinity,
                                                          height: 60.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color:
                                                              Color(0xFFE8F3FB),
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto San Thai',
                                                                    color: Color(
                                                                        0xFF1D71B8),
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          elevation: 0.0,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                      );
                                                    } else {
                                                      return Container(
                                                        width: 250.0,
                                                        height: 250.0,
                                                        child: Stack(
                                                          children: [
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                await Navigator
                                                                    .push(
                                                                  context,
                                                                  PageTransition(
                                                                    type: PageTransitionType
                                                                        .fade,
                                                                    child:
                                                                        FlutterFlowExpandedImageView(
                                                                      image: Image
                                                                          .memory(
                                                                        _model.selfiePlusIdCardFile?.bytes ??
                                                                            Uint8List.fromList([]),
                                                                        fit: BoxFit
                                                                            .contain,
                                                                        errorBuilder: (context,
                                                                                error,
                                                                                stackTrace) =>
                                                                            Image.asset(
                                                                          'assets/images/error_image.png',
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                      ),
                                                                      allowRotation:
                                                                          false,
                                                                      tag:
                                                                          'imageTag2',
                                                                      useHeroAnimation:
                                                                          true,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                              child: Hero(
                                                                tag:
                                                                    'imageTag2',
                                                                transitionOnUserGestures:
                                                                    true,
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child: Image
                                                                      .memory(
                                                                    _model.selfiePlusIdCardFile
                                                                            ?.bytes ??
                                                                        Uint8List.fromList(
                                                                            []),
                                                                    width: double
                                                                        .infinity,
                                                                    height: double
                                                                        .infinity,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    errorBuilder: (context,
                                                                            error,
                                                                            stackTrace) =>
                                                                        Image
                                                                            .asset(
                                                                      'assets/images/error_image.png',
                                                                      width: double
                                                                          .infinity,
                                                                      height: double
                                                                          .infinity,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1.0,
                                                                      -1.0),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderRadius:
                                                                    50.0,
                                                                buttonSize:
                                                                    35.0,
                                                                fillColor: Color(
                                                                    0x98000000),
                                                                icon: Icon(
                                                                  Icons
                                                                      .close_outlined,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  size: 20.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  _model.selfiePlusIdCardImageUrl =
                                                                      'url';
                                                                  _model.selfiePlusIdCardFile =
                                                                      null;
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    }
                                                  },
                                                ),
                                              ),
                                            ].addToEnd(SizedBox(height: 30.0)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 24.0, 24.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 20.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 100.0,
                                            child: VerticalDivider(
                                              width: 3.0,
                                              thickness: 3.0,
                                              color: Color(0x7FDB771A),
                                            ),
                                          ),
                                          Text(
                                            'เอกสารประกอบสัญญา',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto San Thai',
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 12.0)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  PdfViewerPageWidget.routeName,
                                                  queryParameters: {
                                                    'pdfFileByte':
                                                        serializeParam(
                                                      _model.request,
                                                      ParamType.FFUploadedFile,
                                                    ),
                                                    'title': serializeParam(
                                                      'ใบคำขอสินเชื่อใหม่',
                                                      ParamType.String,
                                                    ),
                                                    'index': serializeParam(
                                                      0,
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    '__transition_info__':
                                                        TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .rightToLeft,
                                                    ),
                                                  },
                                                );
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  border: Border.all(
                                                    color: Color(0x4D646464),
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: 40.0,
                                                        height: 40.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                            child: SvgPicture
                                                                .asset(
                                                              'assets/images/document-icon.svg',
                                                              width: 30.0,
                                                              height: 30.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child: Text(
                                                                      'ใบคำขอสินเชื่อใหม่',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto San Thai',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          if (FFAppState()
                                                                  .pdfDocListConsent
                                                                  .elementAtOrNull(
                                                                      0) ??
                                                              true)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .check_circle,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 20.0,
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'ยอมรับแล้ว',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto San Thai',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          Icon(
                                                            Icons
                                                                .navigate_next_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                        ],
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 16.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  PdfViewerPageWidget.routeName,
                                                  queryParameters: {
                                                    'pdfFileByte':
                                                        serializeParam(
                                                      _model.receipt,
                                                      ParamType.FFUploadedFile,
                                                    ),
                                                    'title': serializeParam(
                                                      'ใบรับเงิน',
                                                      ParamType.String,
                                                    ),
                                                    'index': serializeParam(
                                                      1,
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    '__transition_info__':
                                                        TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .rightToLeft,
                                                    ),
                                                  },
                                                );
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  border: Border.all(
                                                    color: Color(0x4D646464),
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: 40.0,
                                                        height: 40.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                            child: SvgPicture
                                                                .asset(
                                                              'assets/images/document-icon.svg',
                                                              width: 30.0,
                                                              height: 30.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child: Text(
                                                                      'ใบรับเงิน',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto San Thai',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          if (FFAppState()
                                                                  .pdfDocListConsent
                                                                  .elementAtOrNull(
                                                                      1) ??
                                                              true)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .check_circle,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 20.0,
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'ยอมรับแล้ว',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto San Thai',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          Icon(
                                                            Icons
                                                                .navigate_next_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                        ],
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 16.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  PdfViewerPageWidget.routeName,
                                                  queryParameters: {
                                                    'pdfFileByte':
                                                        serializeParam(
                                                      _model.agreement,
                                                      ParamType.FFUploadedFile,
                                                    ),
                                                    'title': serializeParam(
                                                      'เอกสารสัญญา',
                                                      ParamType.String,
                                                    ),
                                                    'index': serializeParam(
                                                      2,
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    '__transition_info__':
                                                        TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .rightToLeft,
                                                    ),
                                                  },
                                                );
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  border: Border.all(
                                                    color: Color(0x4D646464),
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: 40.0,
                                                        height: 40.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                            child: SvgPicture
                                                                .asset(
                                                              'assets/images/document-icon.svg',
                                                              width: 30.0,
                                                              height: 30.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child: Text(
                                                                      'เอกสารสัญญา',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto San Thai',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          if (FFAppState()
                                                                  .pdfDocListConsent
                                                                  .elementAtOrNull(
                                                                      2) ??
                                                              true)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .check_circle,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 20.0,
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'ยอมรับแล้ว',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto San Thai',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          Icon(
                                                            Icons
                                                                .navigate_next_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                        ],
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 16.0)),
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
                              Container(
                                width: double.infinity,
                                height: 70.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'ข้อมูลวันที่ ${functions.formatToThaiDate(FFAppState().getTopupDataAPIResultAppstate.dataDate)} เวลา 00.00 น.',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Noto San Thai',
                                            color: Color(0x97646464),
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ].addToStart(SizedBox(height: 8.0)),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 90.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Divider(
                            thickness: 2.0,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Builder(
                                    builder: (context) => FFButtonWidget(
                                      onPressed: ((_model.idCardFile == null ||
                                                  (_model.idCardFile?.bytes
                                                          ?.isEmpty ??
                                                      true)) ||
                                              (_model.selfiePlusIdCardFile ==
                                                      null ||
                                                  (_model.selfiePlusIdCardFile
                                                          ?.bytes?.isEmpty ??
                                                      true)) ||
                                              !FFAppState()
                                                  .pdfDocListConsent
                                                  .elementAtOrNull(0)! ||
                                              !FFAppState()
                                                  .pdfDocListConsent
                                                  .elementAtOrNull(1)! ||
                                              !FFAppState()
                                                  .pdfDocListConsent
                                                  .elementAtOrNull(2)!)
                                          ? null
                                          : () async {
                                              currentUserLocationValue =
                                                  await getCurrentUserLocation(
                                                      defaultLocation:
                                                          LatLng(0.0, 0.0));
                                              var _shouldSetState = false;
                                              _model.isSecondTime = false;
                                              safeSetState(() {});
                                              if (!(_model.idCardFile != null &&
                                                  (_model.idCardFile?.bytes
                                                          ?.isNotEmpty ??
                                                      false))) {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  isDismissible: false,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(context)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child: Container(
                                                          height:
                                                              double.infinity,
                                                          child:
                                                              CapturePictureComponentWidget(
                                                            imageType: 'idCard',
                                                            title:
                                                                'ถ่ายรูปภาพบัตรประชาชน',
                                                            descriptionText:
                                                                'กรุณาถ่ายรูปโดยให้บัตรประชาชนพอดีกับกรอบ',
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) => safeSetState(
                                                    () => _model
                                                            .cameraTriggerComponentReturn =
                                                        value));

                                                _shouldSetState = true;
                                                if (!(_model.cameraTriggerComponentReturn !=
                                                        null &&
                                                    (_model
                                                            .cameraTriggerComponentReturn
                                                            ?.bytes
                                                            ?.isNotEmpty ??
                                                        false))) {
                                                  await showDialog(
                                                    barrierDismissible: false,
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        alignment:
                                                            AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            FocusScope.of(
                                                                    dialogContext)
                                                                .unfocus();
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child:
                                                              ErrorMessageComponentWidget(
                                                            textMessage:
                                                                'กรุณาถ่ายรูปบัตรประชาชน',
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );

                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                                _model.visionThaiIdOutputButton =
                                                    await SrisawadApiGroup
                                                        .visionThaiIdCall
                                                        .call(
                                                  file: _model
                                                      .cameraTriggerComponentReturn,
                                                  apiUrl:
                                                      FFDevEnvironmentValues()
                                                              .isProduction
                                                          ? FFAppState()
                                                              .topupUrlProd
                                                          : FFAppState()
                                                              .topupUrlDev,
                                                );

                                                _shouldSetState = true;
                                                if ((_model.visionThaiIdOutputButton
                                                            ?.statusCode ??
                                                        200) ==
                                                    200) {
                                                } else {
                                                  await showDialog(
                                                    barrierDismissible: false,
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        alignment:
                                                            AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            FocusScope.of(
                                                                    dialogContext)
                                                                .unfocus();
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child:
                                                              ErrorMessageComponentWidget(
                                                            textMessage:
                                                                'กรุณาถ่ายภาพบัตรประชาชนใหม่อีกครั้ง',
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );

                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }

                                                if (!(('1103000101931' ==
                                                        getJsonField(
                                                          (_model.visionThaiIdOutputButton
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.thai_id''',
                                                        ).toString()) ||
                                                    ('1103701967986' ==
                                                        getJsonField(
                                                          (_model.visionThaiIdOutputButton
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.thai_id''',
                                                        ).toString()) ||
                                                    ('1331400042203' ==
                                                        getJsonField(
                                                          (_model.visionThaiIdOutputButton
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.thai_id''',
                                                        ).toString()) ||
                                                    ('3401700351967' ==
                                                        getJsonField(
                                                          (_model.visionThaiIdOutputButton
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.thai_id''',
                                                        ).toString()) ||
                                                    ('${FFAppState().customerDetailData.thaiId}' ==
                                                        getJsonField(
                                                          (_model.visionThaiIdOutputButton
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.thai_id''',
                                                        ).toString()))) {
                                                  await showDialog(
                                                    barrierDismissible: false,
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        alignment:
                                                            AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            FocusScope.of(
                                                                    dialogContext)
                                                                .unfocus();
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child:
                                                              ErrorMessageComponentWidget(
                                                            textMessage:
                                                                'เลขบัตรไม่ตรงกับฐานข้อมูลโปรดลองอีกครั้ง',
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );

                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                                if (!(functions
                                                        .isCurrentDateBeforeDateInput(
                                                            getJsonField(
                                                              (_model.visionThaiIdOutputButton
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.lastest_date''',
                                                            ).toString(),
                                                            FFAppState()
                                                                .getLoanListSelected
                                                                .paymentDetails
                                                                .currentDateTime)! ||
                                                    ('Y' ==
                                                        getJsonField(
                                                          (_model.visionThaiIdOutputButton
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.exception_date''',
                                                        ).toString()))) {
                                                  await showDialog(
                                                    barrierDismissible: false,
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        alignment:
                                                            AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            FocusScope.of(
                                                                    dialogContext)
                                                                .unfocus();
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child:
                                                              ChangeDateExpireComponentWidget(
                                                            textMessage: '-',
                                                            thaiId:
                                                                getJsonField(
                                                              (_model.visionThaiIdOutputButton
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.thai_id''',
                                                            ).toString(),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() => _model
                                                              .changeDateOutputButton =
                                                          value));

                                                  _shouldSetState = true;
                                                  if (!_model
                                                      .changeDateOutputButton!) {
                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                    return;
                                                  }
                                                  _model.uploadingImage = true;
                                                  safeSetState(() {});
                                                }
                                                _model.idCardFile = _model
                                                    .cameraTriggerComponentReturn;
                                                safeSetState(() {});
                                                _model.isSecondTime = false;
                                                safeSetState(() {});
                                              }
                                              if (!(_model.selfiePlusIdCardFile !=
                                                      null &&
                                                  (_model.selfiePlusIdCardFile
                                                          ?.bytes?.isNotEmpty ??
                                                      false))) {
                                                if (_model.isSecondTime) {
                                                  await Future.delayed(
                                                    Duration(
                                                      milliseconds: 1000,
                                                    ),
                                                  );
                                                }
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  isDismissible: false,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(context)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child: Container(
                                                          height:
                                                              double.infinity,
                                                          child:
                                                              CapturePictureComponentWidget(
                                                            imageType:
                                                                'idCardPlusSelfie',
                                                            title:
                                                                'ถ่ายรูปภาพตนเองคู่กับบัตรประชาชน',
                                                            descriptionText:
                                                                'กรุณาถ่ายรูปโดยให้ใบหน้าและบัตรประชาชนพอดีกับกรอบ',
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) => safeSetState(
                                                    () => _model
                                                            .cameraTriggerComponentReturn2 =
                                                        value));

                                                _shouldSetState = true;
                                                if (!(_model.cameraTriggerComponentReturn2 !=
                                                        null &&
                                                    (_model
                                                            .cameraTriggerComponentReturn2
                                                            ?.bytes
                                                            ?.isNotEmpty ??
                                                        false))) {
                                                  await showDialog(
                                                    barrierDismissible: false,
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        alignment:
                                                            AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            FocusScope.of(
                                                                    dialogContext)
                                                                .unfocus();
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child:
                                                              ErrorMessageComponentWidget(
                                                            textMessage:
                                                                'กรุณาถ่ายรูปตนเองคู่กับบัตรประชาชน',
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );

                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                                _model.selfiePlusIdCardFile = _model
                                                    .cameraTriggerComponentReturn2;
                                                safeSetState(() {});
                                              }
                                              if (!(_model.idCardFile != null &&
                                                  (_model.idCardFile?.bytes
                                                          ?.isNotEmpty ??
                                                      false))) {
                                                await showDialog(
                                                  barrierDismissible: false,
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(
                                                                  dialogContext)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child:
                                                            ErrorMessageComponentWidget(
                                                          textMessage:
                                                              'กรุณาถ่ายรูปบัตรประชาชน',
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );

                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                                return;
                                              }
                                              if (!(_model.selfiePlusIdCardFile !=
                                                      null &&
                                                  (_model.selfiePlusIdCardFile
                                                          ?.bytes?.isNotEmpty ??
                                                      false))) {
                                                await showDialog(
                                                  barrierDismissible: false,
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(
                                                                  dialogContext)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child:
                                                            ErrorMessageComponentWidget(
                                                          textMessage:
                                                              'กรุณาถ่ายรูปตนเองคู่กับบัตรประชาชน',
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );

                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                                return;
                                              }
                                              if (!FFAppState()
                                                  .pdfDocListConsent
                                                  .elementAtOrNull(0)!) {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  isDismissible: false,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(context)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child: Container(
                                                          height:
                                                              double.infinity,
                                                          child:
                                                              PdfConsentComponentWidget(
                                                            title:
                                                                'ใบคำขอสินเชื่อใหม่',
                                                            pdfFileByte:
                                                                _model.request!,
                                                            index: 0,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));

                                                if (!FFAppState()
                                                    .pdfDocListConsent
                                                    .elementAtOrNull(0)!) {
                                                  await showDialog(
                                                    barrierDismissible: false,
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        alignment:
                                                            AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            FocusScope.of(
                                                                    dialogContext)
                                                                .unfocus();
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child:
                                                              ErrorMessageComponentWidget(
                                                            textMessage:
                                                                'กรุณาให้ความยินยอมใบคำขอสินเชื่อใหม่',
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );

                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                              }
                                              if (!FFAppState()
                                                  .pdfDocListConsent
                                                  .elementAtOrNull(1)!) {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  isDismissible: false,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(context)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child: Container(
                                                          height:
                                                              double.infinity,
                                                          child:
                                                              PdfConsentComponentWidget(
                                                            title: 'ใบรับเงิน',
                                                            pdfFileByte:
                                                                _model.receipt!,
                                                            index: 1,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));

                                                if (!FFAppState()
                                                    .pdfDocListConsent
                                                    .elementAtOrNull(1)!) {
                                                  await showDialog(
                                                    barrierDismissible: false,
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        alignment:
                                                            AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            FocusScope.of(
                                                                    dialogContext)
                                                                .unfocus();
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child:
                                                              ErrorMessageComponentWidget(
                                                            textMessage:
                                                                'กรุณาให้ความยินยอมใบรับเงิน',
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );

                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                              }
                                              if (!FFAppState()
                                                  .pdfDocListConsent
                                                  .elementAtOrNull(2)!) {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  isDismissible: false,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(context)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child: Container(
                                                          height:
                                                              double.infinity,
                                                          child:
                                                              PdfConsentComponentWidget(
                                                            title:
                                                                'เอกสารสัญญา',
                                                            pdfFileByte: _model
                                                                .agreement!,
                                                            index: 2,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));

                                                if (!FFAppState()
                                                    .pdfDocListConsent
                                                    .elementAtOrNull(2)!) {
                                                  await showDialog(
                                                    barrierDismissible: false,
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        alignment:
                                                            AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            FocusScope.of(
                                                                    dialogContext)
                                                                .unfocus();
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child:
                                                              ErrorMessageComponentWidget(
                                                            textMessage:
                                                                'กรุณาให้ความยินยอมเอกสารสัญญา',
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );

                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                              }
                                              await showDialog(
                                                barrierDismissible: false,
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(
                                                                dialogContext)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child:
                                                          ConfirmDialogComponentWidget(
                                                        textMessage:
                                                            'ผู้กู้ตกลงให้คำรับรองแก่ผู้ให้กู้ว่าคำรับรองดังต่อไปนี้ถูกต้องและตรงตามความเป็นจริงระยะเวลาที่ผู้กู้มีหนี้สินเชื่อคงค้าง อยู่กับผู้ให้กู้ตามสัญญาฉบับนี้ ข้อมูล ข้อเท็จจริง คำรับรอง และ/หรือเอกสารใดๆ ที่ให้กับผู้ให้กู้ในการสมัครสินเชื่อตามสัญญาฉบับนี้และการทำสัญญาฉบับนี้ และ/หรือเอกสารใดๆ อันเกี่ยวกับสินเชื่อตามสัญญาฉบับนี้ ถูกต้องและตรงตามความเป็นจริงทุกประการ เงินกู้ที่กู้ยืมเงินตามสัญญาฉบับนี้จะนำไปใช้เพื่อวัตถุประสงค์ใช้จ่ายในครัวเรือน และหมุนเวียนในการประกอบธุรกิจ รวมถึงใช้ในความจำเป็นอื่นๆ และผู้กู้เป็นผู้ได้รับประโยชน์ของสินเชื่อตามสัญญาฉบับนี้เองแต่เพียงผู้เดียว และผู้กู้มีอำนาจทุกประการแต่เพียงผู้เดียวสำหรับการกู้ยืมเงินตามสัญญาฉบับนี้',
                                                        titleMessage:
                                                            'ยืนยันข้อมูลเอกสาร',
                                                        cancelButtonText:
                                                            'ยกเลิก',
                                                        confirmButtonText:
                                                            'ยืนยัน',
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) => safeSetState(
                                                  () =>
                                                      _model.saveTopupConfirm =
                                                          value));

                                              _shouldSetState = true;
                                              if (!((_model.saveTopupConfirm !=
                                                      null) &&
                                                  _model.saveTopupConfirm!)) {
                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                                return;
                                              }
                                              _model.idCardImageBase64 =
                                                  await actions
                                                      .encodeBase64FromFFFile(
                                                _model.idCardFile,
                                              );
                                              _shouldSetState = true;
                                              _model.selfieImageBase64 =
                                                  await actions
                                                      .encodeBase64FromFFFile(
                                                _model.selfiePlusIdCardFile,
                                              );
                                              _shouldSetState = true;
                                              FFAppState()
                                                  .updateSaveTopupDataStruct(
                                                (e) => e
                                                  ..customerImage2 =
                                                      _model.idCardImageBase64
                                                  ..customerImage3 =
                                                      _model.selfieImageBase64,
                                              );
                                              safeSetState(() {});
                                              showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(
                                                                dialogContext)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: LoadingWidget(),
                                                    ),
                                                  );
                                                },
                                              );

                                              _model.updateSavePdfDataStruct(
                                                (e) => e
                                                  ..contractNo = FFAppState()
                                                      .getTopupDataAPIResultAppstate
                                                      .contractNo
                                                  ..dbName = FFAppState()
                                                      .getTopupDataAPIResultAppstate
                                                      .dbName
                                                  ..contractDate = FFAppState()
                                                      .getTopupDataAPIResultAppstate
                                                      .contractDate
                                                  ..amount = (FFAppState()
                                                              .getTopupCalculateAppState
                                                              .amount -
                                                          FFAppState()
                                                              .getTopupDataAPIResultAppstate
                                                              .contractDetails
                                                              .closingBalance -
                                                          FFAppState()
                                                              .getTopupDataAPIResultAppstate
                                                              .feeAmount)
                                                      .toDouble()
                                                  ..from = FFAppState()
                                                      .getLoanListSelected
                                                      .contractDetails
                                                      .comcode
                                                  ..contractBankAccount =
                                                      FFAppState()
                                                          .getLoanListSelected
                                                          .contractBankAccount
                                                  ..contractBankBrandname =
                                                      FFAppState()
                                                          .getLoanListSelected
                                                          .contractBankBrandname
                                                  ..contractBankType =
                                                      FFAppState()
                                                          .getLoanListSelected
                                                          .contractBankType
                                                  ..contractBankBranch = ''
                                                  ..interestRate = FFAppState()
                                                      .getTopupCalculateAppState
                                                      .interestRate
                                                  ..installmentNumber =
                                                      FFAppState()
                                                          .topupInstallmentSelected
                                                          .tenor
                                                          .toDouble()
                                                  ..amountPerInstallment =
                                                      FFAppState()
                                                          .topupInstallmentSelected
                                                          .regularPeriodAmt
                                                          .toDouble()
                                                  ..startInstallmentDate =
                                                      FFAppState()
                                                          .getTopupCalculateAppState
                                                          .firstDueDate
                                                  ..installmentDate = ''
                                                  ..vehicleType = FFAppState()
                                                      .getLoanListSelected
                                                      .contractDetails
                                                      .loanTypeName,
                                              );
                                              safeSetState(() {});
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text('last period'),
                                                    content: Text(FFAppState()
                                                        .topupInstallmentSelected
                                                        .lastPeriodAmt
                                                        .toString()),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        'last period promo'),
                                                    content: Text(FFAppState()
                                                        .topupInstallmentSelected
                                                        .lastPeriodPromo
                                                        .toString()),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                              if (!false) {
                                                Navigator.pop(context);
                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                                return;
                                              }
                                              _model.saveTopupOutput =
                                                  await SrisawadApiGroup
                                                      .saveNewTopupCall
                                                      .call(
                                                bearerAuth:
                                                    FFAppState().accessToken,
                                                lifeInsureAmt: FFAppState()
                                                    .getTopupDataAPIResultAppstate
                                                    .lifeInsureAmt,
                                                transno: '',
                                                dbName: FFAppState()
                                                    .getTopupDataAPIResultAppstate
                                                    .dbName,
                                                hashThaiId: FFDevEnvironmentValues()
                                                        .isProduction
                                                    ? FFAppState()
                                                        .hashThaiIdAppState
                                                    : '128854d638b67b69b01bc66f7e61de0aecde76706d0e9e4261c704197a0ccf01',
                                                contractNo: FFAppState()
                                                    .getTopupDataAPIResultAppstate
                                                    .contractNo,
                                                marketingConsent: 'Y',
                                                sensitiveConsent: 'Y',
                                                latitude: functions
                                                    .getLatLngStringFromDevice(
                                                        currentUserLocationValue,
                                                        'lat'),
                                                longitude: functions
                                                    .getLatLngStringFromDevice(
                                                        currentUserLocationValue,
                                                        'lng'),
                                                loanAmount: FFAppState()
                                                    .getTopupCalculateAppState
                                                    .amount
                                                    .toDouble(),
                                                topupFee: FFAppState()
                                                    .getTopupCalculateAppState
                                                    .topupFeeAmount
                                                    .toDouble(),
                                                feeAmount: FFAppState()
                                                    .getTopupCalculateAppState
                                                    .feeAmount
                                                    .toDouble(),
                                                transferAmount: (FFAppState()
                                                            .getTopupCalculateAppState
                                                            .amount -
                                                        FFAppState()
                                                            .getTopupDataAPIResultAppstate
                                                            .contractDetails
                                                            .closingBalance -
                                                        FFAppState()
                                                            .getTopupDataAPIResultAppstate
                                                            .feeAmount)
                                                    .toDouble(),
                                                interestRate: FFAppState()
                                                    .getTopupCalculateAppState
                                                    .interestRate,
                                                interestAmount: FFAppState()
                                                    .topupInstallmentSelected
                                                    .intAmt,
                                                totalAmount: FFAppState()
                                                    .topupInstallmentSelected
                                                    .totalAmt,
                                                creditLimit: FFAppState()
                                                    .getTopupDataAPIResultAppstate
                                                    .contractDetails
                                                    .creditLimit,
                                                termPeriod: FFAppState()
                                                    .topupInstallmentSelected
                                                    .tenor
                                                    .toDouble(),
                                                regularPeriod: FFAppState()
                                                    .topupInstallmentSelected
                                                    .regularPeriodAmt
                                                    .toDouble(),
                                                lastPeriod: FFAppState()
                                                    .topupInstallmentSelected
                                                    .lastPeriodAmt,
                                                lastPeriodPromo: FFAppState()
                                                    .topupInstallmentSelected
                                                    .lastPeriodPromo,
                                                actImage: _model.boolTemp
                                                    ? 'data:image/jpeg;base64,${FFAppState().saveTopupData.actImage}'
                                                    : '',
                                                propertyImage: _model.boolTemp
                                                    ? 'data:image/jpeg;base64,${FFAppState().saveTopupData.propertyImage}'
                                                    : '',
                                                topupRequestFile: _model
                                                        .boolTemp
                                                    ? _model.pdfDocData?.request
                                                    : '',
                                                topupArgeementFile:
                                                    _model.boolTemp
                                                        ? _model.pdfDocData
                                                            ?.agreement
                                                        : '',
                                                topupReceiptFile: _model
                                                        .boolTemp
                                                    ? _model.pdfDocData?.receipt
                                                    : '',
                                                savePdfJson:
                                                    _model.savePdfData?.toMap(),
                                                customerImage2: _model.boolTemp
                                                    ? 'data:image/jpeg;base64,${FFAppState().saveTopupData.customerImage2}'
                                                    : '',
                                                customerImage3: _model.boolTemp
                                                    ? 'data:image/jpeg;base64,${FFAppState().saveTopupData.customerImage3}'
                                                    : '',
                                                carImageFront: _model.boolTemp
                                                    ? 'data:image/jpeg;base64,${FFAppState().saveTopupData.carImageFront}'
                                                    : '',
                                                carImageBack: _model.boolTemp
                                                    ? 'data:image/jpeg;base64,${FFAppState().saveTopupData.carImageBack}'
                                                    : '',
                                                carImageLeft: _model.boolTemp
                                                    ? 'data:image/jpeg;base64,${FFAppState().saveTopupData.carImageLeft}'
                                                    : '',
                                                carImageRight: _model.boolTemp
                                                    ? 'data:image/jpeg;base64,${FFAppState().saveTopupData.carImageRight}'
                                                    : '',
                                                carImageMile: _model.boolTemp
                                                    ? 'data:image/jpeg;base64,${FFAppState().saveTopupData.carImageMile}'
                                                    : '',
                                                source: FFAppState()
                                                    .saveTopupData
                                                    .source,
                                                referId: FFAppState()
                                                    .saveTopupData
                                                    .referId,
                                                apiUrl: FFDevEnvironmentValues()
                                                        .isProduction
                                                    ? FFAppState().topupUrlProd
                                                    : FFAppState().topupUrlDev,
                                                productCode: FFAppState()
                                                            .saveTopupData
                                                            .products ==
                                                        ProductsStruct()
                                                    ? ''
                                                    : FFAppState()
                                                        .saveTopupData
                                                        .products
                                                        .productCode,
                                              );

                                              _shouldSetState = true;
                                              if ((_model.saveTopupOutput
                                                          ?.statusCode ??
                                                      200) !=
                                                  200) {
                                                await showDialog(
                                                  barrierDismissible: false,
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(
                                                                  dialogContext)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child:
                                                            ErrorMessageComponentWidget(
                                                          textMessage:
                                                              'พบข้อผิดพลาด status (${(_model.saveTopupOutput?.statusCode ?? 200).toString()})',
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );

                                                Navigator.pop(context);
                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                                return;
                                              }
                                              if ('N' !=
                                                  getJsonField(
                                                    (_model.saveTopupOutput
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.head.error_flag''',
                                                  ).toString()) {
                                                await showDialog(
                                                  barrierDismissible: false,
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(
                                                                  dialogContext)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child:
                                                            ErrorMessageComponentWidget(
                                                          textMessage:
                                                              getJsonField(
                                                            (_model.saveTopupOutput
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$.head.error_desc''',
                                                          ).toString(),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );

                                                Navigator.pop(context);
                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                                return;
                                              }
                                              FFAppState()
                                                  .updateGetLoanListSelectedStruct(
                                                (e) => e
                                                  ..transno = getJsonField(
                                                    (_model.saveTopupOutput
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.body.trans_no''',
                                                  ).toString()
                                                  ..requestDate = FFAppState()
                                                      .getLoanListSelected
                                                      .paymentDetails
                                                      .currentDateTime,
                                              );
                                              safeSetState(() {});
                                              Navigator.pop(context);

                                              context.goNamed(
                                                SaveTopupSuccessWidget
                                                    .routeName,
                                                extra: <String, dynamic>{
                                                  '__transition_info__':
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType
                                                            .bottomToTop,
                                                  ),
                                                },
                                              );

                                              if (_shouldSetState)
                                                safeSetState(() {});
                                            },
                                      text: 'ยืนยัน',
                                      options: FFButtonOptions(
                                        height: 60.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Noto San Thai',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        disabledColor: Color(0x7FDB771A),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 12.0)),
                            ),
                          ),
                        ].divide(SizedBox(height: 8.0)),
                      ),
                    ),
                  ].addToEnd(SizedBox(height: 30.0)),
                ),
              ),
            ),
          )),
    );
  }
}
