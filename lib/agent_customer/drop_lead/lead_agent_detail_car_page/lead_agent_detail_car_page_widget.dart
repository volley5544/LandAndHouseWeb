import '/agent_customer/drop_lead/progress_bar_component/progress_bar_component_widget.dart';
import '/agent_customer/drop_lead/review_detail_customer_component/review_detail_customer_component_widget.dart';
import '/agent_customer/image_source_component/image_source_component_widget.dart';
import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/error_message_component_widget.dart';
import '/components/message_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/m_g_m_agent/web_app_bar_component/web_app_bar_component_widget.dart';
import '/pages/loading/loading_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'lead_agent_detail_car_page_model.dart';
export 'lead_agent_detail_car_page_model.dart';

class LeadAgentDetailCarPageWidget extends StatefulWidget {
  const LeadAgentDetailCarPageWidget({
    super.key,
    this.product,
  });

  final String? product;

  static String routeName = 'LeadAgentDetailCarPage';
  static String routePath = '/leadAgentDetailCarPage';

  @override
  State<LeadAgentDetailCarPageWidget> createState() =>
      _LeadAgentDetailCarPageWidgetState();
}

class _LeadAgentDetailCarPageWidgetState
    extends State<LeadAgentDetailCarPageWidget> with TickerProviderStateMixin {
  late LeadAgentDetailCarPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LeadAgentDetailCarPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        Future(() async {
          while (true) {
            safeSetState(() {});
            await Future.delayed(
              Duration(
                milliseconds: 1000,
              ),
            );
          }
        }),
        Future(() async {
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

          _model.canNextButton = false;
          safeSetState(() {});
          await actions.listenWebviewEventCamera(
            context,
            (cameraBase64, actionNameOutput) async {
              var _shouldSetState = false;
              if (actionNameOutput != 'bluebook') {
                return;
              }
              _model.bluebookBase64 = cameraBase64;
              safeSetState(() {});
              _model.generateBluebookFile =
                  await actions.convertBase64ToFFFiles(
                _model.bluebookBase64,
                '01',
              );
              _shouldSetState = true;
              _model.bluebookFile = _model.generateBluebookFile;
              safeSetState(() {});
            },
          );
          _model.provinceApiOutput = await APIMasterGroup.getProvinceCall.call(
            url: FFAppState().apiUrlDocData.tanjaiApiUrl,
          );

          _model.getVehicleMaster = await AgentAPIGroup.rateGetVehicleCall.call(
            categoryCode: widget.product,
            url: FFDevEnvironmentValues().isProduction
                ? FFAppState().apiUrlDocData.agentWebApiUrl
                : FFAppState().apiUrlDocData.agentWebApiUrlUat,
            tokenHeader: FFDevEnvironmentValues().isProduction
                ? FFAppState().apiUrlDocData.agentWebApiToken
                : FFAppState().apiUrlDocData.agentWebApiTokenUat,
          );

          if ((_model.getVehicleMaster?.statusCode ?? 200) != 200) {
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
                          'พบข้อผิดพลาด connection (${(_model.getVehicleMaster?.statusCode ?? 200).toString()})',
                    ),
                  ),
                );
              },
            );

            Navigator.pop(context);
            return;
          }
          if (AgentAPIGroup.rateGetVehicleCall.code(
                (_model.getVehicleMaster?.jsonBody ?? ''),
              ) !=
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
                      textMessage: '${AgentAPIGroup.rateGetVehicleCall.message(
                        (_model.getVehicleMaster?.jsonBody ?? ''),
                      )}',
                    ),
                  ),
                );
              },
            );

            Navigator.pop(context);
            return;
          }
          _model.vehicelMasterPageState = AgentAPIGroup.rateGetVehicleCall
              .data(
                (_model.getVehicleMaster?.jsonBody ?? ''),
              )!
              .toList()
              .cast<MasterAgentVehicleDataModelStruct>();
          safeSetState(() {});
          if (!(_model.vehicelMasterPageState.isNotEmpty)) {
            _model.canNextButton = true;
            safeSetState(() {});
          }
          Navigator.pop(context);
        }),
      ]);
      if ((FFAppState().saveLeadAgentData.agentCode == '') &&
          (FFAppState().platform != 'mobile')) {
        context.goNamed(
          TimeoutPageWidget.routeName,
          queryParameters: {
            'text': serializeParam(
              'พบข้อผิดพลาด',
              ParamType.String,
            ),
            'code': serializeParam(
              '410',
              ParamType.String,
            ),
          }.withoutNulls,
        );
      }
    });

    _model.rateFromApiTextController ??= TextEditingController();
    _model.rateFromApiFocusNode ??= FocusNode();

    _model.carregisTextController ??= TextEditingController();
    _model.carregisFocusNode ??= FocusNode();

    _model.loanAmountTextController ??= TextEditingController();
    _model.loanAmountFocusNode ??= FocusNode();
    _model.loanAmountFocusNode!.addListener(
      () async {
        var _shouldSetState = false;
        if ((_model.loanAmountFocusNode?.hasFocus ?? false)) {
          safeSetState(() {
            _model.loanAmountTextController?.text = functions
                .removeCommaFromNumText(_model.loanAmountTextController.text)!;
          });
        } else {
          if ((_model.loanAmountTextController.text != '0') &&
              (double.parse(_model.loanAmountTextController.text) <
                  999999999)) {
            safeSetState(() {
              _model.loanAmountTextController?.text =
                  functions.returnNumberWithComma2Decimal(
                      _model.loanAmountTextController.text)!;
            });
          } else {
            if (!(double.parse(_model.loanAmountTextController.text) <
                999999999)) {
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
                      child: MessageComponentWidget(
                        textMessage: 'กรุณากรอกวงเงินไม่เกิน 999,999,999 บาท',
                      ),
                    ),
                  );
                },
              );
            }
            safeSetState(() {
              _model.loanAmountTextController?.text = '';
            });
          }
        }

        if ((FFAppState().agentProfileDataType.agentGroupId == '7') &&
            (loggedIn || (FFAppState().platform == 'mobile'))) {
          _model.apiResulthzdcommission =
              await AgentAPIGroup.agentCommissionCall.call(
            groupChannelCode: FFAppState().agentProfileDataType.agentGroupId,
            product: 'loan',
            subProduct: widget.product,
            amount: functions
                .removeCommaFromNumText(_model.loanAmountTextController.text),
            url: FFDevEnvironmentValues().isProduction
                ? FFAppState().apiUrlDocData.agentWebApiUrl
                : FFAppState().apiUrlDocData.agentWebApiUrlUat,
            tokenHeader: FFDevEnvironmentValues().isProduction
                ? FFAppState().apiUrlDocData.agentWebApiToken
                : FFAppState().apiUrlDocData.agentWebApiTokenUat,
          );

          _shouldSetState = true;
          if ((_model.apiResulthzdcommission?.statusCode ?? 200) != 200) {
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
                    child: MessageComponentWidget(
                      textMessage:
                          'พบข้อผิดพลาด connection (${(_model.apiResulthzdcommission?.statusCode ?? 200).toString()})',
                    ),
                  ),
                );
              },
            );

            if (_shouldSetState) safeSetState(() {});
            return;
          }
          if ('${getJsonField(
                (_model.apiResulthzdcommission?.jsonBody ?? ''),
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
                    child: MessageComponentWidget(
                      textMessage: '${getJsonField(
                        (_model.apiResulthzdcommission?.jsonBody ?? ''),
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
          _model.commissionPageState =
              AgentAPIGroup.agentCommissionCall.commissionamount(
            (_model.apiResulthzdcommission?.jsonBody ?? ''),
          )!;
          safeSetState(() {});
        }
        if (_shouldSetState) safeSetState(() {});
      },
    );
    animationsMap.addAll({
      'columnOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, -20.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, -20.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 800.0.ms,
            begin: Offset(0.0, -20.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, -20.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, -20.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation6': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, -20.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation7': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, -20.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation8': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, -20.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation9': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, -20.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation10': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, -20.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation11': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, -20.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
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
            begin: Offset(0.0, -30.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation12': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, -20.0),
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
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                          FFAppState().platform == 'mobile'
                              ? 'กรอกข้อมูลลูกค้า'
                              : 'กรุณากรอกข้อมูลให้ถูกต้อง',
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
                    Flexible(
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  child: SingleChildScrollView(
                                    controller: _model.columnController,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            width: () {
                                              if (MediaQuery.sizeOf(context)
                                                      .width <
                                                  kBreakpointSmall) {
                                                return MediaQuery.sizeOf(
                                                        context)
                                                    .width;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointMedium) {
                                                return MediaQuery.sizeOf(
                                                        context)
                                                    .width;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointLarge) {
                                                return MediaQuery.sizeOf(
                                                        context)
                                                    .width;
                                              } else {
                                                return 670.0;
                                              }
                                            }(),
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                wrapWithModel(
                                                  model: _model
                                                      .progressBarComponentModel,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child:
                                                      ProgressBarComponentWidget(
                                                    step: '2',
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model: _model
                                                      .reviewDetailCustomerComponentModel,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child:
                                                      ReviewDetailCustomerComponentWidget(
                                                    name: FFAppState()
                                                        .saveLeadAgentData
                                                        .firstName,
                                                    lastname: FFAppState()
                                                        .saveLeadAgentData
                                                        .lastName,
                                                    idcard: FFAppState()
                                                        .saveLeadAgentData
                                                        .registerId,
                                                    phonenumber: FFAppState()
                                                        .saveLeadAgentData
                                                        .mobilePhoneNumber,
                                                    amount: '',
                                                    product: '',
                                                    carregister: FFAppState()
                                                        .saveLeadAgentData
                                                        .carRegistration,
                                                    time: FFAppState()
                                                        .saveLeadAgentData
                                                        .contactTime,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 16.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      SizedBox(
                                                        height: 22.0,
                                                        child: VerticalDivider(
                                                          thickness: 4.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                      ),
                                                      Text(
                                                        'เช็คเรทรถ (Rate Book)',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto San Thai',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 12.0)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 16.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'ประเภทรถ',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
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
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        width: double.infinity,
                                                        height: 50.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Builder(
                                                          builder: (context) =>
                                                              Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            child:
                                                                FlutterFlowDropDown<
                                                                    String>(
                                                              controller: _model
                                                                      .dropDownVehicleValueController ??=
                                                                  FormFieldController<
                                                                          String>(
                                                                      null),
                                                              options: List<
                                                                      String>.from(
                                                                  _model
                                                                      .vehicelMasterPageState
                                                                      .map((e) =>
                                                                          e.vehicleCode)
                                                                      .toList()),
                                                              optionLabels: _model
                                                                  .vehicelMasterPageState
                                                                  .map((e) => e
                                                                      .vehicleName)
                                                                  .toList(),
                                                              onChanged:
                                                                  (val) async {
                                                                safeSetState(() =>
                                                                    _model.dropDownVehicleValue =
                                                                        val);
                                                                var _shouldSetState =
                                                                    false;
                                                                showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (dialogContext) {
                                                                    return Dialog(
                                                                      elevation:
                                                                          0,
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
                                                                              Directionality.of(context)),
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          FocusScope.of(dialogContext)
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

                                                                _model.canNextButton =
                                                                    false;
                                                                safeSetState(
                                                                    () {});
                                                                _model.apiResultGear =
                                                                    await AgentAPIGroup
                                                                        .agentRateSearchCall
                                                                        .call(
                                                                  carVehicleCode:
                                                                      _model
                                                                          .dropDownVehicleValue,
                                                                  url: FFDevEnvironmentValues()
                                                                          .isProduction
                                                                      ? FFAppState()
                                                                          .apiUrlDocData
                                                                          .agentWebApiUrl
                                                                      : FFAppState()
                                                                          .apiUrlDocData
                                                                          .agentWebApiUrlUat,
                                                                  tokenHeader: FFDevEnvironmentValues()
                                                                          .isProduction
                                                                      ? FFAppState()
                                                                          .apiUrlDocData
                                                                          .agentWebApiToken
                                                                      : FFAppState()
                                                                          .apiUrlDocData
                                                                          .agentWebApiTokenUat,
                                                                );

                                                                _shouldSetState =
                                                                    true;
                                                                if ((_model.apiResultGear
                                                                            ?.statusCode ??
                                                                        200) !=
                                                                    200) {
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (dialogContext) {
                                                                      return Dialog(
                                                                        elevation:
                                                                            0,
                                                                        insetPadding:
                                                                            EdgeInsets.zero,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        alignment:
                                                                            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        child:
                                                                            GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            FocusScope.of(dialogContext).unfocus();
                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                          },
                                                                          child:
                                                                              ErrorMessageComponentWidget(
                                                                            textMessage:
                                                                                'พบข้อผิดพลาด connection (${(_model.apiResultGear?.statusCode ?? 200).toString()})',
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );

                                                                  if (_shouldSetState)
                                                                    safeSetState(
                                                                        () {});
                                                                  return;
                                                                }
                                                                if (AgentAPIGroup
                                                                        .agentRateSearchCall
                                                                        .code(
                                                                      (_model.apiResultGear
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    200) {
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (dialogContext) {
                                                                      return Dialog(
                                                                        elevation:
                                                                            0,
                                                                        insetPadding:
                                                                            EdgeInsets.zero,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        alignment:
                                                                            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        child:
                                                                            GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            FocusScope.of(dialogContext).unfocus();
                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                          },
                                                                          child:
                                                                              ErrorMessageComponentWidget(
                                                                            textMessage:
                                                                                '${AgentAPIGroup.agentRateSearchCall.message(
                                                                              (_model.apiResultGear?.jsonBody ?? ''),
                                                                            )}',
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );

                                                                  if (_shouldSetState)
                                                                    safeSetState(
                                                                        () {});
                                                                  return;
                                                                }
                                                                _model.gearMasterPageState =
                                                                    AgentAPIGroup
                                                                        .agentRateSearchCall
                                                                        .gear(
                                                                          (_model.apiResultGear?.jsonBody ??
                                                                              ''),
                                                                        )!
                                                                        .toList()
                                                                        .cast<
                                                                            MasterAgentGearModelStruct>();
                                                                _model.brandMasterPageState =
                                                                    [];
                                                                _model.modelMasterPageState =
                                                                    [];
                                                                _model.ccMasterPageState =
                                                                    [];
                                                                _model.stateNumber =
                                                                    1;
                                                                safeSetState(
                                                                    () {});
                                                                FFAppState()
                                                                    .updateSaveLeadAgentDataStruct(
                                                                  (e) => e
                                                                    ..loanTypeCode =
                                                                        _model
                                                                            .dropDownVehicleValue
                                                                    ..loanTypeId = _model
                                                                        .vehicelMasterPageState
                                                                        .elementAtOrNull(functions.findIndexInList(
                                                                            _model.vehicelMasterPageState.map((e) => e.vehicleCode).toList(),
                                                                            _model.dropDownVehicleValue)!)
                                                                        ?.vehicleId
                                                                    ..loanTypeName = _model
                                                                        .vehicelMasterPageState
                                                                        .elementAtOrNull(functions.findIndexInList(
                                                                            _model.vehicelMasterPageState.map((e) => e.vehicleCode).toList(),
                                                                            _model.dropDownVehicleValue)!)
                                                                        ?.vehicleName,
                                                                );
                                                                safeSetState(
                                                                    () {});
                                                                safeSetState(
                                                                    () {
                                                                  _model
                                                                      .dropDownGearValueController
                                                                      ?.reset();
                                                                  _model.dropDownGearValue =
                                                                      null;
                                                                  _model
                                                                      .dropDownBrand11ValueController
                                                                      ?.reset();
                                                                  _model.dropDownBrand11Value =
                                                                      null;
                                                                  _model
                                                                      .dropDownYearValueController
                                                                      ?.reset();
                                                                  _model.dropDownYearValue =
                                                                      null;
                                                                  _model
                                                                      .dropDownModelValueController
                                                                      ?.reset();
                                                                  _model.dropDownModelValue =
                                                                      null;
                                                                  _model
                                                                      .dropDownCCValueController
                                                                      ?.reset();
                                                                  _model.dropDownCCValue =
                                                                      null;
                                                                });
                                                                if (!(_model
                                                                    .gearMasterPageState
                                                                    .isNotEmpty)) {
                                                                  _model.canNextButton =
                                                                      true;
                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                                Navigator.pop(
                                                                    context);
                                                                if (_shouldSetState)
                                                                  safeSetState(
                                                                      () {});
                                                              },
                                                              width: 200.0,
                                                              height: 40.0,
                                                              searchHintTextStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto San Thai',
                                                                        letterSpacing:
                                                                            0.0,
                                                                        lineHeight:
                                                                            1.0,
                                                                      ),
                                                              searchTextStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto San Thai',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto San Thai',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              hintText:
                                                                  'ระบุประเภทรถ',
                                                              searchHintText:
                                                                  'ค้นหา ...',
                                                              icon: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              elevation: 2.0,
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderWidth: 0.0,
                                                              borderRadius: 8.0,
                                                              margin:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                              isOverButton:
                                                                  false,
                                                              isSearchable:
                                                                  true,
                                                              isMultiSelect:
                                                                  false,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                if ((FFAppState()
                                                                .saveLeadAgentData
                                                                .loanTypeCode !=
                                                            '') &&
                                                    (_model.gearMasterPageState
                                                        .isNotEmpty) &&
                                                    (_model.stateNumber! >= 1))
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 16.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'เกียร์',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto San Thai',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
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
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height: 50.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Builder(
                                                            builder:
                                                                (context) =>
                                                                    Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              child:
                                                                  FlutterFlowDropDown<
                                                                      String>(
                                                                controller: _model
                                                                        .dropDownGearValueController ??=
                                                                    FormFieldController<
                                                                        String>(
                                                                  _model.dropDownGearValue ??=
                                                                      '',
                                                                ),
                                                                options: List<String>.from(_model
                                                                    .gearMasterPageState
                                                                    .map((e) =>
                                                                        e.gearId)
                                                                    .toList()),
                                                                optionLabels: _model
                                                                    .gearMasterPageState
                                                                    .map((e) =>
                                                                        e.gearName)
                                                                    .toList(),
                                                                onChanged:
                                                                    (val) async {
                                                                  safeSetState(() =>
                                                                      _model.dropDownGearValue =
                                                                          val);
                                                                  var _shouldSetState =
                                                                      false;
                                                                  _model.canNextButton =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                  _model.brandMasterPageState =
                                                                      [];
                                                                  _model.modelMasterPageState =
                                                                      [];
                                                                  _model.ccMasterPageState =
                                                                      [];
                                                                  safeSetState(
                                                                      () {});
                                                                  if (!(_model.dropDownGearValue !=
                                                                          null &&
                                                                      _model.dropDownGearValue !=
                                                                          '')) {
                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                    return;
                                                                  }
                                                                  showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (dialogContext) {
                                                                      return Dialog(
                                                                        elevation:
                                                                            0,
                                                                        insetPadding:
                                                                            EdgeInsets.zero,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        alignment:
                                                                            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        child:
                                                                            GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            FocusScope.of(dialogContext).unfocus();
                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                          },
                                                                          child:
                                                                              LoadingWidget(),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );

                                                                  _model.apiResultBrand =
                                                                      await AgentAPIGroup
                                                                          .agentRateSearchCall
                                                                          .call(
                                                                    carVehicleCode:
                                                                        FFAppState()
                                                                            .saveLeadAgentData
                                                                            .loanTypeCode,
                                                                    carGear: _model
                                                                        .dropDownGearValue,
                                                                    url: FFDevEnvironmentValues()
                                                                            .isProduction
                                                                        ? FFAppState()
                                                                            .apiUrlDocData
                                                                            .agentWebApiUrl
                                                                        : FFAppState()
                                                                            .apiUrlDocData
                                                                            .agentWebApiUrlUat,
                                                                    tokenHeader: FFDevEnvironmentValues()
                                                                            .isProduction
                                                                        ? FFAppState()
                                                                            .apiUrlDocData
                                                                            .agentWebApiToken
                                                                        : FFAppState()
                                                                            .apiUrlDocData
                                                                            .agentWebApiTokenUat,
                                                                  );

                                                                  _shouldSetState =
                                                                      true;
                                                                  if ((_model.apiResultBrand
                                                                              ?.statusCode ??
                                                                          200) !=
                                                                      200) {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (dialogContext) {
                                                                        return Dialog(
                                                                          elevation:
                                                                              0,
                                                                          insetPadding:
                                                                              EdgeInsets.zero,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          alignment:
                                                                              AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(dialogContext).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                ErrorMessageComponentWidget(
                                                                              textMessage: 'พบข้อผิดพลาด connection (${(_model.apiResultBrand?.statusCode ?? 200).toString()})',
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );

                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                    return;
                                                                  }
                                                                  if (AgentAPIGroup
                                                                          .agentRateSearchCall
                                                                          .code(
                                                                        (_model.apiResultBrand?.jsonBody ??
                                                                            ''),
                                                                      ) !=
                                                                      200) {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (dialogContext) {
                                                                        return Dialog(
                                                                          elevation:
                                                                              0,
                                                                          insetPadding:
                                                                              EdgeInsets.zero,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          alignment:
                                                                              AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(dialogContext).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                ErrorMessageComponentWidget(
                                                                              textMessage: '${AgentAPIGroup.agentRateSearchCall.message(
                                                                                (_model.apiResultBrand?.jsonBody ?? ''),
                                                                              )}',
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );

                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                    return;
                                                                  }
                                                                  safeSetState(
                                                                      () {
                                                                    _model
                                                                        .dropDownCCValueController
                                                                        ?.reset();
                                                                    _model.dropDownCCValue =
                                                                        null;
                                                                  });
                                                                  safeSetState(
                                                                      () {
                                                                    _model
                                                                        .dropDownModelValueController
                                                                        ?.reset();
                                                                    _model.dropDownModelValue =
                                                                        null;
                                                                  });
                                                                  safeSetState(
                                                                      () {
                                                                    _model
                                                                        .dropDownYearValueController
                                                                        ?.reset();
                                                                    _model.dropDownYearValue =
                                                                        null;
                                                                  });
                                                                  safeSetState(
                                                                      () {
                                                                    _model
                                                                        .dropDownBrand11ValueController
                                                                        ?.reset();
                                                                    _model.dropDownBrand11Value =
                                                                        null;
                                                                  });
                                                                  safeSetState(
                                                                      () {
                                                                    _model
                                                                        .dropDownModelValueController
                                                                        ?.value = '';
                                                                    _model.dropDownModelValue =
                                                                        '';
                                                                  });
                                                                  safeSetState(
                                                                      () {
                                                                    _model
                                                                        .dropDownCCValueController
                                                                        ?.value = '';
                                                                    _model.dropDownCCValue =
                                                                        '';
                                                                  });
                                                                  safeSetState(
                                                                      () {
                                                                    _model
                                                                        .rateFromApiTextController
                                                                        ?.clear();
                                                                  });
                                                                  _model.brandMasterPageState = AgentAPIGroup
                                                                      .agentRateSearchCall
                                                                      .brand(
                                                                        (_model.apiResultBrand?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          MasterAgentBrandModelStruct>();
                                                                  _model.modelMasterPageState =
                                                                      [];
                                                                  _model.ccMasterPageState =
                                                                      [];
                                                                  safeSetState(
                                                                      () {});
                                                                  _model.stateNumber =
                                                                      2;
                                                                  safeSetState(
                                                                      () {});
                                                                  if (!(_model
                                                                      .brandMasterPageState
                                                                      .isNotEmpty)) {
                                                                    _model.canNextButton =
                                                                        true;
                                                                    safeSetState(
                                                                        () {});
                                                                  }
                                                                  safeSetState(
                                                                      () {});
                                                                  Navigator.pop(
                                                                      context);
                                                                  if (_shouldSetState)
                                                                    safeSetState(
                                                                        () {});
                                                                },
                                                                width: 200.0,
                                                                height: 40.0,
                                                                searchHintTextStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto San Thai',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                searchTextStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto San Thai',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto San Thai',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                hintText:
                                                                    'ระบุเกียร์',
                                                                searchHintText:
                                                                    'ค้นหา ...',
                                                                icon: Icon(
                                                                  Icons
                                                                      .keyboard_arrow_down_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 24.0,
                                                                ),
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                elevation: 2.0,
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderWidth:
                                                                    0.0,
                                                                borderRadius:
                                                                    8.0,
                                                                margin: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        12.0,
                                                                        0.0),
                                                                isOverButton:
                                                                    false,
                                                                isSearchable:
                                                                    true,
                                                                isMultiSelect:
                                                                    false,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'columnOnPageLoadAnimation1']!),
                                                  ),
                                                if ((_model.dropDownGearValue !=
                                                            null &&
                                                        _model.dropDownGearValue !=
                                                            '') &&
                                                    (_model.brandMasterPageState
                                                        .isNotEmpty) &&
                                                    (_model.stateNumber! >= 2))
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 16.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'ยี่ห้อรถ',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto San Thai',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
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
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height: 50.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            child:
                                                                FlutterFlowDropDown<
                                                                    String>(
                                                              controller: _model
                                                                      .dropDownBrand11ValueController ??=
                                                                  FormFieldController<
                                                                      String>(
                                                                _model.dropDownBrand11Value ??=
                                                                    '',
                                                              ),
                                                              options: List<
                                                                      String>.from(
                                                                  _model
                                                                      .brandMasterPageState
                                                                      .map((e) =>
                                                                          e.brandId)
                                                                      .toList()),
                                                              optionLabels: _model
                                                                  .brandMasterPageState
                                                                  .map((e) => e
                                                                      .brandName)
                                                                  .toList(),
                                                              onChanged:
                                                                  (val) async {
                                                                safeSetState(() =>
                                                                    _model.dropDownBrand11Value =
                                                                        val);
                                                                if (!(_model.dropDownBrand11Value !=
                                                                        null &&
                                                                    _model.dropDownBrand11Value !=
                                                                        '')) {
                                                                  return;
                                                                }
                                                                safeSetState(
                                                                    () {
                                                                  _model
                                                                      .dropDownYearValueController
                                                                      ?.reset();
                                                                  _model.dropDownYearValue =
                                                                      null;
                                                                  _model
                                                                      .dropDownModelValueController
                                                                      ?.reset();
                                                                  _model.dropDownModelValue =
                                                                      null;
                                                                  _model
                                                                      .dropDownCCValueController
                                                                      ?.reset();
                                                                  _model.dropDownCCValue =
                                                                      null;
                                                                });
                                                                safeSetState(
                                                                    () {
                                                                  _model
                                                                      .rateFromApiTextController
                                                                      ?.clear();
                                                                });
                                                                _model.stateNumber =
                                                                    3;
                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              width: 200.0,
                                                              height: 40.0,
                                                              searchHintTextStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto San Thai',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              searchTextStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto San Thai',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto San Thai',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              hintText:
                                                                  'ระบุยี่ห้อรถ',
                                                              searchHintText:
                                                                  'ค้นหา ...',
                                                              icon: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              elevation: 2.0,
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderWidth: 0.0,
                                                              borderRadius: 8.0,
                                                              margin:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                              hidesUnderline:
                                                                  true,
                                                              isOverButton:
                                                                  false,
                                                              isSearchable:
                                                                  true,
                                                              isMultiSelect:
                                                                  false,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'columnOnPageLoadAnimation2']!),
                                                  ),
                                                if (('${_model.dropDownBrand11Value}' !=
                                                        '') &&
                                                    ('${_model.dropDownBrand11Value}' !=
                                                        'null') &&
                                                    (_model.stateNumber! >= 3))
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 16.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'ปีผลิต',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto San Thai',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
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
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height: 50.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Builder(
                                                            builder:
                                                                (context) =>
                                                                    Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              child:
                                                                  FlutterFlowDropDown<
                                                                      String>(
                                                                controller: _model
                                                                        .dropDownYearValueController ??=
                                                                    FormFieldController<
                                                                            String>(
                                                                        null),
                                                                options: functions
                                                                    .generateListYear(
                                                                        2025,
                                                                        1972)!,
                                                                onChanged:
                                                                    (val) async {
                                                                  safeSetState(() =>
                                                                      _model.dropDownYearValue =
                                                                          val);
                                                                  var _shouldSetState =
                                                                      false;
                                                                  _model.canNextButton =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                  if (!(_model.dropDownYearValue !=
                                                                          null &&
                                                                      _model.dropDownYearValue !=
                                                                          '')) {
                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                    return;
                                                                  }
                                                                  showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (dialogContext) {
                                                                      return Dialog(
                                                                        elevation:
                                                                            0,
                                                                        insetPadding:
                                                                            EdgeInsets.zero,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        alignment:
                                                                            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        child:
                                                                            GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            FocusScope.of(dialogContext).unfocus();
                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                          },
                                                                          child:
                                                                              LoadingWidget(),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );

                                                                  _model.apiResultModel =
                                                                      await AgentAPIGroup
                                                                          .agentRateSearchCall
                                                                          .call(
                                                                    carVehicleCode:
                                                                        FFAppState()
                                                                            .saveLeadAgentData
                                                                            .loanTypeCode,
                                                                    carGear: _model
                                                                        .dropDownGearValue,
                                                                    carBrand: _model
                                                                        .dropDownBrand11Value,
                                                                    carYear: _model
                                                                        .dropDownYearValue,
                                                                    url: FFDevEnvironmentValues()
                                                                            .isProduction
                                                                        ? FFAppState()
                                                                            .apiUrlDocData
                                                                            .agentWebApiUrl
                                                                        : FFAppState()
                                                                            .apiUrlDocData
                                                                            .agentWebApiUrlUat,
                                                                    tokenHeader: FFDevEnvironmentValues()
                                                                            .isProduction
                                                                        ? FFAppState()
                                                                            .apiUrlDocData
                                                                            .agentWebApiToken
                                                                        : FFAppState()
                                                                            .apiUrlDocData
                                                                            .agentWebApiTokenUat,
                                                                  );

                                                                  _shouldSetState =
                                                                      true;
                                                                  if ((_model.apiResultModel
                                                                              ?.statusCode ??
                                                                          200) !=
                                                                      200) {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (dialogContext) {
                                                                        return Dialog(
                                                                          elevation:
                                                                              0,
                                                                          insetPadding:
                                                                              EdgeInsets.zero,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          alignment:
                                                                              AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(dialogContext).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                ErrorMessageComponentWidget(
                                                                              textMessage: 'พบข้อผิดพลาด connection (${(_model.apiResultModel?.statusCode ?? 200).toString()})',
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );

                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                    return;
                                                                  }
                                                                  if (AgentAPIGroup
                                                                          .agentRateSearchCall
                                                                          .code(
                                                                        (_model.apiResultModel?.jsonBody ??
                                                                            ''),
                                                                      ) !=
                                                                      200) {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (dialogContext) {
                                                                        return Dialog(
                                                                          elevation:
                                                                              0,
                                                                          insetPadding:
                                                                              EdgeInsets.zero,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          alignment:
                                                                              AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(dialogContext).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                ErrorMessageComponentWidget(
                                                                              textMessage: '${AgentAPIGroup.agentRateSearchCall.message(
                                                                                (_model.apiResultModel?.jsonBody ?? ''),
                                                                              )}',
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );

                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                    return;
                                                                  }
                                                                  safeSetState(
                                                                      () {
                                                                    _model
                                                                        .dropDownModelValueController
                                                                        ?.reset();
                                                                    _model.dropDownModelValue =
                                                                        null;
                                                                    _model
                                                                        .dropDownCCValueController
                                                                        ?.reset();
                                                                    _model.dropDownCCValue =
                                                                        null;
                                                                  });
                                                                  safeSetState(
                                                                      () {
                                                                    _model
                                                                        .rateFromApiTextController
                                                                        ?.clear();
                                                                  });
                                                                  _model.modelMasterPageState = AgentAPIGroup
                                                                      .agentRateSearchCall
                                                                      .model(
                                                                        (_model.apiResultModel?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          MasterAgentModelModelStruct>();
                                                                  _model.ccMasterPageState =
                                                                      [];
                                                                  safeSetState(
                                                                      () {});
                                                                  if (!(_model
                                                                      .modelMasterPageState
                                                                      .isNotEmpty)) {
                                                                    _model.canNextButton =
                                                                        true;
                                                                    safeSetState(
                                                                        () {});
                                                                  }
                                                                  _model.stateNumber =
                                                                      4;
                                                                  safeSetState(
                                                                      () {});
                                                                  await _model
                                                                      .columnController
                                                                      ?.animateTo(
                                                                    _model
                                                                        .columnController!
                                                                        .position
                                                                        .maxScrollExtent,
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            500),
                                                                    curve: Curves
                                                                        .ease,
                                                                  );
                                                                  safeSetState(
                                                                      () {});
                                                                  Navigator.pop(
                                                                      context);
                                                                  if (_shouldSetState)
                                                                    safeSetState(
                                                                        () {});
                                                                },
                                                                width: 200.0,
                                                                height: 40.0,
                                                                searchHintTextStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto San Thai',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                searchTextStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto San Thai',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto San Thai',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                hintText:
                                                                    'ระบุปีผลิต',
                                                                searchHintText:
                                                                    'ค้นหา ...',
                                                                icon: Icon(
                                                                  Icons
                                                                      .keyboard_arrow_down_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 24.0,
                                                                ),
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                elevation: 2.0,
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderWidth:
                                                                    0.0,
                                                                borderRadius:
                                                                    8.0,
                                                                margin: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        12.0,
                                                                        0.0),
                                                                isOverButton:
                                                                    false,
                                                                isSearchable:
                                                                    true,
                                                                isMultiSelect:
                                                                    false,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'columnOnPageLoadAnimation3']!),
                                                  ),
                                                if ((_model.dropDownBrand11Value != null && _model.dropDownBrand11Value != '') &&
                                                    (_model.dropDownYearValue !=
                                                            null &&
                                                        _model.dropDownYearValue !=
                                                            '') &&
                                                    (_model.modelMasterPageState
                                                        .isNotEmpty) &&
                                                    (_model.stateNumber! >= 4))
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 16.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'รุ่นรถ',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto San Thai',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
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
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height: 50.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Builder(
                                                            builder:
                                                                (context) =>
                                                                    Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              child:
                                                                  FlutterFlowDropDown<
                                                                      String>(
                                                                controller: _model
                                                                        .dropDownModelValueController ??=
                                                                    FormFieldController<
                                                                        String>(
                                                                  _model.dropDownModelValue ??=
                                                                      '',
                                                                ),
                                                                options: List<String>.from(_model
                                                                    .modelMasterPageState
                                                                    .map((e) =>
                                                                        e.modelId)
                                                                    .toList()),
                                                                optionLabels: _model
                                                                    .modelMasterPageState
                                                                    .map((e) =>
                                                                        e.modelName)
                                                                    .toList(),
                                                                onChanged:
                                                                    (val) async {
                                                                  safeSetState(() =>
                                                                      _model.dropDownModelValue =
                                                                          val);
                                                                  var _shouldSetState =
                                                                      false;
                                                                  _model.canNextButton =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                  if (!(_model.dropDownModelValue !=
                                                                          null &&
                                                                      _model.dropDownModelValue !=
                                                                          '')) {
                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                    return;
                                                                  }
                                                                  showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (dialogContext) {
                                                                      return Dialog(
                                                                        elevation:
                                                                            0,
                                                                        insetPadding:
                                                                            EdgeInsets.zero,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        alignment:
                                                                            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        child:
                                                                            GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            FocusScope.of(dialogContext).unfocus();
                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                          },
                                                                          child:
                                                                              LoadingWidget(),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );

                                                                  _model.apiResultCC =
                                                                      await AgentAPIGroup
                                                                          .agentRateSearchCall
                                                                          .call(
                                                                    carVehicleCode:
                                                                        FFAppState()
                                                                            .saveLeadAgentData
                                                                            .loanTypeCode,
                                                                    carGear: _model
                                                                        .dropDownGearValue,
                                                                    carBrand: _model
                                                                        .dropDownBrand11Value,
                                                                    carYear: _model
                                                                        .dropDownYearValue,
                                                                    carModel: _model
                                                                        .dropDownModelValue,
                                                                    url: FFDevEnvironmentValues()
                                                                            .isProduction
                                                                        ? FFAppState()
                                                                            .apiUrlDocData
                                                                            .agentWebApiUrl
                                                                        : FFAppState()
                                                                            .apiUrlDocData
                                                                            .agentWebApiUrlUat,
                                                                    tokenHeader: FFDevEnvironmentValues()
                                                                            .isProduction
                                                                        ? FFAppState()
                                                                            .apiUrlDocData
                                                                            .agentWebApiToken
                                                                        : FFAppState()
                                                                            .apiUrlDocData
                                                                            .agentWebApiTokenUat,
                                                                  );

                                                                  _shouldSetState =
                                                                      true;
                                                                  if ((_model.apiResultCC
                                                                              ?.statusCode ??
                                                                          200) !=
                                                                      200) {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (dialogContext) {
                                                                        return Dialog(
                                                                          elevation:
                                                                              0,
                                                                          insetPadding:
                                                                              EdgeInsets.zero,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          alignment:
                                                                              AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(dialogContext).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                ErrorMessageComponentWidget(
                                                                              textMessage: 'พบข้อผิดพลาด connection (${(_model.apiResultCC?.statusCode ?? 200).toString()})',
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );

                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                    return;
                                                                  }
                                                                  if (AgentAPIGroup
                                                                          .agentRateSearchCall
                                                                          .code(
                                                                        (_model.apiResultCC?.jsonBody ??
                                                                            ''),
                                                                      ) !=
                                                                      200) {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (dialogContext) {
                                                                        return Dialog(
                                                                          elevation:
                                                                              0,
                                                                          insetPadding:
                                                                              EdgeInsets.zero,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          alignment:
                                                                              AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(dialogContext).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                ErrorMessageComponentWidget(
                                                                              textMessage: '${AgentAPIGroup.agentRateSearchCall.message(
                                                                                (_model.apiResultCC?.jsonBody ?? ''),
                                                                              )}',
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );

                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                    return;
                                                                  }
                                                                  safeSetState(
                                                                      () {
                                                                    _model
                                                                        .dropDownCCValueController
                                                                        ?.reset();
                                                                    _model.dropDownCCValue =
                                                                        null;
                                                                  });
                                                                  safeSetState(
                                                                      () {
                                                                    _model
                                                                        .rateFromApiTextController
                                                                        ?.clear();
                                                                  });
                                                                  _model.ccMasterPageState = AgentAPIGroup
                                                                      .agentRateSearchCall
                                                                      .cc(
                                                                        (_model.apiResultCC?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          MasterAgentCCModelStruct>();
                                                                  safeSetState(
                                                                      () {});
                                                                  if (!(_model
                                                                      .ccMasterPageState
                                                                      .isNotEmpty)) {
                                                                    _model.canNextButton =
                                                                        true;
                                                                    safeSetState(
                                                                        () {});
                                                                  }
                                                                  _model.stateNumber =
                                                                      5;
                                                                  safeSetState(
                                                                      () {});
                                                                  await _model
                                                                      .columnController
                                                                      ?.animateTo(
                                                                    _model
                                                                        .columnController!
                                                                        .position
                                                                        .maxScrollExtent,
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            100),
                                                                    curve: Curves
                                                                        .ease,
                                                                  );
                                                                  safeSetState(
                                                                      () {});
                                                                  Navigator.pop(
                                                                      context);
                                                                  if (_shouldSetState)
                                                                    safeSetState(
                                                                        () {});
                                                                },
                                                                width: 200.0,
                                                                height: 40.0,
                                                                searchHintTextStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto San Thai',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                searchTextStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto San Thai',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto San Thai',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                hintText:
                                                                    'ระบุรุ่นรถ',
                                                                searchHintText:
                                                                    'ค้นหา ...',
                                                                icon: Icon(
                                                                  Icons
                                                                      .keyboard_arrow_down_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 24.0,
                                                                ),
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                elevation: 2.0,
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderWidth:
                                                                    0.0,
                                                                borderRadius:
                                                                    8.0,
                                                                margin: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        12.0,
                                                                        0.0),
                                                                isOverButton:
                                                                    false,
                                                                isSearchable:
                                                                    true,
                                                                isMultiSelect:
                                                                    false,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'columnOnPageLoadAnimation4']!),
                                                  ),
                                                if ((_model.dropDownModelValue !=
                                                            null &&
                                                        _model.dropDownModelValue !=
                                                            '') &&
                                                    (_model.ccMasterPageState
                                                        .isNotEmpty) &&
                                                    (_model.stateNumber! >= 5))
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 16.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'รายละเอียดสินค้า',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto San Thai',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
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
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height: 50.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            child:
                                                                FlutterFlowDropDown<
                                                                    String>(
                                                              controller: _model
                                                                      .dropDownCCValueController ??=
                                                                  FormFieldController<
                                                                      String>(
                                                                _model.dropDownCCValue ??=
                                                                    '',
                                                              ),
                                                              options: List<
                                                                      String>.from(
                                                                  _model
                                                                      .ccMasterPageState
                                                                      .map((e) =>
                                                                          e.ccId)
                                                                      .toList()),
                                                              optionLabels: _model
                                                                  .ccMasterPageState
                                                                  .map((e) =>
                                                                      e.ccName)
                                                                  .toList(),
                                                              onChanged:
                                                                  (val) async {
                                                                safeSetState(() =>
                                                                    _model.dropDownCCValue =
                                                                        val);
                                                                safeSetState(
                                                                    () {
                                                                  _model
                                                                      .rateFromApiTextController
                                                                      ?.clear();
                                                                });
                                                                _model.stateNumber =
                                                                    6;
                                                                safeSetState(
                                                                    () {});
                                                                await _model
                                                                    .columnController
                                                                    ?.animateTo(
                                                                  _model
                                                                      .columnController!
                                                                      .position
                                                                      .maxScrollExtent,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          100),
                                                                  curve: Curves
                                                                      .ease,
                                                                );
                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              width: 200.0,
                                                              height: 40.0,
                                                              searchHintTextStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto San Thai',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              searchTextStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto San Thai',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto San Thai',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              hintText:
                                                                  'ระบุรายละเอียดสินค้า',
                                                              searchHintText:
                                                                  'ค้นหา ...',
                                                              icon: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              elevation: 2.0,
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderWidth: 0.0,
                                                              borderRadius: 8.0,
                                                              margin:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                              isOverButton:
                                                                  false,
                                                              isSearchable:
                                                                  true,
                                                              isMultiSelect:
                                                                  false,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'columnOnPageLoadAnimation5']!),
                                                  ),
                                                if ((_model.dropDownVehicleValue != null && _model.dropDownVehicleValue != '') &&
                                                    (_model.dropDownGearValue !=
                                                            null &&
                                                        _model.dropDownGearValue !=
                                                            '') &&
                                                    (_model.dropDownBrand11Value !=
                                                            null &&
                                                        _model.dropDownBrand11Value !=
                                                            '') &&
                                                    (_model.dropDownYearValue !=
                                                            null &&
                                                        _model.dropDownYearValue !=
                                                            '') &&
                                                    (_model.dropDownModelValue !=
                                                            null &&
                                                        _model.dropDownModelValue !=
                                                            '') &&
                                                    (_model.dropDownCCValue !=
                                                            null &&
                                                        _model.dropDownCCValue !=
                                                            '') &&
                                                    (_model.stateNumber! >= 6))
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 16.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'เรทราคา (บาท)',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto San Thai',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 50.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .rateFromApiTextController,
                                                                    focusNode:
                                                                        _model
                                                                            .rateFromApiFocusNode,
                                                                    autofocus:
                                                                        false,
                                                                    textCapitalization:
                                                                        TextCapitalization
                                                                            .words,
                                                                    readOnly:
                                                                        true,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      labelStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto San Thai',
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      hintStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto San Thai',
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      enabledBorder:
                                                                          UnderlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(4.0),
                                                                          topRight:
                                                                              Radius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                      focusedBorder:
                                                                          UnderlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(4.0),
                                                                          topRight:
                                                                              Radius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                      errorBorder:
                                                                          UnderlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(4.0),
                                                                          topRight:
                                                                              Radius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          UnderlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(4.0),
                                                                          topRight:
                                                                              Radius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                      contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          16.0,
                                                                          16.0,
                                                                          8.0),
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto San Thai',
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          lineHeight:
                                                                              3.0,
                                                                        ),
                                                                    maxLines:
                                                                        null,
                                                                    validator: _model
                                                                        .rateFromApiTextControllerValidator
                                                                        .asValidator(
                                                                            context),
                                                                    inputFormatters: [
                                                                      if (!isAndroid &&
                                                                          !isiOS)
                                                                        TextInputFormatter.withFunction((oldValue,
                                                                            newValue) {
                                                                          return TextEditingValue(
                                                                            selection:
                                                                                newValue.selection,
                                                                            text:
                                                                                newValue.text.toCapitalization(TextCapitalization.words),
                                                                          );
                                                                        }),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Builder(
                                                              builder: (context) =>
                                                                  FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  var _shouldSetState =
                                                                      false;
                                                                  if (!(_model.dropDownVehicleValue !=
                                                                          null &&
                                                                      _model.dropDownVehicleValue !=
                                                                          '')) {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          content:
                                                                              Text('กรุณาระบุประเภทรถ'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                              child: Text('Ok'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                    return;
                                                                  }
                                                                  if (!(_model.dropDownGearValue !=
                                                                          null &&
                                                                      _model.dropDownGearValue !=
                                                                          '')) {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          content:
                                                                              Text('กรุณาระบุเกียร์'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                              child: Text('Ok'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                    return;
                                                                  }
                                                                  if (!(_model.dropDownBrand11Value !=
                                                                          null &&
                                                                      _model.dropDownBrand11Value !=
                                                                          '')) {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          content:
                                                                              Text('กรุณาระบุยี่ห้อรถ'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                              child: Text('Ok'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                    return;
                                                                  }
                                                                  if (!(_model.dropDownYearValue !=
                                                                          null &&
                                                                      _model.dropDownYearValue !=
                                                                          '')) {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          content:
                                                                              Text('กรุณาระบุปีที่ผลิต'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                              child: Text('Ok'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                    return;
                                                                  }
                                                                  if (!(_model.dropDownModelValue !=
                                                                          null &&
                                                                      _model.dropDownModelValue !=
                                                                          '')) {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          content:
                                                                              Text('กรุณาระบุรุ่นรถ'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                              child: Text('Ok'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                    return;
                                                                  }
                                                                  if (!(_model.dropDownCCValue !=
                                                                          null &&
                                                                      _model.dropDownCCValue !=
                                                                          '')) {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          content:
                                                                              Text('กรุณาระบุรายละเอียดสินค้า'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                              child: Text('Ok'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                    return;
                                                                  }
                                                                  _model.canNextButton =
                                                                      true;
                                                                  safeSetState(
                                                                      () {});
                                                                  showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (dialogContext) {
                                                                      return Dialog(
                                                                        elevation:
                                                                            0,
                                                                        insetPadding:
                                                                            EdgeInsets.zero,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        alignment:
                                                                            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        child:
                                                                            GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            FocusScope.of(dialogContext).unfocus();
                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                          },
                                                                          child:
                                                                              LoadingWidget(),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );

                                                                  _model.apiResultCheckRate =
                                                                      await AgentAPIGroup
                                                                          .agentCheckRateCall
                                                                          .call(
                                                                    carVehicleCode:
                                                                        FFAppState()
                                                                            .saveLeadAgentData
                                                                            .loanTypeCode,
                                                                    carGear: _model
                                                                        .dropDownGearValue,
                                                                    carBrand: _model
                                                                        .dropDownBrand11Value,
                                                                    carYear: _model
                                                                        .dropDownYearValue,
                                                                    carModel: _model
                                                                        .dropDownModelValue,
                                                                    carCc: _model
                                                                        .dropDownCCValue,
                                                                    tenor: '10',
                                                                    interest:
                                                                        '1',
                                                                    thaiId: FFAppState()
                                                                        .saveLeadAgentData
                                                                        .registerId,
                                                                    url: FFDevEnvironmentValues()
                                                                            .isProduction
                                                                        ? FFAppState()
                                                                            .apiUrlDocData
                                                                            .agentWebApiUrl
                                                                        : FFAppState()
                                                                            .apiUrlDocData
                                                                            .agentWebApiUrlUat,
                                                                    tokenHeader: FFDevEnvironmentValues()
                                                                            .isProduction
                                                                        ? FFAppState()
                                                                            .apiUrlDocData
                                                                            .agentWebApiToken
                                                                        : FFAppState()
                                                                            .apiUrlDocData
                                                                            .agentWebApiTokenUat,
                                                                  );

                                                                  _shouldSetState =
                                                                      true;
                                                                  if ((_model.apiResultCheckRate
                                                                              ?.statusCode ??
                                                                          200) !=
                                                                      200) {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (dialogContext) {
                                                                        return Dialog(
                                                                          elevation:
                                                                              0,
                                                                          insetPadding:
                                                                              EdgeInsets.zero,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          alignment:
                                                                              AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(dialogContext).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                ErrorMessageComponentWidget(
                                                                              textMessage: 'พบข้อผิดพลาด connection (${(_model.apiResultCheckRate?.statusCode ?? 200).toString()})',
                                                                            ),
                                                                          ),
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
                                                                  if (AgentAPIGroup
                                                                          .agentCheckRateCall
                                                                          .statusCode(
                                                                        (_model.apiResultCheckRate?.jsonBody ??
                                                                            ''),
                                                                      ) !=
                                                                      200) {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (dialogContext) {
                                                                        return Dialog(
                                                                          elevation:
                                                                              0,
                                                                          insetPadding:
                                                                              EdgeInsets.zero,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          alignment:
                                                                              AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(dialogContext).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                ErrorMessageComponentWidget(
                                                                              textMessage: AgentAPIGroup.agentCheckRateCall.statusMessage(
                                                                                (_model.apiResultCheckRate?.jsonBody ?? ''),
                                                                              )!,
                                                                            ),
                                                                          ),
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
                                                                  _model.carRateData =
                                                                      AgentAPIGroup
                                                                          .agentCheckRateCall
                                                                          .dataJson(
                                                                    (_model.apiResultCheckRate
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  );
                                                                  safeSetState(
                                                                      () {});
                                                                  if (_model
                                                                          .carRateData !=
                                                                      null) {
                                                                    safeSetState(
                                                                        () {
                                                                      _model.rateFromApiTextController
                                                                              ?.text =
                                                                          functions.returnNumberWithComma2Decimal(_model
                                                                              .carRateData
                                                                              ?.rate)!;
                                                                    });
                                                                    if (_model.rateFromApiTextController.text ==
                                                                            '0.00'
                                                                        ? true
                                                                        : false) {
                                                                      safeSetState(
                                                                          () {
                                                                        _model
                                                                            .rateFromApiTextController
                                                                            ?.text = 'ไม่พบเรท';
                                                                      });
                                                                    }
                                                                  } else {
                                                                    safeSetState(
                                                                        () {
                                                                      _model.rateFromApiTextController
                                                                              ?.text =
                                                                          'ไม่พบเรท';
                                                                    });
                                                                  }

                                                                  _model.stateNumber =
                                                                      7;
                                                                  safeSetState(
                                                                      () {});
                                                                  Navigator.pop(
                                                                      context);
                                                                  if (_shouldSetState)
                                                                    safeSetState(
                                                                        () {});
                                                                },
                                                                text:
                                                                    'เช็คราคา',
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 35.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: Color(
                                                                      0xFF18599F),
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto San Thai',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  elevation:
                                                                      0.0,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'columnOnPageLoadAnimation6']!),
                                                  ),
                                                if ((_model.stateNumber! >=
                                                        7) ||
                                                    _model.canNextButton)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 16.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'ทะเบียนรถ',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto San Thai',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 50.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .carregisTextController,
                                                                    focusNode:
                                                                        _model
                                                                            .carregisFocusNode,
                                                                    autofocus:
                                                                        false,
                                                                    textCapitalization:
                                                                        TextCapitalization
                                                                            .words,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      labelStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto San Thai',
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      hintText:
                                                                          'ระบุทะเบียนรถ',
                                                                      hintStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto San Thai',
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      enabledBorder:
                                                                          UnderlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(4.0),
                                                                          topRight:
                                                                              Radius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                      focusedBorder:
                                                                          UnderlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(4.0),
                                                                          topRight:
                                                                              Radius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                      errorBorder:
                                                                          UnderlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(4.0),
                                                                          topRight:
                                                                              Radius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          UnderlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(4.0),
                                                                          topRight:
                                                                              Radius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                      contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          16.0,
                                                                          16.0,
                                                                          8.0),
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto San Thai',
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          lineHeight:
                                                                              1.0,
                                                                        ),
                                                                    maxLines:
                                                                        null,
                                                                    validator: _model
                                                                        .carregisTextControllerValidator
                                                                        .asValidator(
                                                                            context),
                                                                    inputFormatters: [
                                                                      if (!isAndroid &&
                                                                          !isiOS)
                                                                        TextInputFormatter.withFunction((oldValue,
                                                                            newValue) {
                                                                          return TextEditingValue(
                                                                            selection:
                                                                                newValue.selection,
                                                                            text:
                                                                                newValue.text.toCapitalization(TextCapitalization.words),
                                                                          );
                                                                        }),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'columnOnPageLoadAnimation7']!),
                                                  ),
                                                if ((_model.stateNumber! >=
                                                        7) ||
                                                    _model.canNextButton)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 16.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'จังหวัดทะเบียนรถ',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto San Thai',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 50.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                  child:
                                                                      FlutterFlowDropDown<
                                                                          String>(
                                                                    controller: _model
                                                                        .dropDownProvinceValueController ??= FormFieldController<
                                                                            String>(
                                                                        null),
                                                                    options: APIMasterGroup
                                                                        .getProvinceCall
                                                                        .provth(
                                                                      (_model.provinceApiOutput
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )!,
                                                                    onChanged: (val) =>
                                                                        safeSetState(() =>
                                                                            _model.dropDownProvinceValue =
                                                                                val),
                                                                    width:
                                                                        200.0,
                                                                    height:
                                                                        40.0,
                                                                    searchHintTextStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto San Thai',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    searchTextStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto San Thai',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto San Thai',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    hintText:
                                                                        'ระบุจังหวัดทะเบียนรถ',
                                                                    searchHintText:
                                                                        'ค้นหา ...',
                                                                    icon: Icon(
                                                                      Icons
                                                                          .keyboard_arrow_down_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    elevation:
                                                                        2.0,
                                                                    borderColor:
                                                                        Colors
                                                                            .transparent,
                                                                    borderWidth:
                                                                        0.0,
                                                                    borderRadius:
                                                                        8.0,
                                                                    margin: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                    isOverButton:
                                                                        false,
                                                                    isSearchable:
                                                                        true,
                                                                    isMultiSelect:
                                                                        false,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'columnOnPageLoadAnimation8']!),
                                                  ),
                                                if ((_model.stateNumber! >=
                                                        7) ||
                                                    _model.canNextButton)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      16.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 22.0,
                                                                child:
                                                                    VerticalDivider(
                                                                  thickness:
                                                                      4.0,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                              Text(
                                                                'ข้อมูลเพิ่มเติม',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto San Thai',
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 12.0)),
                                                          ),
                                                        ),
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
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'วงเงินที่ต้องการ',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
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
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    ' *',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto San Thai',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                          50.0,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Builder(
                                                                        builder:
                                                                            (context) =>
                                                                                Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              0.0,
                                                                              16.0,
                                                                              0.0),
                                                                          child:
                                                                              TextFormField(
                                                                            controller:
                                                                                _model.loanAmountTextController,
                                                                            focusNode:
                                                                                _model.loanAmountFocusNode,
                                                                            onChanged: (_) =>
                                                                                EasyDebounce.debounce(
                                                                              '_model.loanAmountTextController',
                                                                              Duration(milliseconds: 100),
                                                                              () => safeSetState(() {}),
                                                                            ),
                                                                            autofocus:
                                                                                false,
                                                                            textCapitalization:
                                                                                TextCapitalization.words,
                                                                            obscureText:
                                                                                false,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              labelStyle: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                    fontFamily: 'Noto San Thai',
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                              hintText: 'กรอกวงเงินที่ต้องการ',
                                                                              hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    fontFamily: 'Noto San Thai',
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                              enabledBorder: UnderlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                  width: 2.0,
                                                                                ),
                                                                                borderRadius: const BorderRadius.only(
                                                                                  topLeft: Radius.circular(4.0),
                                                                                  topRight: Radius.circular(4.0),
                                                                                ),
                                                                              ),
                                                                              focusedBorder: UnderlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  width: 2.0,
                                                                                ),
                                                                                borderRadius: const BorderRadius.only(
                                                                                  topLeft: Radius.circular(4.0),
                                                                                  topRight: Radius.circular(4.0),
                                                                                ),
                                                                              ),
                                                                              errorBorder: UnderlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                  width: 2.0,
                                                                                ),
                                                                                borderRadius: const BorderRadius.only(
                                                                                  topLeft: Radius.circular(4.0),
                                                                                  topRight: Radius.circular(4.0),
                                                                                ),
                                                                              ),
                                                                              focusedErrorBorder: UnderlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                  width: 2.0,
                                                                                ),
                                                                                borderRadius: const BorderRadius.only(
                                                                                  topLeft: Radius.circular(4.0),
                                                                                  topRight: Radius.circular(4.0),
                                                                                ),
                                                                              ),
                                                                              contentPadding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 16.0, 8.0),
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                  fontFamily: 'Noto San Thai',
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  lineHeight: 1.0,
                                                                                ),
                                                                            maxLines:
                                                                                null,
                                                                            keyboardType:
                                                                                TextInputType.number,
                                                                            validator:
                                                                                _model.loanAmountTextControllerValidator.asValidator(context),
                                                                            inputFormatters: [
                                                                              if (!isAndroid && !isiOS)
                                                                                TextInputFormatter.withFunction((oldValue, newValue) {
                                                                                  return TextEditingValue(
                                                                                    selection: newValue.selection,
                                                                                    text: newValue.text.toCapitalization(TextCapitalization.words),
                                                                                  );
                                                                                }),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              if ((FFAppState()
                                                                          .platform ==
                                                                      'mobile') &&
                                                                  (FFAppState()
                                                                          .agentProfileDataType
                                                                          .agentGroupId !=
                                                                      '7'))
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          16.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        'วิธีการรับเงิน ',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Noto San Thai',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        '*',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Noto San Thai',
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              if ((FFAppState()
                                                                          .platform ==
                                                                      'mobile') &&
                                                                  (FFAppState()
                                                                          .agentProfileDataType
                                                                          .agentGroupId !=
                                                                      '7'))
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
                                                                        50.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children:
                                                                          [
                                                                        Expanded(
                                                                          child:
                                                                              InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              _model.paymentState = true;
                                                                              safeSetState(() {});
                                                                              FFAppState().updateAgentProfileDataTypeStruct(
                                                                                (e) => e
                                                                                  ..paymentMethod = 'one_time'
                                                                                  ..actualPercent = '${FFAppState().agentProfileDataType.percentOnetime}'
                                                                                  ..defaultPercent = '${FFAppState().agentProfileDataType.percentOnetime}',
                                                                              );
                                                                              safeSetState(() {});
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 100.0,
                                                                              height: 45.0,
                                                                              decoration: BoxDecoration(
                                                                                color: _model.paymentState ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                border: Border.all(
                                                                                  color: _model.paymentState ? FlutterFlowTheme.of(context).secondary : FlutterFlowTheme.of(context).primary,
                                                                                  width: _model.paymentState ? 0.0 : 2.0,
                                                                                ),
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  if (_model.paymentState)
                                                                                    Icon(
                                                                                      Icons.check_circle,
                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                  Text(
                                                                                    'รับทันที',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Noto San Thai',
                                                                                          color: _model.paymentState ? FlutterFlowTheme.of(context).secondaryBackground : FlutterFlowTheme.of(context).secondaryText,
                                                                                          fontSize: 12.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 8.0)).addToStart(SizedBox(width: 8.0)).addToEnd(SizedBox(width: 8.0)),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              _model.paymentState = false;
                                                                              safeSetState(() {});
                                                                              FFAppState().updateAgentProfileDataTypeStruct(
                                                                                (e) => e
                                                                                  ..paymentMethod = 'installment'
                                                                                  ..actualPercent = '${FFAppState().agentProfileDataType.percentInstallment}'
                                                                                  ..defaultPercent = '${FFAppState().agentProfileDataType.percentInstallment}',
                                                                              );
                                                                              safeSetState(() {});
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 100.0,
                                                                              height: 45.0,
                                                                              decoration: BoxDecoration(
                                                                                color: !_model.paymentState ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                border: Border.all(
                                                                                  color: !_model.paymentState ? FlutterFlowTheme.of(context).secondary : FlutterFlowTheme.of(context).primary,
                                                                                  width: !_model.paymentState ? 0.0 : 2.0,
                                                                                ),
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  if (!_model.paymentState)
                                                                                    Icon(
                                                                                      Icons.check_circle,
                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                  Text(
                                                                                    'รับแบบแบ่งจ่าย',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Noto San Thai',
                                                                                          color: !_model.paymentState ? FlutterFlowTheme.of(context).secondaryBackground : FlutterFlowTheme.of(context).secondaryText,
                                                                                          fontSize: 12.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 8.0)).addToStart(SizedBox(width: 8.0)).addToEnd(SizedBox(width: 8.0)),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(width: 16.0)).addToStart(SizedBox(width: 24.0)).addToEnd(
                                                                              SizedBox(width: 24.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                            ],
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'columnOnPageLoadAnimation9']!),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                Builder(
                                                  builder: (context) {
                                                    if ((FFAppState()
                                                                .agentProfileDataType
                                                                .agentGroupId ==
                                                            '7') &&
                                                        (loggedIn ||
                                                            (FFAppState()
                                                                    .platform ==
                                                                'mobile'))) {
                                                      return Visibility(
                                                        visible: (_model.loanAmountTextController
                                                                        .text !=
                                                                    '') &&
                                                            (double.parse((functions
                                                                    .removeCommaFromNumText(_model
                                                                        .loanAmountTextController
                                                                        .text)!)) >
                                                                0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            16.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    SizedBox(
                                                                      height:
                                                                          22.0,
                                                                      child:
                                                                          VerticalDivider(
                                                                        thickness:
                                                                            4.0,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      'ค่าคอมที่คาดว่าจะได้รับ',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto San Thai',
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          12.0)),
                                                                ),
                                                              ),
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
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Text(
                                                                            '${valueOrDefault<String>(
                                                                              functions.returnNumberWithComma2Decimal(_model.commissionPageState),
                                                                              '0',
                                                                            )} บาท',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Noto San Thai',
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  fontSize: 24.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ).animateOnPageLoad(
                                                                    animationsMap[
                                                                        'columnOnPageLoadAnimation10']!),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    } else {
                                                      return Visibility(
                                                        visible: (_model.loanAmountTextController
                                                                        .text !=
                                                                    '') &&
                                                            (double.parse((functions
                                                                    .removeCommaFromNumText(_model
                                                                        .loanAmountTextController
                                                                        .text)!)) >
                                                                0) &&
                                                            (FFAppState()
                                                                    .platform ==
                                                                'mobile') &&
                                                            (_model.paymentState !=
                                                                null),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            16.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    SizedBox(
                                                                      height:
                                                                          22.0,
                                                                      child:
                                                                          VerticalDivider(
                                                                        thickness:
                                                                            4.0,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      'ค่าคอมที่คาดว่าจะได้รับ',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto San Thai',
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          12.0)),
                                                                ),
                                                              ),
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
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Text(
                                                                            '${valueOrDefault<String>(
                                                                              functions.returnNumberWithComma2Decimal(FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().maxCommissionAmountInstallment < 0.0 ? (((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString()) : (double.parse((((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString())) < FFAppState().maxCommissionAmountInstallment ? (((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString()) : '${FFAppState().maxCommissionAmountInstallment.toString()}')) : (FFAppState().maxCommissionAmountOnetime < 0.0 ? (((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString()) : (double.parse((((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString())) < FFAppState().maxCommissionAmountOnetime ? (((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString()) : '${FFAppState().maxCommissionAmountOnetime.toString()}'))),
                                                                              '0',
                                                                            )} บาท',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Noto San Thai',
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  fontSize: 24.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    if (FFAppState().agentProfileDataType.paymentMethod ==
                                                                            'installment'
                                                                        ? ((double
                                                                            maxCommission) {
                                                                            return maxCommission >=
                                                                                0.0;
                                                                          }(FFAppState()
                                                                            .maxCommissionAmountInstallment))
                                                                        : ((double
                                                                            maxCommission) {
                                                                            return maxCommission >=
                                                                                0.0;
                                                                          }(FFAppState()
                                                                            .maxCommissionAmountOnetime)))
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              FFAppState().agentProfileDataType.paymentMethod == 'installment' ? '${FFAppState().maxCommissionTextInstallment}${functions.returnNumberWithComma2Decimal('${FFAppState().maxCommissionAmountInstallment.toString()}')} บาท' : '${FFAppState().maxCommissionTextOnetime}${functions.returnNumberWithComma2Decimal('${FFAppState().maxCommissionAmountOnetime.toString()}')} บาท',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Noto San Thai',
                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ).animateOnPageLoad(
                                                                    animationsMap[
                                                                        'columnOnPageLoadAnimation11']!),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                  },
                                                ),
                                                if ((_model.stateNumber! >=
                                                        7) ||
                                                    _model.canNextButton)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 16.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'เวลาที่สะดวกให้ติดต่อ',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto San Thai',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await showModalBottomSheet<
                                                                    bool>(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  final _datePickedCupertinoTheme =
                                                                      CupertinoTheme.of(
                                                                          context);
                                                                  return ScrollConfiguration(
                                                                    behavior:
                                                                        const MaterialScrollBehavior()
                                                                            .copyWith(
                                                                      dragDevices: {
                                                                        PointerDeviceKind
                                                                            .mouse,
                                                                        PointerDeviceKind
                                                                            .touch,
                                                                        PointerDeviceKind
                                                                            .stylus,
                                                                        PointerDeviceKind
                                                                            .unknown
                                                                      },
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          MediaQuery.of(context).size.height /
                                                                              3,
                                                                      width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      child:
                                                                          CupertinoTheme(
                                                                        data: _datePickedCupertinoTheme
                                                                            .copyWith(
                                                                          textTheme: _datePickedCupertinoTheme
                                                                              .textTheme
                                                                              .copyWith(
                                                                            dateTimePickerTextStyle: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                  fontFamily: 'Noto San Thai',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            CupertinoDatePicker(
                                                                          mode:
                                                                              CupertinoDatePickerMode.time,
                                                                          minimumDate:
                                                                              DateTime(1900),
                                                                          initialDateTime:
                                                                              getCurrentTimestamp,
                                                                          maximumDate:
                                                                              DateTime(2050),
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          use24hFormat:
                                                                              false,
                                                                          onDateTimeChanged: (newDateTime) =>
                                                                              safeSetState(() {
                                                                            _model.datePicked =
                                                                                newDateTime;
                                                                          }),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                });
                                                          },
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            height: 50.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                                child: Text(
                                                                  _model.datePicked !=
                                                                          null
                                                                      ? dateTimeFormat(
                                                                          "Hm",
                                                                          _model
                                                                              .datePicked)
                                                                      : 'ระบุเวลาที่สะดวกให้ติดต่อ',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto San Thai',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Divider(
                                                          thickness: 2.0,
                                                          indent: 16.0,
                                                          endIndent: 16.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                if ((_model.stateNumber! >=
                                                        7) ||
                                                    _model.canNextButton)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      16.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 22.0,
                                                                child:
                                                                    VerticalDivider(
                                                                  thickness:
                                                                      4.0,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                              Text(
                                                                'แนบรูป',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto San Thai',
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 12.0)),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      12.0,
                                                                      12.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                'เล่มรถ',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto San Thai',
                                                                      fontSize:
                                                                          () {
                                                                        if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointSmall) {
                                                                          return 14.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointMedium) {
                                                                          return 20.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointLarge) {
                                                                          return 20.0;
                                                                        } else {
                                                                          return 20.0;
                                                                        }
                                                                      }(),
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        if (_model.bluebookFile !=
                                                                null &&
                                                            (_model
                                                                    .bluebookFile
                                                                    ?.bytes
                                                                    ?.isNotEmpty ??
                                                                false))
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    valueOrDefault<
                                                                        double>(
                                                                      () {
                                                                        if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointSmall) {
                                                                          return 0.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointMedium) {
                                                                          return 0.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointLarge) {
                                                                          return -1.0;
                                                                        } else {
                                                                          return -1.0;
                                                                        }
                                                                      }(),
                                                                      0.0,
                                                                    ),
                                                                    0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
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
                                                                onTap:
                                                                    () async {
                                                                  await Navigator
                                                                      .push(
                                                                    context,
                                                                    PageTransition(
                                                                      type: PageTransitionType
                                                                          .fade,
                                                                      child:
                                                                          FlutterFlowExpandedImageView(
                                                                        image: Image
                                                                            .memory(
                                                                          _model.bluebookFile?.bytes ??
                                                                              Uint8List.fromList([]),
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                        allowRotation:
                                                                            false,
                                                                        tag:
                                                                            'imageTag',
                                                                        useHeroAnimation:
                                                                            true,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                                child: Hero(
                                                                  tag:
                                                                      'imageTag',
                                                                  transitionOnUserGestures:
                                                                      true,
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child: Image
                                                                        .memory(
                                                                      _model.bluebookFile
                                                                              ?.bytes ??
                                                                          Uint8List.fromList(
                                                                              []),
                                                                      width:
                                                                          () {
                                                                        if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointSmall) {
                                                                          return 200.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointMedium) {
                                                                          return 300.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointLarge) {
                                                                          return 300.0;
                                                                        } else {
                                                                          return 300.0;
                                                                        }
                                                                      }(),
                                                                      height:
                                                                          () {
                                                                        if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointSmall) {
                                                                          return 200.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointMedium) {
                                                                          return 300.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointLarge) {
                                                                          return 300.0;
                                                                        } else {
                                                                          return 300.0;
                                                                        }
                                                                      }(),
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ).animateOnPageLoad(
                                                                  animationsMap[
                                                                      'imageOnPageLoadAnimation']!),
                                                            ),
                                                          ),
                                                        Builder(
                                                          builder: (context) =>
                                                              Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        12.0,
                                                                        0.0,
                                                                        0.0),
                                                            child:
                                                                FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                var _shouldSetState =
                                                                    false;
                                                                await showAlignedDialog(
                                                                  context:
                                                                      context,
                                                                  isGlobal:
                                                                      false,
                                                                  avoidOverflow:
                                                                      false,
                                                                  targetAnchor: AlignmentDirectional(
                                                                          0.0,
                                                                          -1.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  followerAnchor: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  builder:
                                                                      (dialogContext) {
                                                                    return Material(
                                                                      color: Colors
                                                                          .transparent,
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          FocusScope.of(dialogContext)
                                                                              .unfocus();
                                                                          FocusManager
                                                                              .instance
                                                                              .primaryFocus
                                                                              ?.unfocus();
                                                                        },
                                                                        child:
                                                                            ImageSourceComponentWidget(
                                                                          cameraType:
                                                                              'normal',
                                                                          actionName:
                                                                              'bluebook',
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    safeSetState(() =>
                                                                        _model.bluebookFileOutput =
                                                                            value));

                                                                _shouldSetState =
                                                                    true;
                                                                if (!(_model.bluebookFileOutput !=
                                                                        null &&
                                                                    (_model
                                                                            .bluebookFileOutput
                                                                            ?.bytes
                                                                            ?.isNotEmpty ??
                                                                        false))) {
                                                                  if (_shouldSetState)
                                                                    safeSetState(
                                                                        () {});
                                                                  return;
                                                                }
                                                                _model.bluebookFile =
                                                                    _model
                                                                        .bluebookFileOutput;
                                                                safeSetState(
                                                                    () {});
                                                                if (_shouldSetState)
                                                                  safeSetState(
                                                                      () {});
                                                              },
                                                              text: 'แนบรูป',
                                                              icon: Icon(
                                                                Icons
                                                                    .attach_file_sharp,
                                                                size: () {
                                                                  if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointSmall) {
                                                                    return 25.0;
                                                                  } else if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointMedium) {
                                                                    return 30.0;
                                                                  } else if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointLarge) {
                                                                    return 30.0;
                                                                  } else {
                                                                    return 30.0;
                                                                  }
                                                                }(),
                                                              ),
                                                              options:
                                                                  FFButtonOptions(
                                                                width: () {
                                                                  if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointSmall) {
                                                                    return MediaQuery.sizeOf(
                                                                            context)
                                                                        .width;
                                                                  } else if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointMedium) {
                                                                    return MediaQuery.sizeOf(
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
                                                                    return 70.0;
                                                                  } else if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointMedium) {
                                                                    return 90.0;
                                                                  } else if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointLarge) {
                                                                    return 90.0;
                                                                  } else {
                                                                    return 90.0;
                                                                  }
                                                                }(),
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            0.0),
                                                                iconPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                iconColor: Color(
                                                                    0xFF1D71B8),
                                                                color: Color(
                                                                    0xFFD9EBFF),
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto San Thai',
                                                                      color: Color(
                                                                          0xFF1D71B8),
                                                                      fontSize:
                                                                          () {
                                                                        if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointSmall) {
                                                                          return 16.0;
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
                                                                elevation: 0.0,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                if (((_model.stateNumber! >=
                                                            7) ||
                                                        _model.canNextButton) &&
                                                    ((FFAppState().platform ==
                                                            'mobile') ||
                                                        true))
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      16.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 22.0,
                                                                child:
                                                                    VerticalDivider(
                                                                  thickness:
                                                                      4.0,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                              Text(
                                                                FFAppState()
                                                                    .consentText,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto San Thai',
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 12.0)),
                                                          ),
                                                        ),
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
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
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
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .check_circle,
                                                                      color: Color(
                                                                          0xFF24DB1A),
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        'ยินยอมให้เก็บข้อมูลส่วนตัวแล้ว',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Noto San Thai',
                                                                              color: Color(0xFF24DB1A),
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'columnOnPageLoadAnimation12']!),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                Container(
                                                  width: double.infinity,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              context.safePop();
                                                            },
                                                            text:
                                                                valueOrDefault<
                                                                    String>(
                                                              'ย้อนกลับ',
                                                              'ย้อนกลับ',
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              height: 60.0,
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .info,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto San Thai',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Builder(
                                                            builder: (context) =>
                                                                FFButtonWidget(
                                                              onPressed: (!_model
                                                                          .canNextButton ||
                                                                      (_model.loanAmountTextController.text ==
                                                                              '') ||
                                                                      (_model.bluebookFile ==
                                                                              null ||
                                                                          (_model.bluebookFile?.bytes?.isEmpty ??
                                                                              true)))
                                                                  ? null
                                                                  : () async {
                                                                      if (!(_model.loanAmountTextController.text !=
                                                                              '')) {
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (dialogContext) {
                                                                            return Dialog(
                                                                              elevation: 0,
                                                                              insetPadding: EdgeInsets.zero,
                                                                              backgroundColor: Colors.transparent,
                                                                              alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                              child: GestureDetector(
                                                                                onTap: () {
                                                                                  FocusScope.of(dialogContext).unfocus();
                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                },
                                                                                child: MessageComponentWidget(
                                                                                  textMessage: 'กรุณากรอกวงเงินที่ต้องการ',
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        );

                                                                        return;
                                                                      }
                                                                      if (!(_model.bluebookFile !=
                                                                              null &&
                                                                          (_model.bluebookFile?.bytes?.isNotEmpty ??
                                                                              false))) {
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (dialogContext) {
                                                                            return Dialog(
                                                                              elevation: 0,
                                                                              insetPadding: EdgeInsets.zero,
                                                                              backgroundColor: Colors.transparent,
                                                                              alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                              child: GestureDetector(
                                                                                onTap: () {
                                                                                  FocusScope.of(dialogContext).unfocus();
                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                },
                                                                                child: MessageComponentWidget(
                                                                                  textMessage: 'กรุณาอัพรูปเล่มรถ',
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        );

                                                                        return;
                                                                      }
                                                                      if ((FFAppState().agentProfileDataType.agentGroupId ==
                                                                              '7') &&
                                                                          (loggedIn ||
                                                                              (FFAppState().platform == 'mobile'))) {
                                                                        FFAppState()
                                                                            .updateSaveLeadAgentDataStruct(
                                                                          (e) => e
                                                                            ..carGear = _model.dropDownGearValue != null && _model.dropDownGearValue != ''
                                                                                ? _model.dropDownGearValue
                                                                                : ''
                                                                            ..brandName = _model.dropDownBrand11Value != null && _model.dropDownBrand11Value != ''
                                                                                ? _model.dropDownBrand11Value
                                                                                : ''
                                                                            ..carYear = _model.dropDownYearValue != null && _model.dropDownYearValue != ''
                                                                                ? _model.dropDownYearValue
                                                                                : ''
                                                                            ..carModel = _model.dropDownModelValue != null && _model.dropDownModelValue != ''
                                                                                ? _model.dropDownModelValue
                                                                                : ''
                                                                            ..carCc = _model.dropDownCCValue != null && _model.dropDownCCValue != ''
                                                                                ? _model.dropDownCCValue
                                                                                : ''
                                                                            ..productDetail = _model.dropDownCCValue != null && _model.dropDownCCValue != ''
                                                                                ? _model.dropDownCCValue
                                                                                : ''
                                                                            ..estimatePrice = _model.carRateData != null
                                                                                ? _model.carRateData?.rate
                                                                                : '0'
                                                                            ..carRegistration =
                                                                                _model.carregisTextController.text
                                                                            ..contactTime =
                                                                                _model.datePicked?.toString()
                                                                            ..loanAmount =
                                                                                functions.removeCommaFromNumText(_model.loanAmountTextController.text)
                                                                            ..carProvince =
                                                                                _model.dropDownProvinceValue
                                                                            ..commission = FFAppState().agentProfileDataType.paymentMethod == 'installment'
                                                                                ? (FFAppState().maxCommissionAmountInstallment < 0.0 ? (((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString()) : (double.parse((((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString())) < FFAppState().maxCommissionAmountInstallment ? (((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString()) : '${FFAppState().maxCommissionAmountInstallment.toString()}'))
                                                                                : (FFAppState().maxCommissionAmountOnetime < 0.0 ? (((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString()) : (double.parse((((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString())) < FFAppState().maxCommissionAmountOnetime ? (((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString()) : '${FFAppState().maxCommissionAmountOnetime.toString()}'))
                                                                            ..comEstimateAmt =
                                                                                '${_model.commissionPageState}'
                                                                            ..comEstimateVat =
                                                                                FFAppState().agentProfileDataType.agentWht
                                                                            ..comEstimateNetAmt =
                                                                                '${_model.commissionPageState}'
                                                                            ..defaultComPercent =
                                                                                FFAppState().agentProfileDataType.defaultPercent
                                                                            ..actualComPercent =
                                                                                FFAppState().agentProfileDataType.actualPercent
                                                                            ..comEstimateVatAmt =
                                                                                '${((double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().maxCommissionAmountInstallment < 0.0 ? (((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString()) : (double.parse((((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString())) < FFAppState().maxCommissionAmountInstallment ? (((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString()) : '${FFAppState().maxCommissionAmountInstallment.toString()}')) : (FFAppState().maxCommissionAmountOnetime < 0.0 ? (((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString()) : (double.parse((((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString())) < FFAppState().maxCommissionAmountOnetime ? (((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString()) : '${FFAppState().maxCommissionAmountOnetime.toString()}')))) * double.parse((FFAppState().agentProfileDataType.agentWht != '' ? FFAppState().agentProfileDataType.agentWht : '0')) / 100)).toString()}'
                                                                            ..agentCode = FFAppState().agentCode,
                                                                        );
                                                                        safeSetState(
                                                                            () {});
                                                                      } else {
                                                                        FFAppState()
                                                                            .updateSaveLeadAgentDataStruct(
                                                                          (e) => e
                                                                            ..carGear = _model.dropDownGearValue != null && _model.dropDownGearValue != ''
                                                                                ? _model.dropDownGearValue
                                                                                : ''
                                                                            ..brandName = _model.dropDownBrand11Value != null && _model.dropDownBrand11Value != ''
                                                                                ? _model.dropDownBrand11Value
                                                                                : ''
                                                                            ..carYear = _model.dropDownYearValue != null && _model.dropDownYearValue != ''
                                                                                ? _model.dropDownYearValue
                                                                                : ''
                                                                            ..carModel = _model.dropDownModelValue != null && _model.dropDownModelValue != ''
                                                                                ? _model.dropDownModelValue
                                                                                : ''
                                                                            ..carCc = _model.dropDownCCValue != null && _model.dropDownCCValue != ''
                                                                                ? _model.dropDownCCValue
                                                                                : ''
                                                                            ..productDetail = _model.dropDownCCValue != null && _model.dropDownCCValue != ''
                                                                                ? _model.dropDownCCValue
                                                                                : ''
                                                                            ..estimatePrice = _model.carRateData != null
                                                                                ? _model.carRateData?.rate
                                                                                : '0'
                                                                            ..carRegistration =
                                                                                _model.carregisTextController.text
                                                                            ..contactTime =
                                                                                _model.datePicked?.toString()
                                                                            ..loanAmount =
                                                                                functions.removeCommaFromNumText(_model.loanAmountTextController.text)
                                                                            ..carProvince =
                                                                                _model.dropDownProvinceValue
                                                                            ..commission = FFAppState().agentProfileDataType.paymentMethod == 'installment'
                                                                                ? (FFAppState().maxCommissionAmountInstallment < 0.0 ? (((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString()) : (double.parse((((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString())) < FFAppState().maxCommissionAmountInstallment ? (((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString()) : '${FFAppState().maxCommissionAmountInstallment.toString()}'))
                                                                                : (FFAppState().maxCommissionAmountOnetime < 0.0 ? (((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString()) : (double.parse((((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString())) < FFAppState().maxCommissionAmountOnetime ? (((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString()) : '${FFAppState().maxCommissionAmountOnetime.toString()}'))
                                                                            ..comEstimateAmt =
                                                                                '${FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().maxCommissionAmountInstallment < 0.0 ? (((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString()) : (double.parse((((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString())) < FFAppState().maxCommissionAmountInstallment ? (((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString()) : '${FFAppState().maxCommissionAmountInstallment.toString()}')) : (FFAppState().maxCommissionAmountOnetime < 0.0 ? (((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString()) : (double.parse((((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString())) < FFAppState().maxCommissionAmountOnetime ? (((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString()) : '${FFAppState().maxCommissionAmountOnetime.toString()}'))}'
                                                                            ..comEstimateVat =
                                                                                FFAppState().agentProfileDataType.agentWht
                                                                            ..comEstimateNetAmt =
                                                                                '${((double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().maxCommissionAmountInstallment < 0.0 ? (((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString()) : (double.parse((((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString())) < FFAppState().maxCommissionAmountInstallment ? (((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString()) : '${FFAppState().maxCommissionAmountInstallment.toString()}')) : (FFAppState().maxCommissionAmountOnetime < 0.0 ? (((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString()) : (double.parse((((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString())) < FFAppState().maxCommissionAmountOnetime ? (((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString()) : '${FFAppState().maxCommissionAmountOnetime.toString()}'))))) - ((double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().maxCommissionAmountInstallment < 0.0 ? (((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString()) : (double.parse((((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString())) < FFAppState().maxCommissionAmountInstallment ? (((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString()) : '${FFAppState().maxCommissionAmountInstallment.toString()}')) : (FFAppState().maxCommissionAmountOnetime < 0.0 ? (((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString()) : (double.parse((((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString())) < FFAppState().maxCommissionAmountOnetime ? (((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString()) : '${FFAppState().maxCommissionAmountOnetime.toString()}')))) * double.parse((FFAppState().agentProfileDataType.agentWht != '' ? FFAppState().agentProfileDataType.agentWht : '0')) / 100))).toString()}'
                                                                            ..defaultComPercent =
                                                                                FFAppState().agentProfileDataType.defaultPercent
                                                                            ..actualComPercent =
                                                                                FFAppState().agentProfileDataType.actualPercent
                                                                            ..comEstimateVatAmt =
                                                                                '${((double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().maxCommissionAmountInstallment < 0.0 ? (((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString()) : (double.parse((((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString())) < FFAppState().maxCommissionAmountInstallment ? (((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString()) : '${FFAppState().maxCommissionAmountInstallment.toString()}')) : (FFAppState().maxCommissionAmountOnetime < 0.0 ? (((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString()) : (double.parse((((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString())) < FFAppState().maxCommissionAmountOnetime ? (((double.parse((functions.removeCommaFromNumText(_model.loanAmountTextController.text)!))) * (double.parse((FFAppState().agentProfileDataType.paymentMethod == 'installment' ? (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0') : (FFAppState().agentProfileDataType.actualPercent != '' ? FFAppState().agentProfileDataType.actualPercent : '0')))) / 100).toString()) : '${FFAppState().maxCommissionAmountOnetime.toString()}')))) * double.parse((FFAppState().agentProfileDataType.agentWht != '' ? FFAppState().agentProfileDataType.agentWht : '0')) / 100)).toString()}'
                                                                            ..agentCode = FFAppState().agentCode,
                                                                        );
                                                                        safeSetState(
                                                                            () {});
                                                                      }

                                                                      context
                                                                          .pushNamed(
                                                                        LeadAgentReviewDetailPageWidget
                                                                            .routeName,
                                                                        queryParameters:
                                                                            {
                                                                          'imageCarBack':
                                                                              serializeParam(
                                                                            _model.bluebookFile,
                                                                            ParamType.FFUploadedFile,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          '__transition_info__':
                                                                              TransitionInfo(
                                                                            hasTransition:
                                                                                true,
                                                                            transitionType:
                                                                                PageTransitionType.rightToLeft,
                                                                          ),
                                                                        },
                                                                      );
                                                                    },
                                                              text: 'ถัดไป',
                                                              options:
                                                                  FFButtonOptions(
                                                                height: 60.0,
                                                                padding: EdgeInsetsDirectional
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                textStyle: FlutterFlowTheme.of(
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
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                                disabledColor:
                                                                    Color(
                                                                        0x7FDB771A),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: 12.0)),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ].addToEnd(SizedBox(height: 30.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ].addToStart(SizedBox(height: 12.0)),
                          ),
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
