import '/agent_customer/agent_detail/my_commission_advance_search_component/my_commission_advance_search_component_widget.dart';
import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/error_message_component_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/m_g_m_agent/web_app_bar_component/web_app_bar_component_widget.dart';
import '/pages/loading/loading_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:badges/badges.dart' as badges;
import 'package:styled_divider/styled_divider.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'my_pay_dashboard_page_model.dart';
export 'my_pay_dashboard_page_model.dart';

class MyPayDashboardPageWidget extends StatefulWidget {
  const MyPayDashboardPageWidget({super.key});

  static String routeName = 'MyPayDashboardPage';
  static String routePath = '/myPayDashboardPage';

  @override
  State<MyPayDashboardPageWidget> createState() =>
      _MyPayDashboardPageWidgetState();
}

class _MyPayDashboardPageWidgetState extends State<MyPayDashboardPageWidget> {
  late MyPayDashboardPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyPayDashboardPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.checkAuthOutput = await action_blocks.checkAuth(context);
      if (!_model.checkAuthOutput!) {
        return;
      }
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

      _model.commissionData = AgentCommissionDataModelStruct();
      safeSetState(() {});
      _model.getCommissionLeadApiOutput =
          await AgentAPIGroup.getCommissionLeadCall.call(
        agentCode: FFAppState().agentCode,
        url: FFDevEnvironmentValues().isProduction
            ? FFAppState().apiUrlDocData.agentWebApiUrl
            : FFAppState().apiUrlDocData.agentWebApiUrlUat,
        tokenHeader: FFDevEnvironmentValues().isProduction
            ? FFAppState().apiUrlDocData.agentWebApiToken
            : FFAppState().apiUrlDocData.agentWebApiTokenUat,
      );

      if ((_model.getCommissionLeadApiOutput?.statusCode ?? 200) != 200) {
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
                      'พบข้อผิดพลาด Connection (${(_model.getCommissionLeadApiOutput?.statusCode ?? 200).toString()})',
                ),
              ),
            );
          },
        );

        return;
      }
      if ('${getJsonField(
            (_model.getCommissionLeadApiOutput?.jsonBody ?? ''),
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
                    (_model.getCommissionLeadApiOutput?.jsonBody ?? ''),
                    r'''$.message''',
                  ).toString()}',
                ),
              ),
            );
          },
        );

        return;
      }
      _model.commissionData = AgentAPIGroup.getCommissionLeadCall.dataJson(
        (_model.getCommissionLeadApiOutput?.jsonBody ?? ''),
      );
      safeSetState(() {});
      _model.showingLeadData = _model.commissionData!.details
          .toList()
          .cast<AgentCommissionLeadDataModelStruct>();
      safeSetState(() {});
      safeSetState(() {
        _model.choiceChipsValueController?.value = ['ทั้งหมด'];
      });
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
      builder: (context) => Title(
          title: 'โครงการเพื่อนแนะนำเพื่อน',
          color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              floatingActionButton: Visibility(
                visible: () {
                  if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                    return true;
                  } else if (MediaQuery.sizeOf(context).width <
                      kBreakpointMedium) {
                    return true;
                  } else if (MediaQuery.sizeOf(context).width <
                      kBreakpointLarge) {
                    return true;
                  } else {
                    return false;
                  }
                }()
                    ? (('${FFAppState().agentProfileDataType.agentDocStatus}' !=
                            'COMPLETED') &&
                        (loggedIn
                            ? true
                            : ('${FFAppState().platform}' == 'mobile')))
                    : false,
                child: Align(
                  alignment: AlignmentDirectional(1.0, 0.8),
                  child: FloatingActionButton.extended(
                    onPressed: () async {
                      context.pushNamed(AgentDetailPage01Widget.routeName);
                    },
                    backgroundColor: FlutterFlowTheme.of(context).primaryText,
                    elevation: 8.0,
                    label: badges.Badge(
                      badgeContent: Text(
                        '!',
                        style: FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily: 'Noto San Thai',
                              color: Colors.white,
                              letterSpacing: 0.0,
                            ),
                      ),
                      showBadge: true,
                      shape: badges.BadgeShape.circle,
                      badgeColor: FlutterFlowTheme.of(context).primary,
                      elevation: 4.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                      position: badges.BadgePosition.topEnd(),
                      animationType: badges.BadgeAnimationType.scale,
                      toAnimate: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.edit_square,
                            color: FlutterFlowTheme.of(context).info,
                            size: 24.0,
                          ),
                          Text(
                            'กรอกข้อมูล\nเพื่อรับค่าตอบแทน',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Noto San Thai',
                                  color: FlutterFlowTheme.of(context).secondary,
                                  fontSize: 9.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              body: SafeArea(
                top: true,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    wrapWithModel(
                      model: _model.webAppBarComponentModel,
                      updateCallback: () => safeSetState(() {}),
                      child: WebAppBarComponentWidget(),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: () {
                                  if (MediaQuery.sizeOf(context).width <
                                      kBreakpointSmall) {
                                    return MediaQuery.sizeOf(context).width;
                                  } else if (MediaQuery.sizeOf(context).width <
                                      kBreakpointMedium) {
                                    return MediaQuery.sizeOf(context).width;
                                  } else if (MediaQuery.sizeOf(context).width <
                                      kBreakpointLarge) {
                                    return MediaQuery.sizeOf(context).width;
                                  } else {
                                    return 800.0;
                                  }
                                }(),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 8.0, 24.0, 8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: () {
                                          if (MediaQuery.sizeOf(context).width <
                                              kBreakpointSmall) {
                                            return MediaQuery.sizeOf(context)
                                                .width;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointMedium) {
                                            return MediaQuery.sizeOf(context)
                                                .width;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointLarge) {
                                            return MediaQuery.sizeOf(context)
                                                .width;
                                          } else {
                                            return 600.0;
                                          }
                                        }(),
                                        decoration: BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                FaIcon(
                                                  FontAwesomeIcons.wallet,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 30.0,
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {},
                                                  child: Text(
                                                    'กระเป๋าตังค์ของฉัน',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto San Thai',
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 8.0)),
                                            ),
                                            if (false)
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, -1.0),
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
                                                    context.pushNamed(
                                                        MyWalletPageWidget
                                                            .routeName);
                                                  },
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      FaIcon(
                                                        FontAwesomeIcons
                                                            .moneyBillAlt,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 30.0,
                                                      ),
                                                      Text(
                                                        'รายรับ 3 เดือน',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto San Thai',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      11.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline,
                                                                ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 4.0)),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Container(
                                          width: () {
                                            if (MediaQuery.sizeOf(context)
                                                    .width <
                                                kBreakpointSmall) {
                                              return MediaQuery.sizeOf(context)
                                                  .width;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointMedium) {
                                              return MediaQuery.sizeOf(context)
                                                  .width;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointLarge) {
                                              return MediaQuery.sizeOf(context)
                                                  .width;
                                            } else {
                                              return 600.0;
                                            }
                                          }(),
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
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
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 12.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Expanded(
                                                            flex: 2,
                                                            child: Container(
                                                              width: 50.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0.0),
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            -1.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children:
                                                                            [
                                                                          Text(
                                                                            'ค่าตอบแทนทั้งหมด',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Noto San Thai',
                                                                                  color: Colors.black,
                                                                                  fontSize: 16.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w100,
                                                                                ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 16.0)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            24.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              '${functions.returnNumberWithComma2Decimal('${_model.commissionData?.summary.totalComPayAmt}')}',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Noto San Thai',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    fontSize: 24.0,
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
                                                          ),
                                                          Expanded(
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1.0,
                                                                      -1.0),
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
                                                                onTap:
                                                                    () async {
                                                                  context.pushNamed(
                                                                      MyWalletPageWidget
                                                                          .routeName);
                                                                },
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    FaIcon(
                                                                      FontAwesomeIcons
                                                                          .moneyBillAlt,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          30.0,
                                                                    ),
                                                                    Text(
                                                                      'รายรับ 3 เดือน',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto San Thai',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            fontSize:
                                                                                11.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            decoration:
                                                                                TextDecoration.underline,
                                                                          ),
                                                                    ),
                                                                  ]
                                                                      .divide(SizedBox(
                                                                          width:
                                                                              8.0))
                                                                      .addToEnd(SizedBox(
                                                                          width:
                                                                              8.0)),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    8.0,
                                                                    0.0,
                                                                    8.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
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
                                                                onTap:
                                                                    () async {
                                                                  if ((_model.choiceChipsValues
                                                                              ?.length ==
                                                                          1) &&
                                                                      (_model.choiceChipsValues
                                                                              ?.firstOrNull ==
                                                                          'จ่ายแล้ว')) {
                                                                    safeSetState(
                                                                        () {
                                                                      _model
                                                                          .choiceChipsValueController
                                                                          ?.value = [
                                                                        'ทั้งหมด'
                                                                      ];
                                                                    });
                                                                    _model.showingLeadData = _model
                                                                        .commissionData!
                                                                        .details
                                                                        .toList()
                                                                        .cast<
                                                                            AgentCommissionLeadDataModelStruct>();
                                                                    _model.statusRowActive =
                                                                        false;
                                                                    safeSetState(
                                                                        () {});
                                                                    safeSetState(
                                                                        () {
                                                                      _model
                                                                          .searchTextFieldTextController
                                                                          ?.clear();
                                                                    });
                                                                    return;
                                                                  }
                                                                  safeSetState(
                                                                      () {
                                                                    _model
                                                                        .choiceChipsValueController
                                                                        ?.value = [
                                                                      'จ่ายแล้ว'
                                                                    ];
                                                                  });
                                                                  _model.showingLeadData = _model
                                                                      .commissionData!
                                                                      .details
                                                                      .where((e) =>
                                                                          double.parse(e
                                                                              .comReceivedAmt) >
                                                                          0.0)
                                                                      .toList()
                                                                      .cast<
                                                                          AgentCommissionLeadDataModelStruct>();
                                                                  _model.statusRowActive =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                  safeSetState(
                                                                      () {
                                                                    _model
                                                                        .searchTextFieldTextController
                                                                        ?.clear();
                                                                  });
                                                                },
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      'จ่ายแล้ว',
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
                                                                          ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            () {
                                                                          if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointSmall) {
                                                                            return (MediaQuery.sizeOf(context).width *
                                                                                0.25);
                                                                          } else if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointMedium) {
                                                                            return (MediaQuery.sizeOf(context).width *
                                                                                0.25);
                                                                          } else if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointLarge) {
                                                                            return (MediaQuery.sizeOf(context).width *
                                                                                0.25);
                                                                          } else {
                                                                            return 170.0;
                                                                          }
                                                                        }(),
                                                                        height:
                                                                            30.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0xFF4AC225),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceEvenly,
                                                                          children: [
                                                                            if (_model.choiceChipsValues?.lastOrNull ==
                                                                                'จ่ายแล้ว')
                                                                              Expanded(
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Icon(
                                                                                    Icons.check,
                                                                                    color: Color(0xFF4AC225),
                                                                                    size: 16.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            Expanded(
                                                                              flex: 3,
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Text(
                                                                                  '${functions.returnNumberWithComma2Decimal(_model.commissionData?.summary.totalComReceivedAmt)}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Noto San Thai',
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        letterSpacing: 0.0,
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
                                                            Expanded(
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
                                                                onTap:
                                                                    () async {
                                                                  if ((_model.choiceChipsValues
                                                                              ?.length ==
                                                                          3) &&
                                                                      (_model.choiceChipsValues!.contains('รอจ่ายค่างวด') &&
                                                                          _model.choiceChipsValues!.contains(
                                                                              'รออนุมัติ') &&
                                                                          _model
                                                                              .choiceChipsValues!
                                                                              .contains('ได้รับในรอบถัดไป'))) {
                                                                    safeSetState(
                                                                        () {
                                                                      _model
                                                                          .choiceChipsValueController
                                                                          ?.value = [
                                                                        'ทั้งหมด'
                                                                      ];
                                                                    });
                                                                    _model.showingLeadData = _model
                                                                        .commissionData!
                                                                        .details
                                                                        .toList()
                                                                        .cast<
                                                                            AgentCommissionLeadDataModelStruct>();
                                                                    _model.statusRowActive =
                                                                        false;
                                                                    safeSetState(
                                                                        () {});
                                                                    safeSetState(
                                                                        () {
                                                                      _model
                                                                          .searchTextFieldTextController
                                                                          ?.clear();
                                                                    });
                                                                    return;
                                                                  }
                                                                  _model
                                                                      .choiceChipsValueController
                                                                      ?.value = [
                                                                    'รอจ่ายค่างวด',
                                                                    'รออนุมัติ',
                                                                    'ได้รับในรอบถัดไป'
                                                                  ];
                                                                  _model.statusRowActive =
                                                                      true;
                                                                  safeSetState(
                                                                      () {});
                                                                  _model.showingLeadData = _model
                                                                      .commissionData!
                                                                      .details
                                                                      .where((e) =>
                                                                          (double.parse(e.comWaitingPayAmt) > 0.0) ||
                                                                          (double.parse(e.comWaitingApproveAmt) >
                                                                              0.0) ||
                                                                          (double.parse(e.comNextPayAmt) >
                                                                              0.0))
                                                                      .toList()
                                                                      .cast<
                                                                          AgentCommissionLeadDataModelStruct>();
                                                                  safeSetState(
                                                                      () {});
                                                                  safeSetState(
                                                                      () {
                                                                    _model
                                                                        .searchTextFieldTextController
                                                                        ?.clear();
                                                                  });
                                                                },
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      'กำลังดำเนินการ',
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
                                                                          ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            () {
                                                                          if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointSmall) {
                                                                            return (MediaQuery.sizeOf(context).width *
                                                                                0.25);
                                                                          } else if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointMedium) {
                                                                            return (MediaQuery.sizeOf(context).width *
                                                                                0.25);
                                                                          } else if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointLarge) {
                                                                            return (MediaQuery.sizeOf(context).width *
                                                                                0.25);
                                                                          } else {
                                                                            return 170.0;
                                                                          }
                                                                        }(),
                                                                        height:
                                                                            30.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0xFFFFD45B),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceEvenly,
                                                                          children: [
                                                                            if (_model.statusRowActive)
                                                                              Expanded(
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Icon(
                                                                                    Icons.check,
                                                                                    color: Color(0xFFFFD45B),
                                                                                    size: 16.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            Expanded(
                                                                              flex: 3,
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Text(
                                                                                  '${functions.returnNumberWithComma2Decimal(_model.commissionData?.summary.totalComWaitingAmt)}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Noto San Thai',
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        letterSpacing: 0.0,
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
                                                            Expanded(
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
                                                                onTap:
                                                                    () async {
                                                                  if ((_model.choiceChipsValues
                                                                              ?.length ==
                                                                          1) &&
                                                                      (_model.choiceChipsValues
                                                                              ?.firstOrNull ==
                                                                          'ยังไม่ถึงรอบจ่าย')) {
                                                                    safeSetState(
                                                                        () {
                                                                      _model
                                                                          .choiceChipsValueController
                                                                          ?.value = [
                                                                        'ทั้งหมด'
                                                                      ];
                                                                    });
                                                                    _model.showingLeadData = _model
                                                                        .commissionData!
                                                                        .details
                                                                        .toList()
                                                                        .cast<
                                                                            AgentCommissionLeadDataModelStruct>();
                                                                    _model.statusRowActive =
                                                                        false;
                                                                    safeSetState(
                                                                        () {});
                                                                    safeSetState(
                                                                        () {
                                                                      _model
                                                                          .searchTextFieldTextController
                                                                          ?.clear();
                                                                    });
                                                                    return;
                                                                  }
                                                                  safeSetState(
                                                                      () {
                                                                    _model
                                                                        .choiceChipsValueController
                                                                        ?.value = [
                                                                      'ยังไม่ถึงรอบจ่าย'
                                                                    ];
                                                                  });
                                                                  _model.showingLeadData = _model
                                                                      .commissionData!
                                                                      .details
                                                                      .where((e) =>
                                                                          double.parse(e
                                                                              .comPaymentNotDueAmt) >
                                                                          0.0)
                                                                      .toList()
                                                                      .cast<
                                                                          AgentCommissionLeadDataModelStruct>();
                                                                  _model.statusRowActive =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                  safeSetState(
                                                                      () {
                                                                    _model
                                                                        .searchTextFieldTextController
                                                                        ?.clear();
                                                                  });
                                                                },
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      'ยังไม่ถึงรอบจ่าย',
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
                                                                          ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            () {
                                                                          if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointSmall) {
                                                                            return (MediaQuery.sizeOf(context).width *
                                                                                0.25);
                                                                          } else if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointMedium) {
                                                                            return (MediaQuery.sizeOf(context).width *
                                                                                0.25);
                                                                          } else if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointLarge) {
                                                                            return (MediaQuery.sizeOf(context).width *
                                                                                0.25);
                                                                          } else {
                                                                            return 170.0;
                                                                          }
                                                                        }(),
                                                                        height:
                                                                            30.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0xFFEE852B),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceEvenly,
                                                                          children: [
                                                                            if (_model.choiceChipsValues?.lastOrNull ==
                                                                                'ยังไม่ถึงรอบจ่าย')
                                                                              Expanded(
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Icon(
                                                                                    Icons.check,
                                                                                    color: Color(0xFFEE852B),
                                                                                    size: 16.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            Expanded(
                                                                              flex: 3,
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Text(
                                                                                  '${functions.returnNumberWithComma2Decimal(_model.commissionData?.summary.totalComPaymentNotDueAmt)}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Noto San Thai',
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        letterSpacing: 0.0,
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
                                      ),
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(),
                                          child: Visibility(
                                            visible: _model.statusRowActive,
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  8.0),
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
                                                          if ((_model.choiceChipsValues
                                                                      ?.length ==
                                                                  1) &&
                                                              (_model.choiceChipsValues
                                                                      ?.firstOrNull ==
                                                                  'รอจ่ายค่างวด')) {
                                                            safeSetState(() {
                                                              _model
                                                                  .choiceChipsValueController
                                                                  ?.value = [
                                                                'ทั้งหมด'
                                                              ];
                                                            });
                                                            _model.showingLeadData = _model
                                                                .commissionData!
                                                                .details
                                                                .toList()
                                                                .cast<
                                                                    AgentCommissionLeadDataModelStruct>();
                                                            _model.statusRowActive =
                                                                false;
                                                            safeSetState(() {});
                                                            safeSetState(() {
                                                              _model
                                                                  .searchTextFieldTextController
                                                                  ?.clear();
                                                            });
                                                            return;
                                                          }
                                                          safeSetState(() {
                                                            _model
                                                                .choiceChipsValueController
                                                                ?.value = [
                                                              'รอจ่ายค่างวด'
                                                            ];
                                                          });
                                                          _model.showingLeadData = _model
                                                              .commissionData!
                                                              .details
                                                              .where((e) =>
                                                                  double.parse(e
                                                                      .comWaitingPayAmt) >
                                                                  0.0)
                                                              .toList()
                                                              .cast<
                                                                  AgentCommissionLeadDataModelStruct>();
                                                          safeSetState(() {});
                                                          safeSetState(() {
                                                            _model
                                                                .searchTextFieldTextController
                                                                ?.clear();
                                                          });
                                                        },
                                                        child: Container(
                                                          width: () {
                                                            if (MediaQuery.sizeOf(
                                                                        context)
                                                                    .width <
                                                                kBreakpointSmall) {
                                                              return 150.0;
                                                            } else if (MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width <
                                                                kBreakpointMedium) {
                                                              return 150.0;
                                                            } else if (MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width <
                                                                kBreakpointLarge) {
                                                              return 150.0;
                                                            } else {
                                                              return 170.0;
                                                            }
                                                          }(),
                                                          height: () {
                                                            if (MediaQuery.sizeOf(
                                                                        context)
                                                                    .width <
                                                                kBreakpointSmall) {
                                                              return 70.0;
                                                            } else if (MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width <
                                                                kBreakpointMedium) {
                                                              return 70.0;
                                                            } else if (MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width <
                                                                kBreakpointLarge) {
                                                              return 70.0;
                                                            } else {
                                                              return 85.0;
                                                            }
                                                          }(),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Stack(
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          8.0,
                                                                          8.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            Container(
                                                                              width: 26.0,
                                                                              height: 26.0,
                                                                              child: Stack(
                                                                                children: [
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                    child: Icon(
                                                                                      Icons.person_outline_sharp,
                                                                                      color: Colors.black,
                                                                                      size: 26.0,
                                                                                    ),
                                                                                  ),
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(1.0, 1.0),
                                                                                    child: Container(
                                                                                      width: 12.0,
                                                                                      height: 12.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      child: FaIcon(
                                                                                        FontAwesomeIcons.moneyBillAlt,
                                                                                        color: Colors.black,
                                                                                        size: 12.0,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              'รอจ่ายค่างวด',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Noto San Thai',
                                                                                    color: Colors.black,
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 16.0)),
                                                                        ),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            '${functions.returnNumberWithComma2Decimal(_model.commissionData?.summary.totalComWaitingPayAmt)}',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Noto San Thai',
                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                  fontSize: 18.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
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
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  8.0),
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
                                                          if ((_model.choiceChipsValues
                                                                      ?.length ==
                                                                  1) &&
                                                              (_model.choiceChipsValues
                                                                      ?.firstOrNull ==
                                                                  'รออนุมัติ')) {
                                                            safeSetState(() {
                                                              _model
                                                                  .choiceChipsValueController
                                                                  ?.value = [
                                                                'ทั้งหมด'
                                                              ];
                                                            });
                                                            _model.showingLeadData = _model
                                                                .commissionData!
                                                                .details
                                                                .toList()
                                                                .cast<
                                                                    AgentCommissionLeadDataModelStruct>();
                                                            _model.statusRowActive =
                                                                false;
                                                            safeSetState(() {});
                                                            safeSetState(() {
                                                              _model
                                                                  .searchTextFieldTextController
                                                                  ?.clear();
                                                            });
                                                            return;
                                                          }
                                                          safeSetState(() {
                                                            _model
                                                                .choiceChipsValueController
                                                                ?.value = [
                                                              'รออนุมัติ'
                                                            ];
                                                          });
                                                          _model.showingLeadData = _model
                                                              .commissionData!
                                                              .details
                                                              .where((e) =>
                                                                  double.parse(e
                                                                      .comWaitingApproveAmt) >
                                                                  0.0)
                                                              .toList()
                                                              .cast<
                                                                  AgentCommissionLeadDataModelStruct>();
                                                          safeSetState(() {});
                                                          safeSetState(() {
                                                            _model
                                                                .searchTextFieldTextController
                                                                ?.clear();
                                                          });
                                                        },
                                                        child: Container(
                                                          width: () {
                                                            if (MediaQuery.sizeOf(
                                                                        context)
                                                                    .width <
                                                                kBreakpointSmall) {
                                                              return 150.0;
                                                            } else if (MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width <
                                                                kBreakpointMedium) {
                                                              return 150.0;
                                                            } else if (MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width <
                                                                kBreakpointLarge) {
                                                              return 150.0;
                                                            } else {
                                                              return 170.0;
                                                            }
                                                          }(),
                                                          height: () {
                                                            if (MediaQuery.sizeOf(
                                                                        context)
                                                                    .width <
                                                                kBreakpointSmall) {
                                                              return 70.0;
                                                            } else if (MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width <
                                                                kBreakpointMedium) {
                                                              return 70.0;
                                                            } else if (MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width <
                                                                kBreakpointLarge) {
                                                              return 70.0;
                                                            } else {
                                                              return 85.0;
                                                            }
                                                          }(),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          child: Stack(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            8.0,
                                                                            8.0,
                                                                            8.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children:
                                                                            [
                                                                          FaIcon(
                                                                            FontAwesomeIcons.wallet,
                                                                            color:
                                                                                Colors.black,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                          Text(
                                                                            'รออนุมัติ',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Noto San Thai',
                                                                                  color: Colors.black,
                                                                                  fontSize: 16.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 16.0)),
                                                                      ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Text(
                                                                          '${functions.returnNumberWithComma2Decimal(_model.commissionData?.summary.totalComWaitingApproveAmt)}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Noto San Thai',
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                fontSize: 18.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
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
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    8.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            if ((_model.choiceChipsValues
                                                                        ?.length ==
                                                                    1) &&
                                                                (_model.choiceChipsValues
                                                                        ?.firstOrNull ==
                                                                    'ได้รับในรอบถัดไป')) {
                                                              safeSetState(() {
                                                                _model
                                                                    .choiceChipsValueController
                                                                    ?.value = [
                                                                  'ทั้งหมด'
                                                                ];
                                                              });
                                                              _model.showingLeadData = _model
                                                                  .commissionData!
                                                                  .details
                                                                  .toList()
                                                                  .cast<
                                                                      AgentCommissionLeadDataModelStruct>();
                                                              _model.statusRowActive =
                                                                  false;
                                                              safeSetState(
                                                                  () {});
                                                              safeSetState(() {
                                                                _model
                                                                    .searchTextFieldTextController
                                                                    ?.clear();
                                                              });
                                                              return;
                                                            }
                                                            safeSetState(() {
                                                              _model
                                                                  .choiceChipsValueController
                                                                  ?.value = [
                                                                'ได้รับในรอบถัดไป'
                                                              ];
                                                            });
                                                            _model.showingLeadData = _model
                                                                .commissionData!
                                                                .details
                                                                .where((e) =>
                                                                    double.parse(e
                                                                        .comNextPayAmt) >
                                                                    0.0)
                                                                .toList()
                                                                .cast<
                                                                    AgentCommissionLeadDataModelStruct>();
                                                            safeSetState(() {});
                                                            safeSetState(() {
                                                              _model
                                                                  .searchTextFieldTextController
                                                                  ?.clear();
                                                            });
                                                          },
                                                          child: Container(
                                                            width: () {
                                                              if (MediaQuery.sizeOf(
                                                                          context)
                                                                      .width <
                                                                  kBreakpointSmall) {
                                                                return 150.0;
                                                              } else if (MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width <
                                                                  kBreakpointMedium) {
                                                                return 150.0;
                                                              } else if (MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width <
                                                                  kBreakpointLarge) {
                                                                return 150.0;
                                                              } else {
                                                                return 170.0;
                                                              }
                                                            }(),
                                                            height: () {
                                                              if (MediaQuery.sizeOf(
                                                                          context)
                                                                      .width <
                                                                  kBreakpointSmall) {
                                                                return 70.0;
                                                              } else if (MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width <
                                                                  kBreakpointMedium) {
                                                                return 70.0;
                                                              } else if (MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width <
                                                                  kBreakpointLarge) {
                                                                return 70.0;
                                                              } else {
                                                                return 85.0;
                                                              }
                                                            }(),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      4.0,
                                                                  color: Color(
                                                                      0x33000000),
                                                                  offset:
                                                                      Offset(
                                                                    0.0,
                                                                    2.0,
                                                                  ),
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            child: Stack(
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          8.0,
                                                                          8.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            FaIcon(
                                                                              FontAwesomeIcons.moneyBillAlt,
                                                                              color: Colors.black,
                                                                              size: 24.0,
                                                                            ),
                                                                            Container(
                                                                              decoration: BoxDecoration(),
                                                                              child: Text(
                                                                                'ได้รับในรอบถัดไป',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Noto San Thai',
                                                                                      color: Colors.black,
                                                                                      fontSize: 14.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 4.0)),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Text(
                                                                              '${functions.returnNumberWithComma2Decimal(_model.commissionData?.summary.totalComNextPayAmt)}',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Noto San Thai',
                                                                                    color: Color(0xFF3AA9FA),
                                                                                    fontSize: 18.0,
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
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 16.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (false)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
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
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          width: 50.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Row(
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
                                                                  Text(
                                                                    'จำนวนสัญญาทั้งหมด',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto San Thai',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        16.0)),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    '${functions.returnNumberWithCommaFullNumber(_model.commissionData?.summary.totalContract, '0')}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto San Thai',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
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
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    'สัญญา',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto San Thai',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 95.0,
                                                        child: VerticalDivider(
                                                          thickness: 2.0,
                                                          color:
                                                              Color(0xB2003063),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          width: 50.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Row(
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
                                                                  Text(
                                                                    'ค่าตอบแทนทั้งหมด',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto San Thai',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        16.0)),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    '${functions.returnNumberWithCommaFullNumber('${_model.commissionData?.summary.totalComPayAmt}', '0')}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto San Thai',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
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
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    'บาท',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto San Thai',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
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
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          InkWell(
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
                                                              safeSetState(() {
                                                                _model
                                                                    .choiceChipsValueController
                                                                    ?.value = [
                                                                  'รอจ่ายค่างวด'
                                                                ];
                                                              });
                                                              _model.showingLeadData = _model
                                                                  .commissionData!
                                                                  .details
                                                                  .where((e) =>
                                                                      double.parse(e
                                                                          .comWaitingPayAmt) >
                                                                      0)
                                                                  .toList()
                                                                  .cast<
                                                                      AgentCommissionLeadDataModelStruct>();
                                                              safeSetState(
                                                                  () {});
                                                              safeSetState(() {
                                                                _model
                                                                    .searchTextFieldTextController
                                                                    ?.clear();
                                                              });
                                                            },
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 70.0,
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
                                                                      0.0,
                                                                      2.0,
                                                                    ),
                                                                  )
                                                                ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: double
                                                                    .infinity,
                                                                child: Stack(
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          8.0,
                                                                          8.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              Container(
                                                                                width: 26.0,
                                                                                height: 26.0,
                                                                                child: Stack(
                                                                                  children: [
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                      child: Icon(
                                                                                        Icons.person_outline_sharp,
                                                                                        color: Colors.black,
                                                                                        size: 26.0,
                                                                                      ),
                                                                                    ),
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(1.0, 1.0),
                                                                                      child: Container(
                                                                                        width: 12.0,
                                                                                        height: 12.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: FaIcon(
                                                                                          FontAwesomeIcons.moneyBillAlt,
                                                                                          color: Colors.black,
                                                                                          size: 12.0,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                'รอจ่ายค่างวด',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Noto San Thai',
                                                                                      color: Colors.black,
                                                                                      fontSize: 16.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 16.0)),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Text(
                                                                                  '${functions.returnNumberWithCommaFullNumber(_model.commissionData?.summary.totalComWaitingPayAmt, '0')}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Noto San Thai',
                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                        fontSize: 18.0,
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
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              1.0,
                                                                              1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            4.0,
                                                                            4.0),
                                                                        child:
                                                                            Text(
                                                                          'บาท',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Noto San Thai',
                                                                                color: Color(0x99646464),
                                                                                fontSize: 16.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          InkWell(
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
                                                              safeSetState(() {
                                                                _model
                                                                    .choiceChipsValueController
                                                                    ?.value = [
                                                                  'ได้รับในรอบถัดไป'
                                                                ];
                                                              });
                                                              _model.showingLeadData = _model
                                                                  .commissionData!
                                                                  .details
                                                                  .where((e) =>
                                                                      double.parse(e
                                                                          .comNextPayAmt) >
                                                                      0)
                                                                  .toList()
                                                                  .cast<
                                                                      AgentCommissionLeadDataModelStruct>();
                                                              safeSetState(
                                                                  () {});
                                                              safeSetState(() {
                                                                _model
                                                                    .searchTextFieldTextController
                                                                    ?.clear();
                                                              });
                                                            },
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 70.0,
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
                                                                      0.0,
                                                                      2.0,
                                                                    ),
                                                                  )
                                                                ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: double
                                                                    .infinity,
                                                                child: Stack(
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          8.0,
                                                                          8.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                FaIcon(
                                                                                  FontAwesomeIcons.moneyBillAlt,
                                                                                  color: Colors.black,
                                                                                  size: 24.0,
                                                                                ),
                                                                                Expanded(
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Text(
                                                                                      'ได้รับในรอบถัดไป',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Noto San Thai',
                                                                                            color: Colors.black,
                                                                                            fontSize: 14.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 4.0)),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Text(
                                                                                  '${functions.returnNumberWithCommaFullNumber(_model.commissionData?.summary.totalComNextPayAmt, '0')}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Noto San Thai',
                                                                                        color: Color(0xFF3AA9FA),
                                                                                        fontSize: 18.0,
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
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              1.0,
                                                                              1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            4.0,
                                                                            4.0),
                                                                        child:
                                                                            Text(
                                                                          'บาท',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Noto San Thai',
                                                                                color: Color(0x99646464),
                                                                                fontSize: 16.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 8.0)),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          InkWell(
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
                                                              safeSetState(() {
                                                                _model
                                                                    .choiceChipsValueController
                                                                    ?.value = [
                                                                  'รออนุมัติ'
                                                                ];
                                                              });
                                                              _model.showingLeadData = _model
                                                                  .commissionData!
                                                                  .details
                                                                  .where((e) =>
                                                                      double.parse(e
                                                                          .comWaitingApproveAmt) >
                                                                      0)
                                                                  .toList()
                                                                  .cast<
                                                                      AgentCommissionLeadDataModelStruct>();
                                                              safeSetState(
                                                                  () {});
                                                              safeSetState(() {
                                                                _model
                                                                    .searchTextFieldTextController
                                                                    ?.clear();
                                                              });
                                                            },
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 70.0,
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
                                                                      0.0,
                                                                      2.0,
                                                                    ),
                                                                  )
                                                                ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: double
                                                                    .infinity,
                                                                child: Stack(
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          8.0,
                                                                          8.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                FaIcon(
                                                                                  FontAwesomeIcons.wallet,
                                                                                  color: Colors.black,
                                                                                  size: 24.0,
                                                                                ),
                                                                                Text(
                                                                                  'รออนุมัติ',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Noto San Thai',
                                                                                        color: Colors.black,
                                                                                        fontSize: 16.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 16.0)),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Text(
                                                                                  '${functions.returnNumberWithCommaFullNumber(_model.commissionData?.summary.totalComWaitingApproveAmt, '0')}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Noto San Thai',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: 18.0,
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
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              1.0,
                                                                              1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            4.0,
                                                                            4.0),
                                                                        child:
                                                                            Text(
                                                                          'บาท',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Noto San Thai',
                                                                                color: Color(0x99646464),
                                                                                fontSize: 16.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          InkWell(
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
                                                              safeSetState(() {
                                                                _model
                                                                    .choiceChipsValueController
                                                                    ?.value = [
                                                                  'จ่ายแล้ว'
                                                                ];
                                                              });
                                                              _model.showingLeadData = _model
                                                                  .commissionData!
                                                                  .details
                                                                  .where((e) =>
                                                                      double.parse(e
                                                                          .comReceivedAmt) >
                                                                      0)
                                                                  .toList()
                                                                  .cast<
                                                                      AgentCommissionLeadDataModelStruct>();
                                                              safeSetState(
                                                                  () {});
                                                              safeSetState(() {
                                                                _model
                                                                    .searchTextFieldTextController
                                                                    ?.clear();
                                                              });
                                                            },
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 70.0,
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
                                                                      0.0,
                                                                      2.0,
                                                                    ),
                                                                  )
                                                                ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: double
                                                                    .infinity,
                                                                child: Stack(
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          8.0,
                                                                          8.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                FaIcon(
                                                                                  FontAwesomeIcons.handHoldingUsd,
                                                                                  color: Colors.black,
                                                                                  size: 24.0,
                                                                                ),
                                                                                Expanded(
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Text(
                                                                                      'จ่ายแล้ว',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Noto San Thai',
                                                                                            color: Colors.black,
                                                                                            fontSize: 16.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 16.0)),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Text(
                                                                                  '${functions.returnNumberWithCommaFullNumber(_model.commissionData?.summary.totalComReceivedAmt, '0')}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Noto San Thai',
                                                                                        color: Color(0xFF4AC225),
                                                                                        fontSize: 18.0,
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
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              1.0,
                                                                              1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            4.0,
                                                                            4.0),
                                                                        child:
                                                                            Text(
                                                                          'บาท',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Noto San Thai',
                                                                                color: Color(0x99646464),
                                                                                fontSize: 16.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 8.0)),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 16.0)),
                                                ),
                                              ].divide(SizedBox(height: 8.0)),
                                            ),
                                          ),
                                        ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Container(
                                          width: () {
                                            if (MediaQuery.sizeOf(context)
                                                    .width <
                                                kBreakpointSmall) {
                                              return MediaQuery.sizeOf(context)
                                                  .width;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointMedium) {
                                              return MediaQuery.sizeOf(context)
                                                  .width;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointLarge) {
                                              return MediaQuery.sizeOf(context)
                                                  .width;
                                            } else {
                                              return 600.0;
                                            }
                                          }(),
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
                                                'ข้อมูล ณ วันที่ ${functions.formatToThaiDate('${_model.commissionData?.dataDate}')}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto San Thai',
                                                          color:
                                                              Color(0xBF646464),
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
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: () {
                                  if (MediaQuery.sizeOf(context).width <
                                      kBreakpointSmall) {
                                    return MediaQuery.sizeOf(context).width;
                                  } else if (MediaQuery.sizeOf(context).width <
                                      kBreakpointMedium) {
                                    return MediaQuery.sizeOf(context).width;
                                  } else if (MediaQuery.sizeOf(context).width <
                                      kBreakpointLarge) {
                                    return MediaQuery.sizeOf(context).width;
                                  } else {
                                    return 600.0;
                                  }
                                }(),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
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
                                              ].divide(SizedBox(width: 12.0)),
                                            ),
                                            Builder(
                                              builder: (context) => InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  var _shouldSetState = false;
                                                  await showDialog(
                                                    barrierColor:
                                                        Color(0xB3000000),
                                                    barrierDismissible: false,
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
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child:
                                                              MyCommissionAdvanceSearchComponentWidget(
                                                            showingLeadData: _model
                                                                .commissionData!
                                                                .details,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() => _model
                                                              .advanceSearchOutput =
                                                          value));

                                                  _shouldSetState = true;
                                                  if (!(_model
                                                          .advanceSearchOutput !=
                                                      null)) {
                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                    return;
                                                  }
                                                  _model.showingLeadData = _model
                                                      .commissionData!.details
                                                      .where((e) =>
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
                                                                    r'''$.contno_type_name''',
                                                                  ).toString()}' !=
                                                                  ''
                                                              ? ('${e.contnoTypeName}' ==
                                                                  '${getJsonField(
                                                                    _model
                                                                        .advanceSearchOutput,
                                                                    r'''$.contno_type_name''',
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
                                                      .cast<
                                                          AgentCommissionLeadDataModelStruct>();
                                                  safeSetState(() {});
                                                  safeSetState(() {
                                                    _model
                                                        .choiceChipsValueController
                                                        ?.reset();
                                                  });
                                                  safeSetState(() {
                                                    _model
                                                        .searchTextFieldTextController
                                                        ?.clear();
                                                  });
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                },
                                                child: Text(
                                                  'ค้นหาแบบละเอียด',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto San Thai',
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
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
                                              height: 40.0,
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Stack(
                                                      children: [
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          child: TextFormField(
                                                            controller: _model
                                                                .searchTextFieldTextController,
                                                            focusNode: _model
                                                                .searchTextFieldFocusNode,
                                                            autofocus: false,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              isDense: true,
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
                                                                  'คำค้น ชื่อ นามสกุล',
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto San Thai',
                                                                        color: Color(
                                                                            0x98646464),
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x80646464),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              filled: true,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                              prefixIcon: Icon(
                                                                FontAwesomeIcons
                                                                    .search,
                                                                color: Color(
                                                                    0x80646464),
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto San Thai',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                            cursorColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            enableInteractiveSelection:
                                                                true,
                                                            validator: _model
                                                                .searchTextFieldTextControllerValidator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        8.0,
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
                                                                safeSetState(
                                                                    () {
                                                                  _model
                                                                      .searchTextFieldTextController
                                                                      ?.clear();
                                                                });
                                                                safeSetState(
                                                                    () {
                                                                  _model
                                                                      .choiceChipsValueController
                                                                      ?.value = [
                                                                    'ทั้งหมด'
                                                                  ];
                                                                });
                                                                _model.showingLeadData = _model
                                                                    .commissionData!
                                                                    .details
                                                                    .toList()
                                                                    .cast<
                                                                        AgentCommissionLeadDataModelStruct>();
                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              child: Icon(
                                                                Icons
                                                                    .close_outlined,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Builder(
                                                    builder: (context) =>
                                                        FFButtonWidget(
                                                      onPressed: () async {
                                                        if (!(('${_model.searchTextFieldTextController.text}' !=
                                                                '') &&
                                                            ('${_model.searchTextFieldTextController.text}'
                                                                    .length >
                                                                2))) {
                                                          await showDialog(
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
                                                            .commissionData!
                                                            .details
                                                            .where((e) =>
                                                                functions.containString(
                                                                    '${_model.searchTextFieldTextController.text}',
                                                                    e
                                                                        .firstName)! ||
                                                                functions.containString(
                                                                    '${_model.searchTextFieldTextController.text}',
                                                                    e.lastName)!)
                                                            .toList()
                                                            .cast<AgentCommissionLeadDataModelStruct>();
                                                        safeSetState(() {});
                                                        safeSetState(() {
                                                          _model
                                                              .choiceChipsValueController
                                                              ?.reset();
                                                        });
                                                      },
                                                      text: 'ค้นหา',
                                                      options: FFButtonOptions(
                                                        width: 90.0,
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto San Thai',
                                                                  color: Colors
                                                                      .white,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        elevation: 0.0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
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
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child:
                                                          FlutterFlowChoiceChips(
                                                        options: [
                                                          ChipData('ทั้งหมด'),
                                                          ChipData(
                                                              'รอจ่ายค่างวด'),
                                                          ChipData('จ่ายแล้ว'),
                                                          ChipData('รออนุมัติ'),
                                                          ChipData(
                                                              'ได้รับในรอบถัดไป'),
                                                          ChipData(
                                                              'ยังไม่ถึงรอบจ่าย')
                                                        ],
                                                        onChanged: (val) async {
                                                          safeSetState(() =>
                                                              _model.choiceChipsValues =
                                                                  val);
                                                          if (_model
                                                                  .choiceChipsValues
                                                                  ?.lastOrNull ==
                                                              'ทั้งหมด') {
                                                            safeSetState(() {
                                                              _model
                                                                  .choiceChipsValueController
                                                                  ?.value = [
                                                                'ทั้งหมด'
                                                              ];
                                                            });
                                                            _model.showingLeadData = _model
                                                                .commissionData!
                                                                .details
                                                                .toList()
                                                                .cast<
                                                                    AgentCommissionLeadDataModelStruct>();
                                                            _model.statusRowActive =
                                                                false;
                                                            safeSetState(() {});
                                                            safeSetState(() {
                                                              _model
                                                                  .searchTextFieldTextController
                                                                  ?.clear();
                                                            });
                                                            return;
                                                          }
                                                          if (_model
                                                                  .choiceChipsValues!
                                                                  .length >
                                                              0) {
                                                            safeSetState(() {
                                                              _model.choiceChipsValueController
                                                                      ?.value =
                                                                  _model
                                                                      .choiceChipsValues!
                                                                      .where((e) =>
                                                                          e !=
                                                                          'ทั้งหมด')
                                                                      .toList();
                                                            });
                                                            _model.showingLeadData = _model
                                                                .commissionData!
                                                                .details
                                                                .where((e) =>
                                                                    (_model.choiceChipsValues!.contains('จ่ายแล้ว') && (double.parse(e.comReceivedAmt) > 0.0)) ||
                                                                    (_model.choiceChipsValues!.contains('ยังไม่ถึงรอบจ่าย') &&
                                                                        (double.parse(e.comPaymentNotDueAmt) >
                                                                            0.0)) ||
                                                                    (_model.choiceChipsValues!.contains('รอจ่ายค่างวด') &&
                                                                        (double.parse(e.comWaitingPayAmt) >
                                                                            0.0)) ||
                                                                    (_model.choiceChipsValues!.contains(
                                                                            'รออนุมัติ') &&
                                                                        (double.parse(e.comWaitingApproveAmt) >
                                                                            0.0)) ||
                                                                    (_model.choiceChipsValues!.contains(
                                                                            'ได้รับในรอบถัดไป') &&
                                                                        (double.parse(e.comNextPayAmt) >
                                                                            0.0)))
                                                                .toList()
                                                                .cast<AgentCommissionLeadDataModelStruct>();
                                                            safeSetState(() {});
                                                          } else {
                                                            _model.showingLeadData = _model
                                                                .commissionData!
                                                                .details
                                                                .toList()
                                                                .cast<
                                                                    AgentCommissionLeadDataModelStruct>();
                                                            safeSetState(() {});
                                                            safeSetState(() {
                                                              _model
                                                                  .choiceChipsValueController
                                                                  ?.value = [
                                                                'ทั้งหมด'
                                                              ];
                                                            });
                                                          }

                                                          _model.statusRowActive =
                                                              false;
                                                          safeSetState(() {});
                                                          safeSetState(() {
                                                            _model
                                                                .searchTextFieldTextController
                                                                ?.clear();
                                                          });
                                                        },
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
                                                                    letterSpacing:
                                                                        0.0,
                                                                    lineHeight:
                                                                        1.8,
                                                                  ),
                                                          iconColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .info,
                                                          iconSize: 16.0,
                                                          elevation: 0.0,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
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
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          iconColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryText,
                                                          iconSize: 16.0,
                                                          elevation: 0.0,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        chipSpacing: 8.0,
                                                        rowSpacing: 8.0,
                                                        multiselect: true,
                                                        initialized: _model
                                                                .choiceChipsValues !=
                                                            null,
                                                        alignment:
                                                            WrapAlignment.start,
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
                                    Padding(
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
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: leadListItems.length,
                                            itemBuilder:
                                                (context, leadListItemsIndex) {
                                              final leadListItemsItem =
                                                  leadListItems[
                                                      leadListItemsIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 0.0, 4.0, 12.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 2.0,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        offset: Offset(
                                                          2.0,
                                                          4.0,
                                                        ),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  child: Container(
                                                    width: double.infinity,
                                                    color: Color(0x00000000),
                                                    child: ExpandableNotifier(
                                                      initialExpanded: false,
                                                      child: ExpandablePanel(
                                                        header: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 50.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        Container(
                                                                          width:
                                                                              30.0,
                                                                          height:
                                                                              30.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              width: 2.0,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Icon(
                                                                              Icons.person,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 26.0,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Container(
                                                                                decoration: BoxDecoration(),
                                                                                child: Text(
                                                                                  'คุณ${leadListItemsItem.firstName}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Noto San Thai',
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                '${leadListItemsItem.requestNo}',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Noto San Thai',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 10.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 4.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Text(
                                                                      '${leadListItemsItem.comStatus}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto San Thai',
                                                                            color:
                                                                                () {
                                                                              if ('${leadListItemsItem.comStatus}' == 'ยังไม่ถึงรอบจ่าย') {
                                                                                return Color(0xFFEE852B);
                                                                              } else if ('${leadListItemsItem.comStatus}' == 'รออนุมัติ') {
                                                                                return FlutterFlowTheme.of(context).secondaryText;
                                                                              } else if ('${leadListItemsItem.comStatus}' == 'ได้รับในรอบถัดไป') {
                                                                                return Color(0xFF3AA9FA);
                                                                              } else if ('${leadListItemsItem.comStatus}' == 'จ่ายแล้ว') {
                                                                                return Color(0xFF4AC225);
                                                                              } else if ('${leadListItemsItem.comStatus}' == 'รอจ่ายค่างวด') {
                                                                                return FlutterFlowTheme.of(context).error;
                                                                              } else {
                                                                                return Colors.black;
                                                                              }
                                                                            }(),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                    ),
                                                                    if (leadListItemsItem
                                                                            .comStatus ==
                                                                        'จ่ายบางส่วน')
                                                                      Text(
                                                                        '(ค้างชำระ)',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Noto San Thai',
                                                                              color: Color(0xFFFF0000),
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        collapsed: Container(),
                                                        expanded: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      20.0),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Divider(
                                                                  thickness:
                                                                      2.0,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              '${leadListItemsItem.product}' == 'loan' ? 'ข้อมูลสัญญา' : 'ข้อมูลประกัน',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Noto San Thai',
                                                                                    color: Colors.black,
                                                                                    fontSize: 14.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              12.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(
                                                                                'ประเภทสินทรัพย์',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Noto San Thai',
                                                                                      color: Color(0xFF646464),
                                                                                      fontSize: 14.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                '${leadListItemsItem.contnoTypeName}',
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
                                                                    if ('${leadListItemsItem.product}' !=
                                                                        'loan')
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                0.0,
                                                                                12.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Text(
                                                                                  '${leadListItemsItem.product}' == 'loan' ? 'ยอดจัดสินเชื่อ' : 'ยี่ห้อ / รุ่น',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Noto San Thai',
                                                                                        color: Color(0xFF646464),
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.normal,
                                                                                      ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(36.0, 0.0, 0.0, 0.0),
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Align(
                                                                                        alignment: AlignmentDirectional(1.0, 0.0),
                                                                                        child: Text(
                                                                                          '${'${leadListItemsItem.typecod}'} / ${'${leadListItemsItem.modelcod}'}',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Noto San Thai',
                                                                                                color: Colors.black,
                                                                                                fontSize: 14.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.bold,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    if ('${leadListItemsItem.product}' !=
                                                                        'loan')
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                0.0,
                                                                                12.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Text(
                                                                                  'เลขทะเบียน',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Noto San Thai',
                                                                                        color: Color(0xFF646464),
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.normal,
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  '${leadListItemsItem.carRegistration}',
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
                                                                    if ('${leadListItemsItem.product}' !=
                                                                        'loan')
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                0.0,
                                                                                12.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Text(
                                                                                  'จังหวัด',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Noto San Thai',
                                                                                        color: Color(0xFF646464),
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.normal,
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  '${leadListItemsItem.carProvince}',
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
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              12.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(
                                                                                'ค่าตอบแทนทั้งหมด',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Noto San Thai',
                                                                                      color: Color(0xFF646464),
                                                                                      fontSize: 14.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                '${functions.returnNumberWithComma2Decimal((_model.commissionData?.details.elementAtOrNull(leadListItemsIndex))?.comPayAmt)} บาท',
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
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          18.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                8.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(
                                                                                      'รอจ่ายค่างวด',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Noto San Thai',
                                                                                            color: Color(0xFF646464),
                                                                                            fontSize: 14.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.normal,
                                                                                          ),
                                                                                    ),
                                                                                    Text(
                                                                                      '${functions.returnNumberWithComma2Decimal((_model.commissionData?.details.elementAtOrNull(leadListItemsIndex))?.comWaitingPayAmt)} บาท',
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
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                8.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(
                                                                                      'รออนุมัติ',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Noto San Thai',
                                                                                            color: Color(0xFF646464),
                                                                                            fontSize: 14.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.normal,
                                                                                          ),
                                                                                    ),
                                                                                    Text(
                                                                                      '${functions.returnNumberWithComma2Decimal((_model.commissionData?.details.elementAtOrNull(leadListItemsIndex))?.comWaitingApproveAmt)} บาท',
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
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                8.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(
                                                                                      'ได้รับในรอบถัดไป',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Noto San Thai',
                                                                                            color: Color(0xFF646464),
                                                                                            fontSize: 14.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.normal,
                                                                                          ),
                                                                                    ),
                                                                                    Text(
                                                                                      '${functions.returnNumberWithComma2Decimal((_model.commissionData?.details.elementAtOrNull(leadListItemsIndex))?.comNextPayAmt)} บาท',
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
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                8.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(
                                                                                      'จ่ายแล้ว',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Noto San Thai',
                                                                                            color: Color(0xFF646464),
                                                                                            fontSize: 14.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.normal,
                                                                                          ),
                                                                                    ),
                                                                                    Text(
                                                                                      '${functions.returnNumberWithComma2Decimal((_model.commissionData?.details.elementAtOrNull(leadListItemsIndex))?.comReceivedAmt)} บาท',
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
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                8.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(
                                                                                      'ยังไม่ถึงรอบจ่าย',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Noto San Thai',
                                                                                            color: Color(0xFF646464),
                                                                                            fontSize: 14.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.normal,
                                                                                          ),
                                                                                    ),
                                                                                    Text(
                                                                                      '${functions.returnNumberWithComma2Decimal((_model.commissionData?.details.elementAtOrNull(leadListItemsIndex))?.comPaymentNotDueAmt)} บาท',
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
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    if (((double.parse((leadListItemsItem.expDay != '' ? leadListItemsItem.expDay : '0')) >
                                                                                0) ==
                                                                            false) &&
                                                                        false)
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                8.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(
                                                                                      'วันเริ่มค้างชำระ',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Noto San Thai',
                                                                                            color: Color(0xFF646464),
                                                                                            fontSize: 14.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.normal,
                                                                                          ),
                                                                                    ),
                                                                                    Text(
                                                                                      '${leadListItemsItem.expDay}',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Noto San Thai',
                                                                                            color: Color(0xFFFF0000),
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
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                8.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(
                                                                                      'ค่างวดค้างจ่าย',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Noto San Thai',
                                                                                            color: Color(0xFF646464),
                                                                                            fontSize: 14.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.normal,
                                                                                          ),
                                                                                    ),
                                                                                    Text(
                                                                                      '${functions.returnNumberWithComma2Decimal(leadListItemsItem.expAmt)} บาท',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Noto San Thai',
                                                                                            color: Color(0xFFFF0000),
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
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            StyledDivider(
                                                                              thickness: 1.2,
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                              lineStyle: DividerLineStyle.dashdotted,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              12.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(
                                                                                'ค่าตอบแทน',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Noto San Thai',
                                                                                      color: Colors.black,
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
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              12.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                'วิธีการรับเงิน',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Noto San Thai',
                                                                                      color: Color(0xFF646464),
                                                                                      fontSize: 14.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                    ),
                                                                              ),
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                                                children: [
                                                                                  Text(
                                                                                    '${functions.createUniqueValueListLabel(((String input) {
                                                                                          return [input];
                                                                                        }(leadListItemsItem.paymentMethod)).toList())?.firstOrNull}',
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
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              12.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(
                                                                                'ช่องทางการรับเงิน',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Noto San Thai',
                                                                                      color: Color(0xFF646464),
                                                                                      fontSize: 14.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                '${functions.createUniqueValueListLabel(((String input) {
                                                                                      return [input];
                                                                                    }(leadListItemsItem.paymentChannel)).toList())?.firstOrNull}',
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
                                                                    if (false)
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                8.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(
                                                                                      'ค่าตอบแทนทั้งหมด',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Noto San Thai',
                                                                                            color: Color(0xFF646464),
                                                                                            fontSize: 14.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.normal,
                                                                                          ),
                                                                                    ),
                                                                                    Text(
                                                                                      '${functions.returnNumberWithComma2Decimal(leadListItemsItem.comPayAmt)} บาท',
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
                                                                          if ('${leadListItemsItem.paymentMethod}' ==
                                                                              'installment')
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(36.0, 8.0, 12.0, 0.0),
                                                                              child: Container(
                                                                                width: double.infinity,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Align(
                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                child: Icon(
                                                                                                  Icons.circle_sharp,
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  size: 9.0,
                                                                                                ),
                                                                                              ),
                                                                                              Expanded(
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                                  child: Container(
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: Text(
                                                                                                      'งวดที่รับเงิน',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Noto San Thai',
                                                                                                            color: Color(0xFF646464),
                                                                                                            fontSize: 14.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Text(
                                                                                          '${leadListItemsItem.comPaidPeriod}/${leadListItemsItem.comAllPeriod}',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Noto San Thai',
                                                                                                color: Colors.black,
                                                                                                fontSize: 14.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.normal,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Align(
                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                child: Icon(
                                                                                                  Icons.circle_sharp,
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  size: 9.0,
                                                                                                ),
                                                                                              ),
                                                                                              Expanded(
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                                  child: Container(
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: Text(
                                                                                                      'รออนุมัติ',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Noto San Thai',
                                                                                                            color: Color(0xFF646464),
                                                                                                            fontSize: 14.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Text(
                                                                                          '${functions.returnNumberWithComma2Decimal(leadListItemsItem.comWaitingApproveAmt)} บาท',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Noto San Thai',
                                                                                                color: Colors.black,
                                                                                                fontSize: 14.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.normal,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Align(
                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                child: Icon(
                                                                                                  Icons.circle_sharp,
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  size: 9.0,
                                                                                                ),
                                                                                              ),
                                                                                              Expanded(
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                                  child: Container(
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: Text(
                                                                                                      'รอจ่ายค่างวด',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Noto San Thai',
                                                                                                            color: Color(0xFF646464),
                                                                                                            fontSize: 14.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Text(
                                                                                          '${functions.returnNumberWithComma2Decimal(leadListItemsItem.comWaitingPayAmt)} บาท',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Noto San Thai',
                                                                                                color: Colors.black,
                                                                                                fontSize: 14.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.normal,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Align(
                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                child: Icon(
                                                                                                  Icons.circle_sharp,
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  size: 9.0,
                                                                                                ),
                                                                                              ),
                                                                                              Expanded(
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                                  child: Container(
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: Text(
                                                                                                      'จ่ายแล้ว',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Noto San Thai',
                                                                                                            color: Color(0xFF646464),
                                                                                                            fontSize: 14.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Text(
                                                                                          '${functions.returnNumberWithComma2Decimal(leadListItemsItem.comReceivedAmt)} บาท',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Noto San Thai',
                                                                                                color: Colors.black,
                                                                                                fontSize: 14.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.normal,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Align(
                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                child: Icon(
                                                                                                  Icons.circle_sharp,
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  size: 9.0,
                                                                                                ),
                                                                                              ),
                                                                                              Expanded(
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                                  child: Container(
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: Text(
                                                                                                      'ได้ในรอบถัดไป',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Noto San Thai',
                                                                                                            color: Color(0xFF646464),
                                                                                                            fontSize: 14.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Text(
                                                                                          '${functions.returnNumberWithComma2Decimal(leadListItemsItem.comNextPayAmt)} บาท',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Noto San Thai',
                                                                                                color: Colors.black,
                                                                                                fontSize: 14.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.normal,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 8.0)),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          if ('${leadListItemsItem.paymentMethod}' ==
                                                                              'one_time')
                                                                            Container(
                                                                              decoration: BoxDecoration(),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                    child: Container(
                                                                                      width: double.infinity,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Text(
                                                                                              'หัก ${leadListItemsItem.deductionPercent} %',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Noto San Thai',
                                                                                                    color: Color(0xFF646464),
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                  ),
                                                                                            ),
                                                                                            Text(
                                                                                              '${functions.returnNumberWithComma2Decimal(leadListItemsItem.comDeductAmt)} บาท',
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
                                                                                  if (true)
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(36.0, 8.0, 12.0, 0.0),
                                                                                      child: Container(
                                                                                        width: double.infinity,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        ),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Builder(
                                                                                              builder: (context) {
                                                                                                if (!(double.parse(leadListItemsItem.comWaitingApproveAmt) > 0)) {
                                                                                                  return Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                    children: [
                                                                                                      Expanded(
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Align(
                                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                              child: Icon(
                                                                                                                Icons.circle_sharp,
                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                size: 9.0,
                                                                                                              ),
                                                                                                            ),
                                                                                                            Expanded(
                                                                                                              child: Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                                                child: Container(
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: Text(
                                                                                                                    'จ่ายแล้ว',
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'Noto San Thai',
                                                                                                                          color: Color(0xFF646464),
                                                                                                                          fontSize: 14.0,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          fontWeight: FontWeight.normal,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      Text(
                                                                                                        '${functions.returnNumberWithComma2Decimal(leadListItemsItem.comReceivedAmt)} บาท',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Noto San Thai',
                                                                                                              color: Colors.black,
                                                                                                              fontSize: 14.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.bold,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  );
                                                                                                } else {
                                                                                                  return Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                    children: [
                                                                                                      Expanded(
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Align(
                                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                              child: Icon(
                                                                                                                Icons.circle_sharp,
                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                size: 9.0,
                                                                                                              ),
                                                                                                            ),
                                                                                                            Expanded(
                                                                                                              child: Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                                                child: Container(
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: Text(
                                                                                                                    'รออนุมัติ',
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'Noto San Thai',
                                                                                                                          color: Color(0xFF646464),
                                                                                                                          fontSize: 14.0,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          fontWeight: FontWeight.normal,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      Text(
                                                                                                        '${functions.returnNumberWithComma2Decimal(functions.returnNumberWithComma2Decimal(leadListItemsItem.comWaitingApproveAmt))} บาท',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Noto San Thai',
                                                                                                              color: Colors.black,
                                                                                                              fontSize: 14.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.bold,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  );
                                                                                                }
                                                                                              },
                                                                                            ),
                                                                                          ].divide(SizedBox(height: 8.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                  ]
                                                                      .divide(SizedBox(
                                                                          height:
                                                                              0.0))
                                                                      .addToStart(SizedBox(
                                                                          height:
                                                                              8.0)),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          16.0,
                                                                          12.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            context.pushNamed(
                                                                              CommissionHistoryPageWidget.routeName,
                                                                              queryParameters: {
                                                                                'contNo': serializeParam(
                                                                                  leadListItemsItem.contNo,
                                                                                  ParamType.String,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          },
                                                                          text:
                                                                              'ค่าคอมมิชชันทั้งหมด',
                                                                          icon:
                                                                              Icon(
                                                                            Icons.remove_red_eye,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                          options:
                                                                              FFButtonOptions(
                                                                            height:
                                                                                50.0,
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
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: 'Noto San Thai',
                                                                                  color: Colors.white,
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            elevation:
                                                                                0.0,
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            12.0)),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        theme:
                                                            ExpandableThemeData(
                                                          tapHeaderToExpand:
                                                              true,
                                                          tapBodyToExpand:
                                                              false,
                                                          tapBodyToCollapse:
                                                              false,
                                                          headerAlignment:
                                                              ExpandablePanelHeaderAlignment
                                                                  .center,
                                                          hasIcon: true,
                                                          iconColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
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
                                  ].addToStart(SizedBox(height: 16.0)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: () {
                          if (MediaQuery.sizeOf(context).width <
                              kBreakpointSmall) {
                            return MediaQuery.sizeOf(context).width;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointMedium) {
                            return MediaQuery.sizeOf(context).width;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointLarge) {
                            return MediaQuery.sizeOf(context).width;
                          } else {
                            return 600.0;
                          }
                        }(),
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        context.safePop();
                                      },
                                      text: 'กลับหน้าหลัก',
                                      options: FFButtonOptions(
                                        width: () {
                                          if (MediaQuery.sizeOf(context).width <
                                              kBreakpointSmall) {
                                            return MediaQuery.sizeOf(context)
                                                .width;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointMedium) {
                                            return MediaQuery.sizeOf(context)
                                                .width;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointLarge) {
                                            return MediaQuery.sizeOf(context)
                                                .width;
                                          } else {
                                            return 300.0;
                                          }
                                        }(),
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
                                        elevation: 0.0,
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
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
