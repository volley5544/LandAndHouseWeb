import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/error_message_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/m_g_m_agent/web_app_bar_component/web_app_bar_component_widget.dart';
import '/pages/loading/loading_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'agent_main_menu_page_model.dart';
export 'agent_main_menu_page_model.dart';

class AgentMainMenuPageWidget extends StatefulWidget {
  const AgentMainMenuPageWidget({
    super.key,
    this.agentCode,
    String? platform,
  }) : this.platform = platform ?? 'web';

  final String? agentCode;
  final String platform;

  static String routeName = 'AgentMainMenuPage';
  static String routePath = '/agentMainMenuPage';

  @override
  State<AgentMainMenuPageWidget> createState() =>
      _AgentMainMenuPageWidgetState();
}

class _AgentMainMenuPageWidgetState extends State<AgentMainMenuPageWidget> {
  late AgentMainMenuPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AgentMainMenuPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setDarkModeSetting(context, ThemeMode.light);
      FFAppState().platform = '${widget.platform}';
      safeSetState(() {});
      _model.checkAuthOutput = await action_blocks.checkAuth(context);
      if (!_model.checkAuthOutput!) {
        return;
      }
      if (loggedIn) {
        FFAppState().agentCode = currentUserUid;
        safeSetState(() {});
      }
      if (!((FFAppState().agentCode != 'null') &&
          (FFAppState().agentCode != ''))) {
        FFAppState().agentCode = '${widget.agentCode}';
        safeSetState(() {});
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

      _model.queryUrl =
          await ApplicationRecord.getDocumentOnce(FFAppState().configDocument!);
      FFAppState().apiUrlDocData = _model.queryUrl!.apiUrl;
      safeSetState(() {});
      _model.agentAPIOutput = await AgentAPIGroup.agentProfileAPICall.call(
        agentCode: FFAppState().agentCode,
        url: FFDevEnvironmentValues().isProduction
            ? FFAppState().apiUrlDocData.agentWebApiUrl
            : FFAppState().apiUrlDocData.agentWebApiUrlUat,
        tokenHeader: FFDevEnvironmentValues().isProduction
            ? FFAppState().apiUrlDocData.agentWebApiToken
            : FFAppState().apiUrlDocData.agentWebApiTokenUat,
      );

      if ((_model.agentAPIOutput?.statusCode ?? 200) != 200) {
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
                      'พบข้อผิดพลาด connnection (${(_model.agentAPIOutput?.statusCode ?? 200).toString()})',
                ),
              ),
            );
          },
        );

        Navigator.pop(context);
        return;
      }
      if ('${getJsonField(
            (_model.agentAPIOutput?.jsonBody ?? ''),
            r'''$.code''',
          ).toString()}' !=
          '200') {
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
                    (_model.agentAPIOutput?.jsonBody ?? ''),
                    r'''$.message''',
                  ).toString()}',
                ),
              ),
            );
          },
        );

        Navigator.pop(context);
        return;
      }
      FFAppState().agentProfileDataType =
          AgentAPIGroup.agentProfileAPICall.data(
        (_model.agentAPIOutput?.jsonBody ?? ''),
      )!;
      safeSetState(() {});
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
          title: 'โครงการเพื่อนแนะนำเพื่อน',
          color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: PopScope(
              canPop: false,
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                          style:
                              FlutterFlowTheme.of(context).titleSmall.override(
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
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
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
                appBar: () {
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
                    ? AppBar(
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
                          title: Text(
                            'ตัวแทน${FFDevEnvironmentValues().isProduction ? '' : ' (UAT V.${FFAppState().webUatVersion.toString()})'}',
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'Noto San Thai',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          centerTitle: true,
                          expandedTitleScale: 1.0,
                        ),
                        elevation: 2.0,
                      )
                    : null,
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
                      if (responsiveVisibility(
                        context: context,
                        desktop: false,
                      ))
                        Expanded(
                          child: ListView(
                            padding: EdgeInsets.fromLTRB(
                              0,
                              12.0,
                              0,
                              0,
                            ),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      ShareAgentReferPageWidget.routeName,
                                      extra: <String, dynamic>{
                                        '__transition_info__': TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.rightToLeft,
                                        ),
                                      },
                                    );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 70.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x33000000),
                                          offset: Offset(
                                            2.0,
                                            4.0,
                                          ),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: SvgPicture.asset(
                                                        'assets/images/Channel_add.svg',
                                                        width: 35.0,
                                                        height: 35.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 8,
                                                  child: Text(
                                                    'แนะนำลูกค้า',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto San Thai',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 16.0)),
                                            ),
                                          ),
                                          Icon(
                                            Icons.navigate_next_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 30.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      LeadDetailMenuPageWidget.routeName,
                                      extra: <String, dynamic>{
                                        '__transition_info__': TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.rightToLeft,
                                        ),
                                      },
                                    );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 70.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x33000000),
                                          offset: Offset(
                                            2.0,
                                            4.0,
                                          ),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: FaIcon(
                                                      FontAwesomeIcons.award,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 35.0,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 8,
                                                  child: Text(
                                                    'ผลงาน',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto San Thai',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 16.0)),
                                            ),
                                          ),
                                          Icon(
                                            Icons.navigate_next_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 30.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              if (FFAppState().mgmUserManualUrl != '')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if ('${FFAppState().platform}' ==
                                          'mobile') {
                                        await actions.launchUrlInApp(
                                          FFAppState().mgmUserManualUrl,
                                        );
                                      } else {
                                        await actions.urlLauncherAction(
                                          FFAppState().mgmUserManualUrl,
                                        );
                                      }
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 70.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x33000000),
                                            offset: Offset(
                                              2.0,
                                              4.0,
                                            ),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: FaIcon(
                                                        FontAwesomeIcons
                                                            .bookOpen,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 28.0,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 8,
                                                    child: Text(
                                                      'วิธีการใช้งานสำหรับลูกค้าทั่วไป',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto San Thai',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            fontSize: 18.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 16.0)),
                                              ),
                                            ),
                                            Icon(
                                              Icons.navigate_next_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 30.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ].divide(SizedBox(height: 16.0)),
                          ),
                        ),
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                        tablet: false,
                        tabletLandscape: false,
                      ))
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 100.0,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).width * 0.075,
                                    0.0,
                                  ),
                                  valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.04,
                                    0.0,
                                  ),
                                  valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).width * 0.075,
                                    0.0,
                                  ),
                                  0.0),
                              child: Wrap(
                                spacing: 32.0,
                                runSpacing: 50.0,
                                alignment: WrapAlignment.start,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                direction: Axis.horizontal,
                                runAlignment: WrapAlignment.start,
                                verticalDirection: VerticalDirection.down,
                                clipBehavior: Clip.none,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        ShareAgentReferPageWidget.routeName,
                                        extra: <String, dynamic>{
                                          '__transition_info__': TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.rightToLeft,
                                          ),
                                        },
                                      );
                                    },
                                    child: Container(
                                      width: 200.0,
                                      height: 200.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
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
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 24.0, 24.0, 24.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: SvgPicture.asset(
                                                'assets/images/Channel_add.svg',
                                                width: 110.0,
                                                height: 110.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Text(
                                              'แนะนำลูกค้า',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Noto San Thai',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontSize: 22.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ].divide(SizedBox(height: 12.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        LeadDetailMenuPageWidget.routeName,
                                        extra: <String, dynamic>{
                                          '__transition_info__': TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.rightToLeft,
                                          ),
                                        },
                                      );
                                    },
                                    child: Container(
                                      width: 200.0,
                                      height: 200.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
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
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 24.0, 24.0, 24.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            FaIcon(
                                              FontAwesomeIcons.award,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 100.0,
                                            ),
                                            Text(
                                              'ผลงาน',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Noto San Thai',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontSize: 22.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ].divide(SizedBox(height: 12.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (FFAppState().mgmUserManualUrl != '')
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if ('${FFAppState().platform}' ==
                                            'mobile') {
                                          await actions.launchUrlInApp(
                                            FFAppState().mgmUserManualUrl,
                                          );
                                        } else {
                                          await actions.urlLauncherAction(
                                            FFAppState().mgmUserManualUrl,
                                          );
                                        }
                                      },
                                      child: Container(
                                        width: 200.0,
                                        height: 200.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
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
                                              BorderRadius.circular(16.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 24.0, 24.0, 24.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              FaIcon(
                                                FontAwesomeIcons.bookOpen,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 100.0,
                                              ),
                                              Text(
                                                'วิธีการใช้งานสำหรับลูกค้าทั่วไป',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto San Thai',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ].divide(SizedBox(height: 12.0)),
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
              ),
            ),
          )),
    );
  }
}
