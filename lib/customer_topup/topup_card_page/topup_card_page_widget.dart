import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/customer_topup/empty_component_topup/empty_component_topup_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/loading/loading_widget.dart';
import 'dart:async';
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
      setDarkModeSetting(context, ThemeMode.light);
      unawaited(
        () async {}(),
      );
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
              child: LoadingWidget(),
            ),
          );
        },
      );

      _model.configOutput =
          await ApplicationRecord.getDocumentOnce(FFAppState().configDocument!);
      FFAppState().hashThaiIdAppState = widget.hashThaiId!;
      FFAppState().accessToken = widget.token!;
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
          amount: 0,
          from: '',
          contractBankAccount: '',
          contractBankBrandname: '',
          contractBankType: '',
          contractBankBranch: '',
          interestRate: 0,
          installmentNumber: 0,
          amountPerInstallment: 0,
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
      );

      if ((_model.userDetailOutput?.statusCode ?? 200) != 200) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              content: Text(
                  'พบข้อผิดพลาด statuscode (${(_model.userDetailOutput?.statusCode ?? 200).toString()})'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
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
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              content: Text('${UserDetailCall.message(
                (_model.userDetailOutput?.jsonBody ?? ''),
              )}'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
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
      _model.getUserAddressApiOutput =
          await SrisawadApiGroup.getUserAddressInformationCall.call(
        hashThaiId: widget.hashThaiId,
        bearerAuth: FFAppState().accessToken,
      );

      if ((_model.getUserAddressApiOutput?.statusCode ?? 200) == 200) {
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              content: Text('ไม่สามารถโหลดข้อมูลที่อยู่ของลูกค้าได้'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
        Navigator.pop(context);
        return;
      }

      FFAppState().userAddressData =
          SrisawadApiGroup.getUserAddressInformationCall.addressDataJson(
        (_model.getUserAddressApiOutput?.jsonBody ?? ''),
      )!;
      safeSetState(() {});
      _model.getLoanListOutput = await SrisawadApiGroup.getListOfLoanCall.call(
        hashThaiId: FFAppState().hashThaiIdAppState,
        authorization: FFAppState().accessToken,
      );

      if ((_model.getLoanListOutput?.statusCode ?? 200) == 200) {
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              content: Text(
                  'พบข้อผิดพลาด status (${(_model.getLoanListOutput?.statusCode ?? 200).toString()})'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
        Navigator.pop(context);
        return;
      }

      if (('${'${getJsonField(
                (_model.getLoanListOutput?.jsonBody ?? ''),
                r'''$.results[0]''',
              ).toString().toString()}'}' !=
              'null') &&
          ('${'${getJsonField(
                (_model.getLoanListOutput?.jsonBody ?? ''),
                r'''$.results[0]''',
              ).toString().toString()}'}' !=
              '')) {
        FFAppState().getLoanListAPIResultAppState = (getJsonField(
          (_model.getLoanListOutput?.jsonBody ?? ''),
          r'''$.results''',
          true,
        )!
                .toList()
                .map<GetLoanListAPIDataTypeStruct?>(
                    GetLoanListAPIDataTypeStruct.maybeFromMap)
                .toList() as Iterable<GetLoanListAPIDataTypeStruct?>)
            .withoutNulls
            .toList()
            .cast<GetLoanListAPIDataTypeStruct>();
        safeSetState(() {});
      }
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
      builder: (context) => GestureDetector(
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
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(
                    CapturePictureSelfieIdcardPageWidget.routeName,
                    queryParameters: {
                      'imageType': serializeParam(
                        'idCard',
                        ParamType.String,
                      ),
                      'title': serializeParam(
                        'ถ่ายรูปบัตรประชาชน',
                        ParamType.String,
                      ),
                    }.withoutNulls,
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.rightToLeft,
                      ),
                    },
                  );
                },
                child: Text(
                  'เติมวงเงิน',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Noto San Thai',
                        color: Color(0xFF003063),
                        fontSize: 18.0,
                        letterSpacing: 0.0,
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
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
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
                                  '${_model.configOutput?.topupTextTitle}',
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
                                      final listText = _model
                                              .configOutput?.topupTextList
                                              .toList() ??
                                          [];

                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: List.generate(listText.length,
                                            (listTextIndex) {
                                          final listTextItem =
                                              listText[listTextIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 2.0, 0.0, 0.0),
                                            child: Text(
                                              listTextItem,
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                      final warnningTextList = _model
                                              .configOutput
                                              ?.topupWarnningTextList
                                              .toList() ??
                                          [];

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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 2.0, 0.0, 0.0),
                                            child: Text(
                                              warnningTextListItem,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Noto San Thai',
                                                    color: functions.containString(
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
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
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
                      if (FFAppState().getLoanListAPIResultAppState.length > 0)
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                final loanList = FFAppState()
                                    .getLoanListAPIResultAppState
                                    .toList();

                                return ListView.builder(
                                  padding: EdgeInsets.fromLTRB(
                                    0,
                                    0,
                                    0,
                                    30.0,
                                  ),
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: loanList.length,
                                  itemBuilder: (context, loanListIndex) {
                                    final loanListItem =
                                        loanList[loanListIndex];
                                    return Visibility(
                                      visible: valueOrDefault<String>(
                                            FFAppState()
                                                .getLoanListAPIResultAppState
                                                .elementAtOrNull(loanListIndex)
                                                ?.topupDetail
                                                .canTopup,
                                            'contract_no',
                                          ) ==
                                          'Y',
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 9.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            FFAppState().getLoanListSelected =
                                                FFAppState()
                                                    .getLoanListAPIResultAppState
                                                    .elementAtOrNull(
                                                        loanListIndex)!;
                                            safeSetState(() {});

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
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: false
                                                  ? Color(0xFFE9FFEA)
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 4.0,
                                                  color: Color(0x33000000),
                                                  offset: Offset(
                                                    0.0,
                                                    2.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(15.0),
                                                bottomRight:
                                                    Radius.circular(15.0),
                                                topLeft: Radius.circular(15.0),
                                                topRight: Radius.circular(15.0),
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        8.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  if (FFAppState()
                                                                          .getTopupDataAPIResultAppstate
                                                                          .contractDetails
                                                                          .loanTypeCode ==
                                                                      'C') {
                                                                    return ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child: SvgPicture
                                                                          .asset(
                                                                        'assets/images/car-loan.svg',
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    );
                                                                  } else if (FFAppState()
                                                                          .getTopupDataAPIResultAppstate
                                                                          .contractDetails
                                                                          .loanTypeCode ==
                                                                      'M') {
                                                                    return ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child: SvgPicture
                                                                          .asset(
                                                                        'assets/images/MotorLoanIcon.svg',
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    );
                                                                  } else {
                                                                    return ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child: SvgPicture
                                                                          .asset(
                                                                        'assets/images/HouseLoanIcon.svg',
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        fit: BoxFit
                                                                            .cover,
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
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
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
                                                                                              FFAppState().getLoanListAPIResultAppState.elementAtOrNull(loanListIndex)?.contractDetails.loanTypeName,
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
                                                                            child:
                                                                                Container(
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
                                                                                      valueOrDefault<String>(
                                                                                        FFAppState().getLoanListAPIResultAppState.elementAtOrNull(loanListIndex)?.contractNo,
                                                                                        'contract_no',
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
                                                                          Expanded(
                                                                            child:
                                                                                Container(
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
                                                                                      valueOrDefault<String>(
                                                                                        FFAppState().getLoanListAPIResultAppState.elementAtOrNull(loanListIndex)?.contractDetails.collateralInformation,
                                                                                        'collateral_information',
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
                                                                          Expanded(
                                                                            child:
                                                                                Container(
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
                                                                                      valueOrDefault<String>(
                                                                                        FFAppState().getLoanListAPIResultAppState.elementAtOrNull(loanListIndex)?.requestStatus,
                                                                                        'request_status',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Noto San Thai',
                                                                                            color: Colors.black,
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
                                                                          if ('${valueOrDefault<String>(
                                                                                FFAppState().getLoanListAPIResultAppState.elementAtOrNull(loanListIndex)?.topupDetail.topupExtra.toString(),
                                                                                'topup_extra',
                                                                              )}' !=
                                                                              '0')
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
                                                                                        valueOrDefault<String>(
                                                                                          FFAppState().getLoanListAPIResultAppState.elementAtOrNull(loanListIndex)?.topupDetail.topupExtra.toString(),
                                                                                          'topup_extra',
                                                                                        ),
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
                                                                          if (valueOrDefault<String>(
                                                                                FFAppState().getLoanListAPIResultAppState.elementAtOrNull(loanListIndex)?.loanTypeCode,
                                                                                'loan_type_name',
                                                                              ) ==
                                                                              'L')
                                                                            Expanded(
                                                                              child: Container(
                                                                                decoration: BoxDecoration(),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                                    children: [
                                                                                      Text(
                                                                                        'ยังไม่สามารถทำผ่านมือถือได้กรุณาติดต่อสาขา',
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
                                                                          if (valueOrDefault<String>(
                                                                                FFAppState().getLoanListAPIResultAppState.elementAtOrNull(loanListIndex)?.loanTypeCode,
                                                                                'loan_type_name',
                                                                              ) ==
                                                                              'L')
                                                                            Expanded(
                                                                              child: Container(
                                                                                decoration: BoxDecoration(),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                                    children: [
                                                                                      Text(
                                                                                        'เจ้าองบัญชีหรือสาขาใกล้บ้านเพื่อรับเงิน',
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 12.0, 0.0),
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
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'เงินต้นสัญญาเก่า',
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
                                                          Text(
                                                            '(เลขที่สัญญา ${valueOrDefault<String>(
                                                              FFAppState()
                                                                  .getLoanListAPIResultAppState
                                                                  .elementAtOrNull(
                                                                      loanListIndex)
                                                                  ?.contractNo,
                                                              'contract_no',
                                                            )})',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto San Thai',
                                                                  color: Color(
                                                                      0x80646464),
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                      Text(
                                                        valueOrDefault<String>(
                                                          FFAppState()
                                                              .getLoanListAPIResultAppState
                                                              .elementAtOrNull(
                                                                  loanListIndex)
                                                              ?.contractDetails
                                                              .closingBalance
                                                              .toString(),
                                                          'closing_balance',
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Noto San Thai',
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 8.0, 12.0, 8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 50.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent2,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              'เติมวงเงิน',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto San Thai',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ]
                                                  .addToStart(
                                                      SizedBox(height: 12.0))
                                                  .addToEnd(
                                                      SizedBox(height: 4.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      Container(
                        height: 250.0,
                        child: Visibility(
                          visible: (List<String> canTopupList) {
                            return canTopupList.every((e) => e == 'N');
                          }((SrisawadApiGroup.getListOfLoanCall
                                          .results(
                                            (_model.getLoanListOutput
                                                    ?.jsonBody ??
                                                ''),
                                          )!
                                          .length >
                                      0
                                  ? SrisawadApiGroup.getListOfLoanCall.cantopup(
                                      (_model.getLoanListOutput?.jsonBody ??
                                          ''),
                                    )!
                                  : FFAppState().emptyList)
                              .toList()),
                          child: wrapWithModel(
                            model: _model.emptyComponentTopupModel,
                            updateCallback: () => safeSetState(() {}),
                            child: EmptyComponentTopupWidget(
                              text1: _model.configOutput?.topupNoDataText,
                              text2: _model.configOutput?.topupNoData2Text,
                            ),
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
    );
  }
}
