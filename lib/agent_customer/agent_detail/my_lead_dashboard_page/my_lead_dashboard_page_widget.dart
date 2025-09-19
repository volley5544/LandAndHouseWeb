import '/agent_customer/agent_detail/my_lead_advance_search_component/my_lead_advance_search_component_widget.dart';
import '/agent_customer/agent_detail/select_payment_by_lead/select_payment_by_lead_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/error_message_component_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/loading/loading_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:styled_divider/styled_divider.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'my_lead_dashboard_page_model.dart';
export 'my_lead_dashboard_page_model.dart';

class MyLeadDashboardPageWidget extends StatefulWidget {
  const MyLeadDashboardPageWidget({super.key});

  static String routeName = 'MyLeadDashboardPage';
  static String routePath = '/myLeadDashboardPage';

  @override
  State<MyLeadDashboardPageWidget> createState() =>
      _MyLeadDashboardPageWidgetState();
}

class _MyLeadDashboardPageWidgetState extends State<MyLeadDashboardPageWidget> {
  late MyLeadDashboardPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyLeadDashboardPageModel());

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
                width: double.infinity,
                child: LoadingWidget(),
              ),
            ),
          );
        },
      );

      _model.doneDealLeadData = LeadAgentMainCatagoryStruct(
        category: 'ปิดการขาย',
        total: 0,
        subCategory: functions.returnLeadAgentSubCatagoryEmptyList(),
      );
      _model.newCustomerLeadData = LeadAgentMainCatagoryStruct(
        category: 'ลูกค้าใหม่',
        total: 0,
        subCategory: functions.returnLeadAgentSubCatagoryEmptyList(),
      );
      _model.onProcessLeadData = LeadAgentMainCatagoryStruct(
        category: 'อยู่ระหว่างติดต่อลูกค้า',
        total: 0,
        subCategory: functions.returnLeadAgentSubCatagoryEmptyList(),
      );
      safeSetState(() {});
      _model.getLeadAgentApiOutput =
          await AgentAPIGroup.getLeadAgentByTypeCall.call(
        agentCode: FFAppState().agentCode,
        url: 'https://16742361ed73.ngrok-free.app/ssw_agent',
      );

      if ((_model.getLeadAgentApiOutput?.statusCode ?? 200) != 200) {
        Navigator.pop(context);
        await showDialog(
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
                      'พบข้อผิดพลาด Connection (${(_model.getLeadAgentApiOutput?.statusCode ?? 200).toString()})',
                ),
              ),
            );
          },
        );

        return;
      }
      if ('${getJsonField(
            (_model.getLeadAgentApiOutput?.jsonBody ?? ''),
            r'''$.code''',
          ).toString()}' !=
          '200') {
        Navigator.pop(context);
        await showDialog(
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
                  textMessage: '${getJsonField(
                    (_model.getLeadAgentApiOutput?.jsonBody ?? ''),
                    r'''$.message''',
                  ).toString()}',
                ),
              ),
            );
          },
        );

        return;
      }
      _model.allLeadData = AgentAPIGroup.getLeadAgentByTypeCall
          .dataJson(
            (_model.getLeadAgentApiOutput?.jsonBody ?? ''),
          )!
          .toList()
          .cast<LeadAgentMainCatagoryStruct>();
      safeSetState(() {});
      _model.doneDealLeadData = _model.allLeadData.elementAtOrNull(
          functions.findIndexInList(
              _model.allLeadData.map((e) => e.category).toList().toList(),
              'ปิดการขาย')!);
      _model.newCustomerLeadData = _model.allLeadData.elementAtOrNull(
          functions.findIndexInList(
              _model.allLeadData.map((e) => e.category).toList().toList(),
              'ลูกค้าใหม่')!);
      _model.onProcessLeadData = _model.allLeadData.elementAtOrNull(
          functions.findIndexInList(
              _model.allLeadData.map((e) => e.category).toList().toList(),
              'อยู่ระหว่างติดต่อลูกค้า')!);
      safeSetState(() {});
      _model.allLeadList = functions
          .combineLeadAgentDataModelList(
              (getJsonField(
                _model.newCustomerLeadData?.toMap(),
                r'''$.sub_category[*].items''',
                true,
              )
                      ?.toList()
                      .map<LeadAgentDataModelStruct?>(
                          LeadAgentDataModelStruct.maybeFromMap)
                      .toList() as Iterable<LeadAgentDataModelStruct?>)
                  .withoutNulls
                  .toList(),
              (getJsonField(
                _model.onProcessLeadData?.toMap(),
                r'''$.sub_category[*].items''',
                true,
              )
                      ?.toList()
                      .map<LeadAgentDataModelStruct?>(
                          LeadAgentDataModelStruct.maybeFromMap)
                      .toList() as Iterable<LeadAgentDataModelStruct?>)
                  .withoutNulls
                  .toList(),
              (getJsonField(
                _model.doneDealLeadData?.toMap(),
                r'''$.sub_category[*].items[*]''',
                true,
              )
                      ?.toList()
                      .map<LeadAgentDataModelStruct?>(
                          LeadAgentDataModelStruct.maybeFromMap)
                      .toList() as Iterable<LeadAgentDataModelStruct?>)
                  .withoutNulls
                  .toList())!
          .toList()
          .cast<LeadAgentDataModelStruct>();
      safeSetState(() {});
      _model.showingLeadData =
          _model.allLeadList.toList().cast<LeadAgentDataModelStruct>();
      safeSetState(() {});
      Navigator.pop(context);
    });

    _model.searchTextFieldTextController ??= TextEditingController();
    _model.searchTextFieldFocusNode ??= FocusNode();

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
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset(
                        'assets/images/header-background2.png',
                      ).image,
                    ),
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
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                      topLeft: Radius.circular(0.0),
                      topRight: Radius.circular(0.0),
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 24.0, 8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 32.0,
                                height: 34.0,
                                child: Stack(
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.user,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 30.0,
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(1.0, 1.0),
                                      child: Container(
                                        width: 18.0,
                                        height: 18.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFFAE4D1),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.view_headline,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 18.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                'รายการแนะนำลูกค้า',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Noto San Thai',
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 70.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
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
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 8.0, 8.0, 8.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      Icons.fiber_new,
                                                      color: Color(0xFF41C0F0),
                                                      size: 30.0,
                                                    ),
                                                    Text(
                                                      'ลูกค้าใหม่',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto San Thai',
                                                            color: Colors.black,
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 8.0)),
                                                ),
                                              ),
                                              Expanded(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      '${functions.returnNumberWithCommaFullNumber(_model.newCustomerLeadData?.total.toString(), '0')}',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto San Thai',
                                                            color: Colors.black,
                                                            fontSize: 20.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
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
                                        height: 70.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
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
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 8.0, 8.0, 8.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    FaIcon(
                                                      FontAwesomeIcons
                                                          .phoneVolume,
                                                      color: Color(0xFF8615FF),
                                                      size: 24.0,
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Text(
                                                          'อยู่ระหว่างติดต่อลูกค้า',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto San Thai',
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 4.0)),
                                                ),
                                              ),
                                              Expanded(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      '${functions.returnNumberWithCommaFullNumber(_model.onProcessLeadData?.total.toString(), '0')}',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto San Thai',
                                                            color: Colors.black,
                                                            fontSize: 20.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 8.0)),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 148.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
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
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Icon(
                                                                  Icons.star,
                                                                  color: Color(
                                                                      0xFFFDD835),
                                                                  size: 30.0,
                                                                ),
                                                                Text(
                                                                  'ปิดการขาย',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
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
                                                                            FontWeight.bold,
                                                                      ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 8.0)),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  '${functions.returnNumberWithCommaFullNumber(_model.doneDealLeadData?.total.toString(), '0')}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto San Thai',
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            20.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
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
                                              Expanded(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    8.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
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
                                                                  Container(
                                                                    width: 10.0,
                                                                    height:
                                                                        10.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xFF7DD562),
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'อนุมัติวงเงิน',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto San Thai',
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      '(${functions.returnNumberWithCommaFullNumber('${(_model.doneDealLeadData?.subCategory.elementAtOrNull(functions.findIndexInList(_model.doneDealLeadData?.subCategory.map((e) => e.subject).toList().toList(), 'อนุมัติวงเงิน')!))?.totalSub.toString()}', '0')})',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto San Thai',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            fontSize:
                                                                                12.0,
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
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
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
                                                                    Container(
                                                                      width:
                                                                          10.0,
                                                                      height:
                                                                          10.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xFFFD8C8C),
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        'หมดอายุ',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Noto San Thai',
                                                                              color: Colors.black,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        '(${functions.returnNumberWithCommaFullNumber('${(_model.doneDealLeadData?.subCategory.elementAtOrNull(functions.findIndexInList(_model.doneDealLeadData?.subCategory.map((e) => e.subject).toList().toList(), 'หมดอายุ')!))?.totalSub.toString()}', '0')})',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
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
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
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
                                                                    Container(
                                                                      width:
                                                                          10.0,
                                                                      height:
                                                                          10.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        'ข้อมูลซ้ำ',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Noto San Thai',
                                                                              color: Colors.black,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        '(${functions.returnNumberWithCommaFullNumber('${(_model.doneDealLeadData?.subCategory.elementAtOrNull(functions.findIndexInList(_model.doneDealLeadData?.subCategory.map((e) => e.subject).toList().toList(), 'ข้อมูลซ้ำ')!))?.totalSub.toString()}', '0')})',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
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
                              ].divide(SizedBox(width: 16.0)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.info_outlined,
                                  color: Color(0xC0646464),
                                  size: 20.0,
                                ),
                                Text(
                                  'ข้อมูล ณ วันที่ 29/08/2568',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto San Thai',
                                        color: Color(0xBF646464),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ].divide(SizedBox(width: 4.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: 20.0,
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
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
                                      'ลูกค้าของฉัน',
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
                                Builder(
                                  builder: (context) => InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      var _shouldSetState = false;
                                      await showDialog(
                                        barrierColor: Color(0xB3000000),
                                        barrierDismissible: false,
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
                                              child:
                                                  MyLeadAdvanceSearchComponentWidget(
                                                showingLeadData:
                                                    _model.allLeadList,
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() =>
                                          _model.advanceSearchOutput = value));

                                      _shouldSetState = true;
                                      if (!(_model.advanceSearchOutput !=
                                          null)) {
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }
                                      _model.showingLeadData = _model
                                          .allLeadList
                                          .where((e) =>
                                              ('${getJsonField(
                                                        _model
                                                            .advanceSearchOutput,
                                                        r'''$.leadStatus''',
                                                      ).toString()}' !=
                                                      ''
                                                  ? ('${e.leadStatus}' ==
                                                      '${getJsonField(
                                                        _model
                                                            .advanceSearchOutput,
                                                        r'''$.leadStatus''',
                                                      ).toString()}')
                                                  : true) &&
                                              ('${getJsonField(
                                                        _model
                                                            .advanceSearchOutput,
                                                        r'''$.product''',
                                                      ).toString()}' !=
                                                      ''
                                                  ? ('${e.product}' ==
                                                      '${getJsonField(
                                                        _model
                                                            .advanceSearchOutput,
                                                        r'''$.product''',
                                                      ).toString()}')
                                                  : true) &&
                                              ('${getJsonField(
                                                        _model
                                                            .advanceSearchOutput,
                                                        r'''$.loanTypeName''',
                                                      ).toString()}' !=
                                                      ''
                                                  ? ('${e.loanTypeName}' ==
                                                      '${getJsonField(
                                                        _model
                                                            .advanceSearchOutput,
                                                        r'''$.loanTypeName''',
                                                      ).toString()}')
                                                  : true) &&
                                              ('${getJsonField(
                                                        _model
                                                            .advanceSearchOutput,
                                                        r'''$.paymentMethod''',
                                                      ).toString()}' !=
                                                      ''
                                                  ? ('${e.paymentMethod}' ==
                                                      '${getJsonField(
                                                        _model
                                                            .advanceSearchOutput,
                                                        r'''$.paymentMethod''',
                                                      ).toString()}')
                                                  : true) &&
                                              ('${getJsonField(
                                                        _model
                                                            .advanceSearchOutput,
                                                        r'''$.paymentChannel''',
                                                      ).toString()}' !=
                                                      ''
                                                  ? ('${e.paymentChannel}' ==
                                                      '${getJsonField(
                                                        _model
                                                            .advanceSearchOutput,
                                                        r'''$.paymentChannel''',
                                                      ).toString()}')
                                                  : true))
                                          .toList()
                                          .cast<LeadAgentDataModelStruct>();
                                      safeSetState(() {});
                                      safeSetState(() {
                                        _model.choiceChipsValueController
                                            ?.reset();
                                      });
                                      safeSetState(() {
                                        _model.searchTextFieldTextController
                                            ?.clear();
                                      });
                                      if (_shouldSetState) safeSetState(() {});
                                    },
                                    child: Text(
                                      'ค้นหาแบบละเอียด',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Noto San Thai',
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            decoration:
                                                TextDecoration.underline,
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
                              24.0, 8.0, 24.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: double.infinity,
                                          child: TextFormField(
                                            controller: _model
                                                .searchTextFieldTextController,
                                            focusNode:
                                                _model.searchTextFieldFocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.searchTextFieldTextController',
                                              Duration(milliseconds: 2000),
                                              () => safeSetState(() {}),
                                            ),
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto San Thai',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText: 'คำค้น ชื่อ นามสกุล',
                                              hintStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Noto San Thai',
                                                    color: Color(0x98646464),
                                                    letterSpacing: 0.0,
                                                  ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x80646464),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              prefixIcon: Icon(
                                                FontAwesomeIcons.search,
                                                color: Color(0x80646464),
                                                size: 24.0,
                                              ),
                                              suffixIcon: _model
                                                      .searchTextFieldTextController!
                                                      .text
                                                      .isNotEmpty
                                                  ? InkWell(
                                                      onTap: () async {
                                                        _model
                                                            .searchTextFieldTextController
                                                            ?.clear();
                                                        safeSetState(() {});
                                                      },
                                                      child: Icon(
                                                        Icons.clear,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 20.0,
                                                      ),
                                                    )
                                                  : null,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto San Thai',
                                                  letterSpacing: 0.0,
                                                ),
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            enableInteractiveSelection: true,
                                            validator: _model
                                                .searchTextFieldTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                      Builder(
                                        builder: (context) => FFButtonWidget(
                                          onPressed: () async {
                                            if (!(('${_model.searchTextFieldTextController.text}' !=
                                                    '') &&
                                                ('${_model.searchTextFieldTextController.text}'
                                                        .length >
                                                    2))) {
                                              await showDialog(
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
                                                            'กรุณากรอกคำค้นหาอย่างน้อย 3 ตัวอักษร',
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );

                                              return;
                                            }
                                            _model.showingLeadData = _model
                                                .allLeadList
                                                .where((e) =>
                                                    functions.containString(
                                                        '${_model.searchTextFieldTextController.text}',
                                                        '${e.firstName}')! ||
                                                    functions.containString(
                                                        '${_model.searchTextFieldTextController.text}',
                                                        '${e.lastName}')!)
                                                .toList()
                                                .cast<
                                                    LeadAgentDataModelStruct>();
                                            safeSetState(() {});
                                            safeSetState(() {
                                              _model.choiceChipsValueController
                                                  ?.reset();
                                            });
                                          },
                                          text: 'ค้นหา',
                                          options: FFButtonOptions(
                                            width: 90.0,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
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
                                      ),
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 50.0,
                                  decoration: BoxDecoration(),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: FlutterFlowChoiceChips(
                                            options: [
                                              ChipData('ลูกค้าใหม่'),
                                              ChipData(
                                                  'อยู่ระหว่างติดต่อลูกค้า'),
                                              ChipData('ปิดการขาย')
                                            ],
                                            onChanged: (val) async {
                                              safeSetState(() => _model
                                                  .choiceChipsValues = val);
                                              if (_model.choiceChipsValues!
                                                      .length >
                                                  1) {
                                                if (_model.choiceChipsValues
                                                        ?.lastOrNull ==
                                                    'ลูกค้าใหม่') {
                                                  safeSetState(() {
                                                    _model
                                                        .choiceChipsValueController
                                                        ?.value = [
                                                      'ลูกค้าใหม่'
                                                    ];
                                                  });
                                                } else if (_model
                                                        .choiceChipsValues
                                                        ?.lastOrNull ==
                                                    'อยู่ระหว่างติดต่อลูกค้า') {
                                                  safeSetState(() {
                                                    _model
                                                        .choiceChipsValueController
                                                        ?.value = [
                                                      'อยู่ระหว่างติดต่อลูกค้า'
                                                    ];
                                                  });
                                                } else if (_model
                                                        .choiceChipsValues
                                                        ?.lastOrNull ==
                                                    'ปิดการขาย') {
                                                  safeSetState(() {
                                                    _model
                                                        .choiceChipsValueController
                                                        ?.value = ['ปิดการขาย'];
                                                  });
                                                } else {
                                                  safeSetState(() {
                                                    _model
                                                        .choiceChipsValueController
                                                        ?.reset();
                                                  });
                                                }
                                              }
                                              _model.showingLeadData = () {
                                                if ((_model.choiceChipsValues !=
                                                            null &&
                                                        (_model.choiceChipsValues)!
                                                            .isNotEmpty) &&
                                                    (_model.choiceChipsValues
                                                            ?.firstOrNull ==
                                                        'ลูกค้าใหม่')) {
                                                  return (getJsonField(
                                                    _model.newCustomerLeadData!
                                                        .toMap(),
                                                    r'''$.sub_category[*].items''',
                                                    true,
                                                  )!
                                                              .toList()
                                                              .map<LeadAgentDataModelStruct?>(
                                                                  LeadAgentDataModelStruct
                                                                      .maybeFromMap)
                                                              .toList()
                                                          as Iterable<
                                                              LeadAgentDataModelStruct?>)
                                                      .withoutNulls;
                                                } else if ((_model
                                                                .choiceChipsValues !=
                                                            null &&
                                                        (_model.choiceChipsValues)!
                                                            .isNotEmpty) &&
                                                    (_model.choiceChipsValues
                                                            ?.firstOrNull ==
                                                        'อยู่ระหว่างติดต่อลูกค้า')) {
                                                  return (getJsonField(
                                                    _model.onProcessLeadData!
                                                        .toMap(),
                                                    r'''$.sub_category[*].items''',
                                                    true,
                                                  )!
                                                              .toList()
                                                              .map<LeadAgentDataModelStruct?>(
                                                                  LeadAgentDataModelStruct
                                                                      .maybeFromMap)
                                                              .toList()
                                                          as Iterable<
                                                              LeadAgentDataModelStruct?>)
                                                      .withoutNulls;
                                                } else if ((_model
                                                                .choiceChipsValues !=
                                                            null &&
                                                        (_model.choiceChipsValues)!
                                                            .isNotEmpty) &&
                                                    (_model.choiceChipsValues
                                                            ?.firstOrNull ==
                                                        'ปิดการขาย')) {
                                                  return (getJsonField(
                                                    _model.doneDealLeadData!
                                                        .toMap(),
                                                    r'''$.sub_category[*].items[*]''',
                                                    true,
                                                  )!
                                                              .toList()
                                                              .map<LeadAgentDataModelStruct?>(
                                                                  LeadAgentDataModelStruct
                                                                      .maybeFromMap)
                                                              .toList()
                                                          as Iterable<
                                                              LeadAgentDataModelStruct?>)
                                                      .withoutNulls;
                                                } else {
                                                  return functions
                                                      .combineLeadAgentDataModelList(
                                                          (getJsonField(
                                                            _model
                                                                .newCustomerLeadData
                                                                ?.toMap(),
                                                            r'''$.sub_category[*].items''',
                                                            true,
                                                          )
                                                                      ?.toList()
                                                                      .map<LeadAgentDataModelStruct?>(
                                                                          LeadAgentDataModelStruct
                                                                              .maybeFromMap)
                                                                      .toList()
                                                                  as Iterable<
                                                                      LeadAgentDataModelStruct?>)
                                                              .withoutNulls
                                                              .toList(),
                                                          (getJsonField(
                                                            _model
                                                                .onProcessLeadData
                                                                ?.toMap(),
                                                            r'''$.sub_category[*].items''',
                                                            true,
                                                          )
                                                                      ?.toList()
                                                                      .map<LeadAgentDataModelStruct?>(
                                                                          LeadAgentDataModelStruct
                                                                              .maybeFromMap)
                                                                      .toList()
                                                                  as Iterable<
                                                                      LeadAgentDataModelStruct?>)
                                                              .withoutNulls
                                                              .toList(),
                                                          (getJsonField(
                                                            _model
                                                                .doneDealLeadData
                                                                ?.toMap(),
                                                            r'''$.sub_category[*].items[*]''',
                                                            true,
                                                          )
                                                                      ?.toList()
                                                                      .map<LeadAgentDataModelStruct?>(
                                                                          LeadAgentDataModelStruct
                                                                              .maybeFromMap)
                                                                      .toList()
                                                                  as Iterable<
                                                                      LeadAgentDataModelStruct?>)
                                                              .withoutNulls
                                                              .toList())!;
                                                }
                                              }()
                                                  .toList()
                                                  .cast<
                                                      LeadAgentDataModelStruct>();
                                              safeSetState(() {});
                                              safeSetState(() {
                                                _model
                                                    .searchTextFieldTextController
                                                    ?.clear();
                                              });
                                            },
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
                                                    letterSpacing: 0.0,
                                                    lineHeight: 1.8,
                                                  ),
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              iconSize: 16.0,
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            unselectedChipStyle: ChipStyle(
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Noto San Thai',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    letterSpacing: 0.0,
                                                  ),
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              iconSize: 16.0,
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            chipSpacing: 8.0,
                                            rowSpacing: 8.0,
                                            multiselect: true,
                                            initialized:
                                                _model.choiceChipsValues !=
                                                    null,
                                            alignment: WrapAlignment.start,
                                            controller: _model
                                                    .choiceChipsValueController ??=
                                                FormFieldController<
                                                    List<String>>(
                                              [],
                                            ),
                                            wrapped: false,
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
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                final leadListItems =
                                    _model.showingLeadData.toList();

                                return ListView.builder(
                                  padding: EdgeInsets.fromLTRB(
                                    0,
                                    4.0,
                                    0,
                                    0,
                                  ),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: leadListItems.length,
                                  itemBuilder: (context, leadListItemsIndex) {
                                    final leadListItemsItem =
                                        leadListItems[leadListItemsIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 4.0, 12.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 2.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              offset: Offset(
                                                2.0,
                                                4.0,
                                              ),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        child: Container(
                                          width: double.infinity,
                                          color: Color(0x00000000),
                                          child: ExpandableNotifier(
                                            initialExpanded: false,
                                            child: ExpandablePanel(
                                              header: Container(
                                                width: double.infinity,
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: 30.0,
                                                            height: 30.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                width: 2.0,
                                                              ),
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Icon(
                                                                Icons.person,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 26.0,
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            'คุณ${leadListItemsItem.firstName}',
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
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 8.0)),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            '${leadListItemsItem.leadStatus}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto San Thai',
                                                                  color: () {
                                                                    if ('${leadListItemsItem.leadStatus}' ==
                                                                        'ลูกค้าใหม่') {
                                                                      return Color(
                                                                          0xFF3AA9FA);
                                                                    } else if ('${leadListItemsItem.leadStatus}' ==
                                                                        'อยู่ระหว่างติดต่อลูกค้า') {
                                                                      return Color(
                                                                          0xFF8615FF);
                                                                    } else if ('${leadListItemsItem.leadStatus}' ==
                                                                        'อนุมัติวงเงิน') {
                                                                      return Color(
                                                                          0xFF7DD562);
                                                                    } else if ('${leadListItemsItem.leadStatus}' ==
                                                                        'หมดอายุ') {
                                                                      return Color(
                                                                          0xFFFD8C8C);
                                                                    } else if ('${leadListItemsItem.leadStatus}' ==
                                                                        'ข้อมูลซ้ำ') {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary;
                                                                    } else {
                                                                      return Colors
                                                                          .black;
                                                                    }
                                                                  }(),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 8.0)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              collapsed: Container(),
                                              expanded: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 20.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Divider(
                                                        thickness: 2.0,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
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
                                                            child: Padding(
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
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    'วงเงินที่ต้องการ',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto San Thai',
                                                                          color:
                                                                              Color(0xFF646464),
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    '${functions.returnNumberWithComma2Decimal('${leadListItemsItem.loanAmount}')} บาท',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto San Thai',
                                                                          color:
                                                                              Colors.black,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        8.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Padding(
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
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      'ผลิตภัณฑ์',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto San Thai',
                                                                            color:
                                                                                Color(0xFF646464),
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      '${() {
                                                                        if ('${leadListItemsItem.product}' ==
                                                                            'loan') {
                                                                          return 'สินเชื่อ';
                                                                        } else if ('${leadListItemsItem.product}' ==
                                                                            'insurance') {
                                                                          return 'ประกันภัย';
                                                                        } else {
                                                                          return '-';
                                                                        }
                                                                      }()}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto San Thai',
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        8.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Padding(
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
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      'ประเภทสินทรัพย์',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto San Thai',
                                                                            color:
                                                                                Color(0xFF646464),
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      '${leadListItemsItem.loanTypeName}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto San Thai',
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        8.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Padding(
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
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      'วันที่บันทึกข้อมูล',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto San Thai',
                                                                            color:
                                                                                Color(0xFF646464),
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      '${functions.showDateBE('${leadListItemsItem.createdAt}')}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto San Thai',
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
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
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  StyledDivider(
                                                                    thickness:
                                                                        1.2,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    lineStyle:
                                                                        DividerLineStyle
                                                                            .dashdotted,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        4.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Padding(
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
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'วิธีการรับเงิน',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto San Thai',
                                                                            color:
                                                                                Color(0xFF646464),
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        Text(
                                                                          '${leadListItemsItem.paymentMethod}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Noto San Thai',
                                                                                color: Colors.black,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          '(หัก ${leadListItemsItem.deductionPercent} %)',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Noto San Thai',
                                                                                color: Color(0x80646464),
                                                                                fontSize: 10.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
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
                                                            child: Padding(
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
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    'ช่องทางการรับเงิน',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto San Thai',
                                                                          color:
                                                                              Color(0xFF646464),
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    '${leadListItemsItem.paymentChannel}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto San Thai',
                                                                          color:
                                                                              Colors.black,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ]
                                                            .divide(SizedBox(
                                                                height: 0.0))
                                                            .addToStart(
                                                                SizedBox(
                                                                    height:
                                                                        8.0)),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    12.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Padding(
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
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        enableDrag:
                                                                            false,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(context).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                Padding(
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: Container(
                                                                                height: MediaQuery.sizeOf(context).height * 0.5,
                                                                                child: SelectPaymentByLeadWidget(
                                                                                  reductPercent: leadListItemsItem.deductionPercent,
                                                                                  bankAccount: leadListItemsItem.accountNumber,
                                                                                  paymentMethodDefault: leadListItemsItem.paymentMethod,
                                                                                  id: leadListItemsItem.id,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          safeSetState(() =>
                                                                              _model.paymentMethodSelected = value));

                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    text:
                                                                        'เปลี่ยนวิธีการรับเงิน',
                                                                    options:
                                                                        FFButtonOptions(
                                                                      width:
                                                                          12.0,
                                                                      height:
                                                                          35.0,
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
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
                                                                                FontWeight.normal,
                                                                          ),
                                                                      elevation:
                                                                          0.0,
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
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
                                              theme: ExpandableThemeData(
                                                tapHeaderToExpand: true,
                                                tapBodyToExpand: false,
                                                tapBodyToCollapse: false,
                                                headerAlignment:
                                                    ExpandablePanelHeaderAlignment
                                                        .center,
                                                hasIcon: true,
                                                iconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
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
                      ].addToStart(SizedBox(height: 16.0)),
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
                              child: FFButtonWidget(
                                onPressed: () async {
                                  context.safePop();
                                },
                                text: 'กลับหน้าหลัก',
                                options: FFButtonOptions(
                                  height: 60.0,
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
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 12.0)),
                        ),
                      ),
                    ].divide(SizedBox(height: 8.0)),
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
