import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/error_message_component_widget.dart';
import '/customer_loan_detail/loan_detail_card_component/loan_detail_card_component_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/loading/loading_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'loan_detail_page_model.dart';
export 'loan_detail_page_model.dart';

class LoanDetailPageWidget extends StatefulWidget {
  const LoanDetailPageWidget({
    super.key,
    this.bankIcon,
    this.hashThaiId,
    this.contNo,
    this.token,
  });

  final FFUploadedFile? bankIcon;
  final String? hashThaiId;
  final String? contNo;
  final String? token;

  static String routeName = 'LoanDetailPage';
  static String routePath = '/LoanDetailPage';

  @override
  State<LoanDetailPageWidget> createState() => _LoanDetailPageWidgetState();
}

class _LoanDetailPageWidgetState extends State<LoanDetailPageWidget> {
  late LoanDetailPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoanDetailPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
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

      setDarkModeSetting(context, ThemeMode.light);
      _model.configOutput =
          await ApplicationRecord.getDocumentOnce(FFAppState().configDocument!);
      _model.comCodeConfigDoc = await actions.getDataFromDocument(
        '/application/configs',
        'comcode_config',
      );
      _model.wow = _model.comCodeConfigDoc;
      safeSetState(() {});
      FFAppState().hashThaiIdAppState = widget.hashThaiId!;
      FFAppState().accessToken = widget.token!;
      FFAppState().topupUrlDev = '${_model.configOutput?.apiUrl.apiUrlDev}';
      FFAppState().topupUrlProd = '${_model.configOutput?.apiUrl.apiUrlProd}';
      safeSetState(() {});
      _model.getLoanListOutput = await SrisawadApiGroup.getListOfLoanCall.call(
        hashThaiId: FFAppState().hashThaiIdAppState,
        authorization: FFAppState().accessToken,
        apiUrl: FFDevEnvironmentValues().isProduction
            ? FFAppState().topupUrlProd
            : FFAppState().topupUrlDev,
      );

      if ((_model.getLoanListOutput?.statusCode ?? 200) == 200) {
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
                      'พบข้อผิดพลาด status (${(_model.getLoanListOutput?.statusCode ?? 200).toString()})',
                ),
              ),
            );
          },
        );

        Navigator.pop(context);
        return;
      }

      if (('${'${getJsonField(
                (_model.getLoanListOutput?.jsonBody ?? ''),
                r'''$.results[0]''',
              ).toString()}'}' !=
              'null') &&
          ('${'${getJsonField(
                (_model.getLoanListOutput?.jsonBody ?? ''),
                r'''$.results[0]''',
              ).toString()}'}' !=
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
        FFAppState().getLoanListSelected = FFAppState()
            .getLoanListAPIResultAppState
            .elementAtOrNull(functions.findIndexInList(
                (getJsonField(
                  (_model.getLoanListOutput?.jsonBody ?? ''),
                  r'''$.results[*].contract_no''',
                  true,
                ) as List?)
                    ?.map<String>((e) => e.toString())
                    .toList()
                    .cast<String>(),
                widget.contNo)!)!;
        safeSetState(() {});
      }
      _model.detailLoanOutput = await SrisawadApiGroup.getDetailOfLoanCall.call(
        contractNo: FFAppState().getLoanListSelected.contractNo,
        dbName: FFAppState().getLoanListSelected.dbName,
        bearerAuth: FFAppState().accessToken,
        xSrisawad: 'x1',
        apiUrl: FFDevEnvironmentValues().isProduction
            ? FFAppState().topupUrlProd
            : FFAppState().topupUrlDev,
      );

      if ((_model.detailLoanOutput?.statusCode ?? 200) != 200) {
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
                      'พบข้อผิดพลาด status (${(_model.detailLoanOutput?.statusCode ?? 200).toString()})',
                ),
              ),
            );
          },
        );

        Navigator.pop(context);
        return;
      }
      if (SrisawadApiGroup.getDetailOfLoanCall.code(
            (_model.detailLoanOutput?.jsonBody ?? ''),
          ) ==
          '200') {
        _model.carDetailLoanPageState =
            SrisawadApiGroup.getDetailOfLoanCall.cardetails(
          (_model.detailLoanOutput?.jsonBody ?? ''),
        );
        _model.contractDetailLoanPageState =
            SrisawadApiGroup.getDetailOfLoanCall.contractdetails(
          (_model.detailLoanOutput?.jsonBody ?? ''),
        );
        _model.dataDate = SrisawadApiGroup.getDetailOfLoanCall
            .datadate(
              (_model.detailLoanOutput?.jsonBody ?? ''),
            )
            ?.firstOrNull;
        safeSetState(() {});
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
                  textMessage: '${SrisawadApiGroup.getDetailOfLoanCall.message(
                    (_model.detailLoanOutput?.jsonBody ?? ''),
                  )}',
                ),
              ),
            );
          },
        );

        Navigator.pop(context);
        return;
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
      builder: (context) => Title(
          title: 'LoanDetailPage',
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
                      Text(
                        'รายละเอียดสินเชื่อ',
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: 'Noto San Thai',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
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
                  visible:
                      ('${(_model.getLoanListOutput?.statusCode ?? 200).toString()}' ==
                              '200') &&
                          ('${(_model.detailLoanOutput?.statusCode ?? 200).toString()}' ==
                              '200'),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.loanDetailCardComponentModel,
                        updateCallback: () => safeSetState(() {}),
                        child: LoanDetailCardComponentWidget(
                          contNo: FFAppState().getLoanListSelected.contractNo,
                          assetCode: FFAppState()
                              .getLoanListSelected
                              .contractDetails
                              .collateralInformation,
                          productTypeCode: FFAppState()
                              .getLoanListSelected
                              .contractDetails
                              .loanTypeCode,
                          assetName: FFAppState()
                              .getLoanListSelected
                              .contractDetails
                              .loanTypeName,
                          currentInstallmentNumber: FFAppState()
                              .getLoanListSelected
                              .paymentDetails
                              .currentInstallmentNumber
                              .toString(),
                          overdueFrom: FFAppState()
                              .getLoanListSelected
                              .paymentDetails
                              .overdueFrom,
                          overdueTo: FFAppState()
                              .getLoanListSelected
                              .paymentDetails
                              .overdueTo,
                          overdueAmount:
                              '${FFAppState().getLoanListSelected.paymentDetails.currentInstallmentNumber.toString()}' ==
                                      '${FFAppState().getLoanListSelected.paymentDetails.totalInstallmentNumber.toString()}'
                                  ? ((String currentDueDate,
                                              String currentDate) {
                                      return DateTime.parse('${currentDueDate}')
                                          .isAfter(
                                              DateTime.parse('${currentDate}'));
                                    }(
                                          FFAppState()
                                              .getLoanListSelected
                                              .paymentDetails
                                              .currentDueDate,
                                          FFAppState()
                                              .getLoanListSelected
                                              .paymentDetails
                                              .currentDateTime)
                                      ? ('${FFAppState().getLoanListSelected.paymentDetails.overdueAmount.toString()}' !=
                                              'null'
                                          ? FFAppState()
                                              .getLoanListSelected
                                              .paymentDetails
                                              .overdueAmount
                                              .toString()
                                          : '0.00')
                                      : 'เกินกำหนดชำระ')
                                  : FFAppState()
                                      .getLoanListSelected
                                      .paymentDetails
                                      .overdueAmount
                                      .toString(),
                          installmentAmount:
                              '${FFAppState().getLoanListSelected.paymentDetails.currentInstallmentNumber.toString()}' ==
                                      '${FFAppState().getLoanListSelected.paymentDetails.totalInstallmentNumber.toString()}'
                                  ? ((String currentDueDate,
                                              String currentDate) {
                                      return DateTime.parse('${currentDueDate}')
                                          .isAfter(
                                              DateTime.parse('${currentDate}'));
                                    }(
                                          FFAppState()
                                              .getLoanListSelected
                                              .paymentDetails
                                              .currentDueDate,
                                          FFAppState()
                                              .getLoanListSelected
                                              .paymentDetails
                                              .currentDateTime)
                                      ? ('${FFAppState().getLoanListSelected.paymentDetails.currentDueAmount.toString()}' !=
                                              'null'
                                          ? FFAppState()
                                              .getLoanListSelected
                                              .paymentDetails
                                              .currentDueAmount
                                              .toString()
                                          : '0.00')
                                      : 'เกินกำหนดชำระ')
                                  : FFAppState()
                                      .getLoanListSelected
                                      .paymentDetails
                                      .currentDueAmount
                                      .toString(),
                          totalDueAmount: FFAppState()
                              .getLoanListSelected
                              .paymentDetails
                              .currentDueAmount
                              .toString(),
                          currentDueDate: functions.formatToThaiDate(
                              FFAppState()
                                  .getLoanListSelected
                                  .paymentDetails
                                  .currentDueDate),
                          installmentNumber: FFAppState()
                              .getLoanListSelected
                              .paymentDetails
                              .totalInstallmentNumber
                              .toString(),
                          contractLink:
                              '${_model.configOutput?.apiUrl.contractUrl}/contract?contno=${FFAppState().getLoanListSelected.contractNo}&comcode=${FFAppState().getLoanListSelected.barcodeDetails.comcode}',
                          isShowDownload: true
                              ? true
                              : (functions.checkContractException(functions.getDataListFromMapJson(_model.comCodeConfigDoc, 'exception_contract')?.toList(), functions.getDataListFromMapJson(_model.comCodeConfigDoc, 'exception_contract_comcode')?.toList(), FFAppState().getLoanListSelected.contractNo, FFAppState().getLoanListSelected.barcodeDetails.comcode)! ||
                                  (functions.getDataListFromMapJson(_model.comCodeConfigDoc, 'comcode')!.contains(FFAppState().getLoanListSelected.barcodeDetails.comcode) &&
                                      !(functions
                                          .getDataListBoolFromMapJson(
                                              _model.comCodeConfigDoc,
                                              'this_comcode_is_contract')!
                                          .elementAtOrNull(functions.findIndexInList(
                                              functions
                                                  .getDataListFromMapJson(
                                                      _model.comCodeConfigDoc,
                                                      'comcode')
                                                  ?.toList(),
                                              FFAppState()
                                                  .getLoanListSelected
                                                  .barcodeDetails
                                                  .comcode)!))! &&
                                      functions.getDataListFromMapJson(functions.getJsonDataFromMapJson(_model.comCodeConfigDoc, 'loan_type_code'), FFAppState().getLoanListSelected.barcodeDetails.comcode)!.contains(FFAppState()
                                          .getLoanListSelected
                                          .contractDetails
                                          .loanTypeCode) &&
                                      !functions.getDataListFromMapJson(_model.comCodeConfigDoc, 'check_contract_date')!.contains(
                                          FFAppState()
                                              .getLoanListSelected
                                              .barcodeDetails
                                              .comcode)) ||
                                  (functions.getDataListFromMapJson(_model.comCodeConfigDoc, 'comcode')!.contains(FFAppState().getLoanListSelected.barcodeDetails.comcode) &&
                                      functions
                                          .getDataListFromMapJson(
                                              functions.getJsonDataFromMapJson(
                                                  _model.comCodeConfigDoc, 'loan_type_code'),
                                              FFAppState().getLoanListSelected.barcodeDetails.comcode)!
                                          .contains(FFAppState().getLoanListSelected.contractDetails.loanTypeCode) &&
                                      functions.getDataListFromMapJson(_model.comCodeConfigDoc, 'check_contract_date')!.contains(FFAppState().getLoanListSelected.barcodeDetails.comcode) &&
                                      (DateTime.parse((functions.getDataFromMapJson(_model.comCodeConfigDoc, 'contract_default_date')!)).isBefore(DateTime.parse(FFAppState().getLoanListSelected.contractDate))))),
                          installmentAmountColor:
                              '${FFAppState().getLoanListSelected.paymentDetails.currentInstallmentNumber.toString()}' ==
                                      '${FFAppState().getLoanListSelected.paymentDetails.totalInstallmentNumber.toString()}'
                                  ? ((String currentDueDate,
                                              String currentDate) {
                                      return DateTime.parse('${currentDueDate}')
                                          .isAfter(
                                              DateTime.parse('${currentDate}'));
                                    }(
                                          FFAppState()
                                              .getLoanListSelected
                                              .paymentDetails
                                              .currentDueDate,
                                          FFAppState()
                                              .getLoanListSelected
                                              .paymentDetails
                                              .currentDateTime)
                                      ? ('${FFAppState().getLoanListSelected.paymentDetails.currentDueAmount.toString()}' !=
                                              'null'
                                          ? FlutterFlowTheme.of(context)
                                              .primaryText
                                          : FlutterFlowTheme.of(context)
                                              .primaryText)
                                      : Color(0xFFFF0000))
                                  : FlutterFlowTheme.of(context).primaryText,
                          overdueAmountColor:
                              '${FFAppState().getLoanListSelected.paymentDetails.currentInstallmentNumber.toString()}' ==
                                      '${FFAppState().getLoanListSelected.paymentDetails.totalInstallmentNumber.toString()}'
                                  ? ((String currentDueDate,
                                              String currentDate) {
                                      return DateTime.parse('${currentDueDate}')
                                          .isAfter(
                                              DateTime.parse('${currentDate}'));
                                    }(
                                          FFAppState()
                                              .getLoanListSelected
                                              .paymentDetails
                                              .currentDueDate,
                                          FFAppState()
                                              .getLoanListSelected
                                              .paymentDetails
                                              .currentDateTime)
                                      ? ('${FFAppState().getLoanListSelected.paymentDetails.overdueAmount.toString()}' !=
                                              'null'
                                          ? FlutterFlowTheme.of(context)
                                              .primaryText
                                          : FlutterFlowTheme.of(context)
                                              .primaryText)
                                      : Color(0xFFFF0000))
                                  : FlutterFlowTheme.of(context).primaryText,
                          isShowVmi: FFAppState()
                              .getLoanListSelected
                              .insurances
                              .isNotEmpty,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 4.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            child: Text(
                                              '*กรณีค้างชําระ ค่างวดยังไม่รวมค่าปรับ/ค่าติดตาม',
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Noto San Thai',
                                                    color: Color(0xFFFF0000),
                                                    fontSize: 13.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            child: Text(
                                              '**หากต้องปิดบัญชี กรุณาติดต่อสาขาเจ้าของบัญชี',
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Noto San Thai',
                                                    color: Color(0xFFFF0000),
                                                    fontSize: 13.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              child: Text(
                                                'สำคัญ : กรณีชําระค่างวดไม่เต็มจํานวนที่กําหนด\nส่งผลให้เกิดภาระดอกเบี้ยที่สูงขึ้น รวมถึงอาจต้องรับผิดชอบค่าใช้จ่ายในการติดตามทวงถามหนี้ และจะส่งผลให้ยอดเงินที่ต้องชำระในงวดสุดท้ายเพิ่มขึ้น',
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto San Thai',
                                                          color:
                                                              Color(0xFFFF0000),
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                          .divide(SizedBox(height: 4.0))
                                          .addToStart(SizedBox(height: 4.0)),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 4.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 50.0,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 0.0),
                                        child: FlutterFlowChoiceChips(
                                          options: [
                                            ChipData('ข้อมูลสินเชื่อ'),
                                            ChipData('ข้อมูลการชำระ'),
                                            ChipData('ประวัติการชำระ')
                                          ],
                                          onChanged: (val) => safeSetState(() =>
                                              _model.choiceChipsValue =
                                                  val?.firstOrNull),
                                          selectedChipStyle: ChipStyle(
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto San Thai',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  lineHeight: 2.0,
                                                ),
                                            iconColor: Color(0x00000000),
                                            iconSize: 0.0,
                                            labelPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            elevation: 2.0,
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          unselectedChipStyle: ChipStyle(
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto San Thai',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  lineHeight: 2.0,
                                                ),
                                            iconColor: Color(0x00000000),
                                            iconSize: 16.0,
                                            labelPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            elevation: 2.0,
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          chipSpacing: 12.0,
                                          rowSpacing: 8.0,
                                          multiselect: false,
                                          initialized:
                                              _model.choiceChipsValue != null,
                                          alignment: WrapAlignment.start,
                                          controller: _model
                                                  .choiceChipsValueController ??=
                                              FormFieldController<List<String>>(
                                            ['ข้อมูลสินเชื่อ'],
                                          ),
                                          wrapped: false,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Builder(
                                  builder: (context) {
                                    if (_model.choiceChipsValue ==
                                        'ข้อมูลสินเชื่อ') {
                                      return Visibility(
                                        visible: ((_model.getLoanListOutput
                                                        ?.statusCode ??
                                                    200) ==
                                                200) &&
                                            ((_model.detailLoanOutput
                                                        ?.statusCode ??
                                                    200) ==
                                                200),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 30.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Text(
                                                                  'ค่างวด',
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
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            '${functions.returnNumberWithComma2Decimal('${FFAppState().getLoanListSelected.contractDetails.installmentAmount.toString()}')} บาท',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto San Thai',
                                                                  color: Colors
                                                                      .black,
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
                                                  Divider(
                                                    thickness: 2.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 30.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Text(
                                                                  'จำนวนงวด',
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
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            '${'${FFAppState().getLoanListSelected.paymentDetails.totalInstallmentNumber.toString()}'} งวด',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto San Thai',
                                                                  color: Colors
                                                                      .black,
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
                                                  Divider(
                                                    thickness: 2.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 30.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Text(
                                                                  'สาขาที่ทำสัญญา',
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
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            '${'${FFAppState().getLoanListSelected.branchName}'} ${'${FFAppState().getLoanListSelected.branchCode}'}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto San Thai',
                                                                  color: Colors
                                                                      .black,
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
                                                  Divider(
                                                    thickness: 2.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 30.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
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
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
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
                                                                    child: Text(
                                                                      'วันที่ทำสัญญา',
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
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            '${functions.formatToThaiDate('${FFAppState().getLoanListSelected.contractDate}')}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto San Thai',
                                                                  color: Colors
                                                                      .black,
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
                                                  Divider(
                                                    thickness: 2.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 30.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
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
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
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
                                                                    child: Text(
                                                                      'กลุ่มสินค้า',
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
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            '${'${FFAppState().getLoanListSelected.contractDetails.loanTypeName}'}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto San Thai',
                                                                  color: Colors
                                                                      .black,
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
                                                  Divider(
                                                    thickness: 2.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 30.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Text(
                                                                  'ยี่ห้อสินค้า',
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
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            '${'${FFAppState().getLoanListSelected.contractDetails.vehicleBrand}'.trim()}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto San Thai',
                                                                  color: Colors
                                                                      .black,
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
                                                  Divider(
                                                    thickness: 2.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 30.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Text(
                                                                  'รุ่นสินค้า',
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
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            '${_model.carDetailLoanPageState?.carSeries}' !=
                                                                    ''
                                                                ? '${_model.carDetailLoanPageState?.carSeries}'
                                                                : '-',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto San Thai',
                                                                  color: Colors
                                                                      .black,
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
                                                  Divider(
                                                    thickness: 2.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 30.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Text(
                                                                  'รายละเอียดสินค้า',
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
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            _model.carDetailLoanPageState
                                                                        ?.carCc !=
                                                                    ''
                                                                ? '${functions.returnNumberWithCommaFullNumber(_model.carDetailLoanPageState?.carCc, '0')} cc'
                                                                : '-',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto San Thai',
                                                                  color: Colors
                                                                      .black,
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
                                                  Divider(
                                                    thickness: 2.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 30.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Text(
                                                                  'เลขทะเบียน',
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
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            '${FFAppState().getLoanListSelected.contractDetails.collateralInformation}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto San Thai',
                                                                  color: Colors
                                                                      .black,
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
                                                  Divider(
                                                    thickness: 2.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 30.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Text(
                                                                  'วันเริ่มงวดแรก',
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
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            '${functions.showDateBE(_model.contractDetailLoanPageState?.firstDueDate)}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto San Thai',
                                                                  color: Colors
                                                                      .black,
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
                                                  Divider(
                                                    thickness: 2.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 30.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Text(
                                                                  'วันงวดสุดท้าย',
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
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            '${functions.showDateBE(_model.contractDetailLoanPageState?.lastDueDate)}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto San Thai',
                                                                  color: Colors
                                                                      .black,
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
                                                  Divider(
                                                    thickness: 2.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    } else if (_model.choiceChipsValue ==
                                        'ข้อมูลการชำระ') {
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 30.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Text(
                                                                'ชำระค่างวดแล้ว',
                                                                style: FlutterFlowTheme.of(
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
                                                          '${functions.returnNumberWithComma2Decimal('${FFAppState().getLoanListSelected.paymentDetails.totalPaidAmount.toString()}')} บาท',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto San Thai',
                                                                color: Colors
                                                                    .black,
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
                                                Divider(
                                                  thickness: 2.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 30.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
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
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
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
                                                                  child: Text(
                                                                    'จำนวนวันที่ค้าง',
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
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          '${'${FFAppState().getLoanListSelected.paymentDetails.overdueDays.toString()}'} วัน',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto San Thai',
                                                                color: Colors
                                                                    .black,
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
                                                Divider(
                                                  thickness: 2.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 30.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
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
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
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
                                                                  child: Text(
                                                                    'จำนวนงวดที่ค้าง',
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
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          '${'${FFAppState().getLoanListSelected.paymentDetails.overdueTerms.toString()}'} งวด',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto San Thai',
                                                                color: Colors
                                                                    .black,
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
                                                Divider(
                                                  thickness: 2.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 30.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
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
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
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
                                                                  child: Text(
                                                                    'วันชำระครั้งล่าสุด',
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
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          '${functions.showDateBE(FFAppState().getLoanListSelected.paymentDetails.latestPaidDate)}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto San Thai',
                                                                color: Colors
                                                                    .black,
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
                                                Divider(
                                                  thickness: 2.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Expanded(
                                            child:
                                                FutureBuilder<ApiCallResponse>(
                                              future: SrisawadApiGroup
                                                  .paymentHistoryCall
                                                  .call(
                                                contractNo: FFAppState()
                                                    .getLoanListSelected
                                                    .contractNo,
                                                dbName: FFAppState()
                                                    .getLoanListSelected
                                                    .dbName
                                                    .substring(0, 2),
                                                apiUrl:
                                                    !FFDevEnvironmentValues()
                                                            .isProduction
                                                        ? FFAppState()
                                                            .topupUrlProd
                                                        : FFAppState()
                                                            .topupUrlDev,
                                              ),
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
                                                final listViewPaymentHistoryResponse =
                                                    snapshot.data!;

                                                return Builder(
                                                  builder: (context) {
                                                    final paymentList =
                                                        SrisawadApiGroup
                                                                .paymentHistoryCall
                                                                .data(
                                                                  listViewPaymentHistoryResponse
                                                                      .jsonBody,
                                                                )
                                                                ?.toList() ??
                                                            [];

                                                    return ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          paymentList.length,
                                                      itemBuilder: (context,
                                                          paymentListIndex) {
                                                        final paymentListItem =
                                                            paymentList[
                                                                paymentListIndex];
                                                        return Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24.0,
                                                                      24.0,
                                                                      24.0,
                                                                      0.0),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            height: 180.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        functions.formatToThaiDateWithMonth(
                                                                            paymentListItem.date,
                                                                            false),
                                                                        ' date ',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto San Thai',
                                                                            color:
                                                                                Colors.black,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        140.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              4.0,
                                                                          color:
                                                                              Color(0x33000000),
                                                                          offset:
                                                                              Offset(
                                                                            0.0,
                                                                            2.0,
                                                                          ),
                                                                        )
                                                                      ],
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              16.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          20.0,
                                                                          12.0,
                                                                          20.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                valueOrDefault<String>(
                                                                                  functions.formatToThaiDateWithMonth(paymentListItem.date, true),
                                                                                  ' date with time',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Noto San Thai',
                                                                                      fontSize: 15.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                12.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Text(
                                                                                  'จำนวนเงิน',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Noto San Thai',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  '${valueOrDefault<String>(
                                                                                    functions.returnNumberWithComma2Decimal(paymentListItem.paidAmount.toString()),
                                                                                    'paid_amount',
                                                                                  )} บาท',
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
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                12.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Text(
                                                                                  'ช่องทางการชำระ',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Noto San Thai',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  '${paymentListItem.paymentChannelName}',
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
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      );
                                    }
                                  },
                                ),
                                if ((_model.detailLoanOutput?.statusCode ??
                                        200) ==
                                    200)
                                  Container(
                                    width: double.infinity,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'ข้อมูลวันที่ ${functions.formatToThaiDate(_model.dataDate)} เวลา 00.00 น.',
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
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        context.pushNamed(
                                          SelectPaymentPageWidget.routeName,
                                          queryParameters: {
                                            'from': serializeParam(
                                              'loanDetail',
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      text: 'ชำระเงิน',
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
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                  ),
                                  if (functions
                                          .getDataListFromMapJson(
                                              _model.comCodeConfigDoc,
                                              'comcode')!
                                          .contains(FFAppState()
                                              .getLoanListSelected
                                              .barcodeDetails
                                              .comcode) &&
                                      (functions
                                          .getDataListBoolFromMapJson(
                                              _model.comCodeConfigDoc,
                                              'this_comcode_is_contract')!
                                          .elementAtOrNull(
                                              functions.findIndexInList(
                                                  functions
                                                      .getDataListFromMapJson(
                                                          _model
                                                              .comCodeConfigDoc,
                                                          'comcode')
                                                      ?.toList(),
                                                  FFAppState()
                                                      .getLoanListSelected
                                                      .barcodeDetails
                                                      .comcode)!))! &&
                                      functions
                                          .getDataListFromMapJson(
                                              functions.getJsonDataFromMapJson(
                                                  _model.comCodeConfigDoc,
                                                  'loan_type_code'),
                                              FFAppState()
                                                  .getLoanListSelected
                                                  .barcodeDetails
                                                  .comcode)!
                                          .contains(FFAppState()
                                              .getLoanListSelected
                                              .contractDetails
                                              .loanTypeCode) &&
                                      !functions
                                          .getDataListFromMapJson(
                                              _model.comCodeConfigDoc,
                                              'check_contract_date')!
                                          .contains(FFAppState()
                                              .getLoanListSelected
                                              .barcodeDetails
                                              .comcode))
                                    Expanded(
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          await Clipboard.setData(ClipboardData(
                                              text:
                                                  '${_model.configOutput?.apiUrl.contractUrl}/contract?contno=${FFAppState().getLoanListSelected.contractNo}&comcode=${FFAppState().getLoanListSelected.contractDetails.comcodeCode}'));
                                          await actions.openTableauInApp(
                                            '${_model.configOutput?.apiUrl.contractUrl}/contract?contno=${FFAppState().getLoanListSelected.contractNo}&comcode=${FFAppState().getLoanListSelected.contractDetails.comcodeCode}',
                                          );
                                        },
                                        text: valueOrDefault<String>(
                                          '${functions.getDataListFromMapJson(_model.comCodeConfigDoc, 'button_name')?.elementAtOrNull(functions.findIndexInList(functions.getDataListFromMapJson(_model.comCodeConfigDoc, 'comcode')?.toList(), FFAppState().getLoanListSelected.barcodeDetails.comcode)!)}',
                                          'คู่สัญญา',
                                        ),
                                        options: FFButtonOptions(
                                          height: 60.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Noto San Thai',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                letterSpacing: 0.0,
                                              ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
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
            ),
          )),
    );
  }
}
