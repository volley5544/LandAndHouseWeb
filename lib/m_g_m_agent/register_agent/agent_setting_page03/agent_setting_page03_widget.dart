import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/error_message_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/m_g_m_agent/web_app_bar_component/web_app_bar_component_widget.dart';
import '/pages/loading/loading_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'agent_setting_page03_model.dart';
export 'agent_setting_page03_model.dart';

class AgentSettingPage03Widget extends StatefulWidget {
  const AgentSettingPage03Widget({
    super.key,
    this.fromPage,
  });

  final String? fromPage;

  static String routeName = 'AgentSettingPage03';
  static String routePath = '/AgentSettingPage';

  @override
  State<AgentSettingPage03Widget> createState() =>
      _AgentSettingPage03WidgetState();
}

class _AgentSettingPage03WidgetState extends State<AgentSettingPage03Widget>
    with TickerProviderStateMixin {
  late AgentSettingPage03Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AgentSettingPage03Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setDarkModeSetting(context, ThemeMode.light);
      if (!((FFAppState().registerStepCheck == true) ||
          (widget.fromPage == 'changePassWord'))) {
        context.goNamed(AgentRegisterPage01Widget.routeName);

        return;
      }
      FFAppState().customerDetailData = CustomerDetailStruct();
      FFAppState().chanodOutput = ChanodDataModelStruct();
      FFAppState().addressOutput = AddressDataModelStruct();
      FFAppState().addressDataOriginal = [];
      safeSetState(() {});
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

      _model.queryAPIUrl = await ApplicationRecord.getDocumentOnce(
          FFAppState().landAndHouseAPIDocRef!);
      FFAppState().landAndHouseAPIUrl = _model.queryAPIUrl!.apiUrl.landHouseUrl;
      safeSetState(() {});
      Navigator.pop(context);
    });

    _model.passwordTextFieldTextController ??= TextEditingController();
    _model.passwordTextFieldFocusNode ??= FocusNode();

    _model.confirmPasswordTextFieldTextController ??= TextEditingController();
    _model.confirmPasswordTextFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 50.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
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
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
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
                        backgroundColor:
                            FlutterFlowTheme.of(context).backgroundColor,
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
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            size: 24.0,
                          ),
                        ),
                        title: Text(
                          'ตั้งค่าข้อมูลเข้าใช้งานระบบ${FFDevEnvironmentValues().isProduction ? '' : ' (UAT V.${FFAppState().webUatVersion.toString()})'}',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Noto San Thai',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        actions: [],
                        centerTitle: true,
                        elevation: 2.0,
                      )
                    : null,
                body: SafeArea(
                  top: true,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      wrapWithModel(
                        model: _model.webAppBarComponentModel,
                        updateCallback: () => safeSetState(() {}),
                        child: WebAppBarComponentWidget(),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondary,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            if (responsiveVisibility(
                                              context: context,
                                              phone: false,
                                              tablet: false,
                                              tabletLandscape: false,
                                            ))
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 0.0, 12.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Text(
                                                          'ตั้งค่ารหัสผ่าน',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto San Thai',
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: () {
                                                        if (MediaQuery.sizeOf(
                                                                    context)
                                                                .width <
                                                            kBreakpointSmall) {
                                                          return MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width;
                                                        } else if (MediaQuery
                                                                    .sizeOf(
                                                                        context)
                                                                .width <
                                                            kBreakpointMedium) {
                                                          return MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width;
                                                        } else if (MediaQuery
                                                                    .sizeOf(
                                                                        context)
                                                                .width <
                                                            kBreakpointLarge) {
                                                          return 600.0;
                                                        } else {
                                                          return 600.0;
                                                        }
                                                      }(),
                                                      child: Divider(
                                                        thickness: 2.0,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Text(
                                                          'รหัสผ่าน',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto San Thai',
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            '*',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto San Thai',
                                                                  color: Color(
                                                                      0xFFFF0004),
                                                                  fontSize: () {
                                                                    if (MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointSmall) {
                                                                      return 18.0;
                                                                    } else if (MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointMedium) {
                                                                      return 22.0;
                                                                    } else if (MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointLarge) {
                                                                      return 22.0;
                                                                    } else {
                                                                      return 22.0;
                                                                    }
                                                                  }(),
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Builder(
                                                            builder: (context) {
                                                              if (functions.validatePasswordSeparate(
                                                                      _model
                                                                          .passwordTextFieldTextController
                                                                          .text,
                                                                      'all') ??
                                                                  false) {
                                                                return Icon(
                                                                  Icons
                                                                      .check_circle,
                                                                  color: Color(
                                                                      0xFF40B221),
                                                                  size: 24.0,
                                                                );
                                                              } else {
                                                                return Icon(
                                                                  Icons.cancel,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  size: 24.0,
                                                                );
                                                              }
                                                            },
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
                                                                  0.0),
                                                      child: Container(
                                                        width: () {
                                                          if (MediaQuery.sizeOf(
                                                                      context)
                                                                  .width <
                                                              kBreakpointSmall) {
                                                            return MediaQuery
                                                                    .sizeOf(
                                                                        context)
                                                                .width;
                                                          } else if (MediaQuery
                                                                      .sizeOf(
                                                                          context)
                                                                  .width <
                                                              kBreakpointMedium) {
                                                            return MediaQuery
                                                                    .sizeOf(
                                                                        context)
                                                                .width;
                                                          } else if (MediaQuery
                                                                      .sizeOf(
                                                                          context)
                                                                  .width <
                                                              kBreakpointLarge) {
                                                            return 600.0;
                                                          } else {
                                                            return 600.0;
                                                          }
                                                        }(),
                                                        height: () {
                                                          if (MediaQuery.sizeOf(
                                                                      context)
                                                                  .width <
                                                              kBreakpointSmall) {
                                                            return 50.0;
                                                          } else if (MediaQuery
                                                                      .sizeOf(
                                                                          context)
                                                                  .width <
                                                              kBreakpointMedium) {
                                                            return 50.0;
                                                          } else if (MediaQuery
                                                                      .sizeOf(
                                                                          context)
                                                                  .width <
                                                              kBreakpointLarge) {
                                                            return 50.0;
                                                          } else {
                                                            return 45.0;
                                                          }
                                                        }(),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            width: 2.0,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      12.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .passwordTextFieldTextController,
                                                                    focusNode:
                                                                        _model
                                                                            .passwordTextFieldFocusNode,
                                                                    onChanged: (_) =>
                                                                        EasyDebounce
                                                                            .debounce(
                                                                      '_model.passwordTextFieldTextController',
                                                                      Duration(
                                                                          milliseconds:
                                                                              100),
                                                                      () => safeSetState(
                                                                          () {}),
                                                                    ),
                                                                    autofocus:
                                                                        false,
                                                                    obscureText:
                                                                        !_model
                                                                            .passwordTextFieldVisibility,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      isDense:
                                                                          false,
                                                                      labelStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto San Thai',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      hintStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto San Thai',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(20.0),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(20.0),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(20.0),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(20.0),
                                                                      ),
                                                                      filled:
                                                                          true,
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      suffixIcon:
                                                                          InkWell(
                                                                        onTap:
                                                                            () async {
                                                                          safeSetState(() =>
                                                                              _model.passwordTextFieldVisibility = !_model.passwordTextFieldVisibility);
                                                                        },
                                                                        focusNode:
                                                                            FocusNode(skipTraversal: true),
                                                                        child:
                                                                            Icon(
                                                                          _model.passwordTextFieldVisibility
                                                                              ? Icons.visibility_outlined
                                                                              : Icons.visibility_off_outlined,
                                                                          size:
                                                                              22,
                                                                        ),
                                                                      ),
                                                                    ),
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
                                                                        ),
                                                                    cursorColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                    validator: _model
                                                                        .passwordTextFieldTextControllerValidator
                                                                        .asValidator(
                                                                            context),
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
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  16.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Text(
                                                                'ยืนยันรหัสผ่าน',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto San Thai',
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  '*',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto San Thai',
                                                                        color: Color(
                                                                            0xFFFF0004),
                                                                        fontSize:
                                                                            () {
                                                                          if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointSmall) {
                                                                            return 18.0;
                                                                          } else if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointMedium) {
                                                                            return 22.0;
                                                                          } else if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointLarge) {
                                                                            return 22.0;
                                                                          } else {
                                                                            return 22.0;
                                                                          }
                                                                        }(),
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    if ((_model.passwordTextFieldTextController
                                                                                .text ==
                                                                            _model
                                                                                .confirmPasswordTextFieldTextController.text) &&
                                                                        (_model.passwordTextFieldTextController.text !=
                                                                            '') &&
                                                                        (_model.confirmPasswordTextFieldTextController.text !=
                                                                            '')) {
                                                                      return Icon(
                                                                        Icons
                                                                            .check_circle,
                                                                        color: Color(
                                                                            0xFF40B221),
                                                                        size:
                                                                            24.0,
                                                                      );
                                                                    } else {
                                                                      return Icon(
                                                                        Icons
                                                                            .cancel,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        size:
                                                                            24.0,
                                                                      );
                                                                    }
                                                                  },
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
                                                                        0.0),
                                                            child: Container(
                                                              width: () {
                                                                if (MediaQuery.sizeOf(
                                                                            context)
                                                                        .width <
                                                                    kBreakpointSmall) {
                                                                  return MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width;
                                                                } else if (MediaQuery.sizeOf(
                                                                            context)
                                                                        .width <
                                                                    kBreakpointMedium) {
                                                                  return MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width;
                                                                } else if (MediaQuery.sizeOf(
                                                                            context)
                                                                        .width <
                                                                    kBreakpointLarge) {
                                                                  return 600.0;
                                                                } else {
                                                                  return 600.0;
                                                                }
                                                              }(),
                                                              height: () {
                                                                if (MediaQuery.sizeOf(
                                                                            context)
                                                                        .width <
                                                                    kBreakpointSmall) {
                                                                  return 50.0;
                                                                } else if (MediaQuery.sizeOf(
                                                                            context)
                                                                        .width <
                                                                    kBreakpointMedium) {
                                                                  return 50.0;
                                                                } else if (MediaQuery.sizeOf(
                                                                            context)
                                                                        .width <
                                                                    kBreakpointLarge) {
                                                                  return 50.0;
                                                                } else {
                                                                  return 45.0;
                                                                }
                                                              }(),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  width: 2.0,
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
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
                                                                            TextFormField(
                                                                          controller:
                                                                              _model.confirmPasswordTextFieldTextController,
                                                                          focusNode:
                                                                              _model.confirmPasswordTextFieldFocusNode,
                                                                          onChanged: (_) =>
                                                                              EasyDebounce.debounce(
                                                                            '_model.confirmPasswordTextFieldTextController',
                                                                            Duration(milliseconds: 100),
                                                                            () =>
                                                                                safeSetState(() {}),
                                                                          ),
                                                                          autofocus:
                                                                              false,
                                                                          obscureText:
                                                                              !_model.confirmPasswordTextFieldVisibility,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            isDense:
                                                                                false,
                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Noto San Thai',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Noto San Thai',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(20.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(20.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(20.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(20.0),
                                                                            ),
                                                                            filled:
                                                                                true,
                                                                            fillColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            suffixIcon:
                                                                                InkWell(
                                                                              onTap: () async {
                                                                                safeSetState(() => _model.confirmPasswordTextFieldVisibility = !_model.confirmPasswordTextFieldVisibility);
                                                                              },
                                                                              focusNode: FocusNode(skipTraversal: true),
                                                                              child: Icon(
                                                                                _model.confirmPasswordTextFieldVisibility ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                                                                size: 22,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Noto San Thai',
                                                                                color: Colors.black,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          cursorColor:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          validator: _model
                                                                              .confirmPasswordTextFieldTextControllerValidator
                                                                              .asValidator(context),
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
                                                  ],
                                                ).animateOnPageLoad(animationsMap[
                                                    'columnOnPageLoadAnimation']!),
                                              ],
                                            ),
                                          ].addToEnd(SizedBox(height: 24.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    child: Container(
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
                                          return 600.0;
                                        } else {
                                          return 600.0;
                                        }
                                      }(),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .softBGColor,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 12.0, 12.0, 12.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'การตั้งรหัสผ่าน',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Noto San Thai',
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  '• มีความยาวอย่างน้อย 6 ตัวอักษร หรือมากกว่า',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto San Thai',
                                                        color: functions
                                                                .validatePasswordSeparate(
                                                                    _model
                                                                        .passwordTextFieldTextController
                                                                        .text,
                                                                    'length')!
                                                            ? Color(0xFF40B221)
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Builder(
                                                    builder: (context) {
                                                      if (functions
                                                              .validatePasswordSeparate(
                                                                  _model
                                                                      .passwordTextFieldTextController
                                                                      .text,
                                                                  'length') ??
                                                          false) {
                                                        return Icon(
                                                          Icons.check_circle,
                                                          color:
                                                              Color(0xFF40B221),
                                                          size: 18.0,
                                                        );
                                                      } else {
                                                        return Icon(
                                                          Icons.cancel,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          size: 18.0,
                                                        );
                                                      }
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    '• ประกอบด้วยอักขระต่อไปนี้ ',
                                                    style:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Noto San Thai',
                                                              color: functions.validatePasswordSeparate(
                                                                      _model
                                                                          .passwordTextFieldTextController
                                                                          .text,
                                                                      'all')!
                                                                  ? Color(
                                                                      0xFF40B221)
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    '      • ตัวอักษรพิมพ์เล็ก (a-z) ',
                                                    style:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Noto San Thai',
                                                              color: functions.validatePasswordSeparate(
                                                                      _model
                                                                          .passwordTextFieldTextController
                                                                          .text,
                                                                      'lower')!
                                                                  ? Color(
                                                                      0xFF40B221)
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        if (functions
                                                                .validatePasswordSeparate(
                                                                    _model
                                                                        .passwordTextFieldTextController
                                                                        .text,
                                                                    'lower') ??
                                                            false) {
                                                          return Icon(
                                                            Icons.check_circle,
                                                            color: Color(
                                                                0xFF40B221),
                                                            size: 18.0,
                                                          );
                                                        } else {
                                                          return Icon(
                                                            Icons.cancel,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            size: 18.0,
                                                          );
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    '      • ตัวอักษรพิมพ์ใหญ่ (A-Z)',
                                                    style:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Noto San Thai',
                                                              color: functions.validatePasswordSeparate(
                                                                      _model
                                                                          .passwordTextFieldTextController
                                                                          .text,
                                                                      'upper')!
                                                                  ? Color(
                                                                      0xFF40B221)
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        if (functions
                                                                .validatePasswordSeparate(
                                                                    _model
                                                                        .passwordTextFieldTextController
                                                                        .text,
                                                                    'upper') ??
                                                            false) {
                                                          return Icon(
                                                            Icons.check_circle,
                                                            color: Color(
                                                                0xFF40B221),
                                                            size: 18.0,
                                                          );
                                                        } else {
                                                          return Icon(
                                                            Icons.cancel,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            size: 18.0,
                                                          );
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    '      • ตัวเลข (0-9) ',
                                                    style:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Noto San Thai',
                                                              color: functions.validatePasswordSeparate(
                                                                      _model
                                                                          .passwordTextFieldTextController
                                                                          .text,
                                                                      'number')!
                                                                  ? Color(
                                                                      0xFF40B221)
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        if (functions
                                                                .validatePasswordSeparate(
                                                                    _model
                                                                        .passwordTextFieldTextController
                                                                        .text,
                                                                    'number') ??
                                                            false) {
                                                          return Icon(
                                                            Icons.check_circle,
                                                            color: Color(
                                                                0xFF40B221),
                                                            size: 18.0,
                                                          );
                                                        } else {
                                                          return Icon(
                                                            Icons.cancel,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            size: 18.0,
                                                          );
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    '      • เครื่องหมายหรืออักขระพิเศษ เช่น !@#\$',
                                                    style:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Noto San Thai',
                                                              color: functions.validatePasswordSeparate(
                                                                      _model
                                                                          .passwordTextFieldTextController
                                                                          .text,
                                                                      'special')!
                                                                  ? Color(
                                                                      0xFF40B221)
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        if (functions.validatePasswordSeparate(
                                                                _model
                                                                    .passwordTextFieldTextController
                                                                    .text,
                                                                'special') ??
                                                            false) {
                                                          return Icon(
                                                            Icons.check_circle,
                                                            color: Color(
                                                                0xFF40B221),
                                                            size: 18.0,
                                                          );
                                                        } else {
                                                          return Icon(
                                                            Icons.cancel,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            size: 18.0,
                                                          );
                                                        }
                                                      },
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
                              ]
                                  .addToStart(SizedBox(height: 8.0))
                                  .addToEnd(SizedBox(height: 50.0)),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.safePop();
                              },
                              text: 'ยกเลิก',
                              options: FFButtonOptions(
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
                                    return 250.0;
                                  }
                                }(),
                                height: () {
                                  if (MediaQuery.sizeOf(context).width <
                                      kBreakpointSmall) {
                                    return 50.0;
                                  } else if (MediaQuery.sizeOf(context).width <
                                      kBreakpointMedium) {
                                    return 50.0;
                                  } else if (MediaQuery.sizeOf(context).width <
                                      kBreakpointLarge) {
                                    return 50.0;
                                  } else {
                                    return 45.0;
                                  }
                                }(),
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).info,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Noto San Thai',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 2.0,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Builder(
                              builder: (context) => FFButtonWidget(
                                onPressed: () async {
                                  currentUserLocationValue =
                                      await getCurrentUserLocation(
                                          defaultLocation: LatLng(0.0, 0.0));
                                  var _shouldSetState = false;
                                  if (!(_model.passwordTextFieldTextController
                                              .text !=
                                          '')) {
                                    await showDialog(
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
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: ErrorMessageComponentWidget(
                                              textMessage: 'กรุณากรอก password',
                                            ),
                                          ),
                                        );
                                      },
                                    );

                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  }
                                  if (!(_model.confirmPasswordTextFieldTextController
                                              .text !=
                                          '')) {
                                    await showDialog(
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
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: ErrorMessageComponentWidget(
                                              textMessage:
                                                  'กรุณากรอกยืนยัน password',
                                            ),
                                          ),
                                        );
                                      },
                                    );

                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  }
                                  if (_model.passwordTextFieldTextController
                                          .text !=
                                      _model
                                          .confirmPasswordTextFieldTextController
                                          .text) {
                                    await showDialog(
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
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: ErrorMessageComponentWidget(
                                              textMessage:
                                                  'กรุณาตั้งรหัสผ่านและยืนยันรหัสผ่านให้เหมือนกัน',
                                            ),
                                          ),
                                        );
                                      },
                                    );

                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  }
                                  if (!functions.validatePassword(_model
                                      .passwordTextFieldTextController.text)!) {
                                    await showDialog(
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
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: ErrorMessageComponentWidget(
                                              textMessage:
                                                  'password ไม่ถูกต้อง',
                                            ),
                                          ),
                                        );
                                      },
                                    );

                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  }
                                  FFAppState().updateAgentProfileDataTypeStruct(
                                    (e) => e
                                      ..password = _model
                                          .passwordTextFieldTextController.text,
                                  );
                                  safeSetState(() {});
                                  if (widget.fromPage == 'changePassWord') {
                                    _model.changePassAPIOutput =
                                        await AgentAPIGroup
                                            .passwordResetAgentCall
                                            .call(
                                      agentCode: FFAppState()
                                          .agentProfileDataType
                                          .agentCode,
                                      registerId: FFAppState()
                                          .agentProfileDataType
                                          .agentTaxId,
                                      password: _model
                                          .passwordTextFieldTextController.text,
                                      confirmPassword: _model
                                          .confirmPasswordTextFieldTextController
                                          .text,
                                      phoneNumber: FFAppState()
                                          .agentProfileDataType
                                          .agentPhoneNumber,
                                      latitude:
                                          functions.getLatLngStringFromDevice(
                                              currentUserLocationValue, 'lat'),
                                      longitude:
                                          functions.getLatLngStringFromDevice(
                                              currentUserLocationValue, 'lng'),
                                      url: FFDevEnvironmentValues().isProduction
                                          ? FFAppState()
                                              .apiUrlDocData
                                              .agentWebApiUrl
                                          : FFAppState()
                                              .apiUrlDocData
                                              .agentWebApiUrlUat,
                                      tokenHeader:
                                          FFDevEnvironmentValues().isProduction
                                              ? FFAppState()
                                                  .apiUrlDocData
                                                  .agentWebApiToken
                                              : FFAppState()
                                                  .apiUrlDocData
                                                  .agentWebApiTokenUat,
                                    );

                                    _shouldSetState = true;
                                    if ((_model.changePassAPIOutput
                                                ?.statusCode ??
                                            200) !=
                                        200) {
                                      await showDialog(
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
                                                  ErrorMessageComponentWidget(
                                                textMessage:
                                                    'พบข้อผิดพลาด connection (${(_model.changePassAPIOutput?.statusCode ?? 200).toString()})',
                                              ),
                                            ),
                                          );
                                        },
                                      );

                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    }
                                    if ('${getJsonField(
                                          (_model.changePassAPIOutput
                                                  ?.jsonBody ??
                                              ''),
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
                                                  ErrorMessageComponentWidget(
                                                textMessage: '${'${getJsonField(
                                                  (_model.changePassAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.code''',
                                                ).toString()}'}',
                                              ),
                                            ),
                                          );
                                        },
                                      );

                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    }

                                    context.goNamed(
                                        AgentLoginPageWidget.routeName);
                                  } else {
                                    _model.createAgentAPIOutput =
                                        await AgentAPIGroup.createAgentCall
                                            .call(
                                      agentMobilePhone: FFAppState()
                                          .agentProfileDataType
                                          .agentPhoneNumber,
                                      agentPrivacyConsent: FFAppState()
                                          .agentProfileDataType
                                          .agentPrivacyConsent,
                                      password: FFAppState()
                                          .agentProfileDataType
                                          .password,
                                      url: FFDevEnvironmentValues().isProduction
                                          ? FFAppState()
                                              .apiUrlDocData
                                              .agentWebApiUrl
                                          : FFAppState()
                                              .apiUrlDocData
                                              .agentWebApiUrlUat,
                                      tokenHeader:
                                          FFDevEnvironmentValues().isProduction
                                              ? FFAppState()
                                                  .apiUrlDocData
                                                  .agentWebApiToken
                                              : FFAppState()
                                                  .apiUrlDocData
                                                  .agentWebApiTokenUat,
                                    );

                                    _shouldSetState = true;
                                    if ((_model.createAgentAPIOutput
                                                ?.statusCode ??
                                            200) !=
                                        200) {
                                      await showDialog(
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
                                                  ErrorMessageComponentWidget(
                                                textMessage:
                                                    'พบข้อผิดพลาด connection (${(_model.createAgentAPIOutput?.statusCode ?? 200).toString()})',
                                              ),
                                            ),
                                          );
                                        },
                                      );

                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    }
                                    if ('${getJsonField(
                                          (_model.createAgentAPIOutput
                                                  ?.jsonBody ??
                                              ''),
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
                                                  ErrorMessageComponentWidget(
                                                textMessage: '${getJsonField(
                                                  (_model.createAgentAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.message''',
                                                ).toString()}',
                                              ),
                                            ),
                                          );
                                        },
                                      );

                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    }
                                    FFAppState()
                                        .updateAgentProfileDataTypeStruct(
                                      (e) => e
                                        ..agentCode = AgentAPIGroup
                                            .createAgentCall
                                            .agentCode(
                                          (_model.createAgentAPIOutput
                                                  ?.jsonBody ??
                                              ''),
                                        ),
                                    );
                                    safeSetState(() {});
                                    FFAppState().registerStepCheck = true;
                                    safeSetState(() {});

                                    context.pushNamed(
                                        IdCardDetailPage04Widget.routeName);
                                  }

                                  if (_shouldSetState) safeSetState(() {});
                                },
                                text: 'ยืนยัน',
                                options: FFButtonOptions(
                                  width: () {
                                    if (MediaQuery.sizeOf(context).width <
                                        kBreakpointSmall) {
                                      return MediaQuery.sizeOf(context).width;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointMedium) {
                                      return MediaQuery.sizeOf(context).width;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointLarge) {
                                      return MediaQuery.sizeOf(context).width;
                                    } else {
                                      return 250.0;
                                    }
                                  }(),
                                  height: () {
                                    if (MediaQuery.sizeOf(context).width <
                                        kBreakpointSmall) {
                                      return 50.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointMedium) {
                                      return 50.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointLarge) {
                                      return 50.0;
                                    } else {
                                      return 45.0;
                                    }
                                  }(),
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).bGColor2,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Noto San Thai',
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 2.0,
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                              ),
                            ),
                          ),
                        ]
                            .divide(SizedBox(width: () {
                              if (MediaQuery.sizeOf(context).width <
                                  kBreakpointSmall) {
                                return 8.0;
                              } else if (MediaQuery.sizeOf(context).width <
                                  kBreakpointMedium) {
                                return 8.0;
                              } else if (MediaQuery.sizeOf(context).width <
                                  kBreakpointLarge) {
                                return 8.0;
                              } else {
                                return 16.0;
                              }
                            }()))
                            .addToStart(SizedBox(width: 24.0))
                            .addToEnd(SizedBox(width: 24.0)),
                      ),
                    ].addToEnd(SizedBox(height: 20.0)),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
