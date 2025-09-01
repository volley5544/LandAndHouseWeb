import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/error_message_component_widget.dart';
import '/customer_topup/capture_picture_component/capture_picture_component_widget.dart';
import '/customer_topup/empty_component_topup/empty_component_topup_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/loading/loading_widget.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  });

  final String? token;
  final String? hashThaiId;
  final String? source;
  final String? referId;

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
      _model.configOutput =
          await ApplicationRecord.getDocumentOnce(FFAppState().configDocument!);
      _model.isLoadFirestoreCompleted = true;
      safeSetState(() {});
      FFAppState().hashThaiIdAppState = widget.hashThaiId!;
      FFAppState().accessToken = widget.token!;
      FFAppState().topupUrlDev = '${_model.configOutput?.apiUrl.apiUrlDev}';
      FFAppState().topupUrlProd = '${_model.configOutput?.apiUrl.apiUrlProd}';
      FFAppState().LeadUrlDev = '${_model.configOutput?.apiUrl.apiUrlLeadDev}';
      FFAppState().LeadUrlProd =
          '${_model.configOutput?.apiUrl.apiUrlLeadProd}';
      FFAppState().ocrUrlDev = '${_model.configOutput?.apiUrl.ocrUrlDev}';
      FFAppState().ocrUrlProd = '${_model.configOutput?.apiUrl.ocrUrlProd}';
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
      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return AlertDialog(
            title: Text('source'),
            content: Text(FFAppState().saveTopupData.source),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext),
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
            title: Text('refer_id'),
            content: Text(FFAppState().saveTopupData.referId),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext),
                child: Text('Ok'),
              ),
            ],
          );
        },
      );
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
                iconTheme:
                    IconThemeData(color: FlutterFlowTheme.of(context).primary),
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
                        onTap: () async {},
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
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    },
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: Container(
                                        height: double.infinity,
                                        child: CapturePictureComponentWidget(
                                          imageType: 'test5544',
                                          title: 'เทสถ่าย',
                                          descriptionText: 'เทสๆๆ',
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) =>
                                  safeSetState(() => _model.test = value));

                              safeSetState(() {});
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
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFFBEFE3),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 8.0, 12.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${topupCardPageApplicationRecord.topupTextTitle}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Noto San Thai',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          final listText =
                                              topupCardPageApplicationRecord
                                                  .topupTextList
                                                  .toList();

                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children:
                                                List.generate(listText.length,
                                                    (listTextIndex) {
                                              final listTextItem =
                                                  listText[listTextIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 2.0, 0.0, 0.0),
                                                child: Text(
                                                  '${listTextItem}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto San Thai',
                                                        color: Colors.black,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              );
                                            }),
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          final warnningTextList =
                                              topupCardPageApplicationRecord
                                                  .topupWarnningTextList
                                                  .toList();

                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: List.generate(
                                                warnningTextList.length,
                                                (warnningTextListIndex) {
                                              final warnningTextListItem =
                                                  warnningTextList[
                                                      warnningTextListIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 2.0, 0.0, 0.0),
                                                child: Text(
                                                  '${warnningTextListItem}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto San Thai',
                                                        color: functions
                                                                .containString(
                                                                    '***',
                                                                    warnningTextListItem)!
                                                            ? Color(0xFFFF0000)
                                                            : Color(0xFF003063),
                                                        letterSpacing: 0.0,
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'กรุณาเลือกสัญญาที่ต้องการเติมวงเงินเวลาทำการ',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Noto San Thai',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: FutureBuilder<ApiCallResponse>(
                                future: (_model.apiRequestCompleter ??=
                                        Completer<ApiCallResponse>()
                                          ..complete(SrisawadApiGroup
                                              .getListOfLoanCall
                                              .call(
                                            hashThaiId: widget.hashThaiId,
                                            authorization:
                                                FFAppState().accessToken,
                                            apiUrl: FFDevEnvironmentValues()
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
                                  final listViewGetListOfLoanResponse =
                                      snapshot.data!;

                                  return Builder(
                                    builder: (context) {
                                      final loanList = SrisawadApiGroup
                                              .getListOfLoanCall
                                              .results(
                                                listViewGetListOfLoanResponse
                                                    .jsonBody,
                                              )
                                              ?.where((e) =>
                                                  (e.topupDetail.canTopup !=
                                                      'N') &&
                                                  (e.contractDetails
                                                          .accountStatus ==
                                                      'A'))
                                              .toList()
                                              .toList() ??
                                          [];
                                      if (loanList.isEmpty) {
                                        return Center(
                                          child: Container(
                                            width: double.infinity,
                                            height: 350.0,
                                            child: EmptyComponentTopupWidget(
                                              text1:
                                                  topupCardPageApplicationRecord
                                                      .topupNoDataText,
                                              text2:
                                                  topupCardPageApplicationRecord
                                                      .topupNoData2Text,
                                            ),
                                          ),
                                        );
                                      }

                                      return RefreshIndicator(
                                        onRefresh: () async {
                                          safeSetState(() => _model
                                              .apiRequestCompleter = null);
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
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: loanList.length,
                                          itemBuilder:
                                              (context, loanListIndex) {
                                            final loanListItem =
                                                loanList[loanListIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 9.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  FFAppState()
                                                          .getLoanListSelected =
                                                      loanListItem;
                                                  safeSetState(() {});
                                                  if (FFAppState()
                                                              .getLoanListSelected
                                                              .requestStatus ==
                                                          'ยังไม่ได้ทำรายการเติมเงิน'
                                                      ? true
                                                      : false) {
                                                    context.pushNamed(
                                                      TopupDetailDataPageWidget
                                                          .routeName,
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .rightToLeft,
                                                        ),
                                                      },
                                                    );
                                                  } else {
                                                    context.pushNamed(
                                                      TopupStatusPageWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'fromPage':
                                                            serializeParam(
                                                          'LoanListCard',
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .rightToLeft,
                                                        ),
                                                      },
                                                    );
                                                  }
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: false
                                                        ? Color(0xFFE9FFEA)
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4.0,
                                                        color:
                                                            Color(0x33000000),
                                                        offset: Offset(
                                                          0.0,
                                                          2.0,
                                                        ),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(15.0),
                                                      bottomRight:
                                                          Radius.circular(15.0),
                                                      topLeft:
                                                          Radius.circular(15.0),
                                                      topRight:
                                                          Radius.circular(15.0),
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
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
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Builder(
                                                                      builder:
                                                                          (context) {
                                                                        if ('${loanListItem.contractDetails.loanTypeCode}' ==
                                                                            'C') {
                                                                          return ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            child:
                                                                                SvgPicture.asset(
                                                                              'assets/images/car-loan.svg',
                                                                              width: 50.0,
                                                                              height: 50.0,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          );
                                                                        } else if ('${loanListItem.contractDetails.loanTypeCode}' ==
                                                                            'M') {
                                                                          return ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            child:
                                                                                SvgPicture.asset(
                                                                              'assets/images/MotorLoanIcon.svg',
                                                                              width: 50.0,
                                                                              height: 50.0,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          );
                                                                        } else {
                                                                          return ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            child:
                                                                                SvgPicture.asset(
                                                                              'assets/images/HouseLoanIcon.svg',
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
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                8.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
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
                                                                                if (('${loanListItem.contractDetails.loanTypeCode}' == 'L') || ('${loanListItem.contractDetails.loanTypeCode}' == 'H') || (loanListItem.topupDetail.canTopup == 'G') || (loanListItem.topupDetail.canTopup == 'A') || (loanListItem.topupDetail.canTopup == 'L'))
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
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Divider(
                                                        thickness: 2.0,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'วงเงินสินเชื่อสูงสุด',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto San Thai',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                if (('${loanListItem.contractDetails.loanTypeCode}' !=
                                                                        'L') &&
                                                                    ('${loanListItem.contractDetails.loanTypeCode}' !=
                                                                        'H'))
                                                                  Text(
                                                                    '(เลขที่สัญญา ${'${loanListItem.contractNo}'})',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto San Thai',
                                                                          color:
                                                                              Color(0x80646464),
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                if (('${loanListItem.contractDetails.loanTypeCode}' ==
                                                                        'L') ||
                                                                    ('${loanListItem.contractDetails.loanTypeCode}' ==
                                                                        'H'))
                                                                  Text(
                                                                    '(เลขที่${'${loanListItem.contractNo}'})',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto San Thai',
                                                                          color:
                                                                              Color(0x80646464),
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                              ],
                                                            ),
                                                            Text(
                                                              '${valueOrDefault<String>(
                                                                functions
                                                                    .returnNumberWithComma2Decimal(
                                                                        '${loanListItem.topupDetail.defaultTopupAmount.toString()}'),
                                                                '0',
                                                              )}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto San Thai',
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    8.0,
                                                                    12.0,
                                                                    8.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Container(
                                                                width:
                                                                    valueOrDefault<
                                                                        double>(
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
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent2,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      '${loanListItem.requestStatus}' !=
                                                                              'ยังไม่ได้ทำรายการเติมเงิน'
                                                                          ? 'ตรวจสอบสถานะ'
                                                                          : 'เติมวงเงิน',
                                                                      'เติมวงเงิน',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto San Thai',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ]
                                                        .addToStart(SizedBox(
                                                            height: 12.0))
                                                        .addToEnd(SizedBox(
                                                            height: 4.0)),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                          if (false)
                            Container(
                              height: 250.0,
                              child: wrapWithModel(
                                model: _model.emptyComponentTopupModel,
                                updateCallback: () => safeSetState(() {}),
                                child: EmptyComponentTopupWidget(
                                  text1:
                                      '${_model.configOutput?.topupNoDataText}',
                                  text2:
                                      '${_model.configOutput?.topupNoData2Text}',
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
          );
        },
      ),
    );
  }
}
