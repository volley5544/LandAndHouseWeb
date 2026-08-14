import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/error_message_component_widget.dart';
import '/customer_topup/empty_component_topup/empty_component_topup_widget.dart';
import '/customer_topup/navigate_topup_component/navigate_topup_component_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/loading/loading_widget.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'topup_card_page_model.dart';
export 'topup_card_page_model.dart';

class TopupCardPageWidget extends StatefulWidget {
  const TopupCardPageWidget({
    super.key,
    this.token,
    this.hashThaiId,
    this.source,
    this.referId,
    this.contNo,
    String? topupType,
    this.productCode,
  }) : this.topupType = topupType ?? 'normal';

  final String? token;
  final String? hashThaiId;
  final String? source;
  final String? referId;
  final String? contNo;
  final String topupType;
  final String? productCode;

  static String routeName = 'topupCardPage';
  static String routePath = '/topupCardPage';

  @override
  State<TopupCardPageWidget> createState() => _TopupCardPageWidgetState();
}

class _TopupCardPageWidgetState extends State<TopupCardPageWidget> {
  late TopupCardPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TopupCardPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
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
              if (actionNameOutput == 'VideoRecord') {
                _model.videoPath = cameraBase64;
                safeSetState(() {});
                await showDialog(
                  context: context,
                  builder: (alertDialogContext) {
                    return AlertDialog(
                      content: Text(_model.videoPath),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(alertDialogContext),
                          child: Text('Ok'),
                        ),
                      ],
                    );
                  },
                );
                _model.fileVideoOutput =
                    await actions.getFFUploadFileFromFilePath(
                  _model.videoPath,
                  '123456789',
                );
                await showDialog(
                  context: context,
                  builder: (alertDialogContext) {
                    return AlertDialog(
                      content: Text('after gen file'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(alertDialogContext),
                          child: Text('Ok'),
                        ),
                      ],
                    );
                  },
                );
                await Future.delayed(
                  Duration(
                    milliseconds: 500,
                  ),
                );
                _model.resultText = await actions.saveVideoFile(
                  _model.fileVideoOutput,
                  '123456789',
                );
                await showDialog(
                  context: context,
                  builder: (alertDialogContext) {
                    return AlertDialog(
                      content: Text('${_model.resultText}'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(alertDialogContext),
                          child: Text('Ok'),
                        ),
                      ],
                    );
                  },
                );
              }
            },
          );
          showDialog(
            context: context,
            builder: (dialogContext) {
              return Dialog(
                elevation: 0,
                insetPadding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                alignment: AlignmentDirectional(1.0, 1.0)
                    .resolve(Directionality.of(context)),
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(dialogContext).unfocus();
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: LoadingWidget(),
                ),
              );
            },
          );

          setDarkModeSetting(context, ThemeMode.light);
          _model.isLoadFirestoreCompleted = false;
          safeSetState(() {});
          FFAppState().getLoanListAPIResultAppState = [];
          safeSetState(() {});
          unawaited(
            () async {}(),
          );
          _model.configOutput = await ApplicationRecord.getDocumentOnce(
              FFAppState().configDocument!);
          _model.isLoadFirestoreCompleted = true;
          safeSetState(() {});
          FFAppState().hashThaiIdAppState = widget.hashThaiId!;
          FFAppState().accessToken = widget.token!;
          FFAppState().topupUrlDev =
              '${_model.configOutput?.apiUrl.apiUrlDev}';
          FFAppState().topupUrlProd =
              '${_model.configOutput?.apiUrl.apiUrlProd}';
          FFAppState().LeadUrlDev =
              '${_model.configOutput?.apiUrl.apiUrlLeadDev}';
          FFAppState().LeadUrlProd =
              '${_model.configOutput?.apiUrl.apiUrlLeadProd}';
          FFAppState().ocrUrlDev = '${_model.configOutput?.apiUrl.ocrUrlDev}';
          FFAppState().ocrUrlProd =
              '${_model.configOutput?.apiUrl.ocrUrlProd}';
          FFAppState().useNewCameraAction =
              _model.configOutput!.useNewCameraAction;
          safeSetState(() {});
          FFAppState().saveTopupData = SaveTopupDataModelStruct(
            lifeInsureAmt: '',
            transno: '',
            dbName: '',
            hashThaiId: widget.hashThaiId,
            contractNo: '',
            marketingConsent: '',
            sensitiveConsent: '',
            latitude: '',
            longitude: '',
            loanAmount: 0,
            topupFee: 0,
            feeAmount: 0,
            transferAmount: 0,
            interestRate: 0,
            interestAmount: 0,
            totalAmount: 0,
            creditLimit: 0,
            termPeriod: 0,
            regularPeriod: 0,
            lastPeriod: 0,
            lastPeriodPromo: 0,
            actImage: '',
            propertyImage: '',
            topupRequestFile: '',
            topupArgeementFile: '',
            topupReceiptFile: '',
            savePdf: SavePdfDataModelStruct(
              contractNo: '',
              dbName: '',
              contractDate: '',
              amount: 0.0,
              from: '',
              contractBankAccount: '',
              contractBankBrandname: '',
              contractBankType: '',
              contractBankBranch: '',
              interestRate: 0.0,
              installmentNumber: 0.0,
              amountPerInstallment: 0.0,
              startInstallmentDate: '',
              installmentDate: '',
              vehicleType: '',
            ),
            customerImage2: '',
            customerImage3: '',
            carImageFront: '',
            carImageBack: '',
            carImageLeft: '',
            carImageRight: '',
            carImageMile: '',
            source: '${widget.source}',
            referId: '${widget.referId}',
          );
          safeSetState(() {});
          FFAppState().userAddressData = UserAllAddressDataModelStruct(
            currentAddress: UserAddressDataModelStruct(
              addressDetails: '',
              addressSubDistrict: '',
              addressDistrict: '',
              addressProvince: '',
              addressPostalCode: '',
            ),
            registrationAddress: UserAddressDataModelStruct(
              addressDetails: '',
              addressSubDistrict: '',
              addressDistrict: '',
              addressProvince: '',
              addressPostalCode: '',
            ),
            idCardAddress: UserAddressDataModelStruct(
              addressDetails: '',
              addressSubDistrict: '',
              addressDistrict: '',
              addressProvince: '',
              addressPostalCode: '',
            ),
            otherAddress: UserAddressDataModelStruct(
              addressDetails: '',
              addressSubDistrict: '',
              addressDistrict: '',
              addressProvince: '',
              addressPostalCode: '',
            ),
            dataDate: '',
          );
          safeSetState(() {});
          _model.userDetailOutput = await UserDetailCall.call(
            hashId: FFAppState().hashThaiIdAppState,
            url: FFDevEnvironmentValues().isProduction
                ? FFAppState().topupUrlProd
                : FFAppState().topupUrlDev,
          );

          if ((_model.userDetailOutput?.statusCode ?? 200) == 200) {
          } else {
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
                          'พบข้อผิดพลาด statuscode (${(_model.userDetailOutput?.statusCode ?? 200).toString()})',
                    ),
                  ),
                );
              },
            );

            Navigator.pop(context);
            return;
          }

          if (UserDetailCall.statuscode(
                (_model.userDetailOutput?.jsonBody ?? ''),
              ) !=
              '200') {
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
                      textMessage: '${UserDetailCall.message(
                        (_model.userDetailOutput?.jsonBody ?? ''),
                      )}',
                    ),
                  ),
                );
              },
            );

            Navigator.pop(context);
            return;
          }
          FFAppState().customerDetailData = UserDetailCall.results(
            (_model.userDetailOutput?.jsonBody ?? ''),
          )!;
          safeSetState(() {});
          FFAppState().updateCustomerDetailDataStruct(
            (e) => e..hashThaiId = FFAppState().hashThaiIdAppState,
          );
          safeSetState(() {});
          logFirebaseEvent(
            'topup_list_page',
            parameters: {
              'hash_id': FFAppState().hashThaiIdAppState,
              'source': FFAppState().saveTopupData.source,
              'refer_id': FFAppState().saveTopupData.referId,
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
      builder: (context) => FutureBuilder<ApplicationRecord>(
        future: ApplicationRecord.getDocumentOnce(FFAppState().configDocument!),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Scaffold(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
              ),
            );
          }

          final topupCardPageApplicationRecord = snapshot.data!;

          return Title(
              title: 'topupCardPage',
              color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Scaffold(
                  key: scaffoldKey,
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                  appBar: AppBar(
                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                    iconTheme: IconThemeData(
                        color: FlutterFlowTheme.of(context).primary),
                    automaticallyImplyLeading: false,
                    leading: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await actions.navigateBackWebviewAction();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 24.0,
                      ),
                    ),
                    actions: [],
                    flexibleSpace: FlexibleSpaceBar(
                      title: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await actions.openCameraWebview(
                                'video',
                                'VideoRecord',
                              );
                            },
                            child: Text(
                              'เติมวงเงิน',
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Noto San Thai',
                                    color: Color(0xFF003063),
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          if (!FFDevEnvironmentValues().isProduction)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  4.0, 0.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  safeSetState(() {});
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        content: Text(_model.videoPath),
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
                                },
                                child: Text(
                                  '(UAT v.${FFAppState().webUatVersion.toString()})',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Noto San Thai',
                                        color: Color(0xFF003063),
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      centerTitle: true,
                      expandedTitleScale: 1.0,
                    ),
                    elevation: 2.0,
                  ),
                  body: SafeArea(
                    top: true,
                    child: Visibility(
                      visible: _model.isLoadFirestoreCompleted,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).bg03,
                                      borderRadius: BorderRadius.circular(16.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .border03,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 8.0, 12.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${topupCardPageApplicationRecord.topupTextTitle}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto San Thai',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: Builder(
                                              builder: (context) {
                                                final listText =
                                                    topupCardPageApplicationRecord
                                                        .topupTextList
                                                        .toList();

                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: List.generate(
                                                      listText.length,
                                                      (listTextIndex) {
                                                    final listTextItem =
                                                        listText[listTextIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  2.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        '${listTextItem}',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Noto San Thai',
                                                              color:
                                                                  Colors.black,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    );
                                                  }),
                                                );
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: Builder(
                                              builder: (context) {
                                                final warnningTextList =
                                                    topupCardPageApplicationRecord
                                                        .topupWarnningTextList
                                                        .toList();

                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: List.generate(
                                                      warnningTextList.length,
                                                      (warnningTextListIndex) {
                                                    final warnningTextListItem =
                                                        warnningTextList[
                                                            warnningTextListIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  2.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text:
                                                                  '${warnningTextListItem}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto San Thai',
                                                                    color: functions.containString(
                                                                            '***',
                                                                            warnningTextListItem)!
                                                                        ? Color(
                                                                            0xFFA32D2D)
                                                                        : Color(
                                                                            0xFF003063),
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            TextSpan(
                                                              text: functions
                                                                      .containString(
                                                                          '*',
                                                                          warnningTextListItem)!
                                                                  ? ' ${topupCardPageApplicationRecord.topupTextTime}'
                                                                  : '',
                                                              style: TextStyle(
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                              ),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto San Thai',
                                                                color: functions
                                                                        .containString(
                                                                            '***',
                                                                            warnningTextListItem)!
                                                                    ? Color(
                                                                        0xFFA32D2D)
                                                                    : Color(
                                                                        0xFF003063),
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                                );
                                              },
                                            ),
                                          ),
                                        ]
                                            .addToStart(SizedBox(height: 8.0))
                                            .addToEnd(SizedBox(height: 12.0)),
                                      ),
                                    ),
                                  ),
                                ),
                                if (false)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {},
                                            child: Text(
                                              'กรุณาเลือกสัญญาที่ต้องการเติมวงเงินเวลาทำการ',
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Noto San Thai',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                FutureBuilder<ApiCallResponse>(
                                  future: (_model.apiRequestCompleter ??=
                                          Completer<ApiCallResponse>()
                                            ..complete(SrisawadApiGroup
                                                .getListOfLoanCall
                                                .call(
                                              hashThaiId: widget.hashThaiId,
                                              authorization:
                                                  FFAppState().accessToken,
                                              apiUrl:
                                                  FFDevEnvironmentValues()
                                                          .isProduction
                                                      ? topupCardPageApplicationRecord
                                                          .apiUrl.apiUrlProd
                                                      : topupCardPageApplicationRecord
                                                          .apiUrl.apiUrlDev,
                                            )))
                                      .future,
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    final columnGetListOfLoanResponse =
                                        snapshot.data!;

                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (false)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 12.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child:
                                                        FlutterFlowChoiceChips(
                                                      options: [
                                                        ChipData(
                                                            'สัญญาที่เพิ่มวงเงินได้'),
                                                        ChipData(
                                                            'สัญญาที่ยังไม่เข้าเงื่อนไข')
                                                      ],
                                                      onChanged: (val) =>
                                                          safeSetState(() => _model
                                                                  .choiceChipsValue =
                                                              val?.firstOrNull),
                                                      selectedChipStyle:
                                                          ChipStyle(
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto San Thai',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  lineHeight:
                                                                      2.3,
                                                                ),
                                                        iconColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        iconSize: 16.0,
                                                        elevation: 0.0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                      unselectedChipStyle:
                                                          ChipStyle(
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto San Thai',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  lineHeight:
                                                                      2.5,
                                                                ),
                                                        iconColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        iconSize: 16.0,
                                                        elevation: 0.0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                      chipSpacing: 8.0,
                                                      rowSpacing: 8.0,
                                                      multiselect: false,
                                                      initialized: _model
                                                              .choiceChipsValue !=
                                                          null,
                                                      alignment:
                                                          WrapAlignment.start,
                                                      controller: _model
                                                              .choiceChipsValueController ??=
                                                          FormFieldController<
                                                              List<String>>(
                                                        [
                                                          SrisawadApiGroup
                                                                      .getListOfLoanCall
                                                                      .results(
                                                                        columnGetListOfLoanResponse
                                                                            .jsonBody,
                                                                      )!
                                                                      .where((e) =>
                                                                          (e.topupDetail.canTopup !=
                                                                              'N') &&
                                                                          (e.contractDetails.accountStatus ==
                                                                              'A'))
                                                                      .toList()
                                                                      .length >
                                                                  0
                                                              ? 'สัญญาที่เพิ่มวงเงินได้'
                                                              : 'สัญญาที่ยังไม่เข้าเงื่อนไข'
                                                        ],
                                                      ),
                                                      wrapped: false,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 50.0,
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'เลือกสัญญาสินเชื่อ',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto San Thai',
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w900,
                                                          ),
                                                    ),
                                                    if (SrisawadApiGroup
                                                            .getListOfLoanCall
                                                            .results(
                                                              columnGetListOfLoanResponse
                                                                  .jsonBody,
                                                            )!
                                                            .where((e) =>
                                                                e.contractDetails
                                                                    .accountStatus ==
                                                                'A')
                                                            .toList()
                                                            .length >
                                                        0)
                                                      Container(
                                                        height: 26.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .bg04,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      30.0),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            child: Text(
                                                              '${(_model.carouselCurrentIndex + 1).toString()}/${SrisawadApiGroup.getListOfLoanCall.results(
                                                                    columnGetListOfLoanResponse
                                                                        .jsonBody,
                                                                  )?.where((e) => e.contractDetails.accountStatus == 'A').toList().length.toString()}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto San Thai',
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w900,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                  ].divide(
                                                      SizedBox(width: 8.0)),
                                                ),
                                                if (SrisawadApiGroup
                                                        .getListOfLoanCall
                                                        .results(
                                                          columnGetListOfLoanResponse
                                                              .jsonBody,
                                                        )!
                                                        .where((e) =>
                                                            e.contractDetails
                                                                .accountStatus ==
                                                            'A')
                                                        .toList()
                                                        .length >
                                                    0)
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Builder(
                                                        builder: (context) {
                                                          if (_model
                                                                  .carouselCurrentIndex !=
                                                              0) {
                                                            return InkWell(
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
                                                                await _model
                                                                    .carouselController
                                                                    ?.previousPage(
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          300),
                                                                  curve: Curves
                                                                      .ease,
                                                                );
                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              child: Container(
                                                                width: 40.0,
                                                                height: 40.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .cardHeader,
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Icon(
                                                                  Icons
                                                                      .chevron_left_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                            );
                                                          } else {
                                                            return Container(
                                                              width: 40.0,
                                                              height: 40.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                shape: BoxShape
                                                                    .circle,
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  width: 2.0,
                                                                ),
                                                              ),
                                                              child: Icon(
                                                                Icons
                                                                    .chevron_left_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                size: 24.0,
                                                              ),
                                                            );
                                                          }
                                                        },
                                                      ),
                                                      Builder(
                                                        builder: (context) {
                                                          if (_model
                                                                  .carouselCurrentIndex !=
                                                              (SrisawadApiGroup
                                                                      .getListOfLoanCall
                                                                      .results(
                                                                        columnGetListOfLoanResponse
                                                                            .jsonBody,
                                                                      )!
                                                                      .where((e) =>
                                                                          e.contractDetails
                                                                              .accountStatus ==
                                                                          'A')
                                                                      .toList()
                                                                      .length -
                                                                  1)) {
                                                            return InkWell(
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
                                                                await _model
                                                                    .carouselController
                                                                    ?.nextPage(
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          300),
                                                                  curve: Curves
                                                                      .ease,
                                                                );
                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              child: Container(
                                                                width: 40.0,
                                                                height: 40.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .cardHeader,
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Icon(
                                                                  Icons
                                                                      .navigate_next_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                            );
                                                          } else {
                                                            return Container(
                                                              width: 40.0,
                                                              height: 40.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                shape: BoxShape
                                                                    .circle,
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  width: 2.0,
                                                                ),
                                                              ),
                                                              child: Icon(
                                                                Icons
                                                                    .navigate_next_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                size: 24.0,
                                                              ),
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 4.0)),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        if (SrisawadApiGroup.getListOfLoanCall
                                                .results(
                                                  columnGetListOfLoanResponse
                                                      .jsonBody,
                                                )!
                                                .where((e) =>
                                                    e.contractDetails
                                                        .accountStatus ==
                                                    'A')
                                                .toList()
                                                .length >
                                            0)
                                          Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: 26.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .keyboard_double_arrow_left,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .text03,
                                                          size: 16.0,
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .pan_tool_alt_outlined,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .text03,
                                                          size: 16.0,
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            'ปัดซ้าย-ขวา เพื่อดูสัญญาอื่น',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto San Thai',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .text03,
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
                                                        Icon(
                                                          Icons
                                                              .keyboard_double_arrow_right,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .text03,
                                                          size: 16.0,
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        if (true)
                                          wrapWithModel(
                                            model: _model
                                                .navigateTopupComponentModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            updateOnChange: true,
                                            child: NavigateTopupComponentWidget(
                                              contNo: '${widget.contNo}',
                                              navigateTopupDetailAction:
                                                  () async {
                                                if ('${widget.topupType}' ==
                                                    'normal') {
                                                  FFAppState().getLoanListSelected = SrisawadApiGroup
                                                      .getListOfLoanCall
                                                      .results(
                                                        columnGetListOfLoanResponse
                                                            .jsonBody,
                                                      )!
                                                      .where((e) =>
                                                          e.contractDetails
                                                              .accountStatus ==
                                                          'A')
                                                      .toList()
                                                      .elementAtOrNull(functions
                                                          .findIndexInList(
                                                              SrisawadApiGroup
                                                                  .getListOfLoanCall
                                                                  .results(
                                                                    columnGetListOfLoanResponse
                                                                        .jsonBody,
                                                                  )
                                                                  ?.map((e) => e
                                                                      .contractNo)
                                                                  .toList()
                                                                  .toList(),
                                                              '${widget.contNo}')!)!;
                                                  safeSetState(() {});
                                                  FFAppState()
                                                      .updateGetLoanListSelectedStruct(
                                                    (e) => e
                                                      ..topupSpecialFlag =
                                                          false,
                                                  );
                                                  safeSetState(() {});
                                                  FFAppState()
                                                      .updateSaveTopupDataStruct(
                                                    (e) => e
                                                      ..products = FFAppState()
                                                                  .getLoanListSelected
                                                                  .topupDetail
                                                                  .products
                                                                  .length >
                                                              0
                                                          ? FFAppState()
                                                              .getLoanListSelected
                                                              .topupDetail
                                                              .products
                                                              .elementAtOrNull(functions.findIndexInList(
                                                                  FFAppState()
                                                                      .getLoanListSelected
                                                                      .topupDetail
                                                                      .products
                                                                      .map((e) =>
                                                                          e.productCode)
                                                                      .toList(),
                                                                  '${widget.productCode}')!)
                                                          : ProductsStruct(),
                                                  );
                                                  safeSetState(() {});

                                                  context.pushNamed(
                                                      TopupDetailDataPageWidget
                                                          .routeName);
                                                } else if ('${widget.topupType}' ==
                                                    'topup_special') {
                                                  FFAppState().getLoanListSelected = SrisawadApiGroup
                                                      .getListOfLoanCall
                                                      .results(
                                                        columnGetListOfLoanResponse
                                                            .jsonBody,
                                                      )!
                                                      .where((e) =>
                                                          e.contractDetails
                                                              .accountStatus ==
                                                          'A')
                                                      .toList()
                                                      .elementAtOrNull(functions
                                                          .findIndexInList(
                                                              SrisawadApiGroup
                                                                  .getListOfLoanCall
                                                                  .results(
                                                                    columnGetListOfLoanResponse
                                                                        .jsonBody,
                                                                  )
                                                                  ?.map((e) => e
                                                                      .contractNo)
                                                                  .toList()
                                                                  .toList(),
                                                              '${widget.contNo}')!)!;
                                                  safeSetState(() {});
                                                  FFAppState()
                                                      .updateGetLoanListSelectedStruct(
                                                    (e) => e
                                                      ..topupSpecialFlag = true,
                                                  );
                                                  safeSetState(() {});
                                                  FFAppState()
                                                      .updateSaveTopupDataStruct(
                                                    (e) => e
                                                      ..products = FFAppState()
                                                                  .getLoanListSelected
                                                                  .topupDetail
                                                                  .products
                                                                  .length >
                                                              0
                                                          ? FFAppState()
                                                              .getLoanListSelected
                                                              .topupDetail
                                                              .products
                                                              .elementAtOrNull(functions.findIndexInList(
                                                                  FFAppState()
                                                                      .getLoanListSelected
                                                                      .topupDetail
                                                                      .products
                                                                      .map((e) =>
                                                                          e.productCode)
                                                                      .toList(),
                                                                  '${widget.productCode}')!)
                                                          : ProductsStruct(),
                                                  );
                                                  safeSetState(() {});

                                                  context.pushNamed(
                                                      TopupDetailDataPageWidget
                                                          .routeName);
                                                } else {
                                                  FFAppState().getLoanListSelected = SrisawadApiGroup
                                                      .getListOfLoanCall
                                                      .results(
                                                        columnGetListOfLoanResponse
                                                            .jsonBody,
                                                      )!
                                                      .where((e) =>
                                                          e.contractDetails
                                                              .accountStatus ==
                                                          'A')
                                                      .toList()
                                                      .elementAtOrNull(functions
                                                          .findIndexInList(
                                                              SrisawadApiGroup
                                                                  .getListOfLoanCall
                                                                  .results(
                                                                    columnGetListOfLoanResponse
                                                                        .jsonBody,
                                                                  )
                                                                  ?.map((e) => e
                                                                      .contractNo)
                                                                  .toList()
                                                                  .toList(),
                                                              '${widget.contNo}')!)!;
                                                  safeSetState(() {});
                                                  FFAppState()
                                                      .updateGetLoanListSelectedStruct(
                                                    (e) => e
                                                      ..topupSpecialFlag =
                                                          false,
                                                  );
                                                  safeSetState(() {});
                                                  FFAppState()
                                                      .updateSaveTopupDataStruct(
                                                    (e) => e
                                                      ..products = FFAppState()
                                                                  .getLoanListSelected
                                                                  .topupDetail
                                                                  .products
                                                                  .length >
                                                              0
                                                          ? FFAppState()
                                                              .getLoanListSelected
                                                              .topupDetail
                                                              .products
                                                              .elementAtOrNull(functions.findIndexInList(
                                                                  FFAppState()
                                                                      .getLoanListSelected
                                                                      .topupDetail
                                                                      .products
                                                                      .map((e) =>
                                                                          e.productCode)
                                                                      .toList(),
                                                                  '${widget.productCode}')!)
                                                          : ProductsStruct(),
                                                  );
                                                  safeSetState(() {});

                                                  context.pushNamed(
                                                      TopupDetailDataPageWidget
                                                          .routeName);
                                                }
                                              },
                                            ),
                                          ),
                                        if (false)
                                          Builder(
                                            builder: (context) {
                                              final loanList = (true
                                                          ? SrisawadApiGroup
                                                              .getListOfLoanCall
                                                              .results(
                                                                columnGetListOfLoanResponse
                                                                    .jsonBody,
                                                              )
                                                              ?.where((e) =>
                                                                  e.contractDetails
                                                                      .accountStatus ==
                                                                  'A')
                                                              .toList()
                                                          : (_model.tabSelested ==
                                                                  1
                                                              ? SrisawadApiGroup
                                                                  .getListOfLoanCall
                                                                  .results(
                                                                    columnGetListOfLoanResponse
                                                                        .jsonBody,
                                                                  )
                                                                  ?.where((e) =>
                                                                      (e.topupDetail
                                                                              .canTopup !=
                                                                          'N') &&
                                                                      (e.contractDetails
                                                                              .accountStatus ==
                                                                          'A'))
                                                                  .toList()
                                                              : SrisawadApiGroup
                                                                  .getListOfLoanCall
                                                                  .results(
                                                                    columnGetListOfLoanResponse
                                                                        .jsonBody,
                                                                  )
                                                                  ?.where((e) =>
                                                                      (e.topupDetail
                                                                              .canTopup ==
                                                                          'N') &&
                                                                      (e.contractDetails
                                                                              .accountStatus ==
                                                                          'A'))
                                                                  .toList()))
                                                      ?.toList() ??
                                                  [];
                                              if (loanList.isEmpty) {
                                                return Center(
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 350.0,
                                                    child:
                                                        EmptyComponentTopupWidget(
                                                      text1: '',
                                                      text2: _model
                                                                  .tabSelested ==
                                                              1
                                                          ? 'ไม่พบสัญญาที่เพิ่มวงเงินได้'
                                                          : 'ไม่พบสัญญาที่ยังไม่เข้าเงื่อนไข',
                                                    ),
                                                  ),
                                                );
                                              }

                                              return RefreshIndicator(
                                                onRefresh: () async {
                                                  safeSetState(() => _model
                                                          .apiRequestCompleter =
                                                      null);
                                                  await _model
                                                      .waitForApiRequestCompleted();
                                                },
                                                child: ListView.builder(
                                                  padding: EdgeInsets.fromLTRB(
                                                    0,
                                                    0,
                                                    0,
                                                    30.0,
                                                  ),
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: loanList.length,
                                                  itemBuilder:
                                                      (context, loanListIndex) {
                                                    final loanListItem =
                                                        loanList[loanListIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  9.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          if (!(((String
                                                                      amount) {
                                                                return double.parse(
                                                                        amount) <=
                                                                    0.0;
                                                              }(
                                                                  '${loanListItem.topupDetail.topupSpecials.toString()}')) ||
                                                              ('${loanListItem.topupDetail.topupSpecials.toString()}' ==
                                                                  'null') ||
                                                              ('${loanListItem.topupDetail.topupSpecials.toString()}' ==
                                                                  ''))) {
                                                            return;
                                                          }
                                                          if (loanListItem
                                                                  .contractDetails
                                                                  .accountType ==
                                                              'L') {
                                                            return;
                                                          }
                                                          FFAppState()
                                                                  .getLoanListSelected =
                                                              loanListItem;
                                                          safeSetState(() {});
                                                          FFAppState()
                                                              .updateGetLoanListSelectedStruct(
                                                            (e) => e
                                                              ..topupSpecialFlag =
                                                                  false,
                                                          );
                                                          safeSetState(() {});
                                                          if ('${loanListItem.topupDetail.canTopup}' ==
                                                              'N') {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  content: Text(
                                                                      'ไปหน้าLoan Detail'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );

                                                            context.pushNamed(
                                                              LoanDetailPageWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'hashThaiId':
                                                                    serializeParam(
                                                                  FFAppState()
                                                                      .hashThaiIdAppState,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'contNo':
                                                                    serializeParam(
                                                                  loanListItem
                                                                      .contractNo,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'token':
                                                                    serializeParam(
                                                                  FFAppState()
                                                                      .accessToken,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'fromPage':
                                                                    serializeParam(
                                                                  'TopupCard',
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );

                                                            return;
                                                          }
                                                          if (FFAppState()
                                                                      .getLoanListSelected
                                                                      .requestStatus ==
                                                                  'ยังไม่ได้ทำรายการเติมเงิน'
                                                              ? true
                                                              : false) {
                                                            context.pushNamed(
                                                                SelectTopupPurposePageWidget
                                                                    .routeName);
                                                          } else {
                                                            context.pushNamed(
                                                              TopupStatusPageWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'fromPage':
                                                                    serializeParam(
                                                                  'LoanListCard',
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                              extra: <String,
                                                                  dynamic>{
                                                                '__transition_info__':
                                                                    TransitionInfo(
                                                                  hasTransition:
                                                                      true,
                                                                  transitionType:
                                                                      PageTransitionType
                                                                          .rightToLeft,
                                                                ),
                                                              },
                                                            );
                                                          }
                                                        },
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: false
                                                                ? Color(
                                                                    0xFFE9FFEA)
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4.0,
                                                                color: Color(
                                                                    0x33000000),
                                                                offset: Offset(
                                                                  0.0,
                                                                  2.0,
                                                                ),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      15.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      15.0),
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      15.0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          15.0),
                                                            ),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        12.0,
                                                                        0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              8.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                50.0,
                                                                            height:
                                                                                50.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Builder(
                                                                              builder: (context) {
                                                                                if ('${loanListItem.contractDetails.loanTypeCode}' == 'C') {
                                                                                  return ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    child: SvgPicture.asset(
                                                                                      'assets/images/car-loan.svg',
                                                                                      width: 50.0,
                                                                                      height: 50.0,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  );
                                                                                } else if ('${loanListItem.contractDetails.loanTypeCode}' == 'M') {
                                                                                  return ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    child: SvgPicture.asset(
                                                                                      'assets/images/MotorLoanIcon.svg',
                                                                                      width: 50.0,
                                                                                      height: 50.0,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  );
                                                                                } else if ('${loanListItem.contractDetails.loanTypeCode}' == 'H') {
                                                                                  return ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    child: SvgPicture.asset(
                                                                                      'assets/images/HouseLoanIcon.svg',
                                                                                      width: 50.0,
                                                                                      height: 50.0,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  );
                                                                                } else if ('${loanListItem.contractDetails.loanTypeCode}' == 'L') {
                                                                                  return ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    child: SvgPicture.asset(
                                                                                      'assets/images/HouseLoanIcon.svg',
                                                                                      width: 50.0,
                                                                                      height: 50.0,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  );
                                                                                } else if ('${loanListItem.contractDetails.loanTypeCode}' == 'T') {
                                                                                  return ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    child: SvgPicture.asset(
                                                                                      'assets/images/LOANT.svg',
                                                                                      width: 50.0,
                                                                                      height: 50.0,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  );
                                                                                } else if ('${loanListItem.contractDetails.loanTypeCode}' == 'V') {
                                                                                  return ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    child: SvgPicture.asset(
                                                                                      'assets/images/LOANV.svg',
                                                                                      width: 50.0,
                                                                                      height: 50.0,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  );
                                                                                } else if ('${loanListItem.contractDetails.loanTypeCode}' == 'I') {
                                                                                  return ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    child: SvgPicture.asset(
                                                                                      'assets/images/CarInsuranceLoanIcon.svg',
                                                                                      width: 50.0,
                                                                                      height: 50.0,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  );
                                                                                } else {
                                                                                  return ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    child: SvgPicture.asset(
                                                                                      'assets/images/LOANL.svg',
                                                                                      width: 50.0,
                                                                                      height: 50.0,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  );
                                                                                }
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                0.0,
                                                                                8.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              valueOrDefault<String>(
                                                                                                '${loanListItem.contractDetails.loanTypeName}',
                                                                                                'loan_type_name',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Noto San Thai',
                                                                                                    fontSize: 16.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w600,
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
                                                                          if (loanListItem.contractDetails.accountType !=
                                                                              'L')
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 8.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Text(
                                                                                                'เลขที่สัญญา',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Noto San Thai',
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      fontSize: 14.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            Text(
                                                                                              '${loanListItem.contractNo}',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Noto San Thai',
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                0.0,
                                                                                8.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            child: Text(
                                                                                              'ข้อมูลหลักประกัน',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Noto San Thai',
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Text(
                                                                                            '${loanListItem.contractDetails.collateralInformation}',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Noto San Thai',
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                0.0,
                                                                                8.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                if (('${loanListItem.contractDetails.loanTypeCode}' == 'L') && ('${loanListItem.contractDetails.loanTypeCode}' == 'H') && false)
                                                                                  Expanded(
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Text(
                                                                                                'กลุ่มสินค้า',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Noto San Thai',
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      fontSize: 14.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            Text(
                                                                                              valueOrDefault<String>(
                                                                                                FFAppState().getLoanListAPIResultAppState.elementAtOrNull(loanListIndex)?.contractDetails.vehicleBrand,
                                                                                                'vehicle_brand',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Noto San Thai',
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          if (loanListItem.contractDetails.accountType !=
                                                                              'L')
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 8.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  if (!(('${loanListItem.contractDetails.loanTypeCode}' == 'L') || ('${loanListItem.contractDetails.loanTypeCode}' == 'H') || (loanListItem.topupDetail.canTopup == 'G') || (loanListItem.topupDetail.canTopup == 'A')))
                                                                                    Expanded(
                                                                                      child: Container(
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Expanded(
                                                                                                child: Text(
                                                                                                  'ข้อมูลสถานะ',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Noto San Thai',
                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                              Text(
                                                                                                '${loanListItem.requestStatus}',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Noto San Thai',
                                                                                                      color: valueOrDefault<String>(
                                                                                                                FFAppState().getLoanListAPIResultAppState.elementAtOrNull(loanListIndex)?.requestStatus,
                                                                                                                'request_status',
                                                                                                              ) ==
                                                                                                              'เอกสารไม่ครบติดต่อ 1652'
                                                                                                          ? FlutterFlowTheme.of(context).error
                                                                                                          : Colors.black,
                                                                                                      fontSize: 14.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.bold,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          if (loanListItem.contractDetails.accountType !=
                                                                              'L')
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 8.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  if ('${loanListItem.topupDetail.topupExtra.toString()}' != '0')
                                                                                    Expanded(
                                                                                      child: Container(
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Text(
                                                                                                'วงเงินเพิ่มเติม',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Noto San Thai',
                                                                                                      color: Color(0xFFFF0000),
                                                                                                      fontSize: 14.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                    ),
                                                                                              ),
                                                                                              Text(
                                                                                                '${valueOrDefault<String>(
                                                                                                  functions.returnNumberWithComma2Decimal(loanListItem.topupDetail.topupExtra.toString()),
                                                                                                  '0',
                                                                                                )}',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Noto San Thai',
                                                                                                      color: Color(0xFFFF0000),
                                                                                                      fontSize: 14.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          if (loanListItem.contractDetails.accountType !=
                                                                              'L')
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  if ((double.parse('${loanListItem.topupDetail.topupSpecials.toString()}') > 0.0) && ('${loanListItem.topupDetail.topupSpecials.toString()}' != 'null') && ('${loanListItem.topupDetail.topupSpecials.toString()}' != '') && ('${loanListItem.topupDetail.canTopup}' != 'N'))
                                                                                    Expanded(
                                                                                      child: Container(
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          boxShadow: [
                                                                                            BoxShadow(
                                                                                              blurRadius: 10.0,
                                                                                              color: Color(0x33000000),
                                                                                              offset: Offset(
                                                                                                2.0,
                                                                                                2.0,
                                                                                              ),
                                                                                            )
                                                                                          ],
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 16.0, 8.0, 16.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Text(
                                                                                                'วงเงินพิเศษ',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Noto San Thai',
                                                                                                      color: Color(0xFFFF0000),
                                                                                                      fontSize: 14.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                    ),
                                                                                              ),
                                                                                              Text(
                                                                                                '${valueOrDefault<String>(
                                                                                                  functions.returnNumberWithComma2Decimal(loanListItem.topupDetail.topupSpecials.toString()),
                                                                                                  '0',
                                                                                                )}',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Noto San Thai',
                                                                                                      color: Color(0xFFFF0000),
                                                                                                      fontSize: 14.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          if ((('${loanListItem.contractDetails.loanTypeCode}' == 'L') || ('${loanListItem.contractDetails.loanTypeCode}' == 'H') || (loanListItem.topupDetail.canTopup == 'G') || (loanListItem.topupDetail.canTopup == 'A') || (loanListItem.topupDetail.canTopup == 'L')) &&
                                                                              (loanListItem.topupDetail.canTopup != 'N') &&
                                                                              false)
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Container(
                                                                                    width: double.infinity,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          Text(
                                                                                            'ยังไม่สามารถทำรายการผ่านแอปได้',
                                                                                            textAlign: TextAlign.start,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Noto San Thai',
                                                                                                  color: Color(0xFFFF0000),
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Container(
                                                                                    width: double.infinity,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          Text(
                                                                                            'กรุณาติดต่อสาขาเจ้าของบัญชีหรือสาขาใกล้บ้าน',
                                                                                            textAlign: TextAlign.start,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Noto San Thai',
                                                                                                  color: Color(0xFFFF0000),
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Container(
                                                                                    width: double.infinity,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          Text(
                                                                                            'เพื่อทำสัญญาและรับเงิน',
                                                                                            textAlign: TextAlign.start,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Noto San Thai',
                                                                                                  color: Color(0xFFFF0000),
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Divider(
                                                                thickness: 2.0,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                              ),
                                                              if (('${loanListItem.topupDetail.canTopup}' ==
                                                                      'Y') &&
                                                                  (loanListItem
                                                                          .contractDetails
                                                                          .accountType !=
                                                                      'L'))
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            'วงเงินสินเชื่อสูงสุด',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Noto San Thai',
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                          if (('${loanListItem.contractDetails.loanTypeCode}' != 'L') &&
                                                                              ('${loanListItem.contractDetails.loanTypeCode}' != 'H'))
                                                                            Text(
                                                                              '(เลขที่สัญญา ${'${loanListItem.contractNo}'})',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Noto San Thai',
                                                                                    color: Color(0x80646464),
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          if (('${loanListItem.contractDetails.loanTypeCode}' == 'L') ||
                                                                              ('${loanListItem.contractDetails.loanTypeCode}' == 'H'))
                                                                            Text(
                                                                              '(เลขที่${'${loanListItem.contractNo}'})',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Noto San Thai',
                                                                                    color: Color(0x80646464),
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                      Text(
                                                                        '${valueOrDefault<String>(
                                                                          functions
                                                                              .returnNumberWithComma2Decimal('${loanListItem.topupDetail.defaultTopupAmount.toString()}'),
                                                                          '0',
                                                                        )}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Noto San Thai',
                                                                              color: Colors.black,
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              if ('${loanListItem.topupDetail.canTopup}' !=
                                                                  'Y')
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          20.0,
                                                                          12.0,
                                                                          20.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Builder(
                                                                          builder:
                                                                              (context) {
                                                                            if (loanListItem.contractDetails.accountType ==
                                                                                'L') {
                                                                              return Container(
                                                                                width: double.infinity,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 10.0,
                                                                                      color: Color(0x33000000),
                                                                                      offset: Offset(
                                                                                        2.0,
                                                                                        2.0,
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 16.0, 12.0, 16.0),
                                                                                  child: Text(
                                                                                    loanListItem.contractDetails.accountTypeMsg,
                                                                                    textAlign: TextAlign.center,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Noto San Thai',
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            } else if (loanListItem.topupDetail.canTopupMsg != '') {
                                                                              return Container(
                                                                                width: double.infinity,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 10.0,
                                                                                      color: Color(0x33000000),
                                                                                      offset: Offset(
                                                                                        2.0,
                                                                                        2.0,
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 16.0, 12.0, 16.0),
                                                                                  child: Text(
                                                                                    loanListItem.topupDetail.canTopupMsg,
                                                                                    textAlign: TextAlign.center,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Noto San Thai',
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            } else {
                                                                              return Container(
                                                                                width: double.infinity,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 10.0,
                                                                                      color: Color(0x33000000),
                                                                                      offset: Offset(
                                                                                        2.0,
                                                                                        2.0,
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 16.0, 12.0, 16.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: double.infinity,
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Text(
                                                                                          topupCardPageApplicationRecord.topupNoDataText,
                                                                                          textAlign: TextAlign.center,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Noto San Thai',
                                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        width: double.infinity,
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Text(
                                                                                          topupCardPageApplicationRecord.topupNoData2Text,
                                                                                          textAlign: TextAlign.center,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Noto San Thai',
                                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ].divide(SizedBox(height: 4.0)),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              if (loanListItem
                                                                      .contractDetails
                                                                      .accountType !=
                                                                  'L')
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          8.0,
                                                                          12.0,
                                                                          8.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      if ((double.parse(
                                                                                  '${loanListItem.topupDetail.topupSpecials.toString()}') >
                                                                              0.0) &&
                                                                          ('${loanListItem.topupDetail.topupSpecials.toString()}' !=
                                                                              'null') &&
                                                                          ('${loanListItem.topupDetail.topupSpecials.toString()}' !=
                                                                              '') &&
                                                                          ('${loanListItem.topupDetail.canTopup}' !=
                                                                              'N'))
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              if (loanListItem.contractDetails.accountType == 'L') {
                                                                                return;
                                                                              }
                                                                              FFAppState().getLoanListSelected = loanListItem;
                                                                              safeSetState(() {});
                                                                              FFAppState().updateGetLoanListSelectedStruct(
                                                                                (e) => e..topupSpecialFlag = true,
                                                                              );
                                                                              safeSetState(() {});
                                                                              if ('${loanListItem.topupDetail.topupSpecials.toString()}' == 'N') {
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return AlertDialog(
                                                                                      content: Text('ไปหน้าLoan Detail'),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                                          child: Text('Ok'),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                );

                                                                                context.pushNamed(
                                                                                  LoanDetailPageWidget.routeName,
                                                                                  queryParameters: {
                                                                                    'hashThaiId': serializeParam(
                                                                                      FFAppState().hashThaiIdAppState,
                                                                                      ParamType.String,
                                                                                    ),
                                                                                    'contNo': serializeParam(
                                                                                      loanListItem.contractNo,
                                                                                      ParamType.String,
                                                                                    ),
                                                                                    'token': serializeParam(
                                                                                      FFAppState().accessToken,
                                                                                      ParamType.String,
                                                                                    ),
                                                                                    'fromPage': serializeParam(
                                                                                      'TopupCard',
                                                                                      ParamType.String,
                                                                                    ),
                                                                                  }.withoutNulls,
                                                                                );

                                                                                return;
                                                                              }
                                                                              if (FFAppState().getLoanListSelected.requestStatus == 'ยังไม่ได้ทำรายการเติมเงิน' ? true : false) {
                                                                                context.pushNamed(SelectTopupPurposePageWidget.routeName);
                                                                              } else {
                                                                                context.pushNamed(
                                                                                  TopupStatusPageWidget.routeName,
                                                                                  queryParameters: {
                                                                                    'fromPage': serializeParam(
                                                                                      'LoanListCard',
                                                                                      ParamType.String,
                                                                                    ),
                                                                                  }.withoutNulls,
                                                                                  extra: <String, dynamic>{
                                                                                    '__transition_info__': TransitionInfo(
                                                                                      hasTransition: true,
                                                                                      transitionType: PageTransitionType.rightToLeft,
                                                                                    ),
                                                                                  },
                                                                                );
                                                                              }
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: valueOrDefault<double>(
                                                                                ('${valueOrDefault<String>(
                                                                                              FFAppState().getLoanListAPIResultAppState.elementAtOrNull(loanListIndex)?.requestStatus,
                                                                                              'default_topup_amount',
                                                                                            )}' !=
                                                                                            'ยังไม่ได้ทำรายการเติมเงิน'
                                                                                        ? 150
                                                                                        : 100)
                                                                                    .toDouble(),
                                                                                150.0,
                                                                              ),
                                                                              height: 50.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).success,
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Text(
                                                                                  valueOrDefault<String>(
                                                                                    _model.tabSelested == 1
                                                                                        ? valueOrDefault<String>(
                                                                                            '${loanListItem.requestStatus}' != 'ยังไม่ได้ทำรายการเติมเงิน' ? 'ตรวจสอบสถานะ' : 'วงเงินพิเศษ',
                                                                                            'วงเงินฉุกเฉิน',
                                                                                          )
                                                                                        : 'รายละเอียด',
                                                                                    'วงเงินฉุกเฉิน',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Noto San Thai',
                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                        fontSize: 16.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            if (loanListItem.contractDetails.accountType ==
                                                                                'L') {
                                                                              return;
                                                                            }
                                                                            FFAppState().getLoanListSelected =
                                                                                loanListItem;
                                                                            safeSetState(() {});
                                                                            FFAppState().updateGetLoanListSelectedStruct(
                                                                              (e) => e..topupSpecialFlag = false,
                                                                            );
                                                                            safeSetState(() {});
                                                                            if ('${loanListItem.topupDetail.canTopup}' ==
                                                                                'N') {
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    content: Text('ไปหน้าLoan Detail'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                        child: Text('Ok'),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              );

                                                                              context.pushNamed(
                                                                                LoanDetailPageWidget.routeName,
                                                                                queryParameters: {
                                                                                  'hashThaiId': serializeParam(
                                                                                    FFAppState().hashThaiIdAppState,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'contNo': serializeParam(
                                                                                    loanListItem.contractNo,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'token': serializeParam(
                                                                                    FFAppState().accessToken,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'fromPage': serializeParam(
                                                                                    'TopupCard',
                                                                                    ParamType.String,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                              );

                                                                              return;
                                                                            }
                                                                            if (FFAppState().getLoanListSelected.requestStatus == 'ยังไม่ได้ทำรายการเติมเงิน'
                                                                                ? true
                                                                                : false) {
                                                                              context.pushNamed(SelectTopupPurposePageWidget.routeName);
                                                                            } else {
                                                                              context.pushNamed(
                                                                                TopupStatusPageWidget.routeName,
                                                                                queryParameters: {
                                                                                  'fromPage': serializeParam(
                                                                                    'LoanListCard',
                                                                                    ParamType.String,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                                extra: <String, dynamic>{
                                                                                  '__transition_info__': TransitionInfo(
                                                                                    hasTransition: true,
                                                                                    transitionType: PageTransitionType.rightToLeft,
                                                                                  ),
                                                                                },
                                                                              );
                                                                            }
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                valueOrDefault<double>(
                                                                              ('${valueOrDefault<String>(
                                                                                            FFAppState().getLoanListAPIResultAppState.elementAtOrNull(loanListIndex)?.requestStatus,
                                                                                            'default_topup_amount',
                                                                                          )}' !=
                                                                                          'ยังไม่ได้ทำรายการเติมเงิน'
                                                                                      ? 150
                                                                                      : 100)
                                                                                  .toDouble(),
                                                                              150.0,
                                                                            ),
                                                                            height:
                                                                                50.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).accent2,
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Text(
                                                                                valueOrDefault<String>(
                                                                                  '${loanListItem.topupDetail.canTopup}' != 'N'
                                                                                      ? valueOrDefault<String>(
                                                                                          '${loanListItem.requestStatus}' != 'ยังไม่ได้ทำรายการเติมเงิน' ? 'ตรวจสอบสถานะ' : 'เติมวงเงิน',
                                                                                          'เติมวงเงิน',
                                                                                        )
                                                                                      : 'รายละเอียด',
                                                                                  'เติมวงเงิน',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Noto San Thai',
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      fontSize: 16.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            8.0)),
                                                                  ),
                                                                ),
                                                            ]
                                                                .addToStart(
                                                                    SizedBox(
                                                                        height:
                                                                            12.0))
                                                                .addToEnd(
                                                                    SizedBox(
                                                                        height:
                                                                            4.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                                        if (false)
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 12.0, 0.0, 0.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final loanListItemList = (true
                                                              ? SrisawadApiGroup
                                                                  .getListOfLoanCall
                                                                  .results(
                                                                    columnGetListOfLoanResponse
                                                                        .jsonBody,
                                                                  )
                                                                  ?.where((e) =>
                                                                      e.contractDetails
                                                                          .accountStatus ==
                                                                      'A')
                                                                  .toList()
                                                              : (_model.tabSelested ==
                                                                      1
                                                                  ? SrisawadApiGroup
                                                                      .getListOfLoanCall
                                                                      .results(
                                                                        columnGetListOfLoanResponse
                                                                            .jsonBody,
                                                                      )
                                                                      ?.where((e) =>
                                                                          (e.topupDetail.canTopup !=
                                                                              'N') &&
                                                                          (e.contractDetails.accountStatus ==
                                                                              'A'))
                                                                      .toList()
                                                                  : SrisawadApiGroup
                                                                      .getListOfLoanCall
                                                                      .results(
                                                                        columnGetListOfLoanResponse
                                                                            .jsonBody,
                                                                      )
                                                                      ?.where((e) =>
                                                                          (e.topupDetail.canTopup ==
                                                                              'N') &&
                                                                          (e.contractDetails.accountStatus ==
                                                                              'A'))
                                                                      .toList()))
                                                          ?.toList() ??
                                                      [];

                                                  return Container(
                                                    width: double.infinity,
                                                    height: 1200.0,
                                                    child: Stack(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      40.0),
                                                          child:
                                                              PageView.builder(
                                                            controller: _model
                                                                    .pageViewController ??=
                                                                PageController(
                                                                    initialPage: max(
                                                                        0,
                                                                        min(
                                                                            0,
                                                                            loanListItemList.length -
                                                                                1))),
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            itemCount:
                                                                loanListItemList
                                                                    .length,
                                                            itemBuilder: (context,
                                                                loanListItemListIndex) {
                                                              final loanListItemListItem =
                                                                  loanListItemList[
                                                                      loanListItemListIndex];
                                                              return Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          24.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      if (!(((String
                                                                              amount) {
                                                                            return double.parse(amount) <=
                                                                                0.0;
                                                                          }('${loanListItemListItem.topupDetail.topupSpecials.toString()}')) ||
                                                                          ('${loanListItemListItem.topupDetail.topupSpecials.toString()}' == 'null') ||
                                                                          ('${loanListItemListItem.topupDetail.topupSpecials.toString()}' == ''))) {
                                                                        return;
                                                                      }
                                                                      if (loanListItemListItem
                                                                              .contractDetails
                                                                              .accountType ==
                                                                          'L') {
                                                                        return;
                                                                      }
                                                                      FFAppState()
                                                                              .getLoanListSelected =
                                                                          loanListItemListItem;
                                                                      safeSetState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .updateGetLoanListSelectedStruct(
                                                                        (e) => e
                                                                          ..topupSpecialFlag =
                                                                              false,
                                                                      );
                                                                      safeSetState(
                                                                          () {});
                                                                      if ('${loanListItemListItem.topupDetail.canTopup}' ==
                                                                          'N') {
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return AlertDialog(
                                                                              content: Text('ไปหน้าLoan Detail'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                  child: Text('Ok'),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        );

                                                                        context
                                                                            .pushNamed(
                                                                          LoanDetailPageWidget
                                                                              .routeName,
                                                                          queryParameters:
                                                                              {
                                                                            'hashThaiId':
                                                                                serializeParam(
                                                                              FFAppState().hashThaiIdAppState,
                                                                              ParamType.String,
                                                                            ),
                                                                            'contNo':
                                                                                serializeParam(
                                                                              loanListItemListItem.contractNo,
                                                                              ParamType.String,
                                                                            ),
                                                                            'token':
                                                                                serializeParam(
                                                                              FFAppState().accessToken,
                                                                              ParamType.String,
                                                                            ),
                                                                            'fromPage':
                                                                                serializeParam(
                                                                              'TopupCard',
                                                                              ParamType.String,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );

                                                                        return;
                                                                      }
                                                                      if (FFAppState().getLoanListSelected.requestStatus ==
                                                                              'ยังไม่ได้ทำรายการเติมเงิน'
                                                                          ? true
                                                                          : false) {
                                                                        context.pushNamed(
                                                                            SelectTopupPurposePageWidget.routeName);
                                                                      } else {
                                                                        context
                                                                            .pushNamed(
                                                                          TopupStatusPageWidget
                                                                              .routeName,
                                                                          queryParameters:
                                                                              {
                                                                            'fromPage':
                                                                                serializeParam(
                                                                              'LoanListCard',
                                                                              ParamType.String,
                                                                            ),
                                                                          }.withoutNulls,
                                                                          extra: <String,
                                                                              dynamic>{
                                                                            '__transition_info__':
                                                                                TransitionInfo(
                                                                              hasTransition: true,
                                                                              transitionType: PageTransitionType.rightToLeft,
                                                                            ),
                                                                          },
                                                                        );
                                                                      }
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Colors
                                                                            .transparent,
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(15.0),
                                                                          topRight:
                                                                              Radius.circular(15.0),
                                                                          bottomLeft:
                                                                              Radius.circular(15.0),
                                                                          bottomRight:
                                                                              Radius.circular(15.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            boxShadow: [
                                                                              BoxShadow(
                                                                                blurRadius: 4.0,
                                                                                color: Color(0x33000000),
                                                                                offset: Offset(
                                                                                  2.0,
                                                                                  2.0,
                                                                                ),
                                                                              )
                                                                            ],
                                                                            borderRadius:
                                                                                BorderRadius.circular(15.0),
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Builder(
                                                                                          builder: (context) {
                                                                                            if (true) {
                                                                                              return Container(
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).cardHeader,
                                                                                                  borderRadius: BorderRadius.only(
                                                                                                    topLeft: Radius.circular(15.0),
                                                                                                    topRight: Radius.circular(15.0),
                                                                                                  ),
                                                                                                ),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 8.0, 0.0),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Expanded(
                                                                                                              child: Container(
                                                                                                                decoration: BoxDecoration(),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      if (loanListItemListItem.contractDetails.accountType != 'L')
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Expanded(
                                                                                                                child: Container(
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                    child: Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                      children: [
                                                                                                                        Expanded(
                                                                                                                          child: Text(
                                                                                                                            'รับเงินโอนเข้าบัญชีสูงสุด',
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  fontFamily: 'Noto San Thai',
                                                                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                                                                  fontSize: 14.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Expanded(
                                                                                                            child: Container(
                                                                                                              decoration: BoxDecoration(),
                                                                                                              child: Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                  children: [
                                                                                                                    Expanded(
                                                                                                                      child: RichText(
                                                                                                                        textScaler: MediaQuery.of(context).textScaler,
                                                                                                                        text: TextSpan(
                                                                                                                          children: [
                                                                                                                            TextSpan(
                                                                                                                              text: 'สูงสุด  ',
                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                    fontFamily: 'Noto San Thai',
                                                                                                                                    color: FlutterFlowTheme.of(context).secondary,
                                                                                                                                    fontSize: 14.0,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                            TextSpan(
                                                                                                                              text: valueOrDefault<String>(
                                                                                                                                functions.returnNumberWithCommaFullNumber('5000', '0'),
                                                                                                                                '0',
                                                                                                                              ),
                                                                                                                              style: TextStyle(
                                                                                                                                fontWeight: FontWeight.w600,
                                                                                                                                fontSize: 24.0,
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                            TextSpan(
                                                                                                                              text: '  บาท',
                                                                                                                              style: TextStyle(),
                                                                                                                            )
                                                                                                                          ],
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: 'Noto San Thai',
                                                                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.w600,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                      if (loanListItemListItem.contractDetails.accountType != 'L')
                                                                                                        Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            if (('${loanListItemListItem.contractDetails.loanTypeCode}' == 'L') || ('${loanListItemListItem.contractDetails.loanTypeCode}' == 'H') || (loanListItemListItem.topupDetail.canTopup == 'G') || (loanListItemListItem.topupDetail.canTopup == 'A'))
                                                                                                              Expanded(
                                                                                                                child: Container(
                                                                                                                  width: double.infinity,
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                    child: Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Align(
                                                                                                                          alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                                                          child: Icon(
                                                                                                                            Icons.check_circle_outlined,
                                                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                                                            size: 16.0,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        Expanded(
                                                                                                                          child: Text(
                                                                                                                            'เพียงเติมวงเงินเต็มจำนวน รับเงินสดใช้จ่ายได้เลย หลังปิดบัญชีเต็ม',
                                                                                                                            textAlign: TextAlign.start,
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  fontFamily: 'Noto San Thai',
                                                                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                                                                  fontSize: 11.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ].divide(SizedBox(width: 8.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                          ],
                                                                                                        ),
                                                                                                    ].addToStart(SizedBox(height: 8.0)).addToEnd(SizedBox(height: 8.0)),
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            } else if (loanListItemListItem.topupDetail.products.length > 0) {
                                                                                              return Stack(
                                                                                                children: [
                                                                                                  Container(
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).cardHeader,
                                                                                                      borderRadius: BorderRadius.only(
                                                                                                        topLeft: Radius.circular(15.0),
                                                                                                        topRight: Radius.circular(15.0),
                                                                                                      ),
                                                                                                    ),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          if ((double.parse('${loanListItemListItem.topupDetail.topupSpecials.toString()}') > 0.0) && ('${loanListItemListItem.topupDetail.topupSpecials.toString()}' != 'null') && ('${loanListItemListItem.topupDetail.topupSpecials.toString()}' != '') && ('${loanListItemListItem.topupDetail.canTopup}' != 'N') && (loanListItemListItem.contractDetails.accountType != 'L'))
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                children: [
                                                                                                                  Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Icon(
                                                                                                                        Icons.auto_awesome_outlined,
                                                                                                                        color: FlutterFlowTheme.of(context).secondary,
                                                                                                                        size: 18.0,
                                                                                                                      ),
                                                                                                                      Text(
                                                                                                                        'ข้อเสนอพิเศษสำหรับคุณ',
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: 'Noto San Thai',
                                                                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                                                                              fontSize: 13.0,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              fontWeight: FontWeight.w600,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ].divide(SizedBox(width: 8.0)),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          if (loanListItemListItem.contractDetails.accountType != 'L')
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                children: [
                                                                                                                  Expanded(
                                                                                                                    child: Container(
                                                                                                                      decoration: BoxDecoration(),
                                                                                                                      child: Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                        child: Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                          children: [
                                                                                                                            Expanded(
                                                                                                                              child: Text(
                                                                                                                                'รับเงินโอนเข้าบัญชีสูงสุด',
                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                      fontFamily: 'Noto San Thai',
                                                                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                                                                      fontSize: 14.0,
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                      fontWeight: FontWeight.w600,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Expanded(
                                                                                                                child: Container(
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                    child: Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                      children: [
                                                                                                                        Expanded(
                                                                                                                          child: RichText(
                                                                                                                            textScaler: MediaQuery.of(context).textScaler,
                                                                                                                            text: TextSpan(
                                                                                                                              children: [
                                                                                                                                TextSpan(
                                                                                                                                  text: 'สูงสุด  ',
                                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                        fontFamily: 'Noto San Thai',
                                                                                                                                        color: FlutterFlowTheme.of(context).secondary,
                                                                                                                                        fontSize: 14.0,
                                                                                                                                        letterSpacing: 0.0,
                                                                                                                                        fontWeight: FontWeight.normal,
                                                                                                                                      ),
                                                                                                                                ),
                                                                                                                                TextSpan(
                                                                                                                                  text: valueOrDefault<String>(
                                                                                                                                    functions.returnNumberWithCommaFullNumber('5000', '0'),
                                                                                                                                    '0',
                                                                                                                                  ),
                                                                                                                                  style: TextStyle(
                                                                                                                                    color: FlutterFlowTheme.of(context).secondary,
                                                                                                                                    fontWeight: FontWeight.w900,
                                                                                                                                    fontSize: 24.0,
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                                TextSpan(
                                                                                                                                  text: '  บาท',
                                                                                                                                  style: TextStyle(),
                                                                                                                                )
                                                                                                                              ],
                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                    fontFamily: 'Noto San Thai',
                                                                                                                                    color: FlutterFlowTheme.of(context).secondary,
                                                                                                                                    fontSize: 14.0,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                    fontWeight: FontWeight.w600,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                          Expanded(
                                                                                                            child: Container(
                                                                                                              height: 100.0,
                                                                                                              decoration: BoxDecoration(),
                                                                                                              child: Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                  children: [
                                                                                                                    Expanded(
                                                                                                                      child: Container(
                                                                                                                        width: 100.0,
                                                                                                                        height: 80.0,
                                                                                                                        decoration: BoxDecoration(
                                                                                                                          color: FlutterFlowTheme.of(context).bg05,
                                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                                          border: Border.all(
                                                                                                                            color: FlutterFlowTheme.of(context).border06,
                                                                                                                            width: 2.0,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                                                          child: Column(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            children: [
                                                                                                                              Row(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                children: [
                                                                                                                                  Text(
                                                                                                                                    'ทางเลือก 1',
                                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                          fontFamily: 'Noto San Thai',
                                                                                                                                          color: FlutterFlowTheme.of(context).alternate,
                                                                                                                                          fontSize: 12.0,
                                                                                                                                          letterSpacing: 0.0,
                                                                                                                                          fontWeight: FontWeight.w600,
                                                                                                                                        ),
                                                                                                                                  ),
                                                                                                                                ],
                                                                                                                              ),
                                                                                                                              Container(
                                                                                                                                width: double.infinity,
                                                                                                                                decoration: BoxDecoration(),
                                                                                                                                child: Row(
                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                  children: [
                                                                                                                                    Expanded(
                                                                                                                                      child: Text(
                                                                                                                                        'รับเงินเข้าบัญชีทันที',
                                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                              fontFamily: 'Noto San Thai',
                                                                                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                                                                                              letterSpacing: 0.0,
                                                                                                                                              fontWeight: FontWeight.w600,
                                                                                                                                            ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ],
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ].divide(SizedBox(height: 4.0)).addToStart(SizedBox(height: 8.0)),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Expanded(
                                                                                                                      child: Container(
                                                                                                                        width: 100.0,
                                                                                                                        height: 80.0,
                                                                                                                        decoration: BoxDecoration(
                                                                                                                          color: FlutterFlowTheme.of(context).bg05,
                                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                                          border: Border.all(
                                                                                                                            color: FlutterFlowTheme.of(context).border06,
                                                                                                                            width: 2.0,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                                                          child: Column(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            children: [
                                                                                                                              Row(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                children: [
                                                                                                                                  Text(
                                                                                                                                    'ทางเลือก 2',
                                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                          fontFamily: 'Noto San Thai',
                                                                                                                                          color: FlutterFlowTheme.of(context).alternate,
                                                                                                                                          fontSize: 12.0,
                                                                                                                                          letterSpacing: 0.0,
                                                                                                                                          fontWeight: FontWeight.w600,
                                                                                                                                        ),
                                                                                                                                  ),
                                                                                                                                ],
                                                                                                                              ),
                                                                                                                              Container(
                                                                                                                                width: double.infinity,
                                                                                                                                decoration: BoxDecoration(),
                                                                                                                                child: Row(
                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                  children: [
                                                                                                                                    Expanded(
                                                                                                                                      child: Text(
                                                                                                                                        'แลกใช้วงเงินเพื่อสิทธิพิเศษเฉพาะคุณ',
                                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                              fontFamily: 'Noto San Thai',
                                                                                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                                                                                              letterSpacing: 0.0,
                                                                                                                                              fontWeight: FontWeight.w600,
                                                                                                                                            ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ],
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ].divide(SizedBox(height: 4.0)).addToStart(SizedBox(height: 8.0)),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ].divide(SizedBox(width: 8.0)),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          if (loanListItemListItem.contractDetails.accountType != 'L')
                                                                                                            Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                if (('${loanListItemListItem.contractDetails.loanTypeCode}' == 'L') || ('${loanListItemListItem.contractDetails.loanTypeCode}' == 'H') || (loanListItemListItem.topupDetail.canTopup == 'G') || (loanListItemListItem.topupDetail.canTopup == 'A'))
                                                                                                                  Expanded(
                                                                                                                    child: Container(
                                                                                                                      width: double.infinity,
                                                                                                                      decoration: BoxDecoration(),
                                                                                                                      child: Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                        child: Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                          children: [
                                                                                                                            Expanded(
                                                                                                                              child: Text(
                                                                                                                                '*เงินคงเหลือจากการปิดสัญญาเดิมแล้ว',
                                                                                                                                textAlign: TextAlign.start,
                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                      fontFamily: 'Noto San Thai',
                                                                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                                                                      fontSize: 11.0,
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                      fontWeight: FontWeight.w600,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ].divide(SizedBox(width: 8.0)),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                              ],
                                                                                                            ),
                                                                                                        ].addToStart(SizedBox(height: 16.0)).addToEnd(SizedBox(height: 16.0)),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Align(
                                                                                                    alignment: AlignmentDirectional(1.0, -1.0),
                                                                                                    child: FaIcon(
                                                                                                      FontAwesomeIcons.star,
                                                                                                      color: FlutterFlowTheme.of(context).starColor,
                                                                                                      size: 75.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              );
                                                                                            } else {
                                                                                              return Container(
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).cardHeader,
                                                                                                  borderRadius: BorderRadius.only(
                                                                                                    topLeft: Radius.circular(15.0),
                                                                                                    topRight: Radius.circular(15.0),
                                                                                                  ),
                                                                                                ),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 8.0, 0.0),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Expanded(
                                                                                                              child: Container(
                                                                                                                decoration: BoxDecoration(),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      if (loanListItemListItem.contractDetails.accountType != 'L')
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Expanded(
                                                                                                                child: Container(
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                    child: Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                      children: [
                                                                                                                        Expanded(
                                                                                                                          child: Text(
                                                                                                                            'รับเงินโอนเข้าบัญชีสูงสุด',
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  fontFamily: 'Noto San Thai',
                                                                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                                                                  fontSize: 14.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Expanded(
                                                                                                            child: Container(
                                                                                                              decoration: BoxDecoration(),
                                                                                                              child: Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                  children: [
                                                                                                                    Expanded(
                                                                                                                      child: RichText(
                                                                                                                        textScaler: MediaQuery.of(context).textScaler,
                                                                                                                        text: TextSpan(
                                                                                                                          children: [
                                                                                                                            TextSpan(
                                                                                                                              text: 'สูงสุด  ',
                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                    fontFamily: 'Noto San Thai',
                                                                                                                                    color: FlutterFlowTheme.of(context).secondary,
                                                                                                                                    fontSize: 14.0,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                            TextSpan(
                                                                                                                              text: valueOrDefault<String>(
                                                                                                                                functions.returnNumberWithCommaFullNumber('5000', '0'),
                                                                                                                                '0',
                                                                                                                              ),
                                                                                                                              style: TextStyle(
                                                                                                                                fontWeight: FontWeight.w600,
                                                                                                                                fontSize: 24.0,
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                            TextSpan(
                                                                                                                              text: '  บาท',
                                                                                                                              style: TextStyle(),
                                                                                                                            )
                                                                                                                          ],
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: 'Noto San Thai',
                                                                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.w600,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                      if (loanListItemListItem.contractDetails.accountType != 'L')
                                                                                                        Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            if (('${loanListItemListItem.contractDetails.loanTypeCode}' == 'L') || ('${loanListItemListItem.contractDetails.loanTypeCode}' == 'H') || (loanListItemListItem.topupDetail.canTopup == 'G') || (loanListItemListItem.topupDetail.canTopup == 'A'))
                                                                                                              Expanded(
                                                                                                                child: Container(
                                                                                                                  width: double.infinity,
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                    child: Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Align(
                                                                                                                          alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                                                          child: Icon(
                                                                                                                            Icons.check_circle_outlined,
                                                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                                                            size: 16.0,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        Expanded(
                                                                                                                          child: Text(
                                                                                                                            'เพียงเติมวงเงินเต็มจำนวน รับเงินสดใช้จ่ายได้เลย หลังปิดบัญชีเต็ม',
                                                                                                                            textAlign: TextAlign.start,
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  fontFamily: 'Noto San Thai',
                                                                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                                                                  fontSize: 11.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ].divide(SizedBox(width: 8.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                          ],
                                                                                                        ),
                                                                                                    ].addToStart(SizedBox(height: 8.0)).addToEnd(SizedBox(height: 8.0)),
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            }
                                                                                          },
                                                                                        ),
                                                                                        Container(
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                          ),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 0.0, 8.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                  child: Container(
                                                                                                    width: 50.0,
                                                                                                    height: 50.0,
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: Builder(
                                                                                                      builder: (context) {
                                                                                                        if ('${loanListItemListItem.contractDetails.loanTypeCode}' == 'C') {
                                                                                                          return ClipRRect(
                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                            child: SvgPicture.asset(
                                                                                                              'assets/images/car-loan.svg',
                                                                                                              width: 50.0,
                                                                                                              height: 50.0,
                                                                                                              fit: BoxFit.cover,
                                                                                                            ),
                                                                                                          );
                                                                                                        } else if ('${loanListItemListItem.contractDetails.loanTypeCode}' == 'M') {
                                                                                                          return ClipRRect(
                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                            child: SvgPicture.asset(
                                                                                                              'assets/images/MotorLoanIcon.svg',
                                                                                                              width: 50.0,
                                                                                                              height: 50.0,
                                                                                                              fit: BoxFit.cover,
                                                                                                            ),
                                                                                                          );
                                                                                                        } else if ('${loanListItemListItem.contractDetails.loanTypeCode}' == 'H') {
                                                                                                          return ClipRRect(
                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                            child: SvgPicture.asset(
                                                                                                              'assets/images/HouseLoanIcon.svg',
                                                                                                              width: 50.0,
                                                                                                              height: 50.0,
                                                                                                              fit: BoxFit.cover,
                                                                                                            ),
                                                                                                          );
                                                                                                        } else if ('${loanListItemListItem.contractDetails.loanTypeCode}' == 'L') {
                                                                                                          return ClipRRect(
                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                            child: SvgPicture.asset(
                                                                                                              'assets/images/HouseLoanIcon.svg',
                                                                                                              width: 50.0,
                                                                                                              height: 50.0,
                                                                                                              fit: BoxFit.cover,
                                                                                                            ),
                                                                                                          );
                                                                                                        } else if ('${loanListItemListItem.contractDetails.loanTypeCode}' == 'T') {
                                                                                                          return ClipRRect(
                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                            child: SvgPicture.asset(
                                                                                                              'assets/images/LOANT.svg',
                                                                                                              width: 50.0,
                                                                                                              height: 50.0,
                                                                                                              fit: BoxFit.cover,
                                                                                                            ),
                                                                                                          );
                                                                                                        } else if ('${loanListItemListItem.contractDetails.loanTypeCode}' == 'V') {
                                                                                                          return ClipRRect(
                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                            child: SvgPicture.asset(
                                                                                                              'assets/images/LOANV.svg',
                                                                                                              width: 50.0,
                                                                                                              height: 50.0,
                                                                                                              fit: BoxFit.cover,
                                                                                                            ),
                                                                                                          );
                                                                                                        } else if ('${loanListItemListItem.contractDetails.loanTypeCode}' == 'I') {
                                                                                                          return ClipRRect(
                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                            child: SvgPicture.asset(
                                                                                                              'assets/images/CarInsuranceLoanIcon.svg',
                                                                                                              width: 50.0,
                                                                                                              height: 50.0,
                                                                                                              fit: BoxFit.cover,
                                                                                                            ),
                                                                                                          );
                                                                                                        } else {
                                                                                                          return ClipRRect(
                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                            child: SvgPicture.asset(
                                                                                                              'assets/images/LOANL.svg',
                                                                                                              width: 50.0,
                                                                                                              height: 50.0,
                                                                                                              fit: BoxFit.cover,
                                                                                                            ),
                                                                                                          );
                                                                                                        }
                                                                                                      },
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                Expanded(
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 8.0, 0.0),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Expanded(
                                                                                                              child: Container(
                                                                                                                decoration: BoxDecoration(),
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    Expanded(
                                                                                                                      child: Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                        child: Text(
                                                                                                                          valueOrDefault<String>(
                                                                                                                            '${loanListItemListItem.contractDetails.loanTypeName}',
                                                                                                                            'loan_type_name',
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: 'Noto San Thai',
                                                                                                                                fontSize: 16.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.w600,
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
                                                                                                      if (loanListItemListItem.contractDetails.accountType != 'L')
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 8.0, 0.0),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Expanded(
                                                                                                                child: Container(
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                    child: Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                      children: [
                                                                                                                        Expanded(
                                                                                                                          child: Text(
                                                                                                                            'เลขที่สัญญา',
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  fontFamily: 'Noto San Thai',
                                                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                  fontSize: 14.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        Text(
                                                                                                                          '${loanListItemListItem.contractNo}',
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: 'Noto San Thai',
                                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.w600,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 8.0, 0.0),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Expanded(
                                                                                                              child: Container(
                                                                                                                decoration: BoxDecoration(),
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                    children: [
                                                                                                                      Expanded(
                                                                                                                        child: Text(
                                                                                                                          'ข้อมูลหลักประกัน',
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: 'Noto San Thai',
                                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.w600,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      Text(
                                                                                                                        '${loanListItemListItem.contractDetails.collateralInformation}',
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: 'Noto San Thai',
                                                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                              fontSize: 14.0,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              fontWeight: FontWeight.w600,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      if (loanListItemListItem.contractDetails.accountType != 'L')
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 8.0, 0.0),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              if (('${loanListItemListItem.contractDetails.loanTypeCode}' == 'L') || ('${loanListItemListItem.contractDetails.loanTypeCode}' == 'H') || (loanListItemListItem.topupDetail.canTopup == 'G') || (loanListItemListItem.topupDetail.canTopup == 'A'))
                                                                                                                Expanded(
                                                                                                                  child: Container(
                                                                                                                    decoration: BoxDecoration(),
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                      child: Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                        children: [
                                                                                                                          Expanded(
                                                                                                                            child: Text(
                                                                                                                              'ข้อมูลสถานะ',
                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                    fontFamily: 'Noto San Thai',
                                                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                    fontSize: 14.0,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                    fontWeight: FontWeight.w600,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Text(
                                                                                                                            '${loanListItemListItem.requestStatus}',
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  fontFamily: 'Noto San Thai',
                                                                                                                                  color: valueOrDefault<String>(
                                                                                                                                            FFAppState().getLoanListAPIResultAppState.elementAtOrNull(loanListItemListIndex)?.requestStatus,
                                                                                                                                            'request_status',
                                                                                                                                          ) ==
                                                                                                                                          'เอกสารไม่ครบติดต่อ 1652'
                                                                                                                                      ? FlutterFlowTheme.of(context).error
                                                                                                                                      : Colors.black,
                                                                                                                                  fontSize: 14.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          width: double.infinity,
                                                                                          height: 2.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).bg06,
                                                                                          ),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              if (loanListItemListItem.contractDetails.accountType != 'L')
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 8.0, 0.0),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Expanded(
                                                                                                        child: Container(
                                                                                                          decoration: BoxDecoration(),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                              children: [
                                                                                                                Expanded(
                                                                                                                  child: Text(
                                                                                                                    'วงเงินสินเชื่อเดิม',
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'Noto San Thai',
                                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                          fontSize: 14.0,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          fontWeight: FontWeight.w600,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Text(
                                                                                                                  '${loanListItemListItem.contractNo}',
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Noto San Thai',
                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                        fontSize: 14.0,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        fontWeight: FontWeight.w600,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 8.0, 0.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      child: Container(
                                                                                                        decoration: BoxDecoration(),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                            children: [
                                                                                                              Expanded(
                                                                                                                child: Text(
                                                                                                                  'ราคาประเมินปัจจุบัน',
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Noto San Thai',
                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                        fontSize: 14.0,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        fontWeight: FontWeight.w600,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Text(
                                                                                                                '${loanListItemListItem.contractDetails.collateralInformation}',
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Noto San Thai',
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                      fontSize: 14.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FontWeight.w600,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                              if (loanListItemListItem.contractDetails.accountType != 'L')
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 8.0, 0.0),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      if (('${loanListItemListItem.contractDetails.loanTypeCode}' == 'L') || ('${loanListItemListItem.contractDetails.loanTypeCode}' == 'H') || (loanListItemListItem.topupDetail.canTopup == 'G') || (loanListItemListItem.topupDetail.canTopup == 'A'))
                                                                                                        Expanded(
                                                                                                          child: Container(
                                                                                                            decoration: BoxDecoration(),
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                children: [
                                                                                                                  Expanded(
                                                                                                                    child: Text(
                                                                                                                      'วงเงินอนุมัติใหม่',
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: 'Noto San Thai',
                                                                                                                            color: Colors.black,
                                                                                                                            fontSize: 14.0,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            fontWeight: FontWeight.w600,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Text(
                                                                                                                    '${loanListItemListItem.requestStatus}',
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'Noto San Thai',
                                                                                                                          color: Colors.black,
                                                                                                                          fontSize: 15.0,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          fontWeight: FontWeight.w600,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              if ((double.parse('${loanListItemListItem.topupDetail.topupSpecials.toString()}') > 0.0) && ('${loanListItemListItem.topupDetail.topupSpecials.toString()}' != 'null') && ('${loanListItemListItem.topupDetail.topupSpecials.toString()}' != '') && ('${loanListItemListItem.topupDetail.canTopup}' != 'N') && (loanListItemListItem.contractDetails.accountType != 'L'))
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 8.0, 0.0),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                    children: [
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Icon(
                                                                                                            Icons.auto_awesome_outlined,
                                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                                            size: 20.0,
                                                                                                          ),
                                                                                                          Text(
                                                                                                            'วงเงินเพิ่มพิเศษ',
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Noto San Thai',
                                                                                                                  color: Color(0xFFFF0000),
                                                                                                                  fontSize: 14.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ].divide(SizedBox(width: 8.0)),
                                                                                                      ),
                                                                                                      Text(
                                                                                                        '+${valueOrDefault<String>(
                                                                                                          functions.returnNumberWithComma2Decimal(loanListItemListItem.topupDetail.topupSpecials.toString()),
                                                                                                          '0',
                                                                                                        )}',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Noto San Thai',
                                                                                                              color: Color(0xFFFF0000),
                                                                                                              fontSize: 14.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.w600,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 8.0, 12.0),
                                                                                                child: Container(
                                                                                                  width: double.infinity,
                                                                                                  height: 2.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              if (('${loanListItemListItem.topupDetail.canTopup}' == 'Y') && (loanListItemListItem.contractDetails.accountType != 'L'))
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 8.0, 0.0),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        'รวมเป็นวงเงินใหม่ที่คุณ\nขอรับได้เลยวันนี้',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Noto San Thai',
                                                                                                              color: Colors.black,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.w600,
                                                                                                            ),
                                                                                                      ),
                                                                                                      RichText(
                                                                                                        textScaler: MediaQuery.of(context).textScaler,
                                                                                                        text: TextSpan(
                                                                                                          children: [
                                                                                                            TextSpan(
                                                                                                              text: '${valueOrDefault<String>(
                                                                                                                functions.returnNumberWithComma2Decimal('${loanListItemListItem.topupDetail.defaultTopupAmount.toString()}'),
                                                                                                                '0',
                                                                                                              )}',
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Noto San Thai',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 24.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w600,
                                                                                                                  ),
                                                                                                            ),
                                                                                                            TextSpan(
                                                                                                              text: ' บาท',
                                                                                                              style: TextStyle(),
                                                                                                            )
                                                                                                          ],
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Noto San Thai',
                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                fontSize: 14.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 8.0, 12.0),
                                                                                                child: Container(
                                                                                                  width: double.infinity,
                                                                                                  height: 2.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              if (loanListItemListItem.contractDetails.accountType != 'L')
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 8.0, 12.0),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      if (('${loanListItemListItem.contractDetails.loanTypeCode}' == 'L') || ('${loanListItemListItem.contractDetails.loanTypeCode}' == 'H') || (loanListItemListItem.topupDetail.canTopup == 'G') || (loanListItemListItem.topupDetail.canTopup == 'A'))
                                                                                                        Expanded(
                                                                                                          child: Container(
                                                                                                            decoration: BoxDecoration(),
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                children: [
                                                                                                                  Expanded(
                                                                                                                    child: RichText(
                                                                                                                      textScaler: MediaQuery.of(context).textScaler,
                                                                                                                      text: TextSpan(
                                                                                                                        children: [
                                                                                                                          TextSpan(
                                                                                                                            text: 'ยอดปิดบัญชี ณ วันที่ ',
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  fontFamily: 'Noto San Thai',
                                                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                  fontSize: 13.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                          TextSpan(
                                                                                                                            text: valueOrDefault<String>(
                                                                                                                              functions.formatToThaiDateWithMonth(loanListItemListItem.dataDate, false),
                                                                                                                              '24 มิ.ย. 2569',
                                                                                                                            ),
                                                                                                                            style: TextStyle(
                                                                                                                              color: Colors.black,
                                                                                                                              fontWeight: FontWeight.w600,
                                                                                                                              fontSize: 13.0,
                                                                                                                            ),
                                                                                                                          )
                                                                                                                        ],
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: 'Noto San Thai',
                                                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                              fontSize: 13.0,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              fontWeight: FontWeight.w600,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Text(
                                                                                                                    '-${functions.returnNumberWithCommaFullNumber(loanListItemListItem.topupDetail.balanceReceivable.toString(), '0')} บาท',
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'Noto San Thai',
                                                                                                                          color: valueOrDefault<String>(
                                                                                                                                    FFAppState().getLoanListAPIResultAppState.elementAtOrNull(loanListItemListIndex)?.requestStatus,
                                                                                                                                    'request_status',
                                                                                                                                  ) ==
                                                                                                                                  'เอกสารไม่ครบติดต่อ 1652'
                                                                                                                              ? FlutterFlowTheme.of(context).error
                                                                                                                              : Colors.black,
                                                                                                                          fontSize: 13.0,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          fontWeight: FontWeight.w600,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 8.0, 0.0),
                                                                                                child: Container(
                                                                                                  width: double.infinity,
                                                                                                  height: 45.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).bg03,
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                    border: Border.all(
                                                                                                      color: FlutterFlowTheme.of(context).border03,
                                                                                                      width: 2.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: [
                                                                                                        Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            FaIcon(
                                                                                                              FontAwesomeIcons.moneyBillAlt,
                                                                                                              color: FlutterFlowTheme.of(context).text03,
                                                                                                              size: 18.0,
                                                                                                            ),
                                                                                                            Text(
                                                                                                              'เงินคงเหลือโอนเข้าบัญชี',
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Noto San Thai',
                                                                                                                    color: FlutterFlowTheme.of(context).text03,
                                                                                                                    fontSize: 13.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w600,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ].divide(SizedBox(width: 8.0)),
                                                                                                        ),
                                                                                                        Text(
                                                                                                          '${functions.returnNumberWithCommaFullNumber('${loanListItemListItem.topupDetail.defaultTransferAmount.toString()}', '')} บาท',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Noto San Thai',
                                                                                                                color: FlutterFlowTheme.of(context).text03,
                                                                                                                fontSize: 15.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ].addToStart(SizedBox(height: 8.0)).addToEnd(SizedBox(height: 16.0)),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          width: double.infinity,
                                                                                          height: 2.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 8.0, 12.0),
                                                                                          child: Container(
                                                                                            width: double.infinity,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).bg04,
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                              border: Border.all(
                                                                                                color: FlutterFlowTheme.of(context).border04,
                                                                                                width: 2.0,
                                                                                              ),
                                                                                            ),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                    children: [
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Icon(
                                                                                                            Icons.shopping_bag_outlined,
                                                                                                            color: FlutterFlowTheme.of(context).text04,
                                                                                                            size: 22.0,
                                                                                                          ),
                                                                                                          Text(
                                                                                                            'สิทธิพิเศษเฉพาะคุณ',
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Noto San Thai',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 15.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ].divide(SizedBox(width: 8.0)),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                    children: [
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Icon(
                                                                                                            Icons.arrow_upward_outlined,
                                                                                                            color: FlutterFlowTheme.of(context).text04,
                                                                                                            size: 18.0,
                                                                                                          ),
                                                                                                          Text(
                                                                                                            'ใช้เงินก้อนเดียวกับข้อเสนอด้านบน',
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Noto San Thai',
                                                                                                                  color: Color(0xFF0E8C86),
                                                                                                                  fontSize: 12.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ].divide(SizedBox(width: 8.0)),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Expanded(
                                                                                                        child: Container(
                                                                                                          width: 100.0,
                                                                                                          height: 80.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                            border: Border.all(
                                                                                                              color: FlutterFlowTheme.of(context).border05,
                                                                                                              width: 2.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Icon(
                                                                                                                Icons.phone_iphone,
                                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                                size: 24.0,
                                                                                                              ),
                                                                                                              Text(
                                                                                                                'ซื้อมือถือ',
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Noto San Thai',
                                                                                                                      fontSize: 13.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FontWeight.w600,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ].divide(SizedBox(height: 4.0)).addToStart(SizedBox(height: 8.0)),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Expanded(
                                                                                                        child: Container(
                                                                                                          width: 100.0,
                                                                                                          height: 80.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                            border: Border.all(
                                                                                                              color: FlutterFlowTheme.of(context).border05,
                                                                                                              width: 2.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                                            children: [
                                                                                                              FaIcon(
                                                                                                                FontAwesomeIcons.coins,
                                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                                size: 24.0,
                                                                                                              ),
                                                                                                              Text(
                                                                                                                'ซื้อทอง',
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Noto San Thai',
                                                                                                                      fontSize: 13.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FontWeight.w600,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ].divide(SizedBox(height: 4.0)).addToStart(SizedBox(height: 8.0)),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Expanded(
                                                                                                        child: Container(
                                                                                                          width: 100.0,
                                                                                                          height: 80.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                            border: Border.all(
                                                                                                              color: FlutterFlowTheme.of(context).border05,
                                                                                                              width: 2.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Icon(
                                                                                                                Icons.shopping_bag_outlined,
                                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                                size: 24.0,
                                                                                                              ),
                                                                                                              Text(
                                                                                                                'ใช้จ่าย\nอเนกประสงค์',
                                                                                                                textAlign: TextAlign.center,
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Noto San Thai',
                                                                                                                      fontSize: 13.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FontWeight.w600,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ].divide(SizedBox(height: 4.0)).addToStart(SizedBox(height: 8.0)),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ].divide(SizedBox(width: 8.0)),
                                                                                                  ),
                                                                                                ),
                                                                                              ].divide(SizedBox(height: 4.0)).addToStart(SizedBox(height: 8.0)).addToEnd(SizedBox(height: 8.0)),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 8.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              if (('${loanListItemListItem.contractDetails.loanTypeCode}' == 'L') && ('${loanListItemListItem.contractDetails.loanTypeCode}' == 'H') && false)
                                                                                                Expanded(
                                                                                                  child: Container(
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                        children: [
                                                                                                          Expanded(
                                                                                                            child: Text(
                                                                                                              'กลุ่มสินค้า',
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Noto San Thai',
                                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                    fontSize: 14.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Text(
                                                                                                            valueOrDefault<String>(
                                                                                                              FFAppState().getLoanListAPIResultAppState.elementAtOrNull(loanListItemListIndex)?.contractDetails.vehicleBrand,
                                                                                                              'vehicle_brand',
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Noto San Thai',
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                  fontSize: 14.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        if (loanListItemListItem.contractDetails.accountType != 'L')
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 8.0, 0.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                if ('${loanListItemListItem.topupDetail.topupExtra.toString()}' != '0')
                                                                                                  Expanded(
                                                                                                    child: Container(
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              'วงเงินเพิ่มพิเศษ',
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Noto San Thai',
                                                                                                                    color: Color(0xFFFF0000),
                                                                                                                    fontSize: 14.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w600,
                                                                                                                  ),
                                                                                                            ),
                                                                                                            Text(
                                                                                                              '${valueOrDefault<String>(
                                                                                                                functions.returnNumberWithComma2Decimal(loanListItemListItem.topupDetail.topupExtra.toString()),
                                                                                                                '0',
                                                                                                              )}',
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Noto San Thai',
                                                                                                                    color: Color(0xFFFF0000),
                                                                                                                    fontSize: 14.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w600,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        if (loanListItemListItem.contractDetails.accountType != 'L')
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                if ((double.parse('${loanListItemListItem.topupDetail.topupSpecials.toString()}') > 0.0) && ('${loanListItemListItem.topupDetail.topupSpecials.toString()}' != 'null') && ('${loanListItemListItem.topupDetail.topupSpecials.toString()}' != '') && ('${loanListItemListItem.topupDetail.canTopup}' != 'N'))
                                                                                                  Expanded(
                                                                                                    child: Container(
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                        boxShadow: [
                                                                                                          BoxShadow(
                                                                                                            blurRadius: 10.0,
                                                                                                            color: Color(0x33000000),
                                                                                                            offset: Offset(
                                                                                                              2.0,
                                                                                                              2.0,
                                                                                                            ),
                                                                                                          )
                                                                                                        ],
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        if ((('${loanListItemListItem.contractDetails.loanTypeCode}' == 'L') || ('${loanListItemListItem.contractDetails.loanTypeCode}' == 'H') || (loanListItemListItem.topupDetail.canTopup == 'G') || (loanListItemListItem.topupDetail.canTopup == 'A') || (loanListItemListItem.topupDetail.canTopup == 'L')) && (loanListItemListItem.topupDetail.canTopup != 'N') && false)
                                                                                          Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Expanded(
                                                                                                child: Container(
                                                                                                  width: double.infinity,
                                                                                                  decoration: BoxDecoration(),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          'ยังไม่สามารถทำรายการผ่านแอปได้',
                                                                                                          textAlign: TextAlign.start,
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Noto San Thai',
                                                                                                                color: Color(0xFFFF0000),
                                                                                                                fontSize: 14.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Expanded(
                                                                                                child: Container(
                                                                                                  width: double.infinity,
                                                                                                  decoration: BoxDecoration(),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          'กรุณาติดต่อสาขาเจ้าของบัญชีหรือสาขาใกล้บ้าน',
                                                                                                          textAlign: TextAlign.start,
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Noto San Thai',
                                                                                                                color: Color(0xFFFF0000),
                                                                                                                fontSize: 14.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Expanded(
                                                                                                child: Container(
                                                                                                  width: double.infinity,
                                                                                                  decoration: BoxDecoration(),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          'เพื่อทำสัญญาและรับเงิน',
                                                                                                          textAlign: TextAlign.start,
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Noto San Thai',
                                                                                                                color: Color(0xFFFF0000),
                                                                                                                fontSize: 14.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Divider(
                                                                                thickness: 2.0,
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                              ),
                                                                              if ('${loanListItemListItem.topupDetail.canTopup}' != 'Y')
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 20.0, 12.0, 20.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Builder(
                                                                                          builder: (context) {
                                                                                            if (loanListItemListItem.contractDetails.accountType == 'L') {
                                                                                              return Container(
                                                                                                width: double.infinity,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                                  boxShadow: [
                                                                                                    BoxShadow(
                                                                                                      blurRadius: 10.0,
                                                                                                      color: Color(0x33000000),
                                                                                                      offset: Offset(
                                                                                                        2.0,
                                                                                                        2.0,
                                                                                                      ),
                                                                                                    )
                                                                                                  ],
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 16.0, 12.0, 16.0),
                                                                                                  child: Text(
                                                                                                    loanListItemListItem.contractDetails.accountTypeMsg,
                                                                                                    textAlign: TextAlign.center,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Noto San Thai',
                                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            } else if (loanListItemListItem.topupDetail.canTopupMsg != '') {
                                                                                              return Container(
                                                                                                width: double.infinity,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                                  boxShadow: [
                                                                                                    BoxShadow(
                                                                                                      blurRadius: 10.0,
                                                                                                      color: Color(0x33000000),
                                                                                                      offset: Offset(
                                                                                                        2.0,
                                                                                                        2.0,
                                                                                                      ),
                                                                                                    )
                                                                                                  ],
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 16.0, 12.0, 16.0),
                                                                                                  child: Text(
                                                                                                    loanListItemListItem.topupDetail.canTopupMsg,
                                                                                                    textAlign: TextAlign.center,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Noto San Thai',
                                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            } else {
                                                                                              return Container(
                                                                                                width: double.infinity,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                                  boxShadow: [
                                                                                                    BoxShadow(
                                                                                                      blurRadius: 10.0,
                                                                                                      color: Color(0x33000000),
                                                                                                      offset: Offset(
                                                                                                        2.0,
                                                                                                        2.0,
                                                                                                      ),
                                                                                                    )
                                                                                                  ],
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 16.0, 12.0, 16.0),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Container(
                                                                                                        width: double.infinity,
                                                                                                        decoration: BoxDecoration(),
                                                                                                        child: Text(
                                                                                                          topupCardPageApplicationRecord.topupNoDataText,
                                                                                                          textAlign: TextAlign.center,
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Noto San Thai',
                                                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Container(
                                                                                                        width: double.infinity,
                                                                                                        decoration: BoxDecoration(),
                                                                                                        child: Text(
                                                                                                          topupCardPageApplicationRecord.topupNoData2Text,
                                                                                                          textAlign: TextAlign.center,
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Noto San Thai',
                                                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ].divide(SizedBox(height: 4.0)),
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            }
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              if (loanListItemListItem.contractDetails.accountType != 'L')
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                                    children: [
                                                                                      if ((double.parse('${loanListItemListItem.topupDetail.topupSpecials.toString()}') > 0.0) && ('${loanListItemListItem.topupDetail.topupSpecials.toString()}' != 'null') && ('${loanListItemListItem.topupDetail.topupSpecials.toString()}' != '') && ('${loanListItemListItem.topupDetail.canTopup}' != 'N'))
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                          child: InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              if (loanListItemListItem.contractDetails.accountType == 'L') {
                                                                                                return;
                                                                                              }
                                                                                              FFAppState().getLoanListSelected = loanListItemListItem;
                                                                                              safeSetState(() {});
                                                                                              FFAppState().updateGetLoanListSelectedStruct(
                                                                                                (e) => e..topupSpecialFlag = true,
                                                                                              );
                                                                                              safeSetState(() {});
                                                                                              if ('${loanListItemListItem.topupDetail.topupSpecials.toString()}' == '0') {
                                                                                                await showDialog(
                                                                                                  context: context,
                                                                                                  builder: (alertDialogContext) {
                                                                                                    return AlertDialog(
                                                                                                      content: Text('ไปหน้าLoan Detail'),
                                                                                                      actions: [
                                                                                                        TextButton(
                                                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                          child: Text('Ok'),
                                                                                                        ),
                                                                                                      ],
                                                                                                    );
                                                                                                  },
                                                                                                );

                                                                                                context.pushNamed(
                                                                                                  LoanDetailPageWidget.routeName,
                                                                                                  queryParameters: {
                                                                                                    'hashThaiId': serializeParam(
                                                                                                      FFAppState().hashThaiIdAppState,
                                                                                                      ParamType.String,
                                                                                                    ),
                                                                                                    'contNo': serializeParam(
                                                                                                      loanListItemListItem.contractNo,
                                                                                                      ParamType.String,
                                                                                                    ),
                                                                                                    'token': serializeParam(
                                                                                                      FFAppState().accessToken,
                                                                                                      ParamType.String,
                                                                                                    ),
                                                                                                    'fromPage': serializeParam(
                                                                                                      'TopupCard',
                                                                                                      ParamType.String,
                                                                                                    ),
                                                                                                  }.withoutNulls,
                                                                                                );

                                                                                                return;
                                                                                              }
                                                                                              if (FFAppState().getLoanListSelected.requestStatus == 'ยังไม่ได้ทำรายการเติมเงิน' ? true : false) {
                                                                                                context.pushNamed(SelectTopupPurposePageWidget.routeName);
                                                                                              } else {
                                                                                                context.pushNamed(
                                                                                                  TopupStatusPageWidget.routeName,
                                                                                                  queryParameters: {
                                                                                                    'fromPage': serializeParam(
                                                                                                      'LoanListCard',
                                                                                                      ParamType.String,
                                                                                                    ),
                                                                                                  }.withoutNulls,
                                                                                                  extra: <String, dynamic>{
                                                                                                    '__transition_info__': TransitionInfo(
                                                                                                      hasTransition: true,
                                                                                                      transitionType: PageTransitionType.rightToLeft,
                                                                                                    ),
                                                                                                  },
                                                                                                );
                                                                                              }
                                                                                            },
                                                                                            child: Container(
                                                                                              width: valueOrDefault<double>(
                                                                                                ('${valueOrDefault<String>(
                                                                                                              FFAppState().getLoanListAPIResultAppState.elementAtOrNull(loanListItemListIndex)?.requestStatus,
                                                                                                              'default_topup_amount',
                                                                                                            )}' !=
                                                                                                            'ยังไม่ได้ทำรายการเติมเงิน'
                                                                                                        ? 150
                                                                                                        : 100)
                                                                                                    .toDouble(),
                                                                                                150.0,
                                                                                              ),
                                                                                              height: 50.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).success,
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              child: Align(
                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                child: Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    _model.tabSelested == 1
                                                                                                        ? valueOrDefault<String>(
                                                                                                            '${loanListItemListItem.requestStatus}' != 'ยังไม่ได้ทำรายการเติมเงิน' ? 'ตรวจสอบสถานะ' : 'วงเงินพิเศษ',
                                                                                                            'วงเงินฉุกเฉิน',
                                                                                                          )
                                                                                                        : 'รายละเอียด',
                                                                                                    'วงเงินฉุกเฉิน',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Noto San Thai',
                                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                        fontSize: 16.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                        child: InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            if (loanListItemListItem.contractDetails.accountType == 'L') {
                                                                                              return;
                                                                                            }
                                                                                            FFAppState().getLoanListSelected = loanListItemListItem;
                                                                                            safeSetState(() {});
                                                                                            FFAppState().updateGetLoanListSelectedStruct(
                                                                                              (e) => e..topupSpecialFlag = false,
                                                                                            );
                                                                                            safeSetState(() {});
                                                                                            if ('${loanListItemListItem.topupDetail.canTopup}' == 'N') {
                                                                                              await showDialog(
                                                                                                context: context,
                                                                                                builder: (alertDialogContext) {
                                                                                                  return AlertDialog(
                                                                                                    content: Text('ไปหน้าLoan Detail'),
                                                                                                    actions: [
                                                                                                      TextButton(
                                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                        child: Text('Ok'),
                                                                                                      ),
                                                                                                    ],
                                                                                                  );
                                                                                                },
                                                                                              );

                                                                                              context.pushNamed(
                                                                                                LoanDetailPageWidget.routeName,
                                                                                                queryParameters: {
                                                                                                  'hashThaiId': serializeParam(
                                                                                                    FFAppState().hashThaiIdAppState,
                                                                                                    ParamType.String,
                                                                                                  ),
                                                                                                  'contNo': serializeParam(
                                                                                                    loanListItemListItem.contractNo,
                                                                                                    ParamType.String,
                                                                                                  ),
                                                                                                  'token': serializeParam(
                                                                                                    FFAppState().accessToken,
                                                                                                    ParamType.String,
                                                                                                  ),
                                                                                                  'fromPage': serializeParam(
                                                                                                    'TopupCard',
                                                                                                    ParamType.String,
                                                                                                  ),
                                                                                                }.withoutNulls,
                                                                                              );

                                                                                              return;
                                                                                            }
                                                                                            if (FFAppState().getLoanListSelected.requestStatus == 'ยังไม่ได้ทำรายการเติมเงิน' ? true : false) {
                                                                                              context.pushNamed(SelectTopupPurposePageWidget.routeName);
                                                                                            } else {
                                                                                              context.pushNamed(
                                                                                                TopupStatusPageWidget.routeName,
                                                                                                queryParameters: {
                                                                                                  'fromPage': serializeParam(
                                                                                                    'LoanListCard',
                                                                                                    ParamType.String,
                                                                                                  ),
                                                                                                }.withoutNulls,
                                                                                                extra: <String, dynamic>{
                                                                                                  '__transition_info__': TransitionInfo(
                                                                                                    hasTransition: true,
                                                                                                    transitionType: PageTransitionType.rightToLeft,
                                                                                                  ),
                                                                                                },
                                                                                              );
                                                                                            }
                                                                                          },
                                                                                          child: Container(
                                                                                            width: valueOrDefault<double>(
                                                                                              ('${valueOrDefault<String>(
                                                                                                            FFAppState().getLoanListAPIResultAppState.elementAtOrNull(loanListItemListIndex)?.requestStatus,
                                                                                                            'default_topup_amount',
                                                                                                          )}' !=
                                                                                                          'ยังไม่ได้ทำรายการเติมเงิน'
                                                                                                      ? 150
                                                                                                      : 100)
                                                                                                  .toDouble(),
                                                                                              150.0,
                                                                                            ),
                                                                                            height: 50.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).accent2,
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            child: Align(
                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                              child: Text(
                                                                                                valueOrDefault<String>(
                                                                                                  '${loanListItemListItem.topupDetail.canTopup}' != 'N'
                                                                                                      ? valueOrDefault<String>(
                                                                                                          '${loanListItemListItem.requestStatus}' != 'ยังไม่ได้ทำรายการเติมเงิน' ? 'ตรวจสอบสถานะ' : 'เติมวงเงิน',
                                                                                                          'เติมวงเงิน',
                                                                                                        )
                                                                                                      : 'รายละเอียด',
                                                                                                  'เติมวงเงิน',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Noto San Thai',
                                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                      fontSize: 16.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ].divide(SizedBox(width: 8.0)),
                                                                                  ),
                                                                                ),
                                                                            ].addToEnd(SizedBox(height: 4.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, -1.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        16.0),
                                                            child: smooth_page_indicator
                                                                .SmoothPageIndicator(
                                                              controller: _model
                                                                      .pageViewController ??=
                                                                  PageController(
                                                                      initialPage: max(
                                                                          0,
                                                                          min(0,
                                                                              loanListItemList.length - 1))),
                                                              count:
                                                                  loanListItemList
                                                                      .length,
                                                              axisDirection: Axis
                                                                  .horizontal,
                                                              onDotClicked:
                                                                  (i) async {
                                                                await _model
                                                                    .pageViewController!
                                                                    .animateToPage(
                                                                  i,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          500),
                                                                  curve: Curves
                                                                      .ease,
                                                                );
                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              effect: smooth_page_indicator
                                                                  .ExpandingDotsEffect(
                                                                expansionFactor:
                                                                    2.0,
                                                                spacing: 8.0,
                                                                radius: 8.0,
                                                                dotWidth: 8.0,
                                                                dotHeight: 8.0,
                                                                dotColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent1,
                                                                activeDotColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .cardHeader,
                                                                paintStyle:
                                                                    PaintingStyle
                                                                        .fill,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        StreamBuilder<TopupProductConfigRecord>(
                                          stream: TopupProductConfigRecord
                                              .getDocument(FFAppState()
                                                  .topupProductConfig!),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }

                                            final carouselTopupProductConfigRecord =
                                                snapshot.data!;

                                            return Builder(
                                              builder: (context) {
                                                final loanListCarouselItem =
                                                    (true
                                                                ? SrisawadApiGroup
                                                                    .getListOfLoanCall
                                                                    .results(
                                                                      columnGetListOfLoanResponse
                                                                          .jsonBody,
                                                                    )
                                                                    ?.where((e) =>
                                                                        e.contractDetails
                                                                            .accountStatus ==
                                                                        'A')
                                                                    .toList()
                                                                : (_model.tabSelested ==
                                                                        1
                                                                    ? SrisawadApiGroup
                                                                        .getListOfLoanCall
                                                                        .results(
                                                                          columnGetListOfLoanResponse
                                                                              .jsonBody,
                                                                        )
                                                                        ?.where((e) =>
                                                                            (e.topupDetail.canTopup !=
                                                                                'N') &&
                                                                            (e.contractDetails.accountStatus ==
                                                                                'A'))
                                                                        .toList()
                                                                    : SrisawadApiGroup
                                                                        .getListOfLoanCall
                                                                        .results(
                                                                          columnGetListOfLoanResponse
                                                                              .jsonBody,
                                                                        )
                                                                        ?.where((e) =>
                                                                            (e.topupDetail.canTopup ==
                                                                                'N') &&
                                                                            (e.contractDetails.accountStatus ==
                                                                                'A'))
                                                                        .toList()))
                                                            ?.toList() ??
                                                        [];
                                                if (loanListCarouselItem
                                                    .isEmpty) {
                                                  return Container(
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    child:
                                                        EmptyComponentTopupWidget(
                                                      text1:
                                                          topupCardPageApplicationRecord
                                                              .topupNoDataText,
                                                      text2:
                                                          topupCardPageApplicationRecord
                                                              .topupNoData2Text,
                                                    ),
                                                  );
                                                }

                                                return Container(
                                                  width: double.infinity,
                                                  height: 1200.0,
                                                  child: CarouselSlider.builder(
                                                    itemCount:
                                                        loanListCarouselItem
                                                            .length,
                                                    itemBuilder: (context,
                                                        loanListCarouselItemIndex,
                                                        _) {
                                                      final loanListCarouselItemItem =
                                                          loanListCarouselItem[
                                                              loanListCarouselItemIndex];
                                                      return Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, -1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      24.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: InkWell(
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
                                                              if (!(((String
                                                                          amount) {
                                                                    return double.parse(
                                                                            amount) <=
                                                                        0.0;
                                                                  }(
                                                                      '${loanListCarouselItemItem.topupDetail.topupSpecials.toString()}')) ||
                                                                  ('${loanListCarouselItemItem.topupDetail.topupSpecials.toString()}' ==
                                                                      'null') ||
                                                                  ('${loanListCarouselItemItem.topupDetail.topupSpecials.toString()}' ==
                                                                      ''))) {
                                                                return;
                                                              }
                                                              if (loanListCarouselItemItem
                                                                      .contractDetails
                                                                      .accountType ==
                                                                  'L') {
                                                                return;
                                                              }
                                                              FFAppState()
                                                                      .getLoanListSelected =
                                                                  loanListCarouselItemItem;
                                                              safeSetState(
                                                                  () {});
                                                              FFAppState()
                                                                  .updateGetLoanListSelectedStruct(
                                                                (e) => e
                                                                  ..topupSpecialFlag =
                                                                      false,
                                                              );
                                                              safeSetState(
                                                                  () {});
                                                              if ('${loanListCarouselItemItem.contractDetails.canTopup}' ==
                                                                  'N') {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      content: Text(
                                                                          'ไปหน้าLoan Detail'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );

                                                                context
                                                                    .pushNamed(
                                                                  LoanDetailPageWidget
                                                                      .routeName,
                                                                  queryParameters:
                                                                      {
                                                                    'hashThaiId':
                                                                        serializeParam(
                                                                      FFAppState()
                                                                          .hashThaiIdAppState,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'contNo':
                                                                        serializeParam(
                                                                      loanListCarouselItemItem
                                                                          .contractNo,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'token':
                                                                        serializeParam(
                                                                      FFAppState()
                                                                          .accessToken,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'fromPage':
                                                                        serializeParam(
                                                                      'TopupCard',
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );

                                                                return;
                                                              }
                                                              if (FFAppState()
                                                                          .getLoanListSelected
                                                                          .requestStatus ==
                                                                      'ยังไม่ได้ทำรายการเติมเงิน'
                                                                  ? true
                                                                  : false) {
                                                                context.pushNamed(
                                                                    SelectTopupPurposePageWidget
                                                                        .routeName);
                                                              } else {
                                                                context
                                                                    .pushNamed(
                                                                  TopupStatusPageWidget
                                                                      .routeName,
                                                                  queryParameters:
                                                                      {
                                                                    'fromPage':
                                                                        serializeParam(
                                                                      'LoanListCard',
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                  }.withoutNulls,
                                                                  extra: <String,
                                                                      dynamic>{
                                                                    '__transition_info__':
                                                                        TransitionInfo(
                                                                      hasTransition:
                                                                          true,
                                                                      transitionType:
                                                                          PageTransitionType
                                                                              .rightToLeft,
                                                                    ),
                                                                  },
                                                                );
                                                              }
                                                            },
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          15.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          15.0),
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          15.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          15.0),
                                                                ),
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            4.0,
                                                                        color: Color(
                                                                            0x33000000),
                                                                        offset:
                                                                            Offset(
                                                                          2.0,
                                                                          2.0,
                                                                        ),
                                                                      )
                                                                    ],
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .border04,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Builder(
                                                                                  builder: (context) {
                                                                                    if (loanListCarouselItemItem.topupDetail.canTopup == 'N') {
                                                                                      return Container(
                                                                                        width: double.infinity,
                                                                                        decoration: BoxDecoration(
                                                                                          color: Color(0xFFF1EFE8),
                                                                                          borderRadius: BorderRadius.only(
                                                                                            topLeft: Radius.circular(15.0),
                                                                                            topRight: Radius.circular(15.0),
                                                                                          ),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                          child: IntrinsicHeight(
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Align(
                                                                                                  alignment: AlignmentDirectional(0.0, -1.0),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Container(
                                                                                                        width: 45.0,
                                                                                                        height: 45.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: Color(0xFFFFF3EA),
                                                                                                          borderRadius: BorderRadius.circular(30.0),
                                                                                                        ),
                                                                                                        child: Icon(
                                                                                                          Icons.warning_amber_rounded,
                                                                                                          color: FlutterFlowTheme.of(context).text05,
                                                                                                          size: 28.0,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ].addToStart(SizedBox(height: 8.0)),
                                                                                                  ),
                                                                                                ),
                                                                                                Expanded(
                                                                                                  child: Container(
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Expanded(
                                                                                                                  child: Container(
                                                                                                                    decoration: BoxDecoration(),
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                      child: Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                        children: [
                                                                                                                          Expanded(
                                                                                                                            child: Text(
                                                                                                                              'ยังไม่สามารถเติมวงเงินได้ในขณะนี้',
                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                    fontFamily: 'Noto San Thai',
                                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                    fontSize: 12.0,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                    fontWeight: FontWeight.w900,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                          Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Expanded(
                                                                                                                child: Container(
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                    child: Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                      children: [
                                                                                                                        Expanded(
                                                                                                                          child: Text(
                                                                                                                            loanListCarouselItemItem.topupDetail.canTopupMsg,
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  fontFamily: 'Noto San Thai',
                                                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                  fontSize: 11.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                          Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Expanded(
                                                                                                                child: Container(
                                                                                                                  width: double.infinity,
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                                                                                                    child: Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                      children: [
                                                                                                                        Flexible(
                                                                                                                          child: Text(
                                                                                                                            'ติดต่อสาขาเพื่อขอคำแนะนำ',
                                                                                                                            textAlign: TextAlign.start,
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  fontFamily: 'Noto San Thai',
                                                                                                                                  color: FlutterFlowTheme.of(context).cardHeader,
                                                                                                                                  fontSize: 9.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        Align(
                                                                                                                          alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                                                          child: Icon(
                                                                                                                            Icons.navigate_next_sharp,
                                                                                                                            color: FlutterFlowTheme.of(context).cardHeader,
                                                                                                                            size: 14.0,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ].divide(SizedBox(width: 4.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ].addToStart(SizedBox(height: 8.0)).addToEnd(SizedBox(height: 16.0)),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    } else if (loanListCarouselItemItem.topupDetail.products.length > 0) {
                                                                                      return Stack(
                                                                                        children: [
                                                                                          Container(
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).cardHeader,
                                                                                              borderRadius: BorderRadius.only(
                                                                                                topLeft: Radius.circular(15.0),
                                                                                                topRight: Radius.circular(15.0),
                                                                                              ),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  if (((double.parse('${loanListCarouselItemItem.topupDetail.topupSpecials.toString()}') > 0.0) && ('${loanListCarouselItemItem.topupDetail.topupSpecials.toString()}' != 'null') && ('${loanListCarouselItemItem.topupDetail.topupSpecials.toString()}' != '') && ('${loanListCarouselItemItem.topupDetail.canTopup}' != 'N') && (loanListCarouselItemItem.contractDetails.accountType != 'L')) || true)
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                        children: [
                                                                                                          Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Icon(
                                                                                                                Icons.auto_awesome_outlined,
                                                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                                                size: 18.0,
                                                                                                              ),
                                                                                                              Text(
                                                                                                                'ข้อเสนอพิเศษสำหรับคุณ',
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Noto San Thai',
                                                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                                                      fontSize: 13.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FontWeight.w600,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ].divide(SizedBox(width: 8.0)),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Expanded(
                                                                                                          child: Container(
                                                                                                            decoration: BoxDecoration(),
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                children: [
                                                                                                                  Expanded(
                                                                                                                    child: Text(
                                                                                                                      'รับเงินโอนเข้าบัญชีสูงสุด',
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: 'Noto San Thai',
                                                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                                                            fontSize: 14.0,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            fontWeight: FontWeight.w600,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Expanded(
                                                                                                        child: Container(
                                                                                                          decoration: BoxDecoration(),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                              children: [
                                                                                                                Expanded(
                                                                                                                  child: RichText(
                                                                                                                    textScaler: MediaQuery.of(context).textScaler,
                                                                                                                    text: TextSpan(
                                                                                                                      children: [
                                                                                                                        TextSpan(
                                                                                                                          text: 'สูงสุด  ',
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: 'Noto San Thai',
                                                                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                        TextSpan(
                                                                                                                          text: valueOrDefault<String>(
                                                                                                                            functions.returnNumberWithCommaFullNumber('${loanListCarouselItemItem.topupDetail.defaultTransferAmount.toString()}', '0'),
                                                                                                                            '0',
                                                                                                                          ),
                                                                                                                          style: TextStyle(
                                                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                                                            fontWeight: FontWeight.w900,
                                                                                                                            fontSize: 24.0,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        TextSpan(
                                                                                                                          text: '  บาท',
                                                                                                                          style: TextStyle(),
                                                                                                                        )
                                                                                                                      ],
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: 'Noto San Thai',
                                                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                                                            fontSize: 14.0,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            fontWeight: FontWeight.w600,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Expanded(
                                                                                                    child: Container(
                                                                                                      height: 100.0,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          children: [
                                                                                                            Expanded(
                                                                                                              child: Container(
                                                                                                                width: 100.0,
                                                                                                                height: 80.0,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: FlutterFlowTheme.of(context).bg05,
                                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                                  border: Border.all(
                                                                                                                    color: FlutterFlowTheme.of(context).border06,
                                                                                                                    width: 2.0,
                                                                                                                  ),
                                                                                                                ),
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          Text(
                                                                                                                            'ทางเลือก 1',
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  fontFamily: 'Noto San Thai',
                                                                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                                                                  fontSize: 12.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                      Container(
                                                                                                                        width: double.infinity,
                                                                                                                        decoration: BoxDecoration(),
                                                                                                                        child: Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          children: [
                                                                                                                            Expanded(
                                                                                                                              child: Text(
                                                                                                                                'รับเงินเข้าบัญชีทันที',
                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                      fontFamily: 'Noto San Thai',
                                                                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                      fontWeight: FontWeight.w600,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ].divide(SizedBox(height: 4.0)).addToStart(SizedBox(height: 8.0)),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            Expanded(
                                                                                                              child: Container(
                                                                                                                width: 100.0,
                                                                                                                height: 80.0,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: FlutterFlowTheme.of(context).bg05,
                                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                                  border: Border.all(
                                                                                                                    color: FlutterFlowTheme.of(context).border06,
                                                                                                                    width: 2.0,
                                                                                                                  ),
                                                                                                                ),
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          Text(
                                                                                                                            'ทางเลือก 2',
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  fontFamily: 'Noto San Thai',
                                                                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                                                                  fontSize: 12.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                      Container(
                                                                                                                        width: double.infinity,
                                                                                                                        decoration: BoxDecoration(),
                                                                                                                        child: Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          children: [
                                                                                                                            Expanded(
                                                                                                                              child: Text(
                                                                                                                                'แลกใช้วงเงินเพื่อสิทธิพิเศษเฉพาะคุณ',
                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                      fontFamily: 'Noto San Thai',
                                                                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                      fontWeight: FontWeight.w600,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ].divide(SizedBox(height: 4.0)).addToStart(SizedBox(height: 8.0)),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ].divide(SizedBox(width: 8.0)),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      if (('${loanListCarouselItemItem.contractDetails.loanTypeCode}' == 'L') || ('${loanListCarouselItemItem.contractDetails.loanTypeCode}' == 'H') || (loanListCarouselItemItem.topupDetail.canTopup == 'G') || (loanListCarouselItemItem.topupDetail.canTopup == 'A'))
                                                                                                        Expanded(
                                                                                                          child: Container(
                                                                                                            width: double.infinity,
                                                                                                            decoration: BoxDecoration(),
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                children: [
                                                                                                                  Expanded(
                                                                                                                    child: Text(
                                                                                                                      '*เงินคงเหลือจากการปิดสัญญาเดิมแล้ว',
                                                                                                                      textAlign: TextAlign.start,
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: 'Noto San Thai',
                                                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                                                            fontSize: 11.0,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            fontWeight: FontWeight.w600,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ].divide(SizedBox(width: 8.0)),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ].addToStart(SizedBox(height: 16.0)).addToEnd(SizedBox(height: 16.0)),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(1.0, -1.0),
                                                                                            child: FaIcon(
                                                                                              FontAwesomeIcons.star,
                                                                                              color: FlutterFlowTheme.of(context).starColor,
                                                                                              size: 75.0,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    } else {
                                                                                      return Container(
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).cardHeader,
                                                                                          borderRadius: BorderRadius.only(
                                                                                            topLeft: Radius.circular(15.0),
                                                                                            topRight: Radius.circular(15.0),
                                                                                          ),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 8.0, 0.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      child: Container(
                                                                                                        decoration: BoxDecoration(),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      child: Container(
                                                                                                        decoration: BoxDecoration(),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                            children: [
                                                                                                              Expanded(
                                                                                                                child: Text(
                                                                                                                  'รับเงินโอนเข้าบัญชีสูงสุด',
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Noto San Thai',
                                                                                                                        color: FlutterFlowTheme.of(context).secondary,
                                                                                                                        fontSize: 14.0,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        fontWeight: FontWeight.w600,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Expanded(
                                                                                                    child: Container(
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          children: [
                                                                                                            Expanded(
                                                                                                              child: RichText(
                                                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                                                text: TextSpan(
                                                                                                                  children: [
                                                                                                                    TextSpan(
                                                                                                                      text: 'สูงสุด  ',
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: 'Noto San Thai',
                                                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                                                            fontSize: 14.0,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            fontWeight: FontWeight.normal,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                    TextSpan(
                                                                                                                      text: valueOrDefault<String>(
                                                                                                                        functions.returnNumberWithCommaFullNumber(
                                                                                                                            valueOrDefault<String>(
                                                                                                                              functions.returnNumberWithComma2Decimal('${loanListCarouselItemItem.topupDetail.defaultTransferAmount.toString()}'),
                                                                                                                              '0',
                                                                                                                            ),
                                                                                                                            '0'),
                                                                                                                        '0',
                                                                                                                      ),
                                                                                                                      style: TextStyle(
                                                                                                                        fontWeight: FontWeight.w600,
                                                                                                                        fontSize: 24.0,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    TextSpan(
                                                                                                                      text: '  บาท',
                                                                                                                      style: TextStyle(),
                                                                                                                    )
                                                                                                                  ],
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Noto San Thai',
                                                                                                                        color: FlutterFlowTheme.of(context).secondary,
                                                                                                                        fontSize: 14.0,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        fontWeight: FontWeight.w600,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Expanded(
                                                                                                    child: Container(
                                                                                                      width: double.infinity,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Align(
                                                                                                              alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                                              child: Icon(
                                                                                                                Icons.check_circle_outlined,
                                                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                                                size: 16.0,
                                                                                                              ),
                                                                                                            ),
                                                                                                            Expanded(
                                                                                                              child: Text(
                                                                                                                'เพียงเติมวงเงินเต็มจำนวน รับเงินสดใช้จ่ายได้เลย หลังปิดบัญชีเต็ม',
                                                                                                                textAlign: TextAlign.start,
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Noto San Thai',
                                                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                                                      fontSize: 11.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FontWeight.w600,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ].divide(SizedBox(width: 8.0)),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ].addToStart(SizedBox(height: 8.0)).addToEnd(SizedBox(height: 8.0)),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    }
                                                                                  },
                                                                                ),
                                                                                Container(
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondary,
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 0.0, 8.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                          child: Container(
                                                                                            width: 45.0,
                                                                                            height: 45.0,
                                                                                            decoration: BoxDecoration(),
                                                                                            child: Builder(
                                                                                              builder: (context) {
                                                                                                if ('${loanListCarouselItemItem.contractDetails.loanTypeCode}' == 'C') {
                                                                                                  return ClipRRect(
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                    child: SvgPicture.asset(
                                                                                                      'assets/images/car-loan.svg',
                                                                                                      width: 50.0,
                                                                                                      height: 50.0,
                                                                                                      fit: BoxFit.cover,
                                                                                                    ),
                                                                                                  );
                                                                                                } else if ('${loanListCarouselItemItem.contractDetails.loanTypeCode}' == 'M') {
                                                                                                  return ClipRRect(
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                    child: SvgPicture.asset(
                                                                                                      'assets/images/MotorLoanIcon.svg',
                                                                                                      width: 50.0,
                                                                                                      height: 50.0,
                                                                                                      fit: BoxFit.cover,
                                                                                                    ),
                                                                                                  );
                                                                                                } else if ('${loanListCarouselItemItem.contractDetails.loanTypeCode}' == 'H') {
                                                                                                  return ClipRRect(
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                    child: SvgPicture.asset(
                                                                                                      'assets/images/HouseLoanIcon.svg',
                                                                                                      width: 50.0,
                                                                                                      height: 50.0,
                                                                                                      fit: BoxFit.cover,
                                                                                                    ),
                                                                                                  );
                                                                                                } else if ('${loanListCarouselItemItem.contractDetails.loanTypeCode}' == 'L') {
                                                                                                  return ClipRRect(
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                    child: SvgPicture.asset(
                                                                                                      'assets/images/HouseLoanIcon.svg',
                                                                                                      width: 50.0,
                                                                                                      height: 50.0,
                                                                                                      fit: BoxFit.cover,
                                                                                                    ),
                                                                                                  );
                                                                                                } else if ('${loanListCarouselItemItem.contractDetails.loanTypeCode}' == 'T') {
                                                                                                  return ClipRRect(
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                    child: SvgPicture.asset(
                                                                                                      'assets/images/LOANT.svg',
                                                                                                      width: 50.0,
                                                                                                      height: 50.0,
                                                                                                      fit: BoxFit.cover,
                                                                                                    ),
                                                                                                  );
                                                                                                } else if ('${loanListCarouselItemItem.contractDetails.loanTypeCode}' == 'V') {
                                                                                                  return ClipRRect(
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                    child: SvgPicture.asset(
                                                                                                      'assets/images/LOANV.svg',
                                                                                                      width: 50.0,
                                                                                                      height: 50.0,
                                                                                                      fit: BoxFit.cover,
                                                                                                    ),
                                                                                                  );
                                                                                                } else if ('${loanListCarouselItemItem.contractDetails.loanTypeCode}' == 'I') {
                                                                                                  return ClipRRect(
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                    child: SvgPicture.asset(
                                                                                                      'assets/images/CarInsuranceLoanIcon.svg',
                                                                                                      width: 50.0,
                                                                                                      height: 50.0,
                                                                                                      fit: BoxFit.cover,
                                                                                                    ),
                                                                                                  );
                                                                                                } else {
                                                                                                  return ClipRRect(
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                    child: SvgPicture.asset(
                                                                                                      'assets/images/LOANL.svg',
                                                                                                      width: 45.0,
                                                                                                      height: 5.0,
                                                                                                      fit: BoxFit.cover,
                                                                                                    ),
                                                                                                  );
                                                                                                }
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 8.0, 0.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      child: Container(
                                                                                                        decoration: BoxDecoration(),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Expanded(
                                                                                                              child: Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                child: Text(
                                                                                                                  valueOrDefault<String>(
                                                                                                                    '${loanListCarouselItemItem.contractDetails.loanTypeName}',
                                                                                                                    'loan_type_name',
                                                                                                                  ),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Noto San Thai',
                                                                                                                        fontSize: 14.0,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        fontWeight: FontWeight.w600,
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
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 8.0, 0.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      child: Container(
                                                                                                        decoration: BoxDecoration(),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                            children: [
                                                                                                              Expanded(
                                                                                                                child: Text(
                                                                                                                  'เลขที่สัญญา',
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Noto San Thai',
                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                        fontSize: 12.0,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        fontWeight: FontWeight.w600,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Text(
                                                                                                                '${loanListCarouselItemItem.contractNo}',
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Noto San Thai',
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                      fontSize: 12.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FontWeight.w600,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 8.0, 0.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      child: Container(
                                                                                                        decoration: BoxDecoration(),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                            children: [
                                                                                                              Expanded(
                                                                                                                child: Text(
                                                                                                                  'ข้อมูลหลักประกัน',
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Noto San Thai',
                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                        fontSize: 12.0,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        fontWeight: FontWeight.w600,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Text(
                                                                                                                '${loanListCarouselItemItem.contractDetails.collateralInformation}',
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Noto San Thai',
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                      fontSize: 12.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FontWeight.w600,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 8.0, 0.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      child: Container(
                                                                                                        decoration: BoxDecoration(),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                            children: [
                                                                                                              Expanded(
                                                                                                                child: Text(
                                                                                                                  'ข้อมูลสถานะ',
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Noto San Thai',
                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                        fontSize: 12.0,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        fontWeight: FontWeight.w600,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Container(
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: (loanListCarouselItemItem.requestStatus == '') || (loanListCarouselItemItem.requestStatus == 'ยังไม่ได้ทำรายการเติมเงิน') ? FlutterFlowTheme.of(context).bg03 : Color(0xFFD3FFF8),
                                                                                                                  borderRadius: BorderRadius.circular(30.0),
                                                                                                                ),
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 2.0, 8.0, 2.0),
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Icon(
                                                                                                                        Icons.timer_outlined,
                                                                                                                        color: (loanListCarouselItemItem.requestStatus == '') || (loanListCarouselItemItem.requestStatus == 'ยังไม่ได้ทำรายการเติมเงิน') ? FlutterFlowTheme.of(context).text03 : FlutterFlowTheme.of(context).border04,
                                                                                                                        size: 14.0,
                                                                                                                      ),
                                                                                                                      Text(
                                                                                                                        '${loanListCarouselItemItem.requestStatus}',
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: 'Noto San Thai',
                                                                                                                              color: (loanListCarouselItemItem.requestStatus == '') || (loanListCarouselItemItem.requestStatus == 'ยังไม่ได้ทำรายการเติมเงิน') ? FlutterFlowTheme.of(context).text03 : FlutterFlowTheme.of(context).border04,
                                                                                                                              fontSize: 12.0,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              fontWeight: FontWeight.w600,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ].divide(SizedBox(width: 2.0)),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  width: double.infinity,
                                                                                  height: 2.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).bg06,
                                                                                  ),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      if ((String amount) {
                                                                                        return double.parse(amount) <= 0.0;
                                                                                      }('${loanListCarouselItemItem.topupDetail.topupSpecials.toString()}'))
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 8.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Expanded(
                                                                                                child: Container(
                                                                                                  decoration: BoxDecoration(),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: [
                                                                                                        Expanded(
                                                                                                          child: Text(
                                                                                                            'วงเงินสินเชื่อ (สัญญา ${loanListCarouselItemItem.contractNo})',
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Noto San Thai',
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                  fontSize: 12.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 8.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                    children: [
                                                                                                      Expanded(
                                                                                                        child: Text(
                                                                                                          'วงเงินสินเชื่อเดิม',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Noto San Thai',
                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                fontSize: 12.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Text(
                                                                                                        valueOrDefault<String>(
                                                                                                          functions.returnNumberWithComma2Decimal('${loanListCarouselItemItem.contractDetails.creditLimit.toString()}'),
                                                                                                          '0',
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Noto San Thai',
                                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                              fontSize: 12.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.w600,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 8.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                    children: [
                                                                                                      Expanded(
                                                                                                        child: Text(
                                                                                                          (double.parse('${loanListCarouselItemItem.topupDetail.topupSpecials.toString()}') > 0.0) && ('${loanListCarouselItemItem.topupDetail.topupSpecials.toString()}' != 'null') && ('${loanListCarouselItemItem.topupDetail.topupSpecials.toString()}' != '') && ('${loanListCarouselItemItem.topupDetail.canTopup}' != 'N') && (loanListCarouselItemItem.contractDetails.accountType != 'L') ? 'ราคาประเมินปัจจุบัน' : 'ราคาประเมินหลักทรัพย์ปัจจุบัน',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Noto San Thai',
                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                fontSize: 12.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Text(
                                                                                                        valueOrDefault<String>(
                                                                                                          functions.returnNumberWithComma2Decimal('${loanListCarouselItemItem.contractDetails.currentLtvAmount.toString()}'),
                                                                                                          '0',
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Noto San Thai',
                                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                              fontSize: 12.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.w600,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      if ((double.parse('${loanListCarouselItemItem.topupDetail.topupSpecials.toString()}') > 0.0) && ('${loanListCarouselItemItem.topupDetail.topupSpecials.toString()}' != 'null') && ('${loanListCarouselItemItem.topupDetail.topupSpecials.toString()}' != '') && ('${loanListCarouselItemItem.topupDetail.canTopup}' != 'N') && (loanListCarouselItemItem.contractDetails.accountType != 'L'))
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 8.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Expanded(
                                                                                                child: Container(
                                                                                                  decoration: BoxDecoration(),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: [
                                                                                                        Expanded(
                                                                                                          child: Text(
                                                                                                            'วงเงินอนุมัติใหม่',
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Noto San Thai',
                                                                                                                  color: Colors.black,
                                                                                                                  fontSize: 12.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            functions.returnNumberWithComma2Decimal('${loanListCarouselItemItem.topupDetail.defaultTopupAmount.toString()}'),
                                                                                                            '0',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Noto San Thai',
                                                                                                                color: Colors.black,
                                                                                                                fontSize: 13.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      if ((double.parse('${loanListCarouselItemItem.topupDetail.topupSpecials.toString()}') > 0.0) && ('${loanListCarouselItemItem.topupDetail.topupSpecials.toString()}' != 'null') && ('${loanListCarouselItemItem.topupDetail.topupSpecials.toString()}' != '') && ('${loanListCarouselItemItem.topupDetail.canTopup}' != 'N') && (loanListCarouselItemItem.contractDetails.accountType != 'L'))
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 8.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Icon(
                                                                                                    Icons.auto_awesome_outlined,
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    size: 18.0,
                                                                                                  ),
                                                                                                  Text(
                                                                                                    'วงเงินเพิ่มพิเศษ',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Noto San Thai',
                                                                                                          color: Color(0xFFFF0000),
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w600,
                                                                                                        ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 8.0)),
                                                                                              ),
                                                                                              Text(
                                                                                                '+${valueOrDefault<String>(
                                                                                                  functions.returnNumberWithComma2Decimal(loanListCarouselItemItem.topupDetail.topupSpecials.toString()),
                                                                                                  '0',
                                                                                                )}',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Noto San Thai',
                                                                                                      color: Color(0xFFFF0000),
                                                                                                      fontSize: 12.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 8.0, 12.0),
                                                                                        child: Container(
                                                                                          width: double.infinity,
                                                                                          height: 2.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 8.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                          children: [
                                                                                            Text(
                                                                                              () {
                                                                                                if (loanListCarouselItemItem.topupDetail.canTopup == 'N') {
                                                                                                  return 'วงเงินสินเชื่อปัจจุบัน';
                                                                                                } else if (double.parse('${loanListCarouselItemItem.topupDetail.topupSpecials.toString()}') > 0.0) {
                                                                                                  return ('รวมเป็นวงเงินใหม่ที่คุณ\nขอรับได้เลยวันนี้');
                                                                                                } else {
                                                                                                  return 'วงเงินสินเชื่อปัจจุบัน';
                                                                                                }
                                                                                              }(),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Noto San Thai',
                                                                                                    color: Colors.black,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                  ),
                                                                                            ),
                                                                                            RichText(
                                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                                              text: TextSpan(
                                                                                                children: [
                                                                                                  TextSpan(
                                                                                                    text: '${valueOrDefault<String>(
                                                                                                      functions.returnNumberWithComma2Decimal('${loanListCarouselItemItem.topupDetail.defaultTopupAmount.toString()}'),
                                                                                                      '0',
                                                                                                    )}',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Noto San Thai',
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          fontSize: 21.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w600,
                                                                                                        ),
                                                                                                  ),
                                                                                                  TextSpan(
                                                                                                    text: ' บาท',
                                                                                                    style: TextStyle(
                                                                                                      fontSize: 12.0,
                                                                                                    ),
                                                                                                  )
                                                                                                ],
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Noto San Thai',
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      fontSize: 14.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      if (loanListCarouselItemItem.topupDetail.canTopup != 'N')
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 8.0, 12.0),
                                                                                          child: Container(
                                                                                            width: double.infinity,
                                                                                            height: 2.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      if (loanListCarouselItemItem.contractDetails.accountType != 'L')
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 8.0, 12.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              if (loanListCarouselItemItem.topupDetail.canTopup != 'N')
                                                                                                Expanded(
                                                                                                  child: Container(
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                        children: [
                                                                                                          Expanded(
                                                                                                            child: RichText(
                                                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                                                              text: TextSpan(
                                                                                                                children: [
                                                                                                                  TextSpan(
                                                                                                                    text: 'ยอดปิดบัญชี ณ วันที่ ',
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'Noto San Thai',
                                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                          fontSize: 11.0,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          fontWeight: FontWeight.w600,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                  TextSpan(
                                                                                                                    text: valueOrDefault<String>(
                                                                                                                      functions.formatToThaiDateWithMonth('${functions.parseDateTimeToString(loanListCarouselItemItem.dataDate)}', false),
                                                                                                                      '24 มิ.ย. 2569',
                                                                                                                    ),
                                                                                                                    style: TextStyle(
                                                                                                                      color: Colors.black,
                                                                                                                      fontWeight: FontWeight.w600,
                                                                                                                      fontSize: 11.0,
                                                                                                                    ),
                                                                                                                  )
                                                                                                                ],
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Noto San Thai',
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                      fontSize: 13.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FontWeight.w600,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Text(
                                                                                                            '-${functions.returnNumberWithCommaFullNumber(loanListCarouselItemItem.topupDetail.balanceReceivable.toString(), '0')} บาท',
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Noto San Thai',
                                                                                                                  color: valueOrDefault<String>(
                                                                                                                            FFAppState().getLoanListAPIResultAppState.elementAtOrNull(loanListCarouselItemIndex)?.requestStatus,
                                                                                                                            'request_status',
                                                                                                                          ) ==
                                                                                                                          'เอกสารไม่ครบติดต่อ 1652'
                                                                                                                      ? FlutterFlowTheme.of(context).error
                                                                                                                      : Colors.black,
                                                                                                                  fontSize: 11.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      if (loanListCarouselItemItem.topupDetail.canTopup != 'N')
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 8.0, 0.0),
                                                                                          child: Container(
                                                                                            width: double.infinity,
                                                                                            height: 45.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).bg03,
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                              border: Border.all(
                                                                                                color: FlutterFlowTheme.of(context).border03,
                                                                                                width: 2.0,
                                                                                              ),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      FaIcon(
                                                                                                        FontAwesomeIcons.moneyBillAlt,
                                                                                                        color: FlutterFlowTheme.of(context).text03,
                                                                                                        size: 16.0,
                                                                                                      ),
                                                                                                      Text(
                                                                                                        'เงินคงเหลือโอนเข้าบัญชี',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Noto San Thai',
                                                                                                              color: FlutterFlowTheme.of(context).text03,
                                                                                                              fontSize: 11.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.w600,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ].divide(SizedBox(width: 8.0)),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    '${functions.returnNumberWithCommaFullNumber('${loanListCarouselItemItem.topupDetail.defaultTransferAmount.toString()}', '')} บาท',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Noto San Thai',
                                                                                                          color: FlutterFlowTheme.of(context).text03,
                                                                                                          fontSize: 13.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w600,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                    ].addToStart(SizedBox(height: 8.0)).addToEnd(SizedBox(height: 16.0)),
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  width: double.infinity,
                                                                                  height: 2.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                  ),
                                                                                ),
                                                                                if ((loanListCarouselItemItem.topupDetail.products.length > 0) && ('${loanListCarouselItemItem.topupDetail.canTopup}' != 'N') && ('${loanListCarouselItemItem.requestStatus}' == 'ยังไม่ได้ทำรายการเติมเงิน'))
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 8.0, 12.0),
                                                                                    child: Container(
                                                                                      width: double.infinity,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).bg04,
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                        border: Border.all(
                                                                                          color: FlutterFlowTheme.of(context).border04,
                                                                                          width: 2.0,
                                                                                        ),
                                                                                      ),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Icon(
                                                                                                      Icons.shopping_bag_outlined,
                                                                                                      color: FlutterFlowTheme.of(context).text04,
                                                                                                      size: 20.0,
                                                                                                    ),
                                                                                                    Text(
                                                                                                      'สิทธิพิเศษเฉพาะคุณ',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Noto San Thai',
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                            fontSize: 13.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w600,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ].divide(SizedBox(width: 8.0)),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Icon(
                                                                                                      Icons.arrow_upward_outlined,
                                                                                                      color: FlutterFlowTheme.of(context).text04,
                                                                                                      size: 16.0,
                                                                                                    ),
                                                                                                    Text(
                                                                                                      'ใช้เงินก้อนเดียวกับข้อเสนอด้านบน',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Noto San Thai',
                                                                                                            color: Color(0xFF0E8C86),
                                                                                                            fontSize: 10.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w600,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ].divide(SizedBox(width: 8.0)),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                            child: Container(
                                                                                              width: double.infinity,
                                                                                              decoration: BoxDecoration(),
                                                                                              child: Builder(
                                                                                                builder: (context) {
                                                                                                  final productListItem = loanListCarouselItemItem.topupDetail.products.toList();

                                                                                                  return GridView.builder(
                                                                                                    padding: EdgeInsets.zero,
                                                                                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                                                                      crossAxisCount: 3,
                                                                                                      crossAxisSpacing: 6.0,
                                                                                                      mainAxisSpacing: 6.0,
                                                                                                      childAspectRatio: 1.2,
                                                                                                    ),
                                                                                                    primary: false,
                                                                                                    shrinkWrap: true,
                                                                                                    scrollDirection: Axis.vertical,
                                                                                                    itemCount: productListItem.length,
                                                                                                    itemBuilder: (context, productListItemIndex) {
                                                                                                      final productListItemItem = productListItem[productListItemIndex];
                                                                                                      return InkWell(
                                                                                                        splashColor: Colors.transparent,
                                                                                                        focusColor: Colors.transparent,
                                                                                                        hoverColor: Colors.transparent,
                                                                                                        highlightColor: Colors.transparent,
                                                                                                        onTap: () async {
                                                                                                          if (loanListCarouselItemItem.contractDetails.accountType == 'L') {
                                                                                                            return;
                                                                                                          }
                                                                                                          FFAppState().getLoanListSelected = loanListCarouselItemItem;
                                                                                                          safeSetState(() {});
                                                                                                          FFAppState().updateGetLoanListSelectedStruct(
                                                                                                            (e) => e..topupSpecialFlag = (double.parse('${loanListCarouselItemItem.topupDetail.topupSpecials.toString()}') > 0.0) && ('${loanListCarouselItemItem.topupDetail.topupSpecials.toString()}' != 'null') && ('${loanListCarouselItemItem.topupDetail.topupSpecials.toString()}' != ''),
                                                                                                          );
                                                                                                          safeSetState(() {});
                                                                                                          if ('${loanListCarouselItemItem.topupDetail.canTopup}' == 'N') {
                                                                                                            await showDialog(
                                                                                                              context: context,
                                                                                                              builder: (alertDialogContext) {
                                                                                                                return AlertDialog(
                                                                                                                  content: Text('ไปหน้าLoan Detail'),
                                                                                                                  actions: [
                                                                                                                    TextButton(
                                                                                                                      onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                                      child: Text('Ok'),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                );
                                                                                                              },
                                                                                                            );

                                                                                                            context.pushNamed(
                                                                                                              LoanDetailPageWidget.routeName,
                                                                                                              queryParameters: {
                                                                                                                'hashThaiId': serializeParam(
                                                                                                                  FFAppState().hashThaiIdAppState,
                                                                                                                  ParamType.String,
                                                                                                                ),
                                                                                                                'contNo': serializeParam(
                                                                                                                  loanListCarouselItemItem.contractNo,
                                                                                                                  ParamType.String,
                                                                                                                ),
                                                                                                                'token': serializeParam(
                                                                                                                  FFAppState().accessToken,
                                                                                                                  ParamType.String,
                                                                                                                ),
                                                                                                                'fromPage': serializeParam(
                                                                                                                  'TopupCard',
                                                                                                                  ParamType.String,
                                                                                                                ),
                                                                                                              }.withoutNulls,
                                                                                                            );

                                                                                                            return;
                                                                                                          }
                                                                                                          if ('${productListItemItem.productCode}' == 'PLD001') {
                                                                                                            await actions.openPLoanExtra(
                                                                                                              loanListCarouselItemItem.dbName,
                                                                                                              loanListCarouselItemItem.contractNo,
                                                                                                            );
                                                                                                            return;
                                                                                                          }
                                                                                                          if (FFAppState().getLoanListSelected.requestStatus == 'ยังไม่ได้ทำรายการเติมเงิน' ? true : false) {
                                                                                                            FFAppState().updateSaveTopupDataStruct(
                                                                                                              (e) => e..products = productListItemItem,
                                                                                                            );
                                                                                                            safeSetState(() {});

                                                                                                            context.pushNamed(
                                                                                                              TopupDetailDataPageWidget.routeName,
                                                                                                              extra: <String, dynamic>{
                                                                                                                '__transition_info__': TransitionInfo(
                                                                                                                  hasTransition: true,
                                                                                                                  transitionType: PageTransitionType.rightToLeft,
                                                                                                                ),
                                                                                                              },
                                                                                                            );
                                                                                                          } else {
                                                                                                            context.pushNamed(
                                                                                                              TopupStatusPageWidget.routeName,
                                                                                                              queryParameters: {
                                                                                                                'fromPage': serializeParam(
                                                                                                                  'LoanListCard',
                                                                                                                  ParamType.String,
                                                                                                                ),
                                                                                                              }.withoutNulls,
                                                                                                              extra: <String, dynamic>{
                                                                                                                '__transition_info__': TransitionInfo(
                                                                                                                  hasTransition: true,
                                                                                                                  transitionType: PageTransitionType.rightToLeft,
                                                                                                                ),
                                                                                                              },
                                                                                                            );
                                                                                                          }
                                                                                                        },
                                                                                                        child: Container(
                                                                                                          width: 100.0,
                                                                                                          height: 80.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                            border: Border.all(
                                                                                                              color: FlutterFlowTheme.of(context).border05,
                                                                                                              width: 2.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Container(
                                                                                                                width: 21.0,
                                                                                                                height: 21.0,
                                                                                                                child: custom_widgets.SvgIconWidget(
                                                                                                                  width: 21.0,
                                                                                                                  height: 21.0,
                                                                                                                  svgUrl: functions.findIndexInList(carouselTopupProductConfigRecord.produceCode.toList(), productListItemItem.productCode) != -1 ? carouselTopupProductConfigRecord.productImg.elementAtOrNull(functions.findIndexInList(carouselTopupProductConfigRecord.produceCode.toList(), productListItemItem.productCode)!) : 'https://firebasestorage.googleapis.com/v0/b/srisawad-mobile-app-prd.appspot.com/o/IconSvg%2Fimage-square-svgrepo-com%20(1).svg?alt=media&token=3cb66394-4506-4a8d-a101-4ae12ca40a0d',
                                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                                ),
                                                                                                              ),
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 0.0),
                                                                                                                child: Container(
                                                                                                                  width: double.infinity,
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: Text(
                                                                                                                    productListItemItem.productName,
                                                                                                                    textAlign: TextAlign.center,
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'Noto San Thai',
                                                                                                                          fontSize: 11.0,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          fontWeight: FontWeight.w600,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ].divide(SizedBox(height: 4.0)).addToStart(SizedBox(height: 8.0)),
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(height: 4.0)).addToStart(SizedBox(height: 8.0)).addToEnd(SizedBox(height: 8.0)),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                Expanded(
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                      children: [
                                                                                        Builder(
                                                                                          builder: (context) {
                                                                                            if ('${loanListCarouselItemItem.topupDetail.canTopup}' != 'N') {
                                                                                              return InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  if (loanListCarouselItemItem.contractDetails.accountType == 'L') {
                                                                                                    return;
                                                                                                  }
                                                                                                  FFAppState().getLoanListSelected = loanListCarouselItemItem;
                                                                                                  safeSetState(() {});
                                                                                                  FFAppState().updateGetLoanListSelectedStruct(
                                                                                                    (e) => e..topupSpecialFlag = (double.parse('${loanListCarouselItemItem.topupDetail.topupSpecials.toString()}') > 0.0) && ('${loanListCarouselItemItem.topupDetail.topupSpecials.toString()}' != 'null') && ('${loanListCarouselItemItem.topupDetail.topupSpecials.toString()}' != ''),
                                                                                                  );
                                                                                                  safeSetState(() {});
                                                                                                  if ('${loanListCarouselItemItem.topupDetail.canTopup}' == 'N') {
                                                                                                    await showDialog(
                                                                                                      context: context,
                                                                                                      builder: (alertDialogContext) {
                                                                                                        return AlertDialog(
                                                                                                          content: Text('ไปหน้าLoan Detail'),
                                                                                                          actions: [
                                                                                                            TextButton(
                                                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                              child: Text('Ok'),
                                                                                                            ),
                                                                                                          ],
                                                                                                        );
                                                                                                      },
                                                                                                    );

                                                                                                    context.pushNamed(
                                                                                                      LoanDetailPageWidget.routeName,
                                                                                                      queryParameters: {
                                                                                                        'hashThaiId': serializeParam(
                                                                                                          FFAppState().hashThaiIdAppState,
                                                                                                          ParamType.String,
                                                                                                        ),
                                                                                                        'contNo': serializeParam(
                                                                                                          loanListCarouselItemItem.contractNo,
                                                                                                          ParamType.String,
                                                                                                        ),
                                                                                                        'token': serializeParam(
                                                                                                          FFAppState().accessToken,
                                                                                                          ParamType.String,
                                                                                                        ),
                                                                                                        'fromPage': serializeParam(
                                                                                                          'TopupCard',
                                                                                                          ParamType.String,
                                                                                                        ),
                                                                                                      }.withoutNulls,
                                                                                                    );

                                                                                                    return;
                                                                                                  }
                                                                                                  if (FFAppState().getLoanListSelected.requestStatus == 'ยังไม่ได้ทำรายการเติมเงิน' ? true : false) {
                                                                                                    FFAppState().updateSaveTopupDataStruct(
                                                                                                      (e) => e..products = ProductsStruct(),
                                                                                                    );
                                                                                                    safeSetState(() {});

                                                                                                    context.pushNamed(
                                                                                                      TopupDetailDataPageWidget.routeName,
                                                                                                      extra: <String, dynamic>{
                                                                                                        '__transition_info__': TransitionInfo(
                                                                                                          hasTransition: true,
                                                                                                          transitionType: PageTransitionType.rightToLeft,
                                                                                                        ),
                                                                                                      },
                                                                                                    );
                                                                                                  } else {
                                                                                                    context.pushNamed(
                                                                                                      TopupStatusPageWidget.routeName,
                                                                                                      queryParameters: {
                                                                                                        'fromPage': serializeParam(
                                                                                                          'LoanListCard',
                                                                                                          ParamType.String,
                                                                                                        ),
                                                                                                      }.withoutNulls,
                                                                                                      extra: <String, dynamic>{
                                                                                                        '__transition_info__': TransitionInfo(
                                                                                                          hasTransition: true,
                                                                                                          transitionType: PageTransitionType.rightToLeft,
                                                                                                        ),
                                                                                                      },
                                                                                                    );
                                                                                                  }
                                                                                                },
                                                                                                child: Container(
                                                                                                  width: 80.0,
                                                                                                  height: 80.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).cardHeader,
                                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                                    border: Border.all(
                                                                                                      color: FlutterFlowTheme.of(context).border05,
                                                                                                      width: 2.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                    children: [
                                                                                                      FaIcon(
                                                                                                        FontAwesomeIcons.wallet,
                                                                                                        color: FlutterFlowTheme.of(context).secondary,
                                                                                                        size: 24.0,
                                                                                                      ),
                                                                                                      Text(
                                                                                                        'เติมวงเงิน',
                                                                                                        textAlign: TextAlign.center,
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Noto San Thai',
                                                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                                                              fontSize: 12.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.w600,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            } else {
                                                                                              return Container(
                                                                                                width: 80.0,
                                                                                                height: 80.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).bg07,
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                  border: Border.all(
                                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                ),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                  children: [
                                                                                                    Icon(
                                                                                                      Icons.lock_outlined,
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      size: 24.0,
                                                                                                    ),
                                                                                                    Text(
                                                                                                      'ยังเติมไม่ได้',
                                                                                                      textAlign: TextAlign.center,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Noto San Thai',
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                            fontSize: 12.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w600,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              );
                                                                                            }
                                                                                          },
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 8.0, 0.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      if (('${loanListCarouselItemItem.contractDetails.loanTypeCode}' == 'L') && ('${loanListCarouselItemItem.contractDetails.loanTypeCode}' == 'H') && false)
                                                                                        Expanded(
                                                                                          child: Container(
                                                                                            decoration: BoxDecoration(),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  Expanded(
                                                                                                    child: Text(
                                                                                                      'กลุ่มสินค้า',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Noto San Thai',
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                            fontSize: 14.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      FFAppState().getLoanListAPIResultAppState.elementAtOrNull(loanListCarouselItemIndex)?.contractDetails.vehicleBrand,
                                                                                                      'vehicle_brand',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Noto San Thai',
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                if ((loanListCarouselItemItem.contractDetails.accountType != 'L') && false)
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 8.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        if ('${loanListCarouselItemItem.topupDetail.topupExtra.toString()}' != '0')
                                                                                          Expanded(
                                                                                            child: Container(
                                                                                              decoration: BoxDecoration(),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      'วงเงินเพิ่มพิเศษ',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Noto San Thai',
                                                                                                            color: Color(0xFFFF0000),
                                                                                                            fontSize: 14.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w600,
                                                                                                          ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      '${valueOrDefault<String>(
                                                                                                        functions.returnNumberWithComma2Decimal(loanListCarouselItemItem.topupDetail.topupExtra.toString()),
                                                                                                        '0',
                                                                                                      )}',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Noto San Thai',
                                                                                                            color: Color(0xFFFF0000),
                                                                                                            fontSize: 14.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w600,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                if ((('${loanListCarouselItemItem.contractDetails.loanTypeCode}' == 'L') || ('${loanListCarouselItemItem.contractDetails.loanTypeCode}' == 'H') || (loanListCarouselItemItem.topupDetail.canTopup == 'G') || (loanListCarouselItemItem.topupDetail.canTopup == 'A') || (loanListCarouselItemItem.topupDetail.canTopup == 'L')) && (loanListCarouselItemItem.topupDetail.canTopup != 'N') && false)
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Container(
                                                                                          width: double.infinity,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'ยังไม่สามารถทำรายการผ่านแอปได้',
                                                                                                  textAlign: TextAlign.start,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Noto San Thai',
                                                                                                        color: Color(0xFFFF0000),
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                      ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Container(
                                                                                          width: double.infinity,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'กรุณาติดต่อสาขาเจ้าของบัญชีหรือสาขาใกล้บ้าน',
                                                                                                  textAlign: TextAlign.start,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Noto San Thai',
                                                                                                        color: Color(0xFFFF0000),
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                      ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Container(
                                                                                          width: double.infinity,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'เพื่อทำสัญญาและรับเงิน',
                                                                                                  textAlign: TextAlign.start,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Noto San Thai',
                                                                                                        color: Color(0xFFFF0000),
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                      ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                              ].addToEnd(SizedBox(height: 16.0)),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      if (false)
                                                                        Divider(
                                                                          thickness:
                                                                              2.0,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                        ),
                                                                      if (('${loanListCarouselItemItem.topupDetail.canTopup}' !=
                                                                              'Y') &&
                                                                          false)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              20.0,
                                                                              12.0,
                                                                              20.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Builder(
                                                                                  builder: (context) {
                                                                                    if (loanListCarouselItemItem.contractDetails.accountType == 'L') {
                                                                                      return Container(
                                                                                        width: double.infinity,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondary,
                                                                                          boxShadow: [
                                                                                            BoxShadow(
                                                                                              blurRadius: 10.0,
                                                                                              color: Color(0x33000000),
                                                                                              offset: Offset(
                                                                                                2.0,
                                                                                                2.0,
                                                                                              ),
                                                                                            )
                                                                                          ],
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 16.0, 12.0, 16.0),
                                                                                          child: Text(
                                                                                            loanListCarouselItemItem.contractDetails.accountTypeMsg,
                                                                                            textAlign: TextAlign.center,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Noto San Thai',
                                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    } else if (loanListCarouselItemItem.topupDetail.canTopupMsg != '') {
                                                                                      return Container(
                                                                                        width: double.infinity,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondary,
                                                                                          boxShadow: [
                                                                                            BoxShadow(
                                                                                              blurRadius: 10.0,
                                                                                              color: Color(0x33000000),
                                                                                              offset: Offset(
                                                                                                2.0,
                                                                                                2.0,
                                                                                              ),
                                                                                            )
                                                                                          ],
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 16.0, 12.0, 16.0),
                                                                                          child: Text(
                                                                                            loanListCarouselItemItem.topupDetail.canTopupMsg,
                                                                                            textAlign: TextAlign.center,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Noto San Thai',
                                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    } else {
                                                                                      return Container(
                                                                                        width: double.infinity,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondary,
                                                                                          boxShadow: [
                                                                                            BoxShadow(
                                                                                              blurRadius: 10.0,
                                                                                              color: Color(0x33000000),
                                                                                              offset: Offset(
                                                                                                2.0,
                                                                                                2.0,
                                                                                              ),
                                                                                            )
                                                                                          ],
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 16.0, 12.0, 16.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: double.infinity,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Text(
                                                                                                  topupCardPageApplicationRecord.topupNoDataText,
                                                                                                  textAlign: TextAlign.center,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Noto San Thai',
                                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                              Container(
                                                                                                width: double.infinity,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Text(
                                                                                                  topupCardPageApplicationRecord.topupNoData2Text,
                                                                                                  textAlign: TextAlign.center,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Noto San Thai',
                                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ].divide(SizedBox(height: 4.0)),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    }
                                                                                  },
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      if ((loanListCarouselItemItem.contractDetails.accountType !=
                                                                              'L') &&
                                                                          false)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              12.0,
                                                                              8.0,
                                                                              12.0,
                                                                              8.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            children:
                                                                                [
                                                                              if ((double.parse('${loanListCarouselItemItem.topupDetail.topupSpecials.toString()}') > 0.0) && ('${loanListCarouselItemItem.topupDetail.topupSpecials.toString()}' != 'null') && ('${loanListCarouselItemItem.topupDetail.topupSpecials.toString()}' != '') && ('${loanListCarouselItemItem.topupDetail.canTopup}' != 'N'))
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      if (loanListCarouselItemItem.contractDetails.accountType == 'L') {
                                                                                        return;
                                                                                      }
                                                                                      FFAppState().getLoanListSelected = loanListCarouselItemItem;
                                                                                      safeSetState(() {});
                                                                                      FFAppState().updateGetLoanListSelectedStruct(
                                                                                        (e) => e..topupSpecialFlag = true,
                                                                                      );
                                                                                      safeSetState(() {});
                                                                                      if ('${loanListCarouselItemItem.topupDetail.topupSpecials.toString()}' == '0') {
                                                                                        await showDialog(
                                                                                          context: context,
                                                                                          builder: (alertDialogContext) {
                                                                                            return AlertDialog(
                                                                                              content: Text('ไปหน้าLoan Detail'),
                                                                                              actions: [
                                                                                                TextButton(
                                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                  child: Text('Ok'),
                                                                                                ),
                                                                                              ],
                                                                                            );
                                                                                          },
                                                                                        );

                                                                                        context.pushNamed(
                                                                                          LoanDetailPageWidget.routeName,
                                                                                          queryParameters: {
                                                                                            'hashThaiId': serializeParam(
                                                                                              FFAppState().hashThaiIdAppState,
                                                                                              ParamType.String,
                                                                                            ),
                                                                                            'contNo': serializeParam(
                                                                                              loanListCarouselItemItem.contractNo,
                                                                                              ParamType.String,
                                                                                            ),
                                                                                            'token': serializeParam(
                                                                                              FFAppState().accessToken,
                                                                                              ParamType.String,
                                                                                            ),
                                                                                            'fromPage': serializeParam(
                                                                                              'TopupCard',
                                                                                              ParamType.String,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                        );

                                                                                        return;
                                                                                      }
                                                                                      if (FFAppState().getLoanListSelected.requestStatus == 'ยังไม่ได้ทำรายการเติมเงิน' ? true : false) {
                                                                                        context.pushNamed(SelectTopupPurposePageWidget.routeName);
                                                                                      } else {
                                                                                        context.pushNamed(
                                                                                          TopupStatusPageWidget.routeName,
                                                                                          queryParameters: {
                                                                                            'fromPage': serializeParam(
                                                                                              'LoanListCard',
                                                                                              ParamType.String,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                          extra: <String, dynamic>{
                                                                                            '__transition_info__': TransitionInfo(
                                                                                              hasTransition: true,
                                                                                              transitionType: PageTransitionType.rightToLeft,
                                                                                            ),
                                                                                          },
                                                                                        );
                                                                                      }
                                                                                    },
                                                                                    child: Container(
                                                                                      width: valueOrDefault<double>(
                                                                                        ('${valueOrDefault<String>(
                                                                                                      FFAppState().getLoanListAPIResultAppState.elementAtOrNull(loanListCarouselItemIndex)?.requestStatus,
                                                                                                      'default_topup_amount',
                                                                                                    )}' !=
                                                                                                    'ยังไม่ได้ทำรายการเติมเงิน'
                                                                                                ? 150
                                                                                                : 100)
                                                                                            .toDouble(),
                                                                                        150.0,
                                                                                      ),
                                                                                      height: 50.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).success,
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                      ),
                                                                                      child: Align(
                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                        child: Text(
                                                                                          valueOrDefault<String>(
                                                                                            _model.tabSelested == 1
                                                                                                ? valueOrDefault<String>(
                                                                                                    '${loanListCarouselItemItem.requestStatus}' != 'ยังไม่ได้ทำรายการเติมเงิน' ? 'ตรวจสอบสถานะ' : 'วงเงินพิเศษ',
                                                                                                    'วงเงินฉุกเฉิน',
                                                                                                  )
                                                                                                : 'รายละเอียด',
                                                                                            'วงเงินฉุกเฉิน',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Noto San Thai',
                                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                fontSize: 16.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w600,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    if (loanListCarouselItemItem.contractDetails.accountType == 'L') {
                                                                                      return;
                                                                                    }
                                                                                    FFAppState().getLoanListSelected = loanListCarouselItemItem;
                                                                                    safeSetState(() {});
                                                                                    FFAppState().updateGetLoanListSelectedStruct(
                                                                                      (e) => e..topupSpecialFlag = false,
                                                                                    );
                                                                                    safeSetState(() {});
                                                                                    if ('${loanListCarouselItemItem.topupDetail.canTopup}' == 'N') {
                                                                                      await showDialog(
                                                                                        context: context,
                                                                                        builder: (alertDialogContext) {
                                                                                          return AlertDialog(
                                                                                            content: Text('ไปหน้าLoan Detail'),
                                                                                            actions: [
                                                                                              TextButton(
                                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                child: Text('Ok'),
                                                                                              ),
                                                                                            ],
                                                                                          );
                                                                                        },
                                                                                      );

                                                                                      context.pushNamed(
                                                                                        LoanDetailPageWidget.routeName,
                                                                                        queryParameters: {
                                                                                          'hashThaiId': serializeParam(
                                                                                            FFAppState().hashThaiIdAppState,
                                                                                            ParamType.String,
                                                                                          ),
                                                                                          'contNo': serializeParam(
                                                                                            loanListCarouselItemItem.contractNo,
                                                                                            ParamType.String,
                                                                                          ),
                                                                                          'token': serializeParam(
                                                                                            FFAppState().accessToken,
                                                                                            ParamType.String,
                                                                                          ),
                                                                                          'fromPage': serializeParam(
                                                                                            'TopupCard',
                                                                                            ParamType.String,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                      );

                                                                                      return;
                                                                                    }
                                                                                    if (FFAppState().getLoanListSelected.requestStatus == 'ยังไม่ได้ทำรายการเติมเงิน' ? true : false) {
                                                                                      context.pushNamed(SelectTopupPurposePageWidget.routeName);
                                                                                    } else {
                                                                                      context.pushNamed(
                                                                                        TopupStatusPageWidget.routeName,
                                                                                        queryParameters: {
                                                                                          'fromPage': serializeParam(
                                                                                            'LoanListCard',
                                                                                            ParamType.String,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                        extra: <String, dynamic>{
                                                                                          '__transition_info__': TransitionInfo(
                                                                                            hasTransition: true,
                                                                                            transitionType: PageTransitionType.rightToLeft,
                                                                                          ),
                                                                                        },
                                                                                      );
                                                                                    }
                                                                                  },
                                                                                  child: Container(
                                                                                    width: valueOrDefault<double>(
                                                                                      ('${valueOrDefault<String>(
                                                                                                    FFAppState().getLoanListAPIResultAppState.elementAtOrNull(loanListCarouselItemIndex)?.requestStatus,
                                                                                                    'default_topup_amount',
                                                                                                  )}' !=
                                                                                                  'ยังไม่ได้ทำรายการเติมเงิน'
                                                                                              ? 150
                                                                                              : 100)
                                                                                          .toDouble(),
                                                                                      150.0,
                                                                                    ),
                                                                                    height: 50.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).accent2,
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    child: Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          '${loanListCarouselItemItem.topupDetail.canTopup}' != 'N'
                                                                                              ? valueOrDefault<String>(
                                                                                                  '${loanListCarouselItemItem.requestStatus}' != 'ยังไม่ได้ทำรายการเติมเงิน' ? 'ตรวจสอบสถานะ' : 'เติมวงเงิน',
                                                                                                  'เติมวงเงิน',
                                                                                                )
                                                                                              : 'รายละเอียด',
                                                                                          'เติมวงเงิน',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Noto San Thai',
                                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                              fontSize: 16.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 8.0)),
                                                                          ),
                                                                        ),
                                                                    ].addToEnd(SizedBox(
                                                                        height:
                                                                            4.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    carouselController: _model
                                                            .carouselController ??=
                                                        CarouselSliderController(),
                                                    options: CarouselOptions(
                                                      initialPage: max(
                                                          0,
                                                          min(
                                                              0,
                                                              loanListCarouselItem
                                                                      .length -
                                                                  1)),
                                                      viewportFraction: 0.9,
                                                      disableCenter: true,
                                                      enlargeCenterPage: true,
                                                      enlargeFactor: 0.15,
                                                      enableInfiniteScroll:
                                                          false,
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      autoPlay: false,
                                                      onPageChanged:
                                                          (index, _) async {
                                                        _model.carouselCurrentIndex =
                                                            index;
                                                        safeSetState(() {});
                                                      },
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                if (false)
                                  Container(
                                    height: 250.0,
                                    child: wrapWithModel(
                                      model: _model.emptyComponentTopupModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: EmptyComponentTopupWidget(
                                        text1: '',
                                        text2: _model.tabSelested == 1
                                            ? 'ไม่พบสัญญาที่เพิ่มวงเงินได้'
                                            : 'ไม่พบสัญญาที่ยังไม่เข้าเงื่อนไข',
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
