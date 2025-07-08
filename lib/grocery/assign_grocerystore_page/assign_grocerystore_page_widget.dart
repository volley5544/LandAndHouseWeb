import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/saved_lead_called_status_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/loading/loading_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'assign_grocerystore_page_model.dart';
export 'assign_grocerystore_page_model.dart';

class AssignGrocerystorePageWidget extends StatefulWidget {
  const AssignGrocerystorePageWidget({
    super.key,
    required this.employeeId,
    required this.token,
    required this.branchCodeSearch,
    required this.mode,
    String? fromPage,
    this.level,
  }) : this.fromPage = fromPage ?? 'assignBranch';

  final String? employeeId;
  final String? token;
  final String? branchCodeSearch;
  final String? mode;
  final String fromPage;
  final String? level;

  static String routeName = 'AssignGrocerystorePage';
  static String routePath = '/AssignGrocerystorePage';

  @override
  State<AssignGrocerystorePageWidget> createState() =>
      _AssignGrocerystorePageWidgetState();
}

class _AssignGrocerystorePageWidgetState
    extends State<AssignGrocerystorePageWidget> with TickerProviderStateMixin {
  late AssignGrocerystorePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AssignGrocerystorePageModel());

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

      _model.queryAPIUrl = await ApplicationRecord.getDocumentOnce(
          FFAppState().landAndHouseAPIDocRef!);
      FFAppState().landAndHouseAssignApiUrl =
          _model.queryAPIUrl!.apiUrl.landAndHouseAssign;
      FFAppState().arunsawadApiUrl =
          _model.queryAPIUrl!.apiUrl.arunsawadApiUrlProd;
      safeSetState(() {});
      if (widget.fromPage == 'หน้าส่งไปสาขา') {
        safeSetState(() {
          _model.tabBarController!.animateTo(
            _model.tabBarController!.length - 1,
            duration: Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        });
      } else {
        safeSetState(() {
          _model.tabBarController!.animateTo(
            0,
            duration: Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        });
      }

      FFAppState().saveBranchDataTemp = SaveAssignBranchStruct();
      safeSetState(() {});
      setDarkModeSetting(context, ThemeMode.light);
      _model.getListGrocery = await GetListGroceryCall.call(
        empCode: widget.employeeId,
        mode: () {
          if (widget.mode == 'สาขา') {
            return 'branch';
          } else if (widget.mode == 'เขต') {
            return 'area';
          } else if (widget.mode == 'ภาค') {
            return 'region';
          } else {
            return widget.mode;
          }
        }(),
        regionCode: widget.branchCodeSearch,
        apiUrl: FFAppState().landAndHouseAssignApiUrl,
        areaCode: widget.branchCodeSearch,
      );

      if ((_model.getListGrocery?.statusCode ?? 200) != 200) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              content: Text(
                  'พบข้อผิดพลาด Connection (${(_model.getListGrocery?.statusCode ?? 200).toString()})'),
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
      if ('${GetListGroceryCall.statuslayer1(
            (_model.getListGrocery?.jsonBody ?? ''),
          )?.toString()}' !=
          '200') {
        if ('${GetListGroceryCall.statuslayer1(
              (_model.getListGrocery?.jsonBody ?? ''),
            )?.toString()}' ==
            '404') {
          Navigator.pop(context);
          return;
        }
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              content: Text('พบข้อผิดพลาด (${GetListGroceryCall.statuslayer1(
                (_model.getListGrocery?.jsonBody ?? ''),
              )?.toString()})'),
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
      _model.chanodlist = GetListGroceryCall.assignForData(
        (_model.getListGrocery?.jsonBody ?? ''),
      )!
          .toList()
          .cast<ChanodData3Struct>();
      safeSetState(() {});
      _model.chanodlistto = GetListGroceryCall.assignTodData(
        (_model.getListGrocery?.jsonBody ?? ''),
      )!
          .toList()
          .cast<ChanodData3Struct>();
      safeSetState(() {});
      Navigator.pop(context);
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    _model.textField23TextController ??= TextEditingController();
    _model.textField23FocusNode ??= FocusNode();

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
            title: Text(
              'รายการร้านโชว์ห่วย${FFDevEnvironmentValues().isProduction ? '' : ' (UAT)'}',
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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment(-1.0, 0),
                          child: FlutterFlowButtonTabBar(
                            useToggleButtonStyle: false,
                            labelStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Noto San Thai',
                                  fontSize: 15.0,
                                  letterSpacing: 1.0,
                                  lineHeight: 1.0,
                                ),
                            unselectedLabelStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Noto San Thai',
                                  fontSize: 15.0,
                                  letterSpacing: 1.0,
                                  lineHeight: 1.0,
                                ),
                            labelColor:
                                FlutterFlowTheme.of(context).primaryText,
                            unselectedLabelColor: Color(0xFF003063),
                            backgroundColor: Color(0x4CFBC3A3),
                            unselectedBackgroundColor: Colors.white,
                            borderColor: FlutterFlowTheme.of(context).primary,
                            unselectedBorderColor: Colors.white,
                            borderWidth: 2.0,
                            borderRadius: 0.0,
                            elevation: 0.0,
                            tabs: [
                              Tab(
                                text: 'รายการร้านโชว์ห่วย',
                              ),
                              Tab(
                                text: 'รายการร้านโชว์ห่วย\nส่งไปสาขา',
                              ),
                            ],
                            controller: _model.tabBarController,
                            onTap: (i) async {
                              [() async {}, () async {}][i]();
                            },
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _model.tabBarController,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'กรุณาเลือกร้านโชว์ห่วยที่ต้องการมอบหมาย',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto San Thai',
                                                  color: Color(0xFF4C4C4C),
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (_model.chanodlist.length > 0)
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              final branchLisChanod =
                                                  _model.chanodlist.toList();

                                              return ListView.builder(
                                                padding: EdgeInsets.fromLTRB(
                                                  0,
                                                  0,
                                                  0,
                                                  30.0,
                                                ),
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    branchLisChanod.length,
                                                itemBuilder: (context,
                                                    branchLisChanodIndex) {
                                                  final branchLisChanodItem =
                                                      branchLisChanod[
                                                          branchLisChanodIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 9.0,
                                                                0.0, 0.0),
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      elevation: 8.0,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  15.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  15.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  15.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  15.0),
                                                        ),
                                                      ),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: widget.level !=
                                                                'HO'
                                                            ? 210.0
                                                            : 160.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: '${branchLisChanodItem.callStatus}' ==
                                                                  'ติดต่อได้'
                                                              ? Color(
                                                                  0xFFE9FFEA)
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    15.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    15.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    15.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    15.0),
                                                          ),
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
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
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            child:
                                                                                Image.asset(
                                                                              'assets/images/imagesGroceryStore1.gif',
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Column(
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
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                child: Column(
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
                                                                                                      '${branchLisChanodItem.firstName} ${functions.checkUserName(branchLisChanodItem.lastName)}',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Noto San Thai',
                                                                                                            fontSize: 17.0,
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
                                                                                            children: [
                                                                                              Expanded(
                                                                                                child: Text(
                                                                                                  'ที่อยู่ ${branchLisChanodItem.addressDesc == '' ? 'ไม่ระบุ' : branchLisChanodItem.addressDesc}',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Noto San Thai',
                                                                                                        color: Color(0xFF452F1F),
                                                                                                        fontSize: 16.0,
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
                                                                                    Expanded(
                                                                                      child: Container(
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Text(
                                                                                                'รหัสไปรษณีย์ ${branchLisChanodItem.postcode == '' ? 'ไม่ระบุ' : branchLisChanodItem.postcode}',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Noto San Thai',
                                                                                                      color: Color(0xFF452F1F),
                                                                                                      fontSize: 16.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            child: Align(
                                                                                              alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  '${branchLisChanodItem.callStatus}',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Noto San Thai',
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        fontSize: 15.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                      ),
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
                                                                            ),
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Builder(
                                                                                  builder: (context) {
                                                                                    if (!false) {
                                                                                      return FlutterFlowIconButton(
                                                                                        borderRadius: 30.0,
                                                                                        buttonSize: 40.0,
                                                                                        fillColor: Color(0xFF53C300),
                                                                                        icon: Icon(
                                                                                          Icons.call,
                                                                                          color: FlutterFlowTheme.of(context).info,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                        showLoadingIndicator: true,
                                                                                        onPressed: () async {
                                                                                          var _shouldSetState = false;
                                                                                          var confirmDialogResponse = await showDialog<bool>(
                                                                                                context: context,
                                                                                                builder: (alertDialogContext) {
                                                                                                  return AlertDialog(
                                                                                                    content: Text('คุณต้องการจะโทรออกหรือไม่?'),
                                                                                                    actions: [
                                                                                                      TextButton(
                                                                                                        onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                        child: Text('ยกเลิก'),
                                                                                                      ),
                                                                                                      TextButton(
                                                                                                        onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                        child: Text('โทร'),
                                                                                                      ),
                                                                                                    ],
                                                                                                  );
                                                                                                },
                                                                                              ) ??
                                                                                              false;
                                                                                          if (!confirmDialogResponse) {
                                                                                            if (_shouldSetState) safeSetState(() {});
                                                                                            return;
                                                                                          }
                                                                                          if (!functions.checkPhoneNumberChar(branchLisChanodItem.phoneNumber)!) {
                                                                                            await showDialog(
                                                                                              context: context,
                                                                                              builder: (alertDialogContext) {
                                                                                                return AlertDialog(
                                                                                                  content: Text('เบอร์โทรไม่ถูกต้อง'),
                                                                                                  actions: [
                                                                                                    TextButton(
                                                                                                      onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                      child: Text('Ok'),
                                                                                                    ),
                                                                                                  ],
                                                                                                );
                                                                                              },
                                                                                            );
                                                                                            if (_shouldSetState) safeSetState(() {});
                                                                                            return;
                                                                                          }
                                                                                          _model.open3cx1 = await actions.open3CXAction(
                                                                                            '${branchLisChanodItem.phoneNumber}',
                                                                                          );
                                                                                          _shouldSetState = true;
                                                                                          if (_shouldSetState) safeSetState(() {});
                                                                                        },
                                                                                      );
                                                                                    } else {
                                                                                      return Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                        child: InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            await Clipboard.setData(ClipboardData(text: branchLisChanodItem.phoneNumber));
                                                                                            await showDialog(
                                                                                              context: context,
                                                                                              builder: (alertDialogContext) {
                                                                                                return AlertDialog(
                                                                                                  content: Text('คัดลอกเบอร์โทรของลูกค้า ${'${branchLisChanodItem.firstName} ${functions.checkUserName(branchLisChanodItem.lastName)}'} สำเร็จ! กรุณานำไปวางในแอพโทรศัพท์เพื่อโทรหาลูกค้า'),
                                                                                                  actions: [
                                                                                                    TextButton(
                                                                                                      onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                      child: Text('Ok'),
                                                                                                    ),
                                                                                                  ],
                                                                                                );
                                                                                              },
                                                                                            );
                                                                                          },
                                                                                          child: Text(
                                                                                            'คัดลอกเบอร์โทร',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Noto San Thai',
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                  decoration: TextDecoration.underline,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    }
                                                                                  },
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        if (false)
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                4.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Text(
                                                                                  'โฉนดที่ดิน',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Noto San Thai',
                                                                                        color: Color(0xFFBCBCBE),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  branchLisChanodItem.chanodNo == '' ? '-' : branchLisChanodItem.chanodNo,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Noto San Thai',
                                                                                        color: Color(0xFF999A9C),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        if (false)
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                4.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Text(
                                                                                  'ระวาง',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Noto San Thai',
                                                                                        color: Color(0xFFBCBCBE),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  functions.rawangFormattedFunction(branchLisChanodItem.utmmap) == null || functions.rawangFormattedFunction(branchLisChanodItem.utmmap) == '' ? '-' : branchLisChanodItem.utmmap,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Noto San Thai',
                                                                                        color: Color(0xFF999A9C),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        if (false)
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                4.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Text(
                                                                                  'เนื้อที่ (ไร่-งาน-วา)',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Noto San Thai',
                                                                                        color: Color(0xFFBCBCBE),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  '${branchLisChanodItem.landAreaRai}-${branchLisChanodItem.landAreaNgan}-${branchLisChanodItem.landAreaWa}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Noto San Thai',
                                                                                        color: Color(0xFF999A9C),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        if (false)
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                4.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Text(
                                                                                  'ไม่จดจำนอง (บาท)',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Noto San Thai',
                                                                                        color: Color(0xFFBCBCBE),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  '${functions.returnNumberWithComma2Decimal(branchLisChanodItem.ltv1Amount)}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Noto San Thai',
                                                                                        color: Color(0xFF999A9C),
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
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          10.0,
                                                                          11.0,
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
                                                                        .end,
                                                                children: [
                                                                  if (false)
                                                                    Expanded(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          if (false)
                                                                            Expanded(
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                                                children: [
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(0.0, 1.0),
                                                                                    child: Text(
                                                                                      'จดจำนอง (บาท)',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Noto San Thai',
                                                                                            color: Color(0xFF999A9C),
                                                                                            fontSize: 14.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          if (false)
                                                                            Expanded(
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                                                children: [
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(0.0, 1.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          functions.returnNumberWithComma2Decimal(branchLisChanodItem.ltv2Amount),
                                                                                          '186372.00',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Noto San Thai',
                                                                                              fontSize: 20.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
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
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children:
                                                                              [
                                                                            if (widget.level !=
                                                                                'HO')
                                                                              FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  FFAppState().isTextFieldVisible = true;
                                                                                  safeSetState(() {});
                                                                                  FFAppState().saveBranchDataTemp = SaveAssignBranchStruct(
                                                                                    empCode: widget.employeeId,
                                                                                    mode: () {
                                                                                      if (widget.mode == 'สาขา') {
                                                                                        return 'branch';
                                                                                      } else if (widget.mode == 'เขต') {
                                                                                        return 'area';
                                                                                      } else if (widget.mode == 'ภาค') {
                                                                                        return 'region';
                                                                                      } else {
                                                                                        return widget.mode;
                                                                                      }
                                                                                    }(),
                                                                                    leadId: branchLisChanodItem.leadId,
                                                                                    assignType: 'assign',
                                                                                    regionCode: widget.branchCodeSearch,
                                                                                    token: widget.token,
                                                                                    level: widget.mode,
                                                                                    level2: widget.level,
                                                                                  );
                                                                                  safeSetState(() {});

                                                                                  context.goNamed(
                                                                                    SelectedBranchPageWidget.routeName,
                                                                                    queryParameters: {
                                                                                      'fromPage': serializeParam(
                                                                                        'store',
                                                                                        ParamType.String,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                  );
                                                                                },
                                                                                text: 'ส่งเรื่องไปสาขา',
                                                                                options: FFButtonOptions(
                                                                                  width: 120.0,
                                                                                  height: 40.0,
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: 'Noto San Thai',
                                                                                        color: Colors.white,
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                  elevation: 0.0,
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                              ),
                                                                            if (widget.level !=
                                                                                'HO')
                                                                              FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  var _shouldSetState = false;
                                                                                  _model.getCalledStatusCodeAssign = await GetLeadCalledStatusDropdownAPICall.call(
                                                                                    apiUrl: FFAppState().arunsawadApiUrl,
                                                                                    token: widget.token,
                                                                                    leadChannel: branchLisChanodItem.channel,
                                                                                  );

                                                                                  _shouldSetState = true;
                                                                                  if (!(((_model.getCalledStatusCodeAssign?.statusCode ?? 200) == 200) &&
                                                                                      (GetLeadCalledStatusDropdownAPICall.statusLayer1(
                                                                                            (_model.getCalledStatusCodeAssign?.jsonBody ?? ''),
                                                                                          ) ==
                                                                                          200))) {
                                                                                    await showDialog(
                                                                                      context: context,
                                                                                      builder: (alertDialogContext) {
                                                                                        return AlertDialog(
                                                                                          content: Text('Connection Status ${(_model.getCalledStatusCodeAssign?.statusCode ?? 200).toString()} Status Layer1 ${GetLeadCalledStatusDropdownAPICall.statusLayer1(
                                                                                            (_model.getCalledStatusCodeAssign?.jsonBody ?? ''),
                                                                                          )?.toString()}'),
                                                                                          actions: [
                                                                                            TextButton(
                                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                                              child: Text('Ok'),
                                                                                            ),
                                                                                          ],
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                    if (_shouldSetState) safeSetState(() {});
                                                                                    return;
                                                                                  }
                                                                                  await showModalBottomSheet(
                                                                                    isScrollControlled: true,
                                                                                    backgroundColor: Colors.transparent,
                                                                                    barrierColor: Color(0xBF000000),
                                                                                    isDismissible: false,
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
                                                                                          child: Container(
                                                                                            height: MediaQuery.sizeOf(context).height * 0.7,
                                                                                            child: SavedLeadCalledStatusWidget(
                                                                                              leadChannel: branchLisChanodItem.channel,
                                                                                              leadId: branchLisChanodItem.leadId,
                                                                                              callStatusId: GetLeadCalledStatusDropdownAPICall.callStatusID(
                                                                                                (_model.getCalledStatusCodeAssign?.jsonBody ?? ''),
                                                                                              )!,
                                                                                              callStatussName: GetLeadCalledStatusDropdownAPICall.callStatusName(
                                                                                                (_model.getCalledStatusCodeAssign?.jsonBody ?? ''),
                                                                                              )!,
                                                                                              customerName: '${branchLisChanodItem.firstName} ${functions.checkUserName(branchLisChanodItem.lastName)}',
                                                                                              token: widget.token!,
                                                                                              fromPage: 'store',
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ).then((value) => safeSetState(() => _model.savedCallStatusAssign = value));

                                                                                  _shouldSetState = true;
                                                                                  if (!(('${_model.savedCallStatusAssign}' != '') && ('${_model.savedCallStatusAssign}' != 'null'))) {
                                                                                    if (_shouldSetState) safeSetState(() {});
                                                                                    return;
                                                                                  }
                                                                                  _model.updateChanodlistAtIndex(
                                                                                    branchLisChanodIndex,
                                                                                    (e) => e..callStatus = _model.savedCallStatusAssign,
                                                                                  );
                                                                                  safeSetState(() {});
                                                                                  if (_shouldSetState) safeSetState(() {});
                                                                                },
                                                                                text: 'บันทึกโทร',
                                                                                options: FFButtonOptions(
                                                                                  width: 120.0,
                                                                                  height: 40.0,
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: 'Noto San Thai',
                                                                                        color: Colors.white,
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                  elevation: 0.0,
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                              ),
                                                                          ].divide(SizedBox(width: 12.0)),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ]
                                                              .addToStart(
                                                                  SizedBox(
                                                                      height:
                                                                          4.0))
                                                              .addToEnd(
                                                                  SizedBox(
                                                                      height:
                                                                          4.0)),
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
                                    if (_model.chanodlist.length == 0)
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'ไม่พบรายการข้อมูล',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Noto San Thai',
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 10.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(10.0),
                                                    bottomRight:
                                                        Radius.circular(10.0),
                                                    topLeft:
                                                        Radius.circular(10.0),
                                                    topRight:
                                                        Radius.circular(10.0),
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 8.0, 0.0),
                                                  child: TextFormField(
                                                    controller: _model
                                                        .textField23TextController,
                                                    focusNode: _model
                                                        .textField23FocusNode,
                                                    onChanged: (_) =>
                                                        EasyDebounce.debounce(
                                                      '_model.textField23TextController',
                                                      Duration(
                                                          milliseconds: 100),
                                                      () => safeSetState(() {}),
                                                    ),
                                                    autofocus: false,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto San Thai',
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      hintText:
                                                          'รหัสสาขา/ชื่อสาขา/ชื่อ-สกุล ลูกค้า',
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto San Thai',
                                                                color: Color(
                                                                    0xFFBCBCBE),
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                      enabledBorder:
                                                          InputBorder.none,
                                                      focusedBorder:
                                                          InputBorder.none,
                                                      errorBorder:
                                                          InputBorder.none,
                                                      focusedErrorBorder:
                                                          InputBorder.none,
                                                      hoverColor: Colors.white,
                                                      prefixIcon: Icon(
                                                        Icons.search_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto San Thai',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    validator: _model
                                                        .textField23TextControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          if (false)
                                            FFButtonWidget(
                                              onPressed: () async {
                                                context.pushNamed(
                                                    ChanodListPageCopyWidget
                                                        .routeName);
                                              },
                                              text: 'ค้นหา',
                                              options: FFButtonOptions(
                                                width: 100.0,
                                                height: 50.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Noto San Thai',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          FFButtonWidget(
                                            onPressed: () async {
                                              _model.chanodlistto = functions
                                                  .reversedList(_model
                                                      .chanodlistto
                                                      .toList())
                                                  .toList()
                                                  .cast<ChanodData3Struct>();
                                              safeSetState(() {});
                                            },
                                            text: 'เรียงลำดับข้อมูล',
                                            icon: FaIcon(
                                              FontAwesomeIcons.sortAmountUp,
                                              size: 15.0,
                                            ),
                                            options: FFButtonOptions(
                                              width: 170.0,
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconAlignment: IconAlignment.end,
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0xFF003063),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Noto San Thai',
                                                        color: Colors.white,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 0.0,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(20.0),
                                                bottomRight:
                                                    Radius.circular(20.0),
                                                topLeft: Radius.circular(20.0),
                                                topRight: Radius.circular(20.0),
                                              ),
                                            ),
                                          ),
                                          FFButtonWidget(
                                            onPressed: () async {
                                              safeSetState(() {
                                                _model.textField23TextController
                                                    ?.clear();
                                              });
                                            },
                                            text: 'ล้างข้อมูล',
                                            options: FFButtonOptions(
                                              width: 170.0,
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Noto San Thai',
                                                    color: Color(0xFF003063),
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                              elevation: 0.0,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(20.0),
                                                bottomRight:
                                                    Radius.circular(20.0),
                                                topLeft: Radius.circular(20.0),
                                                topRight: Radius.circular(20.0),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (_model.chanodlistto.length > 0)
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              final branchListChanodItemTo =
                                                  _model.chanodlistto.toList();

                                              return ListView.builder(
                                                padding: EdgeInsets.fromLTRB(
                                                  0,
                                                  0,
                                                  0,
                                                  30.0,
                                                ),
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    branchListChanodItemTo
                                                        .length,
                                                itemBuilder: (context,
                                                    branchListChanodItemToIndex) {
                                                  final branchListChanodItemToItem =
                                                      branchListChanodItemTo[
                                                          branchListChanodItemToIndex];
                                                  return Visibility(
                                                    visible: _model
                                                                .textField23TextController
                                                                .text !=
                                                            ''
                                                        ? (functions
                                                                .containString(
                                                                    _model
                                                                        .textField23TextController
                                                                        .text,
                                                                    branchListChanodItemToItem
                                                                        .branchName)! ||
                                                            functions.containString(
                                                                _model
                                                                    .textField23TextController
                                                                    .text,
                                                                branchListChanodItemToItem
                                                                    .branchCode)! ||
                                                            functions.containString(
                                                                _model
                                                                    .textField23TextController
                                                                    .text,
                                                                branchListChanodItemToItem
                                                                    .firstName)! ||
                                                            functions.containString(
                                                                _model
                                                                    .textField23TextController
                                                                    .text,
                                                                branchListChanodItemToItem
                                                                    .lastName)!)
                                                        : true,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  9.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 8.0,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    15.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    15.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    15.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    15.0),
                                                          ),
                                                        ),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              widget.level !=
                                                                      'HO'
                                                                  ? 240.0
                                                                  : 190.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: '${branchListChanodItemToItem.callStatus}' ==
                                                                    'ติดต่อได้'
                                                                ? Color(
                                                                    0xFFE9FFEA)
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      15.0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          15.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      15.0),
                                                              topRight: Radius
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
                                                                    .spaceAround,
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
                                                                              5.0,
                                                                              8.0,
                                                                              0.0),
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            child:
                                                                                Image.asset(
                                                                              'assets/images/imagesGroceryStore1.gif',
                                                                              width: 50.0,
                                                                              height: 50.0,
                                                                              fit: BoxFit.cover,
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
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Container(
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Expanded(
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    '${branchListChanodItemToItem.firstName} ${functions.checkUserName(branchListChanodItemToItem.lastName)}',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Noto San Thai',
                                                                                                          fontSize: 17.0,
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
                                                                                      Expanded(
                                                                                        child: Container(
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: Text(
                                                                                                    'ที่อยู่ ${branchListChanodItemToItem.addressDesc == '' ? 'ไม่ระบุ' : branchListChanodItemToItem.addressDesc}',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Noto San Thai',
                                                                                                          color: Color(0xFF452F1F),
                                                                                                          fontSize: 16.0,
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
                                                                                      Expanded(
                                                                                        child: Container(
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: Text(
                                                                                                    'รหัสไปรษณีย์ ${branchListChanodItemToItem.postcode == '' ? 'ไม่ระบุ' : branchListChanodItemToItem.postcode}',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Noto San Thai',
                                                                                                          color: Color(0xFF452F1F),
                                                                                                          fontSize: 16.0,
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
                                                                                      Expanded(
                                                                                        child: Container(
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                            children: [
                                                                                              Flexible(
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    'สาขา ${branchListChanodItemToItem.branchName} (${branchListChanodItemToItem.branchCode})',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Noto San Thai',
                                                                                                          color: Color(0xFF003063),
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
                                                                                      Expanded(
                                                                                        child: Container(
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                            children: [
                                                                                              Expanded(
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    '${branchListChanodItemToItem.callStatus}',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Noto San Thai',
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          fontSize: 15.0,
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
                                                                              ),
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Builder(
                                                                                    builder: (context) {
                                                                                      if (!false) {
                                                                                        return Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                          child: FlutterFlowIconButton(
                                                                                            borderRadius: 30.0,
                                                                                            buttonSize: 40.0,
                                                                                            fillColor: Color(0xFF53C300),
                                                                                            icon: Icon(
                                                                                              Icons.call,
                                                                                              color: FlutterFlowTheme.of(context).info,
                                                                                              size: 24.0,
                                                                                            ),
                                                                                            showLoadingIndicator: true,
                                                                                            onPressed: () async {
                                                                                              currentUserLocationValue = await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
                                                                                              var _shouldSetState = false;
                                                                                              var confirmDialogResponse = await showDialog<bool>(
                                                                                                    context: context,
                                                                                                    builder: (alertDialogContext) {
                                                                                                      return AlertDialog(
                                                                                                        content: Text('คุณต้องการจะโทรออกหรือไม่?'),
                                                                                                        actions: [
                                                                                                          TextButton(
                                                                                                            onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                            child: Text('ยกเลิก'),
                                                                                                          ),
                                                                                                          TextButton(
                                                                                                            onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                            child: Text('โทร'),
                                                                                                          ),
                                                                                                        ],
                                                                                                      );
                                                                                                    },
                                                                                                  ) ??
                                                                                                  false;
                                                                                              if (!confirmDialogResponse) {
                                                                                                if (_shouldSetState) safeSetState(() {});
                                                                                                return;
                                                                                              }
                                                                                              if (!functions.checkPhoneNumberChar('${branchListChanodItemToItem.phoneNumber}')!) {
                                                                                                await showDialog(
                                                                                                  context: context,
                                                                                                  builder: (alertDialogContext) {
                                                                                                    return AlertDialog(
                                                                                                      content: Text('เบอร์โทรไม่ถูกต้อง'),
                                                                                                      actions: [
                                                                                                        TextButton(
                                                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                          child: Text('Ok'),
                                                                                                        ),
                                                                                                      ],
                                                                                                    );
                                                                                                  },
                                                                                                );
                                                                                                if (_shouldSetState) safeSetState(() {});
                                                                                                return;
                                                                                              }
                                                                                              _model.open3cx2 = await actions.open3CXAction(
                                                                                                '${branchListChanodItemToItem.phoneNumber}',
                                                                                              );
                                                                                              _shouldSetState = true;
                                                                                              if (_shouldSetState) safeSetState(() {});
                                                                                            },
                                                                                          ),
                                                                                        );
                                                                                      } else {
                                                                                        return Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                          child: InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              await Clipboard.setData(ClipboardData(text: branchListChanodItemToItem.phoneNumber));
                                                                                              await showDialog(
                                                                                                context: context,
                                                                                                builder: (alertDialogContext) {
                                                                                                  return AlertDialog(
                                                                                                    content: Text('คัดลอกเบอร์โทรของลูกค้า ${'${branchListChanodItemToItem.firstName} ${functions.checkUserName(branchListChanodItemToItem.lastName)}'} สำเร็จ! กรุณานำไปวางในแอพโทรศัพท์เพื่อโทรหาลูกค้า'),
                                                                                                    actions: [
                                                                                                      TextButton(
                                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                        child: Text('Ok'),
                                                                                                      ),
                                                                                                    ],
                                                                                                  );
                                                                                                },
                                                                                              );
                                                                                            },
                                                                                            child: Text(
                                                                                              'คัดลอกเบอร์โทร',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Noto San Thai',
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                    decoration: TextDecoration.underline,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      }
                                                                                    },
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          if (false)
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Text(
                                                                                    'โฉนดที่ดิน',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Noto San Thai',
                                                                                          color: Color(0xFFBCBCBE),
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    branchListChanodItemToItem.chanodNo == '' ? '-' : branchListChanodItemToItem.chanodNo,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Noto San Thai',
                                                                                          color: Color(0xFF999A9C),
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          if (false)
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Text(
                                                                                    'ระวาง',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Noto San Thai',
                                                                                          color: Color(0xFFBCBCBE),
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    functions.rawangFormattedFunction(branchListChanodItemToItem.utmmap) == null || functions.rawangFormattedFunction(branchListChanodItemToItem.utmmap) == '' ? '-' : branchListChanodItemToItem.utmmap,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Noto San Thai',
                                                                                          color: Color(0xFF999A9C),
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          if (false)
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Text(
                                                                                    'เนื้อที่ (ไร่-งาน-วา)',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Noto San Thai',
                                                                                          color: Color(0xFFBCBCBE),
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    '${branchListChanodItemToItem.landAreaRai}-${branchListChanodItemToItem.landAreaNgan}-${branchListChanodItemToItem.landAreaWa}',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Noto San Thai',
                                                                                          color: Color(0xFF999A9C),
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          if (false)
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Text(
                                                                                    'ไม่จดจำนอง (บาท)',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Noto San Thai',
                                                                                          color: Color(0xFFBCBCBE),
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    '${functions.returnNumberWithComma2Decimal(branchListChanodItemToItem.ltv1Amount)}',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Noto San Thai',
                                                                                          color: Color(0xFF999A9C),
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          if (false)
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Text(
                                                                                    'จดจำนอง (บาท)',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Noto San Thai',
                                                                                          color: Color(0xFFBCBCBE),
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    '${functions.returnNumberWithComma2Decimal(branchListChanodItemToItem.ltv2Amount)}',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Noto San Thai',
                                                                                          color: Color(0xFF999A9C),
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
                                                                  ],
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        10.0,
                                                                        11.0,
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
                                                                          .end,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                if (('${branchListChanodItemToItem.callStatus}' == 'ใหม่') && (widget.level != 'HO'))
                                                                                  FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      FFAppState().isTextFieldVisible = false;
                                                                                      safeSetState(() {});
                                                                                      FFAppState().saveBranchDataTemp = SaveAssignBranchStruct(
                                                                                        empCode: widget.employeeId,
                                                                                        mode: () {
                                                                                          if (widget.mode == 'สาขา') {
                                                                                            return 'branch';
                                                                                          } else if (widget.mode == 'เขต') {
                                                                                            return 'area';
                                                                                          } else if (widget.mode == 'ภาค') {
                                                                                            return 'region';
                                                                                          } else {
                                                                                            return widget.mode;
                                                                                          }
                                                                                        }(),
                                                                                        leadId: branchListChanodItemToItem.leadId,
                                                                                        assignType: 'transfer',
                                                                                        regionCode: widget.branchCodeSearch,
                                                                                        token: widget.token,
                                                                                        level: widget.mode,
                                                                                        level2: widget.level,
                                                                                      );
                                                                                      safeSetState(() {});

                                                                                      context.goNamed(
                                                                                        SelectedBranchPageWidget.routeName,
                                                                                        queryParameters: {
                                                                                          'fromPage': serializeParam(
                                                                                            'store',
                                                                                            ParamType.String,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                      );
                                                                                    },
                                                                                    text: 'ย้ายสาขา',
                                                                                    options: FFButtonOptions(
                                                                                      width: 120.0,
                                                                                      height: 40.0,
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            fontFamily: 'Noto San Thai',
                                                                                            color: Colors.white,
                                                                                            fontSize: 14.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      elevation: 0.0,
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                  ),
                                                                                if (widget.level != 'HO')
                                                                                  FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      var _shouldSetState = false;
                                                                                      _model.getCalledStatusCode = await GetLeadCalledStatusDropdownAPICall.call(
                                                                                        apiUrl: FFAppState().arunsawadApiUrl,
                                                                                        token: widget.token,
                                                                                        leadChannel: branchListChanodItemToItem.channel,
                                                                                      );

                                                                                      _shouldSetState = true;
                                                                                      if (!(((_model.getCalledStatusCode?.statusCode ?? 200) == 200) &&
                                                                                          (GetLeadCalledStatusDropdownAPICall.statusLayer1(
                                                                                                (_model.getCalledStatusCode?.jsonBody ?? ''),
                                                                                              ) ==
                                                                                              200))) {
                                                                                        await showDialog(
                                                                                          context: context,
                                                                                          builder: (alertDialogContext) {
                                                                                            return AlertDialog(
                                                                                              content: Text('Connection Status ${(_model.getCalledStatusCode?.statusCode ?? 200).toString()} Status Layer1 ${GetLeadCalledStatusDropdownAPICall.statusLayer1(
                                                                                                (_model.getCalledStatusCode?.jsonBody ?? ''),
                                                                                              )?.toString()}'),
                                                                                              actions: [
                                                                                                TextButton(
                                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                  child: Text('Ok'),
                                                                                                ),
                                                                                              ],
                                                                                            );
                                                                                          },
                                                                                        );
                                                                                        if (_shouldSetState) safeSetState(() {});
                                                                                        return;
                                                                                      }
                                                                                      await showModalBottomSheet(
                                                                                        isScrollControlled: true,
                                                                                        backgroundColor: Colors.transparent,
                                                                                        barrierColor: Color(0xBF000000),
                                                                                        isDismissible: false,
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
                                                                                              child: Container(
                                                                                                height: MediaQuery.sizeOf(context).height * 0.7,
                                                                                                child: SavedLeadCalledStatusWidget(
                                                                                                  leadChannel: branchListChanodItemToItem.channel,
                                                                                                  leadId: branchListChanodItemToItem.leadId,
                                                                                                  callStatusId: GetLeadCalledStatusDropdownAPICall.callStatusID(
                                                                                                    (_model.getCalledStatusCode?.jsonBody ?? ''),
                                                                                                  )!,
                                                                                                  callStatussName: GetLeadCalledStatusDropdownAPICall.callStatusName(
                                                                                                    (_model.getCalledStatusCode?.jsonBody ?? ''),
                                                                                                  )!,
                                                                                                  customerName: '${branchListChanodItemToItem.firstName} ${functions.checkUserName(branchListChanodItemToItem.lastName)}',
                                                                                                  token: widget.token!,
                                                                                                  fromPage: 'store',
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ).then((value) => safeSetState(() => _model.savedCallStatus = value));

                                                                                      _shouldSetState = true;
                                                                                      if (!(('${_model.savedCallStatus}' != '') && ('${_model.savedCallStatus}' != 'null'))) {
                                                                                        if (_shouldSetState) safeSetState(() {});
                                                                                        return;
                                                                                      }
                                                                                      _model.updateChanodlisttoAtIndex(
                                                                                        branchListChanodItemToIndex,
                                                                                        (e) => e..callStatus = _model.savedCallStatus,
                                                                                      );
                                                                                      safeSetState(() {});
                                                                                      if (_shouldSetState) safeSetState(() {});
                                                                                    },
                                                                                    text: 'บันทึกโทร',
                                                                                    options: FFButtonOptions(
                                                                                      width: 120.0,
                                                                                      height: 40.0,
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            fontFamily: 'Noto San Thai',
                                                                                            color: Colors.white,
                                                                                            fontSize: 14.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      elevation: 0.0,
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                  ),
                                                                              ].divide(SizedBox(width: 12.0)),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ]
                                                                .addToStart(
                                                                    SizedBox(
                                                                        height:
                                                                            4.0))
                                                                .addToEnd(
                                                                    SizedBox(
                                                                        height:
                                                                            4.0)),
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
                                    if (_model.chanodlistto.length == 0)
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'ไม่พบรายการข้อมูล',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Noto San Thai',
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
                            ],
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
      ),
    );
  }
}
