import '/agent_customer/agent_detail/agent_save_success/agent_save_success_widget.dart';
import '/agent_customer/agent_detail/user_agent_detail_component/user_agent_detail_component_widget.dart';
import '/agent_customer/select_payment_transfer_component/select_payment_transfer_component_widget.dart';
import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/banner_agent_component_widget.dart';
import '/components/error_message_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/m_g_m_agent/web_app_bar_component/web_app_bar_component_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/index.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'verify_transfer_page_model.dart';
export 'verify_transfer_page_model.dart';

class VerifyTransferPageWidget extends StatefulWidget {
  const VerifyTransferPageWidget({super.key});

  static String routeName = 'VerifyTransferPage';
  static String routePath = '/verifyTransferPage';

  @override
  State<VerifyTransferPageWidget> createState() =>
      _VerifyTransferPageWidgetState();
}

class _VerifyTransferPageWidgetState extends State<VerifyTransferPageWidget> {
  late VerifyTransferPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerifyTransferPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.checkAuthOutput = await action_blocks.checkAuth(context);
      if (!_model.checkAuthOutput!) {
        return;
      }
      _model.paymentMethod = FFAppState().agentProfileDataType.paymentMethod;
      _model.paymentChannel = FFAppState().agentProfileDataType.paymentChannel;
      safeSetState(() {});
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

    return Title(
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
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
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
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
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
                                    return 700.0;
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
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 8.0, 24.0, 12.0),
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
                                            return 500.0;
                                          }
                                        }(),
                                        decoration: BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 32.0,
                                              height: 32.0,
                                              child: Stack(
                                                children: [
                                                  Icon(
                                                    Icons.people_alt_outlined,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 30.0,
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 1.0),
                                                    child: Container(
                                                      width: 16.0,
                                                      height: 16.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFFAE4D1),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Icon(
                                                        Icons.chat_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 16.0,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'ข้อมูลของฉัน',
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                          ],
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
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
                                              return 400.0;
                                            }
                                          }(),
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 0.0),
                                            child: wrapWithModel(
                                              model: _model
                                                  .bannerAgentComponentModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child:
                                                  BannerAgentComponentWidget(),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
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
                                              return 500.0;
                                            }
                                          }(),
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 0.0),
                                            child: wrapWithModel(
                                              model: _model
                                                  .userAgentDetailComponentModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child:
                                                  UserAgentDetailComponentWidget(
                                                name:
                                                    '${FFAppState().agentProfileDataType.agentNameTh}',
                                                lastName:
                                                    '${FFAppState().agentProfileDataType.agentLastnameTh}',
                                                idCard:
                                                    '${FFAppState().agentProfileDataType.agentTaxId}',
                                                phoneNumber:
                                                    '${FFAppState().agentProfileDataType.agentMobilePhone}',
                                                backAccount:
                                                    '${FFAppState().agentProfileDataType.agentBankNo}',
                                                bankName:
                                                    '${FFAppState().agentProfileDataType.agentBankName}',
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
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: Container(
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
                                      return 500.0;
                                    }
                                  }(),
                                  decoration: BoxDecoration(),
                                  child: wrapWithModel(
                                    model: _model
                                        .selectPaymentTransferComponentModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: SelectPaymentTransferComponentWidget(
                                      reductPercent:
                                          '${FFAppState().agentProfileDataType.deductionPercent}',
                                      bankAccount:
                                          '${FFAppState().agentProfileDataType.agentBankNo}',
                                      promptPay:
                                          '${FFAppState().agentProfileDataType.promptpayNumber}',
                                      paymentMethodDefault:
                                          '${FFAppState().agentProfileDataType.paymentMethod}',
                                      paymentChannelDefault:
                                          '${FFAppState().agentProfileDataType.paymentChannel}',
                                      bankName:
                                          '${FFAppState().agentProfileDataType.agentBankName}',
                                      returnPayment: (paymentMethod,
                                          paymentChannel) async {
                                        _model.paymentMethod = paymentMethod;
                                        _model.paymentChannel = paymentChannel;
                                        safeSetState(() {});
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ].addToEnd(SizedBox(height: 30.0)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: () {
                      if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Builder(
                                  builder: (context) => FFButtonWidget(
                                    onPressed: () async {
                                      var _shouldSetState = false;
                                      _model.apiResultyyt = await AgentAPIGroup
                                          .agentLeadSaveCall
                                          .call(
                                        agentCode: FFAppState()
                                            .agentProfileDataType
                                            .agentCode,
                                        deductionPercent: FFAppState()
                                            .agentProfileDataType
                                            .deductionPercent,
                                        paymentNumber: _model.paymentChannel ==
                                                'bank_account'
                                            ? '${FFAppState().agentProfileDataType.agentBankNo}'
                                            : FFAppState()
                                                .agentProfileDataType
                                                .promptpayNumber,
                                        paymentChannel: _model.paymentChannel,
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
                                        paymentMethod: FFAppState()
                                            .agentProfileDataType
                                            .paymentMethod,
                                      );

                                      _shouldSetState = true;
                                      if ((_model.apiResultyyt?.statusCode ??
                                              200) !=
                                          200) {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
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
                                                      'พบข้อผิดพลาด(${(_model.apiResultyyt?.statusCode ?? 200).toString()})',
                                                ),
                                              ),
                                            );
                                          },
                                        );

                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }
                                      if (AgentAPIGroup.agentLeadSaveCall.code(
                                            (_model.apiResultyyt?.jsonBody ??
                                                ''),
                                          ) !=
                                          '200') {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
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
                                                      '${AgentAPIGroup.agentLeadSaveCall.message(
                                                    (_model.apiResultyyt
                                                            ?.jsonBody ??
                                                        ''),
                                                  )}',
                                                ),
                                              ),
                                            );
                                          },
                                        );

                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }
                                      FFAppState().agentProfileDataType =
                                          AgentAPIGroup.agentLeadSaveCall.data(
                                        (_model.apiResultyyt?.jsonBody ?? ''),
                                      )!;
                                      safeSetState(() {});
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
                                              child: Container(
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.5,
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.9,
                                                child: AgentSaveSuccessWidget(),
                                              ),
                                            ),
                                          );
                                        },
                                      );

                                      if (_shouldSetState) safeSetState(() {});
                                    },
                                    text: 'ยืนยันข้อมูล',
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
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
        ));
  }
}
