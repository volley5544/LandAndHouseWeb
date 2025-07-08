import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/data_saved_success/data_saved_success_widget.dart';
import '/pages/loading/loading_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'selected_branch_page_model.dart';
export 'selected_branch_page_model.dart';

class SelectedBranchPageWidget extends StatefulWidget {
  const SelectedBranchPageWidget({
    super.key,
    this.fromPage,
  });

  final String? fromPage;

  static String routeName = 'selectedBranchPage';
  static String routePath = '/selectedBranchPage';

  @override
  State<SelectedBranchPageWidget> createState() =>
      _SelectedBranchPageWidgetState();
}

class _SelectedBranchPageWidgetState extends State<SelectedBranchPageWidget> {
  late SelectedBranchPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectedBranchPageModel());

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
              child: Container(
                height: double.infinity,
                child: LoadingWidget(),
              ),
            ),
          );
        },
      );

      _model.getlocationAPI = await GetlocationAPICall.call(
        token: FFAppState().saveBranchDataTemp.token,
        apiUrl: FFAppState().arunsawadApiUrl,
      );

      if ((_model.getlocationAPI?.statusCode ?? 200) != 200) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              content: Text(
                  'พบข้อผิดพลาด Connection (${(_model.getlocationAPI?.statusCode ?? 200).toString()})'),
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
      if ('${GetlocationAPICall.statusLayer1(
            (_model.getlocationAPI?.jsonBody ?? ''),
          )?.toString()}' !=
          '200') {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              content: Text(GetlocationAPICall.messageLayer1(
                (_model.getlocationAPI?.jsonBody ?? ''),
              )!),
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
      _model.branchData = GetlocationAPICall.branchdata(
        (_model.getlocationAPI?.jsonBody ?? ''),
      )!
          .toList()
          .cast<BranchLocationModelStruct>();
      safeSetState(() {});
      _model.selectList = functions
          .generateFalseListByNumItem(_model.branchData.length)!
          .toList()
          .cast<bool>();
      safeSetState(() {});
      Navigator.pop(context);
    });

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

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
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).primary,
                size: 30.0,
              ),
              onPressed: () async {
                if (widget.fromPage == 'LH') {
                  context.goNamed(
                    AssignBranchPageWidget.routeName,
                    queryParameters: {
                      'employeeId': serializeParam(
                        FFAppState().saveBranchDataTemp.empCode,
                        ParamType.String,
                      ),
                      'token': serializeParam(
                        FFAppState().saveBranchDataTemp.token,
                        ParamType.String,
                      ),
                      'branchCodeSearch': serializeParam(
                        FFAppState().saveBranchDataTemp.regionCode,
                        ParamType.String,
                      ),
                      'mode': serializeParam(
                        FFAppState().saveBranchDataTemp.level,
                        ParamType.String,
                      ),
                      'fromPage': serializeParam(
                        '',
                        ParamType.String,
                      ),
                      'level': serializeParam(
                        FFAppState().saveBranchDataTemp.level2,
                        ParamType.String,
                      ),
                    }.withoutNulls,
                  );
                } else {
                  context.goNamed(
                    AssignGrocerystorePageWidget.routeName,
                    queryParameters: {
                      'employeeId': serializeParam(
                        FFAppState().saveBranchDataTemp.empCode,
                        ParamType.String,
                      ),
                      'token': serializeParam(
                        FFAppState().saveBranchDataTemp.token,
                        ParamType.String,
                      ),
                      'branchCodeSearch': serializeParam(
                        FFAppState().saveBranchDataTemp.regionCode,
                        ParamType.String,
                      ),
                      'mode': serializeParam(
                        FFAppState().saveBranchDataTemp.level,
                        ParamType.String,
                      ),
                      'fromPage': serializeParam(
                        '',
                        ParamType.String,
                      ),
                      'level': serializeParam(
                        FFAppState().saveBranchDataTemp.level2,
                        ParamType.String,
                      ),
                    }.withoutNulls,
                  );
                }
              },
            ),
            title: Text(
              'ค้นหาสาขา${FFDevEnvironmentValues().isProduction ? '' : ' (UAT)'}',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Noto San Thai',
                    color: Color(0xFF003063),
                    fontSize: 18.0,
                    letterSpacing: 0.0,
                  ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 2.0,
          ),
          body: SafeArea(
            top: true,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              ),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: TextFormField(
                                controller: _model.textController1,
                                focusNode: _model.textFieldFocusNode1,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController1',
                                  Duration(milliseconds: 100),
                                  () => safeSetState(() {}),
                                ),
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Noto San Thai',
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: 'ชื่อสาขา/รหัสสาขา',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Noto San Thai',
                                        color: Color(0xFFBCBCBE),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.search_outlined,
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Noto San Thai',
                                      letterSpacing: 0.0,
                                    ),
                                validator: _model.textController1Validator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ),
                        if (false)
                          FFButtonWidget(
                            onPressed: () async {},
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
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.5,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 20.0, 15.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final branchListItem = _model.branchData.toList();

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: branchListItem.length,
                            itemBuilder: (context, branchListItemIndex) {
                              final branchListItemItem =
                                  branchListItem[branchListItemIndex];
                              return Visibility(
                                visible: _model.textController1.text != ''
                                    ? (functions.containString(
                                            _model.textController1.text,
                                            branchListItemItem.branchName)! ||
                                        functions.containString(
                                            _model.textController1.text,
                                            branchListItemItem.branchCode)!)
                                    : true,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.selectList = functions
                                          .setSelectedData(
                                              _model.branchData.length,
                                              branchListItemIndex)!
                                          .toList()
                                          .cast<bool>();
                                      safeSetState(() {});
                                    },
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 10.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10.0),
                                          bottomRight: Radius.circular(10.0),
                                          topLeft: Radius.circular(10.0),
                                          topRight: Radius.circular(10.0),
                                        ),
                                      ),
                                      child: Container(
                                        width: 100.0,
                                        height: 45.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10.0),
                                            bottomRight: Radius.circular(10.0),
                                            topLeft: Radius.circular(10.0),
                                            topRight: Radius.circular(10.0),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  '${branchListItemItem.branchName} (${branchListItemItem.branchCode})',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto San Thai',
                                                        color: Colors.black,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            if (_model.selectList
                                                    .elementAtOrNull(
                                                        branchListItemIndex) ??
                                                true)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 20.0, 0.0),
                                                child: Icon(
                                                  Icons.check_circle,
                                                  color: Color(0xFFDB771A),
                                                  size: 28.0,
                                                ),
                                              ),
                                          ],
                                        ),
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(14.0, 20.0, 15.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: 150.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                      child: Container(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _model.textController2,
                          focusNode: _model.textFieldFocusNode2,
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Noto San Thai',
                                  letterSpacing: 0.0,
                                ),
                            hintText: 'ระบุหมายเหตุ',
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Noto San Thai',
                                  color: Color(0xFFC8C7C7),
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Noto San Thai',
                                    letterSpacing: 0.0,
                                  ),
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          validator: _model.textController2Validator
                              .asValidator(context),
                        ),
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) => Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(14.0, 25.0, 14.0, 0.0),
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
                                child: GestureDetector(
                                  onTap: () {
                                    FocusScope.of(dialogContext).unfocus();
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  },
                                  child: LoadingWidget(),
                                ),
                              );
                            },
                          );

                          if (!_model.selectList.contains(true)) {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  content: Text('กรุณาเลือกสาขา'),
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
                          FFAppState().updateSaveBranchDataTempStruct(
                            (e) => e
                              ..branchCode = _model.branchData
                                  .elementAtOrNull(
                                      _model.selectList.toList().indexOf(true))
                                  ?.branchCode
                              ..remark = _model.textController2.text != ''
                                  ? _model.textController2.text
                                  : '',
                          );
                          safeSetState(() {});
                          _model.saveAssignGroceryApi =
                              await SaveAssignGroceryApiCall.call(
                            empCode: FFAppState().saveBranchDataTemp.empCode,
                            mode: FFAppState().saveBranchDataTemp.mode,
                            regionCode:
                                FFAppState().saveBranchDataTemp.regionCode,
                            assignType:
                                FFAppState().saveBranchDataTemp.assignType,
                            remark: FFAppState().saveBranchDataTemp.remark,
                            leadId: FFAppState().saveBranchDataTemp.leadId,
                            branchCode:
                                FFAppState().saveBranchDataTemp.branchCode,
                            apiUrl: FFAppState().landAndHouseAssignApiUrl,
                            areaCode:
                                FFAppState().saveBranchDataTemp.regionCode,
                          );

                          _shouldSetState = true;
                          if ((_model.saveAssignGroceryApi?.statusCode ??
                                  200) !=
                              200) {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  content: Text(
                                      'พบข้อผิพลาด Connection (${(_model.saveAssignGroceryApi?.statusCode ?? 200).toString()})'),
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
                                (_model.saveAssignGroceryApi?.jsonBody ?? ''),
                                r'''$.code''',
                              ).toString()}' !=
                              '200') {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  content: Text(getJsonField(
                                    (_model.saveAssignGroceryApi?.jsonBody ??
                                        ''),
                                    r'''$.message''',
                                  ).toString()),
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
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            barrierColor: Color(0xC0000000),
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return GestureDetector(
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: DataSavedSuccessWidget(
                                    fromPage: widget.fromPage,
                                  ),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));

                          if (_shouldSetState) safeSetState(() {});
                        },
                        text: 'ส่งเรื่องไปสาขา',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Noto San Thai',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ].addToEnd(SizedBox(height: 50.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
