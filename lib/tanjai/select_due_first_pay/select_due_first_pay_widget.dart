import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'select_due_first_pay_model.dart';
export 'select_due_first_pay_model.dart';

class SelectDueFirstPayWidget extends StatefulWidget {
  const SelectDueFirstPayWidget({
    super.key,
    this.dataList,
    this.dueFromQuotationIndex,
    this.insuranceInfoData,
    this.token,
  });

  final List<String>? dataList;
  final int? dueFromQuotationIndex;
  final InsuranceInfoDataModelStruct? insuranceInfoData;
  final String? token;

  static String routeName = 'selectDueFirstPay';
  static String routePath = '/selectDueFirstPay';

  @override
  State<SelectDueFirstPayWidget> createState() =>
      _SelectDueFirstPayWidgetState();
}

class _SelectDueFirstPayWidgetState extends State<SelectDueFirstPayWidget> {
  late SelectDueFirstPayModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectDueFirstPayModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.falseList = functions
          .createFalseList(
              widget.insuranceInfoData?.tenorList.length.toString())!
          .toList()
          .cast<bool>();
      safeSetState(() {});
      _model.tenorListData = widget.insuranceInfoData!.tenorList
          .toList()
          .cast<TenorListDataModelStruct>();
      safeSetState(() {});
      _model.currentTenorListData = _model.tenorListData.elementAtOrNull(
          functions.findIndexInList(
              _model.tenorListData.map((e) => e.tenor).toList().toList(),
              widget.insuranceInfoData?.tenor)!);
      safeSetState(() {});
      _model.updateFalseListAtIndex(
        functions.findIndexInList(
            _model.currentTenorListData?.tenorFirstDue.toList(),
            widget.insuranceInfoData?.tenorFirstDue)!,
        (_) => true,
      );
      safeSetState(() {});
      _model.tanjaiApi = await ApplicationRecord.getDocumentOnce(
          FFAppState().tanjaiApiDocRef!);
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
                ApproveInsurancePageWidget.routeName,
                queryParameters: {
                  'token': serializeParam(
                    widget.token,
                    ParamType.String,
                  ),
                }.withoutNulls,
              );
            },
            child: Icon(
              Icons.arrow_back,
              color: FlutterFlowTheme.of(context).primary,
              size: 24.0,
            ),
          ),
          title: Text(
            'รายการอนุมัติค่างวด',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Noto San Thai',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (false)
                          Container(
                            width: double.infinity,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: TextFormField(
                                        controller: _model.textController,
                                        focusNode: _model.textFieldFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.textController',
                                          Duration(milliseconds: 100),
                                          () => safeSetState(() {}),
                                        ),
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Noto San Thai',
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintText: 'กรุณากรอกคำค้นหา',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Noto San Thai',
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          focusedErrorBorder: InputBorder.none,
                                          prefixIcon: Icon(
                                            Icons.search_outlined,
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto San Thai',
                                              letterSpacing: 0.0,
                                            ),
                                        validator: _model
                                            .textControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    if (_model.textController.text.length > 2) {
                                      FFAppState().addressDataListOutput =
                                          FFAppState()
                                              .addressDataOriginal
                                              .where((e) =>
                                                  functions.containString(
                                                      _model
                                                          .textController.text,
                                                      e.keyword)!)
                                              .toList()
                                              .cast<AddressDataModelStruct>();
                                      safeSetState(() {});
                                    }
                                  },
                                  text: 'ค้นหา',
                                  options: FFButtonOptions(
                                    width: 100.0,
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
                              ].divide(SizedBox(width: 8.0)),
                            ),
                          ),
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              if (true) {
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(),
                                        child: Builder(
                                          builder: (context) {
                                            final tenorListItem = _model
                                                    .currentTenorListData
                                                    ?.tenorFirstDue
                                                    .toList() ??
                                                [];

                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: tenorListItem.length,
                                              itemBuilder: (context,
                                                  tenorListItemIndex) {
                                                final tenorListItemItem =
                                                    tenorListItem[
                                                        tenorListItemIndex];
                                                return Visibility(
                                                  visible: true ||
                                                      functions.containString(
                                                          _model.textController
                                                              .text,
                                                          FFAppState()
                                                              .addressDataOriginal
                                                              .elementAtOrNull(
                                                                  tenorListItemIndex)
                                                              ?.keyword)!,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          _model.falseList = functions
                                                              .createFalseList(_model
                                                                  .currentTenorListData
                                                                  ?.tenorFirstDue
                                                                  .length
                                                                  .toString())!
                                                              .toList()
                                                              .cast<bool>();
                                                          safeSetState(() {});
                                                          _model
                                                              .updateFalseListAtIndex(
                                                            tenorListItemIndex,
                                                            (_) => true,
                                                          );
                                                          safeSetState(() {});
                                                        },
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 60.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  '${tenorListItemItem}   งวด',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .notoSansThai(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                              if (_model
                                                                      .falseList
                                                                      .elementAtOrNull(
                                                                          tenorListItemIndex) ??
                                                                  true)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .check_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 32.0,
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Divider(
                                                        thickness: 1.0,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent4,
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 20.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          var _shouldSetState = false;
                                          var confirmDialogResponse =
                                              await showDialog<bool>(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        content: Text(
                                                            'ยืนยันบันทึกงวดที่เลือก'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child:
                                                                Text('ยกเลิก'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child:
                                                                Text('ยืนยัน'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ) ??
                                                  false;
                                          if (!confirmDialogResponse) {
                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          }
                                          _model.apiSaveInstallmentOutput =
                                              await ApproveInstallmentAPISaveCall
                                                  .call(
                                            apiUrl: _model.tanjaiApi?.apiUrl
                                                .tanjaiApiUrl,
                                            token: widget.token,
                                            quotationId: widget
                                                .insuranceInfoData?.quotationId,
                                            tenorFirstDue: _model
                                                .currentTenorListData
                                                ?.tenorFirstDue
                                                .elementAtOrNull(functions
                                                    .findTrueInBoolList(_model
                                                        .falseList
                                                        .toList())!),
                                          );

                                          _shouldSetState = true;
                                          if ((_model.apiSaveInstallmentOutput
                                                      ?.statusCode ??
                                                  200) !=
                                              200) {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  content: Text(
                                                      'พบข้อผิดพลาด connection (${(_model.apiSaveInstallmentOutput?.statusCode ?? 200).toString()})'),
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
                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          }
                                          if (ApproveInstallmentAPISaveCall
                                                  .code(
                                                (_model.apiSaveInstallmentOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              ) !=
                                              200) {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  content: Text(
                                                      '${ApproveInstallmentAPISaveCall.message(
                                                    (_model.apiSaveInstallmentOutput
                                                            ?.jsonBody ??
                                                        ''),
                                                  ).toString()}'),
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
                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          }
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                content:
                                                    Text('บันทึกงวดสำเร็จ'),
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

                                          context.goNamed(
                                            ApproveInsurancePageWidget
                                                .routeName,
                                            queryParameters: {
                                              'token': serializeParam(
                                                widget.token,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );

                                          if (_shouldSetState)
                                            safeSetState(() {});
                                        },
                                        text: 'อนุมัติ',
                                        options: FFButtonOptions(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.8,
                                          height: 50.0,
                                          padding: EdgeInsets.all(16.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Noto San Thai',
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                  ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                return Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          'กรุณากรอกคำค้นหาอย่างน้อย 3 ตัวอักษร',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto San Thai',
                                                color: Color(0xCC646464),
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ].addToEnd(SizedBox(height: 200.0)),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ]
                          .divide(SizedBox(height: 12.0))
                          .addToStart(SizedBox(height: 12.0))
                          .addToEnd(SizedBox(height: 24.0)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
