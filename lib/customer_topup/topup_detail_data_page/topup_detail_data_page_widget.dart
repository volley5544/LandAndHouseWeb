import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/customer_topup/loan_detail_card_component/loan_detail_card_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/loading/loading_widget.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'topup_detail_data_page_model.dart';
export 'topup_detail_data_page_model.dart';

class TopupDetailDataPageWidget extends StatefulWidget {
  const TopupDetailDataPageWidget({super.key});

  static String routeName = 'TopupDetailDataPage';
  static String routePath = '/TopupDetailDataPage';

  @override
  State<TopupDetailDataPageWidget> createState() =>
      _TopupDetailDataPageWidgetState();
}

class _TopupDetailDataPageWidgetState extends State<TopupDetailDataPageWidget> {
  late TopupDetailDataPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TopupDetailDataPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
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

      _model.getTopupDetailAPIOutput =
          await SrisawadApiGroup.getTopupDetailCall.call(
        dbName: FFAppState().getLoanListSelected.dbName,
        contractNo: FFAppState().getLoanListSelected.contractNo,
        bearerAuth: FFAppState().accessToken,
      );

      if ((_model.getTopupDetailAPIOutput?.statusCode ?? 200) != 200) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              content: Text(
                  'พบข้อผิดพลาด status (${(_model.getTopupDetailAPIOutput?.statusCode ?? 200).toString()})'),
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
      if (SrisawadApiGroup.getTopupDetailCall.code(
            (_model.getTopupDetailAPIOutput?.jsonBody ?? ''),
          ) !=
          '200') {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              content: Text('${SrisawadApiGroup.getTopupDetailCall.message(
                (_model.getTopupDetailAPIOutput?.jsonBody ?? ''),
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
      FFAppState().getTopupDataAPIResultAppstate =
          GetTopupDataAPIDataTypeStruct.maybeFromMap(
              (_model.getTopupDetailAPIOutput?.jsonBody ?? ''))!;
      safeSetState(() {});
      safeSetState(() {
        _model.textController?.text = valueOrDefault<String>(
          FFAppState()
              .getTopupDataAPIResultAppstate
              .defaultTopupAmount
              .toString(),
          'default_topup_amount',
        );
      });
      _model.inittopupCalculateAPIOutput =
          await SrisawadApiGroup.postToCalculatorToGetNewTopupCall.call(
        bearerAuth: FFAppState().accessToken,
        transno: '',
        dbName: valueOrDefault<String>(
          FFAppState().getTopupDataAPIResultAppstate.dbName,
          'db_name',
        ),
        contractNo: valueOrDefault<String>(
          FFAppState().getTopupDataAPIResultAppstate.contractNo,
          'contract_no',
        ),
        loanAmount: FFAppState()
            .getTopupDataAPIResultAppstate
            .defaultTopupAmount
            .toDouble(),
        interestRate: double.parse(valueOrDefault<String>(
          FFAppState().getTopupDataAPIResultAppstate.interestRate.toString(),
          'interest_rate',
        )),
        topupFeeAmount: double.parse(valueOrDefault<String>(
          FFAppState().getTopupDataAPIResultAppstate.feeAmount.toString(),
          'fee_amount',
        )),
        feeAmount: double.parse(valueOrDefault<String>(
          FFAppState().getTopupDataAPIResultAppstate.feeAmount.toString(),
          'fee_amount',
        )),
      );

      if ((_model.inittopupCalculateAPIOutput?.statusCode ?? 200) != 200) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              content: Text(
                  'พบข้อผิดพลาด status (${(_model.inittopupCalculateAPIOutput?.statusCode ?? 200).toString()})'),
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
      FFAppState().getTopupCalculateAppState =
          TopupCalculateDataTypeStruct.maybeFromMap(
              (_model.inittopupCalculateAPIOutput?.jsonBody ?? ''))!;
      safeSetState(() {});
      FFAppState().updateGetTopupDataAPIResultAppstateStruct(
        (e) => e..feeAmount = FFAppState().getTopupCalculateAppState.feeAmount,
      );
      safeSetState(() {});
      Navigator.pop(context);
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
              title: Text(
                'ข้อมูลยอดจัดสินเชื่อ',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Noto San Thai',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 18.0,
                      letterSpacing: 0.0,
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
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Visibility(
                      visible:
                          FFAppState().getTopupDataAPIResultAppstate.code ==
                              '200',
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            wrapWithModel(
                              model: _model.loanDetailCardComponentModel,
                              updateCallback: () => safeSetState(() {}),
                              child: LoanDetailCardComponentWidget(
                                contNo: valueOrDefault<String>(
                                  FFAppState()
                                      .getTopupDataAPIResultAppstate
                                      .contractNo,
                                  'contract_no',
                                ),
                                assetCode: valueOrDefault<String>(
                                  FFAppState()
                                      .getTopupDataAPIResultAppstate
                                      .contractDetails
                                      .collateralInformation,
                                  'collateral_information',
                                ),
                                productTypeCode: FFAppState()
                                    .getLoanListSelected
                                    .contractDetails
                                    .loanTypeCode,
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  width: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Text(
                                                    'ยอดจัดสินเชื่อเดิม',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto San Thai',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
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
                                            24.0, 0.0, 24.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                valueOrDefault<String>(
                                                  functions
                                                      .returnNumberWithComma2Decimal(
                                                          valueOrDefault<
                                                              String>(
                                                    FFAppState()
                                                        .getTopupDataAPIResultAppstate
                                                        .topupActual
                                                        .toString(),
                                                    'topup_actual',
                                                  )),
                                                  'topup_actual',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto San Thai',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                              Text(
                                                'บาท',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto San Thai',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 8.0)),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    width: 100.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  1.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'วงเงินพิเศษ',
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
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  valueOrDefault<String>(
                                                    functions
                                                        .returnNumberWithComma2Decimal(
                                                            valueOrDefault<
                                                                String>(
                                                      FFAppState()
                                                          .getTopupDataAPIResultAppstate
                                                          .topupExtra
                                                          .toString(),
                                                      'topup_extra',
                                                    )),
                                                    'topup_extra',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto San Thai',
                                                        color:
                                                            Color(0xFFFF0000),
                                                        fontSize: 24.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                                Text(
                                                  'บาท',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto San Thai',
                                                        color:
                                                            Color(0xFFFF0000),
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 8.0)),
                                    ),
                                  ),
                                  Divider(
                                    thickness: 2.0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              width: 100.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Text(
                                                'วงเงินสินเชื่อใหม่',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto San Thai',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 24.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            '${functions.returnNumberWithComma2Decimal(valueOrDefault<String>(
                                              FFAppState()
                                                  .getTopupDataAPIResultAppstate
                                                  .defaultTopupAmount
                                                  .toString(),
                                              'default_topup_amount',
                                            ))} บาท',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto San Thai',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 24.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    thickness: 2.0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  width: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Text(
                                                    'เงื่อนไข',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto San Thai',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            'คุณสามารถแก้ไขยอดขอสินเชื่อใหม่ได้ แต่จำนวนเงินต้องไม่เกิน 7000 บาท (ยอดจัดสินเชื่อ ระบบจะปัดเป็นจำนวนเต็มร้อยเท่านั้น)',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto San Thai',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                          ),
                                        ],
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  width: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 0.0),
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
                                                                    .tertiary,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Builder(
                                                    builder: (context) =>
                                                        Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 200.0,
                                                        child: TextFormField(
                                                          controller: _model
                                                              .textController,
                                                          focusNode: _model
                                                              .textFieldFocusNode,
                                                          onFieldSubmitted:
                                                              (_) async {
                                                            var _shouldSetState =
                                                                false;
                                                            safeSetState(() {
                                                              _model.textController
                                                                      ?.text =
                                                                  functions
                                                                      .roundDownInput(functions.removeCommaFromNumText(_model
                                                                          .textController
                                                                          .text))!
                                                                      .toString();
                                                            });
                                                            unawaited(
                                                              () async {}(),
                                                            );
                                                            if (!((int textField,
                                                                    int
                                                                        minTopup,
                                                                    int
                                                                        maxTopup) {
                                                              return (textField >=
                                                                      minTopup) &&
                                                                  (textField <=
                                                                      maxTopup);
                                                            }(
                                                                int.parse(_model
                                                                    .textController
                                                                    .text),
                                                                valueOrDefault<
                                                                    int>(
                                                                  FFAppState()
                                                                      .getTopupDataAPIResultAppstate
                                                                      .minTopupAmount,
                                                                  0,
                                                                ),
                                                                valueOrDefault<
                                                                    int>(
                                                                  FFAppState()
                                                                      .getTopupDataAPIResultAppstate
                                                                      .maxTopupAmount,
                                                                  0,
                                                                )))) {
                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                              return;
                                                            }
                                                            showDialog(
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
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
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      GestureDetector(
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
                                                                        LoadingWidget(),
                                                                  ),
                                                                );
                                                              },
                                                            );

                                                            _model.topupCalculateAPIOutput =
                                                                await SrisawadApiGroup
                                                                    .postToCalculatorToGetNewTopupCall
                                                                    .call(
                                                              bearerAuth:
                                                                  FFAppState()
                                                                      .accessToken,
                                                              transno: '',
                                                              dbName:
                                                                  valueOrDefault<
                                                                      String>(
                                                                FFAppState()
                                                                    .getTopupDataAPIResultAppstate
                                                                    .dbName,
                                                                'db_name',
                                                              ),
                                                              contractNo:
                                                                  valueOrDefault<
                                                                      String>(
                                                                FFAppState()
                                                                    .getTopupDataAPIResultAppstate
                                                                    .contractNo,
                                                                'contract_no',
                                                              ),
                                                              loanAmount: double
                                                                  .parse((functions
                                                                      .removeCommaFromNumText(_model
                                                                          .textController
                                                                          .text)!)),
                                                              interestRate:
                                                                  double.parse(
                                                                      valueOrDefault<
                                                                          String>(
                                                                FFAppState()
                                                                    .getTopupDataAPIResultAppstate
                                                                    .interestRate
                                                                    .toString(),
                                                                'interest_rate',
                                                              )),
                                                              topupFeeAmount:
                                                                  double.parse(
                                                                      valueOrDefault<
                                                                          String>(
                                                                FFAppState()
                                                                    .getTopupDataAPIResultAppstate
                                                                    .feeAmount
                                                                    .toString(),
                                                                'fee_amount',
                                                              )),
                                                              feeAmount: double.parse(
                                                                  valueOrDefault<
                                                                      String>(
                                                                FFAppState()
                                                                    .getTopupDataAPIResultAppstate
                                                                    .feeAmount
                                                                    .toString(),
                                                                'fee_amount',
                                                              )),
                                                            );

                                                            _shouldSetState =
                                                                true;
                                                            if ((_model.topupCalculateAPIOutput
                                                                        ?.statusCode ??
                                                                    200) !=
                                                                200) {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    content: Text(
                                                                        'พบข้อผิดพลาด status (${(_model.topupCalculateAPIOutput?.statusCode ?? 200).toString()})'),
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
                                                              Navigator.pop(
                                                                  context);
                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                              return;
                                                            }
                                                            FFAppState()
                                                                    .getTopupCalculateAppState =
                                                                TopupCalculateDataTypeStruct
                                                                    .maybeFromMap((_model
                                                                            .topupCalculateAPIOutput
                                                                            ?.jsonBody ??
                                                                        ''))!;
                                                            safeSetState(() {});
                                                            FFAppState()
                                                                .updateGetTopupDataAPIResultAppstateStruct(
                                                              (e) => e
                                                                ..feeAmount =
                                                                    FFAppState()
                                                                        .getTopupCalculateAppState
                                                                        .feeAmount,
                                                            );
                                                            safeSetState(() {});
                                                            Navigator.pop(
                                                                context);
                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                          },
                                                          autofocus: false,
                                                          readOnly:
                                                              valueOrDefault<
                                                                      String>(
                                                                    FFAppState()
                                                                        .getTopupDataAPIResultAppstate
                                                                        .interestPaidFlag,
                                                                    'topup_extra',
                                                                  ) ==
                                                                  'Y',
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            isDense: false,
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto San Thai',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            hintText:
                                                                'TextField',
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto San Thai',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            enabledBorder:
                                                                UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                width: 0.8,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedBorder:
                                                                UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 0.8,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            errorBorder:
                                                                UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 0.8,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 0.8,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            filled: true,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto San Thai',
                                                                fontSize: 24.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          cursorColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                          validator: _model
                                                              .textControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  'บาท',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto San Thai',
                                                        fontSize: 24.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                  width: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'เลื่อนเพื่อปรับลดวงเงิน',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto San Thai',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: Container(
                                              height: 60.0,
                                              decoration: BoxDecoration(),
                                              child: Stack(
                                                children: [
                                                  Builder(
                                                    builder: (context) =>
                                                        Container(
                                                      width: 350.0,
                                                      child: Slider(
                                                        activeColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        inactiveColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        min: valueOrDefault<
                                                            double>(
                                                          FFAppState()
                                                              .getTopupDataAPIResultAppstate
                                                              .minTopupAmount
                                                              .toDouble(),
                                                          0.0,
                                                        ),
                                                        max: valueOrDefault<
                                                            double>(
                                                          FFAppState()
                                                              .getTopupDataAPIResultAppstate
                                                              .maxTopupAmount
                                                              .toDouble(),
                                                          0.0,
                                                        ),
                                                        value: _model
                                                                .sliderValue ??=
                                                            valueOrDefault<
                                                                double>(
                                                          FFAppState()
                                                              .getTopupDataAPIResultAppstate
                                                              .defaultTopupAmount
                                                              .toDouble(),
                                                          0.0,
                                                        ),
                                                        label: _model
                                                            .sliderValue
                                                            ?.toStringAsFixed(
                                                                0),
                                                        divisions: 100,
                                                        onChanged: (newValue) {
                                                          newValue = double
                                                              .parse(newValue
                                                                  .toStringAsFixed(
                                                                      0));
                                                          safeSetState(() =>
                                                              _model.sliderValue =
                                                                  newValue);
                                                        },
                                                        onChangeEnd:
                                                            (newValue) async {
                                                          newValue = double
                                                              .parse(newValue
                                                                  .toStringAsFixed(
                                                                      0));
                                                          safeSetState(() =>
                                                              _model.sliderValue =
                                                                  newValue);
                                                          var _shouldSetState =
                                                              false;
                                                          safeSetState(() {
                                                            _model.textController
                                                                    ?.text =
                                                                functions
                                                                    .roundDownInput(functions.removeCommaFromNumText(_model
                                                                        .sliderValue
                                                                        ?.toString()))!
                                                                    .toString();
                                                          });
                                                          safeSetState(() {
                                                            _model.sliderValue = functions
                                                                .roundDownInput(
                                                                    functions.removeCommaFromNumText(_model
                                                                        .sliderValue
                                                                        ?.toString()))!
                                                                .toDouble();
                                                          });
                                                          unawaited(
                                                            () async {}(),
                                                          );
                                                          showDialog(
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
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
                                                                        Directionality.of(
                                                                            context)),
                                                                child:
                                                                    GestureDetector(
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
                                                                      LoadingWidget(),
                                                                ),
                                                              );
                                                            },
                                                          );

                                                          _model.topupCalculateAPIOutputSlider =
                                                              await SrisawadApiGroup
                                                                  .postToCalculatorToGetNewTopupCall
                                                                  .call(
                                                            bearerAuth:
                                                                FFAppState()
                                                                    .accessToken,
                                                            transno: '',
                                                            dbName:
                                                                valueOrDefault<
                                                                    String>(
                                                              FFAppState()
                                                                  .getTopupDataAPIResultAppstate
                                                                  .dbName,
                                                              'db_name',
                                                            ),
                                                            contractNo:
                                                                valueOrDefault<
                                                                    String>(
                                                              FFAppState()
                                                                  .getTopupDataAPIResultAppstate
                                                                  .contractNo,
                                                              'contract_no',
                                                            ),
                                                            loanAmount: double.parse(functions
                                                                .roundDownInput(
                                                                    functions.removeCommaFromNumText(_model
                                                                        .sliderValue
                                                                        ?.toString()))!
                                                                .toString()),
                                                            interestRate:
                                                                double.parse(
                                                                    valueOrDefault<
                                                                        String>(
                                                              FFAppState()
                                                                  .getTopupDataAPIResultAppstate
                                                                  .interestRate
                                                                  .toString(),
                                                              'interest_rate',
                                                            )),
                                                            topupFeeAmount:
                                                                double.parse(
                                                                    valueOrDefault<
                                                                        String>(
                                                              FFAppState()
                                                                  .getTopupDataAPIResultAppstate
                                                                  .feeAmount
                                                                  .toString(),
                                                              'fee_amount',
                                                            )),
                                                            feeAmount:
                                                                double.parse(
                                                                    valueOrDefault<
                                                                        String>(
                                                              FFAppState()
                                                                  .getTopupDataAPIResultAppstate
                                                                  .feeAmount
                                                                  .toString(),
                                                              'fee_amount',
                                                            )),
                                                          );

                                                          _shouldSetState =
                                                              true;
                                                          if ((_model.topupCalculateAPIOutputSlider
                                                                      ?.statusCode ??
                                                                  200) !=
                                                              200) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  content: Text(
                                                                      'พบข้อผิดพลาด status (${(_model.topupCalculateAPIOutputSlider?.statusCode ?? 200).toString()})'),
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
                                                            Navigator.pop(
                                                                context);
                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                            return;
                                                          }
                                                          FFAppState()
                                                                  .getTopupCalculateAppState =
                                                              TopupCalculateDataTypeStruct
                                                                  .maybeFromMap((_model
                                                                          .topupCalculateAPIOutputSlider
                                                                          ?.jsonBody ??
                                                                      ''))!;
                                                          safeSetState(() {});
                                                          FFAppState()
                                                              .updateGetTopupDataAPIResultAppstateStruct(
                                                            (e) => e
                                                              ..feeAmount =
                                                                  FFAppState()
                                                                      .getTopupCalculateAppState
                                                                      .feeAmount,
                                                          );
                                                          safeSetState(() {});
                                                          Navigator.pop(
                                                              context);
                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -0.86, 0.0),
                                                    child: Container(
                                                      width: 3.0,
                                                      height: 15.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.86, 0.0),
                                                    child: Container(
                                                      width: 3.0,
                                                      height: 15.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 5.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    '${functions.returnNumberWithComma2Decimal(valueOrDefault<String>(
                                                      FFAppState()
                                                          .getTopupDataAPIResultAppstate
                                                          .minTopupAmount
                                                          .toString(),
                                                      'min_topup_amount',
                                                    ))} บาท',
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
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    '${functions.returnNumberWithComma2Decimal(valueOrDefault<String>(
                                                      FFAppState()
                                                          .getTopupDataAPIResultAppstate
                                                          .maxTopupAmount
                                                          .toString(),
                                                      'max_topup_amount',
                                                    ))} บาท',
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
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  width: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Visibility(
                                                    visible: int.parse(_model
                                                            .textController
                                                            .text) <
                                                        int.parse(
                                                            valueOrDefault<
                                                                String>(
                                                          FFAppState()
                                                              .getTopupDataAPIResultAppstate
                                                              .minTopupAmount
                                                              .toString(),
                                                          '0',
                                                        )),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        '* จำนวนเงินต้องไม่น้อยกว่า  ${valueOrDefault<String>(
                                                          FFAppState()
                                                              .getTopupDataAPIResultAppstate
                                                              .minTopupAmount
                                                              .toString(),
                                                          'default_topup_amount',
                                                        )}  บาท',
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
                                                                ),
                                                      ),
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
                                                  width: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Visibility(
                                                    visible: int.parse(_model
                                                            .textController
                                                            .text) >
                                                        int.parse(
                                                            valueOrDefault<
                                                                String>(
                                                          FFAppState()
                                                              .getTopupDataAPIResultAppstate
                                                              .maxTopupAmount
                                                              .toString(),
                                                          '0',
                                                        )),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        '* ต้องการวงเงินมากกว่า${valueOrDefault<String>(
                                                          FFAppState()
                                                              .getTopupDataAPIResultAppstate
                                                              .maxTopupAmount
                                                              .toString(),
                                                          'max_topup_amount',
                                                        )}บาท สามารถติดต่อสาขาใกล้บ้านที่สะดวก',
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
                                                                ),
                                                      ),
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
                                  Divider(
                                    thickness: 2.0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 12.0, 24.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '1.หักยอดเงินต้นสัญญาเก่า',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto San Thai',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                if (valueOrDefault<String>(
                                                      FFAppState()
                                                          .getTopupDataAPIResultAppstate
                                                          .contractDetails
                                                          .loanTypeCode,
                                                      'contract_no',
                                                    ) !=
                                                    'L')
                                                  Text(
                                                    '(เลขที่สัญญา ${valueOrDefault<String>(
                                                      FFAppState()
                                                          .getTopupDataAPIResultAppstate
                                                          .contractNo,
                                                      'contract_no',
                                                    )})',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto San Thai',
                                                          color:
                                                              Color(0x76646464),
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                if (valueOrDefault<String>(
                                                      FFAppState()
                                                          .getTopupDataAPIResultAppstate
                                                          .contractDetails
                                                          .loanTypeCode,
                                                      'contract_no',
                                                    ) ==
                                                    'L')
                                                  Text(
                                                    '(ตั๋วสัญญาใช้เงิน ${valueOrDefault<String>(
                                                      FFAppState()
                                                          .getTopupDataAPIResultAppstate
                                                          .contractNo,
                                                      'contract_no',
                                                    )})',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto San Thai',
                                                          color:
                                                              Color(0x76646464),
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            '${functions.returnNumberWithComma2Decimal(valueOrDefault<String>(
                                              FFAppState()
                                                  .getTopupDataAPIResultAppstate
                                                  .contractDetails
                                                  .closingBalance
                                                  .toString(),
                                              'closing_balance',
                                            ))} บาท',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto San Thai',
                                                  color: Colors.black,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    thickness: 2.0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 12.0, 24.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '2.หักอากรสแตมป์',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto San Thai',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                if (valueOrDefault<String>(
                                                      FFAppState()
                                                          .getTopupDataAPIResultAppstate
                                                          .contractDetails
                                                          .loanTypeCode,
                                                      'contract_no',
                                                    ) !=
                                                    'L')
                                                  Text(
                                                    '(เลขที่สัญญา ${valueOrDefault<String>(
                                                      FFAppState()
                                                          .getTopupDataAPIResultAppstate
                                                          .contractNo,
                                                      'contract_no',
                                                    )})',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto San Thai',
                                                          color:
                                                              Color(0x76646464),
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                if (valueOrDefault<String>(
                                                      FFAppState()
                                                          .getTopupDataAPIResultAppstate
                                                          .contractDetails
                                                          .loanTypeCode,
                                                      'contract_no',
                                                    ) ==
                                                    'L')
                                                  Text(
                                                    '(ตั๋วสัญญาใช้เงิน ${valueOrDefault<String>(
                                                      FFAppState()
                                                          .getTopupDataAPIResultAppstate
                                                          .contractNo,
                                                      'contract_no',
                                                    )})',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto San Thai',
                                                          color:
                                                              Color(0x76646464),
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            '${functions.returnNumberWithComma2Decimal(valueOrDefault<String>(
                                              FFAppState()
                                                  .getTopupDataAPIResultAppstate
                                                  .feeAmount
                                                  .toString(),
                                              'fee_amount',
                                            ))} บาท',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto San Thai',
                                                  color: Colors.black,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    thickness: 2.0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 12.0, 24.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '3.จำนวนเงินที่จะได้รับ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto San Thai',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                Text(
                                                  '(ก่อนจ่ายยอดค้างชำระ)',
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
                                              ],
                                            ),
                                          ),
                                          Text(
                                            '${functions.returnNumberWithComma2Decimal((double.parse((functions.removeCommaFromNumText('${FFAppState().getTopupCalculateAppState.amount.toString()}')!)) - int.parse(valueOrDefault<String>(
                                                  FFAppState()
                                                      .getTopupDataAPIResultAppstate
                                                      .contractDetails
                                                      .closingBalance
                                                      .toString(),
                                                  'closing_balance',
                                                )) - int.parse(valueOrDefault<String>(
                                                  FFAppState()
                                                      .getTopupDataAPIResultAppstate
                                                      .feeAmount
                                                      .toString(),
                                                  'fee_amount',
                                                )) - int.parse(valueOrDefault<String>(
                                                  FFAppState()
                                                      .getTopupDataAPIResultAppstate
                                                      .collectionFee
                                                      .toString(),
                                                  'collection_fee',
                                                ))).toString())} บาท',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto San Thai',
                                                  color: Colors.black,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  if (valueOrDefault<String>(
                                        FFAppState()
                                            .getTopupDataAPIResultAppstate
                                            .interestPaidFlag,
                                        'yield',
                                      ) ==
                                      'Y')
                                    Divider(
                                      thickness: 2.0,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                  if (valueOrDefault<String>(
                                        FFAppState()
                                            .getTopupDataAPIResultAppstate
                                            .interestPaidFlag,
                                        'yield',
                                      ) ==
                                      'Y')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 12.0, 24.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '4.ค้างชำระงวดที่ (${valueOrDefault<String>(
                                                      FFAppState()
                                                          .getTopupDataAPIResultAppstate
                                                          .overdueTo,
                                                      'overdue_to',
                                                    )}-${valueOrDefault<String>(
                                                      FFAppState()
                                                          .getTopupDataAPIResultAppstate
                                                          .overdueFrom,
                                                      'overdue_from',
                                                    )})',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto San Thai',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  if (valueOrDefault<String>(
                                                        FFAppState()
                                                            .getTopupDataAPIResultAppstate
                                                            .contractDetails
                                                            .loanTypeCode,
                                                        'contract_no',
                                                      ) !=
                                                      'L')
                                                    Text(
                                                      '(เลขที่สัญญา ${valueOrDefault<String>(
                                                        FFAppState()
                                                            .getTopupDataAPIResultAppstate
                                                            .contractNo,
                                                        'contract_no',
                                                      )})',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto San Thai',
                                                            color: Color(
                                                                0x76646464),
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  if (valueOrDefault<String>(
                                                        FFAppState()
                                                            .getTopupDataAPIResultAppstate
                                                            .contractDetails
                                                            .loanTypeCode,
                                                        'contract_no',
                                                      ) ==
                                                      'L')
                                                    Text(
                                                      '(ตั๋วสัญญาใช้เงิน ${valueOrDefault<String>(
                                                        FFAppState()
                                                            .getTopupDataAPIResultAppstate
                                                            .contractNo,
                                                        'contract_no',
                                                      )})',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto San Thai',
                                                            color: Color(
                                                                0x76646464),
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                            Text(
                                              '${functions.returnNumberWithComma2Decimal(valueOrDefault<String>(
                                                FFAppState()
                                                    .getTopupDataAPIResultAppstate
                                                    .overdueAmount
                                                    .toString(),
                                                'overdue_amount',
                                              ))} บาท',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Noto San Thai',
                                                    color: Colors.black,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  if (valueOrDefault<String>(
                                        FFAppState()
                                            .getTopupDataAPIResultAppstate
                                            .interestPaidFlag,
                                        'yield',
                                      ) ==
                                      'Y')
                                    Divider(
                                      thickness: 2.0,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                  if (valueOrDefault<String>(
                                        FFAppState()
                                            .getTopupDataAPIResultAppstate
                                            .interestPaidFlag,
                                        'yield',
                                      ) ==
                                      'Y')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 12.0, 24.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 80.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              flex: 4,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '5.รวมหักดอกเบี้ยและยอดติดตามทวงถามสัญญาเก่า',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto San Thai',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  if (valueOrDefault<String>(
                                                        FFAppState()
                                                            .getTopupDataAPIResultAppstate
                                                            .contractDetails
                                                            .loanTypeCode,
                                                        'contract_no',
                                                      ) !=
                                                      'L')
                                                    Text(
                                                      '(เลขที่สัญญา ${valueOrDefault<String>(
                                                        FFAppState()
                                                            .getTopupDataAPIResultAppstate
                                                            .contractNo,
                                                        'contract_no',
                                                      )})',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto San Thai',
                                                            color: Color(
                                                                0x76646464),
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  if (valueOrDefault<String>(
                                                        FFAppState()
                                                            .getTopupDataAPIResultAppstate
                                                            .contractDetails
                                                            .loanTypeCode,
                                                        'contract_no',
                                                      ) ==
                                                      'L')
                                                    Text(
                                                      '(ตั๋วสัญญาใช้เงิน ${valueOrDefault<String>(
                                                        FFAppState()
                                                            .getTopupDataAPIResultAppstate
                                                            .contractNo,
                                                        'contract_no',
                                                      )})',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto San Thai',
                                                            color: Color(
                                                                0x76646464),
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  Text(
                                                    '*กรุณาชำระเงินก่อนดำเนินการเติมวงเงิน',
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
                                                ],
                                              ),
                                            ),
                                            Text(
                                              '${functions.returnNumberWithComma2Decimal((int.parse(valueOrDefault<String>(
                                                    FFAppState()
                                                        .getTopupDataAPIResultAppstate
                                                        .collectionFee
                                                        .toString(),
                                                    'collection_fee',
                                                  )) + int.parse(valueOrDefault<String>(
                                                    FFAppState()
                                                        .getTopupDataAPIResultAppstate
                                                        .yield
                                                        .toString(),
                                                    'yield',
                                                  ))).toString())} บาท',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Noto San Thai',
                                                    color: Colors.black,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  if (valueOrDefault<String>(
                                        FFAppState()
                                            .getTopupDataAPIResultAppstate
                                            .interestPaidFlag,
                                        'yield',
                                      ) ==
                                      'Y')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          40.0, 0.0, 24.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if ('${valueOrDefault<String>(
                                                  FFAppState()
                                                      .getTopupDataAPIResultAppstate
                                                      .collectionFee
                                                      .toString(),
                                                  'collection_fee',
                                                )}' !=
                                                '0')
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 5.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        '5.1 ดอกเบี้ย',
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
                                                      Text(
                                                        '${functions.returnNumberWithComma2Decimal(valueOrDefault<String>(
                                                          FFAppState()
                                                              .getTopupDataAPIResultAppstate
                                                              .collectionFee
                                                              .toString(),
                                                          'collection_fee',
                                                        ))} บาท',
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
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            if ('${valueOrDefault<String>(
                                                  FFAppState()
                                                      .getTopupDataAPIResultAppstate
                                                      .yield
                                                      .toString(),
                                                  'yield',
                                                )}' !=
                                                '0')
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        '5.2.ค่าติดตามทางถาม',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto San Thai',
                                                                  color: Color(
                                                                      0xFF646464),
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                      Text(
                                                        '${functions.returnNumberWithComma2Decimal(valueOrDefault<String>(
                                                          FFAppState()
                                                              .getTopupDataAPIResultAppstate
                                                              .yield
                                                              .toString(),
                                                          'yield',
                                                        ))} บาท',
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
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
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
                                  Divider(
                                    thickness: 2.0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                if ((((String textField, String minTopup) {
                          return int.parse(textField) >= int.parse(minTopup);
                        }(
                            _model.textController.text,
                            valueOrDefault<String>(
                              FFAppState()
                                  .getTopupDataAPIResultAppstate
                                  .minTopupAmount
                                  .toString(),
                              '0',
                            ))) ==
                        true) ||
                    (((String textField, String maxTopup) {
                          return int.parse(textField) <= int.parse(maxTopup);
                        }(
                            _model.textController.text,
                            valueOrDefault<String>(
                              FFAppState()
                                  .getTopupDataAPIResultAppstate
                                  .minTopupAmount
                                  .toString(),
                              '0',
                            ))) ==
                        true))
                  Container(
                    width: double.infinity,
                    height: 120.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 12.0, 24.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: 30.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'จำนวนเงินที่จะได้รับ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto San Thai',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  '${functions.returnNumberWithComma2Decimal((double.parse((functions.removeCommaFromNumText('${FFAppState().getTopupCalculateAppState.amount.toString()}')!)) - int.parse((valueOrDefault<String>(
                                            FFAppState()
                                                .getTopupDataAPIResultAppstate
                                                .interestPaidFlag,
                                            'yield',
                                          ) == 'Y' ? valueOrDefault<String>(
                                          FFAppState()
                                              .getTopupDataAPIResultAppstate
                                              .yield
                                              .toString(),
                                          'yield',
                                        ) : '0')) - int.parse(valueOrDefault<String>(
                                        FFAppState()
                                            .getTopupDataAPIResultAppstate
                                            .contractDetails
                                            .closingBalance
                                            .toString(),
                                        'closing_balance',
                                      )) - int.parse(valueOrDefault<String>(
                                        FFAppState()
                                            .getTopupDataAPIResultAppstate
                                            .feeAmount
                                            .toString(),
                                        'fee_amount',
                                      )) - int.parse(valueOrDefault<String>(
                                        FFAppState()
                                            .getTopupDataAPIResultAppstate
                                            .collectionFee
                                            .toString(),
                                        'collection_fee',
                                      ))).toString())} บาท',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto San Thai',
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              if ((valueOrDefault<String>(
                                        FFAppState()
                                            .getTopupDataAPIResultAppstate
                                            .interestPaidFlag,
                                        'yield',
                                      ) ==
                                      'Y') ||
                                  true)
                                FFButtonWidget(
                                  onPressed: () async {
                                    _model.interestPayment =
                                        await SrisawadApiGroup
                                            .interestpaymentAPICall
                                            .call(
                                      comcode: FFAppState()
                                          .getLoanListSelected
                                          .barcodeDetails
                                          .comcode,
                                      contractNo: FFAppState()
                                          .getLoanListSelected
                                          .contractNo,
                                      contractName: FFAppState()
                                          .getLoanListSelected
                                          .contractName,
                                      firstname: (String name) {
                                        return name.split(' ')[0];
                                      }(FFAppState()
                                          .getLoanListSelected
                                          .contractName),
                                      lastname: (String name) {
                                        return name.split(' ')[1];
                                      }(FFAppState()
                                          .getLoanListSelected
                                          .contractName),
                                      nationalThaiId: FFAppState()
                                          .customerDetailData
                                          .thaiId,
                                      hashThaiId:
                                          FFAppState().hashThaiIdAppState,
                                      interestAmount: int.parse(
                                          (functions.removeCommaFromNumText(
                                              _model.textController.text)!)),
                                      collectionFee: FFAppState()
                                          .getTopupDataAPIResultAppstate
                                          .collectionFee,
                                      penaltyFee: FFAppState()
                                          .getTopupDataAPIResultAppstate
                                          .penaltyFee,
                                      db: FFAppState()
                                          .getTopupDataAPIResultAppstate
                                          .dbName,
                                      barcodeRef1: FFAppState()
                                          .getLoanListSelected
                                          .barcodeDetails
                                          .ref1,
                                      barcodeRef2: FFAppState()
                                          .getLoanListSelected
                                          .barcodeDetails
                                          .ref2,
                                    );

                                    context.goNamed(
                                      QrPaymentPageWidget.routeName,
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.rightToLeft,
                                        ),
                                      },
                                    );

                                    safeSetState(() {});
                                  },
                                  text: 'ชำระเงิน',
                                  options: FFButtonOptions(
                                    width: 140.0,
                                    height: 50.0,
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
                              if ((valueOrDefault<String>(
                                        FFAppState()
                                            .getTopupDataAPIResultAppstate
                                            .interestPaidFlag,
                                        'yield',
                                      ) ==
                                      'N') ||
                                  true)
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: !(((int textField,
                                                      int minTopup,
                                                      int maxTopup) {
                                                return (textField >=
                                                        minTopup) &&
                                                    (textField <= maxTopup);
                                              }(
                                                  int.parse(_model
                                                      .textController.text),
                                                  valueOrDefault<int>(
                                                    FFAppState()
                                                        .getTopupDataAPIResultAppstate
                                                        .minTopupAmount,
                                                    0,
                                                  ),
                                                  valueOrDefault<int>(
                                                    FFAppState()
                                                        .getTopupDataAPIResultAppstate
                                                        .maxTopupAmount,
                                                    0,
                                                  ))) &&
                                              ((valueOrDefault<String>(
                                                        FFAppState()
                                                            .getTopupDataAPIResultAppstate
                                                            .interestPaidFlag,
                                                        'yield',
                                                      ) ==
                                                      'Y') ||
                                                  true))
                                          ? null
                                          : () async {
                                              context.pushNamed(
                                                SelectInstallmentPageWidget
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
                                      text: valueOrDefault<String>(
                                                FFAppState()
                                                    .getTopupDataAPIResultAppstate
                                                    .contractDetails
                                                    .loanTypeCode,
                                                'contract_no',
                                              ) !=
                                              'L'
                                          ? 'ถัดไป'
                                          : 'ส่งข้อมูล',
                                      options: FFButtonOptions(
                                        width: 140.0,
                                        height: 50.0,
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
                                            BorderRadius.circular(8.0),
                                        disabledColor: Color(0x80DB771A),
                                      ),
                                    ),
                                  ),
                                ),
                              if ((valueOrDefault<String>(
                                        FFAppState()
                                            .getTopupDataAPIResultAppstate
                                            .interestPaidFlag,
                                        'yield',
                                      ) ==
                                      'Y') ||
                                  true)
                                Builder(
                                  builder: (context) => FFButtonWidget(
                                    onPressed: () async {
                                      var _shouldSetState = false;
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
                                            alignment: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: GestureDetector(
                                              onTap: () {
                                                FocusScope.of(dialogContext)
                                                    .unfocus();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              child: LoadingWidget(),
                                            ),
                                          );
                                        },
                                      );

                                      _model.getTopupDetailAPIRefresh =
                                          await SrisawadApiGroup
                                              .getTopupDetailCall
                                              .call(
                                        dbName: FFAppState()
                                            .getLoanListSelected
                                            .dbName,
                                        contractNo: FFAppState()
                                            .getLoanListSelected
                                            .contractNo,
                                        bearerAuth: FFAppState().accessToken,
                                      );

                                      _shouldSetState = true;
                                      if ((_model.getTopupDetailAPIRefresh
                                                  ?.statusCode ??
                                              200) !=
                                          200) {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              content: Text(
                                                  'พบข้อผิดพลาด status (${(_model.getTopupDetailAPIRefresh?.statusCode ?? 200).toString()})'),
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
                                        Navigator.pop(context);
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }
                                      if (SrisawadApiGroup.getTopupDetailCall
                                              .code(
                                            (_model.getTopupDetailAPIRefresh
                                                    ?.jsonBody ??
                                                ''),
                                          ) !=
                                          '200') {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              content: Text(
                                                  '${SrisawadApiGroup.getTopupDetailCall.message(
                                                (_model.getTopupDetailAPIRefresh
                                                        ?.jsonBody ??
                                                    ''),
                                              )}'),
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
                                        Navigator.pop(context);
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }
                                      FFAppState()
                                              .getTopupDataAPIResultAppstate =
                                          GetTopupDataAPIDataTypeStruct
                                              .maybeFromMap((_model
                                                      .getTopupDetailAPIRefresh
                                                      ?.jsonBody ??
                                                  ''))!;
                                      safeSetState(() {});
                                      Navigator.pop(context);
                                      if (_shouldSetState) safeSetState(() {});
                                    },
                                    text: 'ปรับปรุงยอดชำระ',
                                    options: FFButtonOptions(
                                      width: 140.0,
                                      height: 50.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).accent2,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
