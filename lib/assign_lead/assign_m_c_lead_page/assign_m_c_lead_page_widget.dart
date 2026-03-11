import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/saved_lead_called_status_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/loading/loading_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'assign_m_c_lead_page_model.dart';
export 'assign_m_c_lead_page_model.dart';

class AssignMCLeadPageWidget extends StatefulWidget {
  const AssignMCLeadPageWidget({
    super.key,
    required this.employeeId,
    required this.token,
    required this.branchCodeSearch,
    required this.mode,
    String? fromPage,
    this.level,
    this.product,
  }) : this.fromPage = fromPage ?? 'assignBranch';

  final String? employeeId;
  final String? token;
  final String? branchCodeSearch;
  final String? mode;
  final String fromPage;
  final String? level;
  final String? product;

  static String routeName = 'AssignMCLeadPage';
  static String routePath = '/assignMCLeadPage';

  @override
  State<AssignMCLeadPageWidget> createState() => _AssignMCLeadPageWidgetState();
}

class _AssignMCLeadPageWidgetState extends State<AssignMCLeadPageWidget>
    with TickerProviderStateMixin {
  late AssignMCLeadPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AssignMCLeadPageModel());

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
      _model.getListChanod = await GetListChanodCall.call(
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

      _model.getListLeadMC = await GetListMCAssignCall.call(
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

      if ((_model.getListLeadMC?.statusCode ?? 200) != 200) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              content: Text(
                  'พบข้อผิดพลาด Connection (${(_model.getListLeadMC?.statusCode ?? 200).toString()})'),
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
      if ('${GetListMCAssignCall.statuslayer1(
            (_model.getListLeadMC?.jsonBody ?? ''),
          )?.toString()}' !=
          '200') {
        if ('${GetListMCAssignCall.statuslayer1(
              (_model.getListLeadMC?.jsonBody ?? ''),
            )?.toString()}' ==
            '404') {
          Navigator.pop(context);
          return;
        }
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              content: Text('พบข้อผิดพลาด (${GetListMCAssignCall.statuslayer1(
                (_model.getListLeadMC?.jsonBody ?? ''),
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
      _model.assignForList = GetListMCAssignCall.assignForData(
        (_model.getListLeadMC?.jsonBody ?? ''),
      )!
          .toList()
          .cast<AssignLeadMCDataModelStruct>();
      safeSetState(() {});
      _model.assignToList = GetListMCAssignCall.assignTodData(
        (_model.getListLeadMC?.jsonBody ?? ''),
      )!
          .toList()
          .cast<AssignLeadMCDataModelStruct>();
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
      builder: (context) => Title(
          title: 'AssignMCLeadPage',
          color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
          child: GestureDetector(
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
                  'รายการสินเชื่อ${FFDevEnvironmentValues().isProduction ? '' : ' (UAT)'}',
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FlutterFlowChoiceChips(
                                options: [
                                  ChipData('ทั้งหมด'),
                                  ChipData('รถจักรยานยนต์'),
                                  ChipData('รถยนต์')
                                ],
                                onChanged: (val) => safeSetState(() =>
                                    _model.choiceChipsValue = val?.firstOrNull),
                                selectedChipStyle: ChipStyle(
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto San Thai',
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        letterSpacing: 0.0,
                                        lineHeight: 1.5,
                                      ),
                                  iconColor: FlutterFlowTheme.of(context).info,
                                  iconSize: 16.0,
                                  labelPadding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  elevation: 2.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                unselectedChipStyle: ChipStyle(
                                  backgroundColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto San Thai',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                        lineHeight: 1.5,
                                      ),
                                  iconColor: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  iconSize: 16.0,
                                  labelPadding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  elevation: 2.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                chipSpacing: 12.0,
                                rowSpacing: 8.0,
                                multiselect: false,
                                initialized: _model.choiceChipsValue != null,
                                alignment: WrapAlignment.start,
                                controller:
                                    _model.choiceChipsValueController ??=
                                        FormFieldController<List<String>>(
                                  ['ทั้งหมด'],
                                ),
                                wrapped: false,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
                                unselectedLabelStyle:
                                    FlutterFlowTheme.of(context)
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
                                borderColor:
                                    FlutterFlowTheme.of(context).primary,
                                unselectedBorderColor: Colors.white,
                                borderWidth: 2.0,
                                borderRadius: 0.0,
                                elevation: 0.0,
                                tabs: [
                                  Tab(
                                    text: 'รายการสินเชื่อ',
                                  ),
                                  Tab(
                                    text: 'รายการส่งไปสาขา',
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                'กรุณาเลือกสินเชื่อรถที่ต้องการมอบหมาย',
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto San Thai',
                                                          color:
                                                              Color(0xFF4C4C4C),
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (_model.assignForList.length > 0)
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final assignForListItem =
                                                      _model.assignForList
                                                          .where((e) => () {
                                                                if (_model
                                                                        .choiceChipsValue ==
                                                                    'ทั้งหมด') {
                                                                  return true;
                                                                } else if (_model
                                                                        .choiceChipsValue ==
                                                                    'รถจักรยานยนต์') {
                                                                  return (e
                                                                          .carVehicleCode ==
                                                                      'M');
                                                                } else if (_model
                                                                        .choiceChipsValue ==
                                                                    'รถยนต์') {
                                                                  return (e
                                                                          .carVehicleCode ==
                                                                      'C');
                                                                } else {
                                                                  return false;
                                                                }
                                                              }())
                                                          .toList();

                                                  return ListView.builder(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                      0,
                                                      0,
                                                      0,
                                                      30.0,
                                                    ),
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount: assignForListItem
                                                        .length,
                                                    itemBuilder: (context,
                                                        assignForListItemIndex) {
                                                      final assignForListItemItem =
                                                          assignForListItem[
                                                              assignForListItemIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    9.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 8.0,
                                                          shape:
                                                              RoundedRectangleBorder(
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
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: '${assignForListItemItem.callStatus}' ==
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
                                                                bottomRight: Radius
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
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          16.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
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
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Builder(
                                                                              builder: (context) {
                                                                                if ('${assignForListItemItem.carVehicleCode}' == 'C') {
                                                                                  return Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 8.0, 0.0),
                                                                                    child: ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                      child: SvgPicture.asset(
                                                                                        'assets/images/car-loan.svg',
                                                                                        width: 60.0,
                                                                                        height: 60.0,
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                } else if ('${assignForListItemItem.carVehicleCode}' == 'M') {
                                                                                  return Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 8.0, 0.0),
                                                                                    child: ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                      child: SvgPicture.asset(
                                                                                        'assets/images/MotorLoanIcon.svg',
                                                                                        width: 60.0,
                                                                                        height: 60.0,
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                } else {
                                                                                  return Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 8.0, 0.0),
                                                                                    child: ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                      child: SvgPicture.asset(
                                                                                        'assets/images/LOANL.svg',
                                                                                        width: 60.0,
                                                                                        height: 60.0,
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }
                                                                              },
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
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                                                                                            '${assignForListItemItem.firstName} ${functions.checkUserName(assignForListItemItem.lastName)}',
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
                                                                                                        '${('${assignForListItemItem.carBrandName}' != 'null') && ('${assignForListItemItem.carBrandName}' != '') ? '${assignForListItemItem.carBrandName}' : 'ไม่ระบุยี่ห้อ'}>${('${assignForListItemItem.carModelName}' != 'null') && ('${assignForListItemItem.carModelName}' != '') ? '${assignForListItemItem.carModelName}' : 'ไม่ระบุรุ่น'}>${('${assignForListItemItem.carYear}' != 'null') && ('${assignForListItemItem.carYear}' != '') ? '${assignForListItemItem.carYear}' : 'ไม่ระบุปี'}',
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
                                                                                                  if (!functions.checkPhoneNumberChar(assignForListItemItem.phoneNumber)!) {
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
                                                                                                    '${assignForListItemItem.phoneNumber}',
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
                                                                                                  await Clipboard.setData(ClipboardData(text: assignForListItemItem.phoneNumber));
                                                                                                  await showDialog(
                                                                                                    context: context,
                                                                                                    builder: (alertDialogContext) {
                                                                                                      return AlertDialog(
                                                                                                        content: Text('คัดลอกเบอร์โทรของลูกค้า ${'${assignForListItemItem.firstName} ${functions.checkUserName(assignForListItemItem.lastName)}'} สำเร็จ! กรุณานำไปวางในแอพโทรศัพท์เพื่อโทรหาลูกค้า'),
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
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(
                                                                                      'ประเภทรถ',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Noto San Thai',
                                                                                            color: Color(0xFFBCBCBE),
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                    ),
                                                                                    Text(
                                                                                      '${assignForListItemItem.carVehicleName}',
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
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(
                                                                                      'รายละเอียดสินค้า',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Noto San Thai',
                                                                                            color: Color(0xFFBCBCBE),
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                        child: Container(
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Align(
                                                                                            alignment: AlignmentDirectional(1.0, 0.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                                              children: [
                                                                                                Flexible(
                                                                                                  child: Align(
                                                                                                    alignment: AlignmentDirectional(1.0, 0.0),
                                                                                                    child: Text(
                                                                                                      ('${assignForListItemItem.carCcName}' != 'null') && ('${assignForListItemItem.carCcName}' != '') ? '${assignForListItemItem.carCcName}' : 'ไม่ระบุ',
                                                                                                      textAlign: TextAlign.end,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Noto San Thai',
                                                                                                            color: Color(0xFF999A9C),
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
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(
                                                                                      'ทะเบียนรถ',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Noto San Thai',
                                                                                            color: Color(0xFFBCBCBE),
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                        child: Container(
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                                                            children: [
                                                                                              Flexible(
                                                                                                child: Align(
                                                                                                  alignment: AlignmentDirectional(1.0, 0.0),
                                                                                                  child: Text(
                                                                                                    ('${assignForListItemItem.carRegistration}' != 'null') && ('${assignForListItemItem.carRegistration}' != '') ? '${assignForListItemItem.carRegistration}' : 'ไม่ระบุ',
                                                                                                    textAlign: TextAlign.end,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Noto San Thai',
                                                                                                          color: Color(0xFF999A9C),
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
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(
                                                                                      'จังหวัดทะเบียนรถ',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Noto San Thai',
                                                                                            color: Color(0xFFBCBCBE),
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                    ),
                                                                                    Text(
                                                                                      '${assignForListItemItem.province}',
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
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                                                  children: [
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(0.0, 1.0),
                                                                                      child: Text(
                                                                                        'เรทราคา (บาท)',
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
                                                                                          double.parse(assignForListItemItem.carRate) > 0.0
                                                                                              ? valueOrDefault<String>(
                                                                                                  functions.returnNumberWithComma2Decimal(assignForListItemItem.carRate),
                                                                                                  '186372.00',
                                                                                                )
                                                                                              : 'ไม่พบเรท',
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
                                                                              Expanded(
                                                                                child: Container(
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
                                                                                              '${assignForListItemItem.callStatus}',
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
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            if (widget.level !=
                                                                                'HO')
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                                                                                child: FFButtonWidget(
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
                                                                                      leadId: assignForListItemItem.leadId,
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
                                                                                          'LeadMC',
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
                                                                              ),
                                                                            if (widget.level !=
                                                                                'HO')
                                                                              FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  var _shouldSetState = false;
                                                                                  _model.getCalledStatusCodeAssign = await GetLeadCalledStatusDropdownAPICall.call(
                                                                                    apiUrl: FFAppState().arunsawadApiUrl,
                                                                                    token: widget.token,
                                                                                    leadChannel: assignForListItemItem.channel,
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
                                                                                            height: MediaQuery.sizeOf(context).height * 0.85,
                                                                                            child: SavedLeadCalledStatusWidget(
                                                                                              leadChannel: assignForListItemItem.channel,
                                                                                              leadId: assignForListItemItem.leadId,
                                                                                              callStatusId: GetLeadCalledStatusDropdownAPICall.callStatusID(
                                                                                                (_model.getCalledStatusCodeAssign?.jsonBody ?? ''),
                                                                                              )!,
                                                                                              callStatussName: GetLeadCalledStatusDropdownAPICall.callStatusName(
                                                                                                (_model.getCalledStatusCodeAssign?.jsonBody ?? ''),
                                                                                              )!,
                                                                                              customerName: '${assignForListItemItem.firstName} ${functions.checkUserName(assignForListItemItem.lastName)}',
                                                                                              token: widget.token!,
                                                                                              fromPage: 'LeadMC',
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
                                                                                  _model.updateAssignForListAtIndex(
                                                                                    assignForListItemIndex,
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
                                                                          ],
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
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        if (_model.assignForList.length == 0)
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
                                                        fontFamily:
                                                            'Noto San Thai',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                                            Radius.circular(
                                                                10.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                10.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                10.0),
                                                        topRight:
                                                            Radius.circular(
                                                                10.0),
                                                      ),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textField23TextController,
                                                        focusNode: _model
                                                            .textField23FocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.textField23TextController',
                                                          Duration(
                                                              milliseconds:
                                                                  100),
                                                          () => safeSetState(
                                                              () {}),
                                                        ),
                                                        autofocus: false,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
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
                                                              'รหัสสาขา/ชื่อสาขา',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto San Thai',
                                                                    color: Color(
                                                                        0xFFBCBCBE),
                                                                    fontSize:
                                                                        14.0,
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
                                                          hoverColor:
                                                              Colors.white,
                                                          prefixIcon: Icon(
                                                            Icons
                                                                .search_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                          ),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto San Thai',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        validator: _model
                                                            .textField23TextControllerValidator
                                                            .asValidator(
                                                                context),
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Noto San Thai',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 0.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  _model.assignToList = functions
                                                      .reversedListLeadMC(_model
                                                          .assignToList
                                                          .toList())
                                                      .toList()
                                                      .cast<
                                                          AssignLeadMCDataModelStruct>();
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
                                                  iconAlignment:
                                                      IconAlignment.end,
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0xFF003063),
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Noto San Thai',
                                                            color: Colors.white,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(20.0),
                                                    bottomRight:
                                                        Radius.circular(20.0),
                                                    topLeft:
                                                        Radius.circular(20.0),
                                                    topRight:
                                                        Radius.circular(20.0),
                                                  ),
                                                ),
                                              ),
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  safeSetState(() {
                                                    _model
                                                        .textField23TextController
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
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Noto San Thai',
                                                        color:
                                                            Color(0xFF003063),
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(20.0),
                                                    bottomRight:
                                                        Radius.circular(20.0),
                                                    topLeft:
                                                        Radius.circular(20.0),
                                                    topRight:
                                                        Radius.circular(20.0),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (_model.assignToList.length > 0)
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final assigToListItem =
                                                      _model.assignToList
                                                          .where((e) => () {
                                                                if (_model
                                                                        .choiceChipsValue ==
                                                                    'ทั้งหมด') {
                                                                  return true;
                                                                } else if (_model
                                                                        .choiceChipsValue ==
                                                                    'รถจักรยานยนต์') {
                                                                  return (e
                                                                          .carVehicleCode ==
                                                                      'M');
                                                                } else if (_model
                                                                        .choiceChipsValue ==
                                                                    'รถยนต์') {
                                                                  return (e
                                                                          .carVehicleCode ==
                                                                      'C');
                                                                } else {
                                                                  return false;
                                                                }
                                                              }())
                                                          .toList();

                                                  return ListView.builder(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                      0,
                                                      0,
                                                      0,
                                                      30.0,
                                                    ),
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        assigToListItem.length,
                                                    itemBuilder: (context,
                                                        assigToListItemIndex) {
                                                      final assigToListItemItem =
                                                          assigToListItem[
                                                              assigToListItemIndex];
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
                                                                        assigToListItemItem
                                                                            .branchName)! ||
                                                                functions
                                                                    .containString(
                                                                        _model
                                                                            .textField23TextController
                                                                            .text,
                                                                        assigToListItemItem
                                                                            .branchCode)! ||
                                                                (true
                                                                    ? false
                                                                    : functions.containString(
                                                                        _model
                                                                            .textField23TextController
                                                                            .text,
                                                                        assigToListItemItem
                                                                            .firstName)!) ||
                                                                (true
                                                                    ? false
                                                                    : functions.containString(
                                                                        _model
                                                                            .textField23TextController
                                                                            .text,
                                                                        assigToListItemItem
                                                                            .lastName)!))
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
                                                            color: Colors
                                                                .transparent,
                                                            elevation: 8.0,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        15.0),
                                                                bottomRight: Radius
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
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: '${assigToListItemItem.callStatus}' ==
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
                                                                  bottomRight: Radius
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
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
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
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Builder(
                                                                              builder: (context) {
                                                                                if ('${assigToListItemItem.carVehicleCode}' == 'C') {
                                                                                  return Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 8.0, 0.0),
                                                                                    child: ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                      child: SvgPicture.asset(
                                                                                        'assets/images/car-loan.svg',
                                                                                        width: 60.0,
                                                                                        height: 60.0,
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                } else if ('${assigToListItemItem.carVehicleCode}' == 'M') {
                                                                                  return Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 8.0, 0.0),
                                                                                    child: ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                      child: SvgPicture.asset(
                                                                                        'assets/images/MotorLoanIcon.svg',
                                                                                        width: 60.0,
                                                                                        height: 60.0,
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                } else {
                                                                                  return Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 8.0, 0.0),
                                                                                    child: ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                      child: SvgPicture.asset(
                                                                                        'assets/images/LOANL.svg',
                                                                                        width: 60.0,
                                                                                        height: 60.0,
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }
                                                                              },
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
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                                                                                        '${assigToListItemItem.firstName} ${functions.checkUserName(assigToListItemItem.lastName)}',
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
                                                                                                        '${('${assigToListItemItem.carBrandName}' != 'null') && ('${assigToListItemItem.carBrandName}' != '') ? '${assigToListItemItem.carBrandName}' : 'ไม่ระบุยี่ห้อ'}>${('${'${assigToListItemItem.carModelName}'}' != 'null') && ('${'${assigToListItemItem.carModelName}'}' != '') ? '${assigToListItemItem.carBrandName}' : 'ไม่ระบุรุ่น'}>${('${assigToListItemItem.carYear}' != 'null') && ('${'${assigToListItemItem.carYear}'}' != '') ? '${assigToListItemItem.carYear}' : 'ไม่ระบุปี'}',
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
                                                                                                  if (!functions.checkPhoneNumberChar('${assigToListItemItem.phoneNumber}')!) {
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
                                                                                                    '${assigToListItemItem.phoneNumber}',
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
                                                                                                  await Clipboard.setData(ClipboardData(text: assigToListItemItem.phoneNumber));
                                                                                                  await showDialog(
                                                                                                    context: context,
                                                                                                    builder: (alertDialogContext) {
                                                                                                      return AlertDialog(
                                                                                                        content: Text('คัดลอกเบอร์โทรของลูกค้า ${'${assigToListItemItem.firstName} ${functions.checkUserName(assigToListItemItem.lastName)}'} สำเร็จ! กรุณานำไปวางในแอพโทรศัพท์เพื่อโทรหาลูกค้า'),
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
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(
                                                                                      'ประเภทรถ',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Noto San Thai',
                                                                                            color: Color(0xFFBCBCBE),
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                    ),
                                                                                    Text(
                                                                                      '${assigToListItemItem.carVehicleName}',
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
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(
                                                                                      'รายละเอียดสินค้า',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Noto San Thai',
                                                                                            color: Color(0xFFBCBCBE),
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                        child: Container(
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Align(
                                                                                            alignment: AlignmentDirectional(1.0, 0.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: Align(
                                                                                                    alignment: AlignmentDirectional(1.0, 0.0),
                                                                                                    child: Text(
                                                                                                      ('${assigToListItemItem.carCcName}' != 'null') && ('${assigToListItemItem.carCcName}' != '') ? '${assigToListItemItem.carCcName}' : 'ไม่ระบุ',
                                                                                                      textAlign: TextAlign.end,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Noto San Thai',
                                                                                                            color: Color(0xFF999A9C),
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
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(
                                                                                      'ทะเบียนรถ',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Noto San Thai',
                                                                                            color: Color(0xFFBCBCBE),
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                        child: Container(
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                                                            children: [
                                                                                              Expanded(
                                                                                                child: Text(
                                                                                                  ('${assigToListItemItem.carRegistration}' != 'null') && ('${assigToListItemItem.carRegistration}' != '') ? '${assigToListItemItem.carRegistration}' : 'ไม่ระบุ',
                                                                                                  textAlign: TextAlign.end,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Noto San Thai',
                                                                                                        color: Color(0xFF999A9C),
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
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(
                                                                                      'จังหวัดทะเบียนรถ',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Noto San Thai',
                                                                                            color: Color(0xFFBCBCBE),
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                    ),
                                                                                    Text(
                                                                                      '${assigToListItemItem.province}',
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
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(
                                                                                      'ราคาประเมิน',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Noto San Thai',
                                                                                            color: Color(0xFFBCBCBE),
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                    ),
                                                                                    Text(
                                                                                      double.parse('${assigToListItemItem.carRate}') > 0.0 ? '${functions.returnNumberWithComma2Decimal(assigToListItemItem.carRate)} บาท' : 'ไม่พบเรท',
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
                                                                                MainAxisAlignment.spaceEvenly,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
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
                                                                                            '${assigToListItemItem.branchName} (${assigToListItemItem.branchCode})',
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
                                                                              Container(
                                                                                decoration: BoxDecoration(),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          '${assigToListItemItem.callStatus}',
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
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.end,
                                                                          children: [
                                                                            if (('${assigToListItemItem.callStatus}' == 'ใหม่') &&
                                                                                (widget.level != 'HO'))
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                                                                                child: FFButtonWidget(
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
                                                                                      leadId: assigToListItemItem.leadId,
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
                                                                                          'LeadMC',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  },
                                                                                  text: 'ย้ายสาขา',
                                                                                  options: FFButtonOptions(
                                                                                    width: 100.0,
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
                                                                              ),
                                                                            if (widget.level !=
                                                                                'HO')
                                                                              FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  var _shouldSetState = false;
                                                                                  _model.getCalledStatusCode = await GetLeadCalledStatusDropdownAPICall.call(
                                                                                    apiUrl: FFAppState().arunsawadApiUrl,
                                                                                    token: widget.token,
                                                                                    leadChannel: '${assigToListItemItem.channel}',
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
                                                                                            height: MediaQuery.sizeOf(context).height * 0.85,
                                                                                            child: SavedLeadCalledStatusWidget(
                                                                                              leadChannel: assigToListItemItem.channel,
                                                                                              leadId: assigToListItemItem.leadId,
                                                                                              callStatusId: GetLeadCalledStatusDropdownAPICall.callStatusID(
                                                                                                (_model.getCalledStatusCode?.jsonBody ?? ''),
                                                                                              )!,
                                                                                              callStatussName: GetLeadCalledStatusDropdownAPICall.callStatusName(
                                                                                                (_model.getCalledStatusCode?.jsonBody ?? ''),
                                                                                              )!,
                                                                                              customerName: '${assigToListItemItem.firstName} ${functions.checkUserName(assigToListItemItem.lastName)}',
                                                                                              token: widget.token!,
                                                                                              fromPage: 'LeadMC',
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
                                                                                  _model.updateAssignToListAtIndex(
                                                                                    assigToListItemIndex,
                                                                                    (e) => e..callStatus = _model.savedCallStatus,
                                                                                  );
                                                                                  safeSetState(() {});
                                                                                  if (_shouldSetState) safeSetState(() {});
                                                                                },
                                                                                text: 'บันทึกโทร',
                                                                                options: FFButtonOptions(
                                                                                  width: 100.0,
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
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ].addToEnd(
                                                                    SizedBox(
                                                                        height:
                                                                            16.0)),
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
                                        if (_model.assignToList.length == 0)
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
                                                        fontFamily:
                                                            'Noto San Thai',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
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
          )),
    );
  }
}
