import '/agent_customer/drop_lead/progress_bar_component/progress_bar_component_widget.dart';
import '/agent_customer/image_source_component/image_source_component_widget.dart';
import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/confirm_dialog_component_widget.dart';
import '/components/error_message_component_widget.dart';
import '/customer_topup/capture_picture_component/capture_picture_component_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/upload_data.dart';
import '/m_g_m_agent/web_app_bar_component/web_app_bar_component_widget.dart';
import '/pages/loading/loading_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:badges/badges.dart' as badges;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'lead_agent_detail_customer_page_model.dart';
export 'lead_agent_detail_customer_page_model.dart';

class LeadAgentDetailCustomerPageWidget extends StatefulWidget {
  const LeadAgentDetailCustomerPageWidget({
    super.key,
    this.product,
  });

  final String? product;

  static String routeName = 'LeadAgentDetailCustomerPage';
  static String routePath = '/leadAgentDetailCustomerPage';

  @override
  State<LeadAgentDetailCustomerPageWidget> createState() =>
      _LeadAgentDetailCustomerPageWidgetState();
}

class _LeadAgentDetailCustomerPageWidgetState
    extends State<LeadAgentDetailCustomerPageWidget> {
  late LeadAgentDetailCustomerPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LeadAgentDetailCustomerPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().isGuest) {
        _model.appConfig2 = await queryApplicationRecordOnce(
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        FFAppState().consentText = FFAppState().platform == 'mobile'
            ? _model.appConfig2!.consentTextAgent
            : _model.appConfig2!.consentTextCustomer;
        safeSetState(() {});
        return;
      }
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
              child: LoadingWidget(),
            ),
          );
        },
      );

      FFAppState().saveLeadAgentData = SaveLeadAgentDataModelStruct();
      safeSetState(() {});
      _model.appConfig = await queryApplicationRecordOnce(
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      FFAppState().maxCommissionAmountOnetime =
          _model.appConfig!.maxCommissionAmountOnetime;
      FFAppState().maxCommissionAmountInstallment =
          _model.appConfig!.maxCommissionAmountInstallment;
      FFAppState().maxCommissionTextOnetime =
          _model.appConfig!.maxCommissionTextOnetime;
      FFAppState().maxCommissionTextInstallment =
          _model.appConfig!.maxCommissionTextInstallment;
      FFAppState().consentText = FFAppState().platform == 'mobile'
          ? _model.appConfig!.consentTextAgent
          : _model.appConfig!.consentTextCustomer;
      safeSetState(() {});
      Navigator.pop(context);
      if (FFAppState().platform == 'mobile') {
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
            await actions.listenWebviewEventCamera(
              context,
              (cameraBase64, actionNameOutput) async {
                var _shouldSetState = false;
                if (actionNameOutput != 'idCardOCR') {
                  return;
                }
                _model.idCardBase64 = cameraBase64;
                safeSetState(() {});
                _model.generateIdCardFile =
                    await actions.convertBase64ToFFFiles(
                  _model.idCardBase64,
                  '11',
                );
                _shouldSetState = true;
                _model.idCardImageUrlCallback =
                    await actions.uploadFileFirebaseStorage(
                  'Topup${FFAppState().getLoanListSelected.contractDetails.loanTypeCode}',
                  _model.generateIdCardFile,
                  FFAppState().getLoanListSelected.contractNo,
                  FFAppState().hashThaiIdAppState,
                );
                _shouldSetState = true;
                _model.idCardFile = _model.generateIdCardFile;
                safeSetState(() {});
                _model.visionOutputThaiIdmobile =
                    await SrisawadApiGroup.visionThaiIdCall.call(
                  file: _model.idCardFile,
                  apiUrl: FFDevEnvironmentValues().isProduction
                      ? FFAppState().topupUrlProd
                      : FFAppState().topupUrlDev,
                );

                _shouldSetState = true;
                if ((_model.visionOutputThaiIdmobile?.statusCode ?? 200) !=
                    200) {
                  return;
                }
                FFAppState().updateSaveLeadAgentDataStruct(
                  (e) => e
                    ..firstName = getJsonField(
                      (_model.visionOutputThaiIdmobile?.jsonBody ?? ''),
                      r'''$.first_name''',
                    ).toString()
                    ..lastName = getJsonField(
                      (_model.visionOutputThaiIdmobile?.jsonBody ?? ''),
                      r'''$.last_name''',
                    ).toString()
                    ..registerId = getJsonField(
                      (_model.visionOutputThaiIdmobile?.jsonBody ?? ''),
                      r'''$.thai_id''',
                    ).toString(),
                );
                safeSetState(() {});
                safeSetState(() {
                  _model.firstNameTextController?.text =
                      FFAppState().saveLeadAgentData.firstName;
                });
                safeSetState(() {
                  _model.lastNameTextController?.text =
                      FFAppState().saveLeadAgentData.lastName;
                });
                if (functions.checkIdCard(
                    '${FFAppState().saveLeadAgentData.registerId}')!) {
                  safeSetState(() {
                    _model.idcardTextController?.text =
                        functions.showThaiIdNumberForm(
                            '${FFAppState().saveLeadAgentData.registerId}')!;
                    _model.idcardMask.updateMask(
                      newValue: TextEditingValue(
                        text: _model.idcardTextController!.text,
                      ),
                    );
                  });
                }
              },
            );
          }),
        ]);
        return;
      }
    });

    _model.firstNameTextController ??= TextEditingController();
    _model.firstNameFocusNode ??= FocusNode();

    _model.lastNameTextController ??= TextEditingController();
    _model.lastNameFocusNode ??= FocusNode();

    _model.idcardTextController ??= TextEditingController();
    _model.idcardFocusNode ??= FocusNode();

    _model.idcardMask = MaskTextInputFormatter(mask: '#-####-#####-##-#');
    _model.textController4 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textFieldMask1 = MaskTextInputFormatter(mask: '###-###-####');
    _model.textController5 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();
    _model.textFieldFocusNode2!.addListener(
      () async {
        if ((_model.textFieldFocusNode2?.hasFocus ?? false)) {
          safeSetState(() {
            _model.textController5?.text =
                functions.removeCommaFromNumText(_model.textController5.text)!;
          });
        } else {
          if (_model.textController5.text != '0') {
            safeSetState(() {
              _model.textController5?.text = functions
                  .returnNumberWithComma2Decimal(_model.textController5.text)!;
            });
          } else {
            safeSetState(() {
              _model.textController5?.text = '0';
            });
          }
        }
      },
    );
    _model.textController6 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

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
                          _model.checkConsentStatusTimer?.cancel();
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
                    Expanded(
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    wrapWithModel(
                                                      model: _model
                                                          .progressBarComponentModel,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child:
                                                          ProgressBarComponentWidget(
                                                        step: '1',
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
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(
                                                            height: 22.0,
                                                            child:
                                                                VerticalDivider(
                                                              thickness: 4.0,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                          Text(
                                                            'ข้อมูลของลูกค้า',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                            width: 8.0)),
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
                                                            MainAxisSize.max,
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
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  'ชื่อ',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto San Thai',
                                                                        color: FlutterFlowTheme.of(context)
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
                                                                  height: 50.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      Padding(
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
                                                                              .firstNameTextController,
                                                                      focusNode:
                                                                          _model
                                                                              .firstNameFocusNode,
                                                                      autofocus:
                                                                          false,
                                                                      textCapitalization:
                                                                          TextCapitalization
                                                                              .words,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        labelStyle: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: 'Noto San Thai',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        hintText:
                                                                            'ระบุชื่อ',
                                                                        hintStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'Noto San Thai',
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
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
                                                                      validator: _model
                                                                          .firstNameTextControllerValidator
                                                                          .asValidator(
                                                                              context),
                                                                      inputFormatters: [
                                                                        if (!isAndroid &&
                                                                            !isiOS)
                                                                          TextInputFormatter.withFunction((oldValue,
                                                                              newValue) {
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
                                                              Builder(
                                                                builder:
                                                                    (context) =>
                                                                        Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      var _shouldSetState =
                                                                          false;
                                                                      if (FFAppState()
                                                                              .platform ==
                                                                          'mobile') {
                                                                        await actions
                                                                            .openCameraWebview(
                                                                          'idCard',
                                                                          'idCardOCR',
                                                                        );
                                                                      } else {
                                                                        if ((FFAppState().clientDevicePlatform ==
                                                                                'android') ||
                                                                            (FFAppState().clientDevicePlatform ==
                                                                                'ios')) {
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            isDismissible:
                                                                                false,
                                                                            enableDrag:
                                                                                false,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return GestureDetector(
                                                                                onTap: () {
                                                                                  FocusScope.of(context).unfocus();
                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                },
                                                                                child: Padding(
                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                  child: Container(
                                                                                    height: double.infinity,
                                                                                    child: CapturePictureComponentWidget(
                                                                                      imageType: 'idCard',
                                                                                      title: 'ถ่ายรูปภาพบัตรประชาชน',
                                                                                      descriptionText: 'กรุณาถ่ายรูปโดยให้บัตรประชาชนพอดีกับกรอบ',
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              safeSetState(() => _model.cameraTriggerComponentReturn = value));

                                                                          _shouldSetState =
                                                                              true;
                                                                          if (!(_model.cameraTriggerComponentReturn != null &&
                                                                              (_model.cameraTriggerComponentReturn?.bytes?.isNotEmpty ?? false))) {
                                                                            if (_shouldSetState)
                                                                              safeSetState(() {});
                                                                            return;
                                                                          }
                                                                          _model.idCardFile =
                                                                              _model.cameraTriggerComponentReturn;
                                                                          safeSetState(
                                                                              () {});
                                                                        } else {
                                                                          await showAlignedDialog(
                                                                            context:
                                                                                context,
                                                                            isGlobal:
                                                                                false,
                                                                            avoidOverflow:
                                                                                false,
                                                                            targetAnchor:
                                                                                AlignmentDirectional(0.0, 1.0).resolve(Directionality.of(context)),
                                                                            followerAnchor:
                                                                                AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                            builder:
                                                                                (dialogContext) {
                                                                              return Material(
                                                                                color: Colors.transparent,
                                                                                child: GestureDetector(
                                                                                  onTap: () {
                                                                                    FocusScope.of(dialogContext).unfocus();
                                                                                    FocusManager.instance.primaryFocus?.unfocus();
                                                                                  },
                                                                                  child: ImageSourceComponentWidget(
                                                                                    cameraType: 'normal',
                                                                                    actionName: 'idCard',
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              safeSetState(() => _model.imageSourceComponentReturn = value));

                                                                          _shouldSetState =
                                                                              true;
                                                                          _model.idCardFile =
                                                                              _model.imageSourceComponentReturn;
                                                                          safeSetState(
                                                                              () {});
                                                                        }

                                                                        showDialog(
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
                                                                                child: LoadingWidget(),
                                                                              ),
                                                                            );
                                                                          },
                                                                        );

                                                                        _model.visionOutputThaiId = await SrisawadApiGroup
                                                                            .visionThaiIdCall
                                                                            .call(
                                                                          file:
                                                                              _model.idCardFile,
                                                                          apiUrl: FFDevEnvironmentValues().isProduction
                                                                              ? FFAppState().topupUrlProd
                                                                              : FFAppState().topupUrlDev,
                                                                        );

                                                                        _shouldSetState =
                                                                            true;
                                                                        if ((_model.visionOutputThaiId?.statusCode ??
                                                                                200) !=
                                                                            200) {
                                                                          await showDialog(
                                                                            barrierDismissible:
                                                                                false,
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
                                                                                  child: ErrorMessageComponentWidget(
                                                                                    textMessage: 'กรุณาถ่ายภาพบัตรประชาชนใหม่อีกครั้ง',
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          );

                                                                          Navigator.pop(
                                                                              context);
                                                                          if (_shouldSetState)
                                                                            safeSetState(() {});
                                                                          return;
                                                                        }
                                                                        FFAppState()
                                                                            .updateSaveLeadAgentDataStruct(
                                                                          (e) => e
                                                                            ..firstName =
                                                                                getJsonField(
                                                                              (_model.visionOutputThaiId?.jsonBody ?? ''),
                                                                              r'''$.first_name''',
                                                                            ).toString()
                                                                            ..lastName =
                                                                                getJsonField(
                                                                              (_model.visionOutputThaiId?.jsonBody ?? ''),
                                                                              r'''$.last_name''',
                                                                            ).toString()
                                                                            ..registerId = getJsonField(
                                                                              (_model.visionOutputThaiId?.jsonBody ?? ''),
                                                                              r'''$.thai_id''',
                                                                            ).toString(),
                                                                        );
                                                                        safeSetState(
                                                                            () {});
                                                                        safeSetState(
                                                                            () {
                                                                          _model
                                                                              .firstNameTextController
                                                                              ?.text = FFAppState().saveLeadAgentData.firstName;
                                                                        });
                                                                        safeSetState(
                                                                            () {
                                                                          _model
                                                                              .lastNameTextController
                                                                              ?.text = FFAppState().saveLeadAgentData.lastName;
                                                                        });
                                                                        safeSetState(
                                                                            () {
                                                                          _model
                                                                              .idcardTextController
                                                                              ?.text = valueOrDefault<String>(
                                                                            functions.showThaiIdNumberForm('${FFAppState().saveLeadAgentData.registerId}'),
                                                                            'idcard',
                                                                          );
                                                                          _model
                                                                              .idcardMask
                                                                              .updateMask(
                                                                            newValue:
                                                                                TextEditingValue(
                                                                              text: _model.idcardTextController!.text,
                                                                            ),
                                                                          );
                                                                        });
                                                                        Navigator.pop(
                                                                            context);
                                                                      }

                                                                      if (_shouldSetState)
                                                                        safeSetState(
                                                                            () {});
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .camera_alt,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          36.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
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
                                                            MainAxisSize.max,
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
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  'นามสกุล',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
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
                                                                        color: FlutterFlowTheme.of(context)
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
                                                                  TextFormField(
                                                                controller: _model
                                                                    .lastNameTextController,
                                                                focusNode: _model
                                                                    .lastNameFocusNode,
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
                                                                      'ระบุนามสกุล',
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
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              4.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  focusedBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              4.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  errorBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              4.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              4.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  contentPadding:
                                                                      EdgeInsetsDirectional.fromSTEB(
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
                                                                validator: _model
                                                                    .lastNameTextControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                                inputFormatters: [
                                                                  if (!isAndroid &&
                                                                      !isiOS)
                                                                    TextInputFormatter.withFunction(
                                                                        (oldValue,
                                                                            newValue) {
                                                                      return TextEditingValue(
                                                                        selection:
                                                                            newValue.selection,
                                                                        text: newValue
                                                                            .text
                                                                            .toCapitalization(TextCapitalization.words),
                                                                      );
                                                                    }),
                                                                ],
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
                                                                    .max,
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
                                                                  'เลขบัตรประชาชน',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
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
                                                                        color: FlutterFlowTheme.of(context)
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
                                                                  TextFormField(
                                                                controller: _model
                                                                    .idcardTextController,
                                                                focusNode: _model
                                                                    .idcardFocusNode,
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
                                                                      'ระบุเลขบัตรประชาชน',
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
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              4.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  focusedBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              4.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  errorBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              4.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              4.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  contentPadding:
                                                                      EdgeInsetsDirectional.fromSTEB(
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
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                validator: _model
                                                                    .idcardTextControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                                inputFormatters: [
                                                                  _model
                                                                      .idcardMask
                                                                ],
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
                                                                    .max,
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
                                                                  'เบอร์โทรศัพท์',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
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
                                                                        color: FlutterFlowTheme.of(context)
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
                                                                  TextFormField(
                                                                controller: _model
                                                                    .textController4,
                                                                focusNode: _model
                                                                    .textFieldFocusNode1,
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
                                                                      'ระบุเบอร์โทรศัพท์',
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
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              4.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  focusedBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              4.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  errorBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              4.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              4.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  contentPadding:
                                                                      EdgeInsetsDirectional.fromSTEB(
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
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                validator: _model
                                                                    .textController4Validator
                                                                    .asValidator(
                                                                        context),
                                                                inputFormatters: [
                                                                  _model
                                                                      .textFieldMask1
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    if (((_model
                                                                    .customerConsentFlag ==
                                                                'P') ||
                                                            (_model.customerConsentFlag ==
                                                                'N') ||
                                                            (_model.customerConsentFlag ==
                                                                'Y')) &&
                                                        (FFAppState()
                                                                .platform ==
                                                            'mobile'))
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        12.0,
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
                                                                Text(
                                                                  'สถานะความยินยอมลูกค้า :',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto San Thai',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  () {
                                                                    if (_model
                                                                            .customerConsentFlag ==
                                                                        'P') {
                                                                      return 'รอลูกค้ายืนยัน';
                                                                    } else if (_model
                                                                            .customerConsentFlag ==
                                                                        'N') {
                                                                      return 'ลูกค้าไม่ยินยอม';
                                                                    } else if (_model
                                                                            .customerConsentFlag ==
                                                                        'Y') {
                                                                      return 'ลูกค้ายินยอม';
                                                                    } else {
                                                                      return '-';
                                                                    }
                                                                  }(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto San Thai',
                                                                        color:
                                                                            () {
                                                                          if (_model.customerConsentFlag ==
                                                                              'P') {
                                                                            return FlutterFlowTheme.of(context).primaryText;
                                                                          } else if (_model.customerConsentFlag ==
                                                                              'N') {
                                                                            return FlutterFlowTheme.of(context).error;
                                                                          } else if (_model.customerConsentFlag ==
                                                                              'Y') {
                                                                            return Color(0xFF4DBA2D);
                                                                          } else {
                                                                            return FlutterFlowTheme.of(context).primaryText;
                                                                          }
                                                                        }(),
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 8.0)),
                                                            ),
                                                          ),
                                                          if (_model
                                                                  .customerConsentFlag ==
                                                              'N')
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            4.0,
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
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        '***ลูกค้าไม่ยินยอมให้เก็บข้อมูลส่วนตัว ท่านไม่สามารถบันทึกข้อมูลลูกค้าต่อได้',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Noto San Thai',
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          8.0)),
                                                                ),
                                                              ),
                                                            ),
                                                          if (_model
                                                                  .customerConsentFlag ==
                                                              'P')
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          12.0,
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
                                                                  Text(
                                                                    'ระยะเวลาลูกค้ากดยืนยัน ก่อนหมดอายุ : ',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto San Thai',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                  FlutterFlowTimer(
                                                                    initialTime:
                                                                        _model
                                                                            .timerInitialTimeMs,
                                                                    getDisplayTime:
                                                                        (value) =>
                                                                            StopWatchTimer.getDisplayTime(
                                                                      value,
                                                                      hours:
                                                                          false,
                                                                      milliSecond:
                                                                          false,
                                                                    ),
                                                                    controller:
                                                                        _model
                                                                            .timerController,
                                                                    updateStateInterval:
                                                                        Duration(
                                                                            milliseconds:
                                                                                1000),
                                                                    onChanged: (value,
                                                                        displayTime,
                                                                        shouldUpdate) {
                                                                      _model.timerMilliseconds =
                                                                          value;
                                                                      _model.timerValue =
                                                                          displayTime;
                                                                      if (shouldUpdate)
                                                                        safeSetState(
                                                                            () {});
                                                                    },
                                                                    onEnded:
                                                                        () async {
                                                                      _model
                                                                          .checkConsentStatusTimer
                                                                          ?.cancel();
                                                                      _model.customerConsentFlag =
                                                                          null;
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto San Thai',
                                                                          fontSize:
                                                                              20.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        12.0)),
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    if (FFAppState().isGuest
                                                        ? false
                                                        : (!((_model
                                                                        .customerConsentFlag ==
                                                                    'P') ||
                                                                (_model.customerConsentFlag ==
                                                                    'N') ||
                                                                (_model.customerConsentFlag ==
                                                                    'Y')) &&
                                                            (FFAppState()
                                                                    .platform ==
                                                                'mobile') &&
                                                            _model.appConfig!
                                                                .isUseOtp))
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        12.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  'ระบบจะส่ง OTP ไปยังเบอร์โทรศัพท์ที่ระบุไว้ด้านบน',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto San Thai',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 8.0)),
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
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  'กรุณาให้เพื่อนของคุณทำรายการจนกว่าจะเสร็จสิ้น',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto San Thai',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 8.0)),
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
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  'กรุณาอย่าปิดหน้าจอ จนกว่าเพื่อนของคุณจะทำรายการเสร็จสิ้น',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto San Thai',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 8.0)),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    if (false)
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
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
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
                                                                child: RichText(
                                                                  textScaler: MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                                  text:
                                                                      TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text:
                                                                            'ข้าพเจ้าให้ความยินยอมกับบริษัทฯ ในการเก็บรวบรวม ใช้และเปิดเผยข้อมูลส่วนบุคคลของข้าพเจ้าในการติดต่อเพื่อเสนอผลิตภัณฑ์และบริการของบริษัทฯและรับรองว่าได้อ่านและรับทราบประกาศความเป็นส่วนตัวแล้ว \n',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Noto San Thai',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      TextSpan(
                                                                        text:
                                                                            'ประกาศความเป็นส่วนตัวแล้ว ',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Noto San Thai',
                                                                              letterSpacing: 0.0,
                                                                              decoration: TextDecoration.underline,
                                                                            ),
                                                                        mouseCursor:
                                                                            SystemMouseCursors.click,
                                                                        recognizer:
                                                                            TapGestureRecognizer()
                                                                              ..onTap = () async {
                                                                                await actions.launchUrlInApp(
                                                                                  'https://www.sawad.co.th/',
                                                                                );
                                                                              },
                                                                      )
                                                                    ],
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto San Thai',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 50.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Theme(
                                                                            data:
                                                                                ThemeData(
                                                                              checkboxTheme: CheckboxThemeData(
                                                                                visualDensity: VisualDensity.compact,
                                                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(24.0),
                                                                                ),
                                                                              ),
                                                                              unselectedWidgetColor: FlutterFlowTheme.of(context).alternate,
                                                                            ),
                                                                            child:
                                                                                Checkbox(
                                                                              value: _model.consentFlagYValue ??= false,
                                                                              onChanged: (newValue) async {
                                                                                safeSetState(() => _model.consentFlagYValue = newValue!);
                                                                                if (newValue!) {
                                                                                  safeSetState(() {
                                                                                    _model.consentFlagNValue = false;
                                                                                  });
                                                                                }
                                                                              },
                                                                              side: (FlutterFlowTheme.of(context).alternate != null)
                                                                                  ? BorderSide(
                                                                                      width: 2,
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                    )
                                                                                  : null,
                                                                              activeColor: FlutterFlowTheme.of(context).primary,
                                                                              checkColor: FlutterFlowTheme.of(context).info,
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            'ยินยอม',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Noto San Thai',
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Theme(
                                                                            data:
                                                                                ThemeData(
                                                                              checkboxTheme: CheckboxThemeData(
                                                                                visualDensity: VisualDensity.compact,
                                                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(24.0),
                                                                                ),
                                                                              ),
                                                                              unselectedWidgetColor: FlutterFlowTheme.of(context).alternate,
                                                                            ),
                                                                            child:
                                                                                Checkbox(
                                                                              value: _model.consentFlagNValue ??= false,
                                                                              onChanged: (newValue) async {
                                                                                safeSetState(() => _model.consentFlagNValue = newValue!);
                                                                                if (newValue!) {
                                                                                  safeSetState(() {
                                                                                    _model.consentFlagYValue = false;
                                                                                  });
                                                                                }
                                                                              },
                                                                              side: (FlutterFlowTheme.of(context).alternate != null)
                                                                                  ? BorderSide(
                                                                                      width: 2,
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                    )
                                                                                  : null,
                                                                              activeColor: FlutterFlowTheme.of(context).primary,
                                                                              checkColor: FlutterFlowTheme.of(context).info,
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            'ไม่ยินยอม',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Noto San Thai',
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
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
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  16.0,
                                                                  24.0,
                                                                  12.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child:
                                                                FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                context
                                                                    .safePop();
                                                              },
                                                              text:
                                                                  valueOrDefault<
                                                                      String>(
                                                                'ย้อนกลับ',
                                                                'ย้อนกลับ',
                                                              ),
                                                              options:
                                                                  FFButtonOptions(
                                                                height: 40.0,
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
                                                                    .info,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto San Thai',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16.0),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Builder(
                                                              builder: (context) =>
                                                                  FFButtonWidget(
                                                                onPressed: (FFAppState()
                                                                            .isGuest
                                                                        ? false
                                                                        : ((_model.customerConsentFlag ==
                                                                                'P') ||
                                                                            (_model.customerConsentFlag ==
                                                                                'N')))
                                                                    ? null
                                                                    : () async {
                                                                        currentUserLocationValue =
                                                                            await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
                                                                        var _shouldSetState =
                                                                            false;
                                                                        if (!(_model.firstNameTextController.text !=
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
                                                                                  child: ErrorMessageComponentWidget(
                                                                                    textMessage: 'กรุณาระบุชื่อ',
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          );

                                                                          if (_shouldSetState)
                                                                            safeSetState(() {});
                                                                          return;
                                                                        }
                                                                        if (!(_model.lastNameTextController.text !=
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
                                                                                  child: ErrorMessageComponentWidget(
                                                                                    textMessage: 'กรุณาระบุนามสกุล',
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          );

                                                                          if (_shouldSetState)
                                                                            safeSetState(() {});
                                                                          return;
                                                                        }
                                                                        if (!(_model.idcardTextController.text !=
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
                                                                                  child: ErrorMessageComponentWidget(
                                                                                    textMessage: 'กรุณาระบุเลขบัตรประชาชน',
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          );

                                                                          if (_shouldSetState)
                                                                            safeSetState(() {});
                                                                          return;
                                                                        }
                                                                        if (!functions.checkIdCard(functions.removeDash(_model
                                                                            .idcardTextController
                                                                            .text))!) {
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
                                                                                  child: ErrorMessageComponentWidget(
                                                                                    textMessage: 'เลขบัตรประชาชนไม่ถูกต้อง',
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          );

                                                                          if (_shouldSetState)
                                                                            safeSetState(() {});
                                                                          return;
                                                                        }
                                                                        if (!(_model.textController4.text !=
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
                                                                                  child: ErrorMessageComponentWidget(
                                                                                    textMessage: 'กรุณาระบุเบอร์โทรศัพท์',
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          );

                                                                          if (_shouldSetState)
                                                                            safeSetState(() {});
                                                                          return;
                                                                        }
                                                                        if (!functions.checkPhoneNumberChar(functions.removeDash(_model
                                                                            .textController4
                                                                            .text))!) {
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
                                                                                  child: ErrorMessageComponentWidget(
                                                                                    textMessage: 'เบอร์โทรศัพท์ไม่ถูกต้อง',
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          );

                                                                          if (_shouldSetState)
                                                                            safeSetState(() {});
                                                                          return;
                                                                        }
                                                                        FFAppState().saveLeadAgentData =
                                                                            SaveLeadAgentDataModelStruct(
                                                                          agentGroupId: FFAppState()
                                                                              .agentProfileDataType
                                                                              .agentGroupId,
                                                                          agentId: FFAppState()
                                                                              .agentProfileDataType
                                                                              .id
                                                                              .toString(),
                                                                          agentCode: FFAppState()
                                                                              .agentProfileDataType
                                                                              .agentCode,
                                                                          firstName: _model
                                                                              .firstNameTextController
                                                                              .text,
                                                                          lastName: _model
                                                                              .lastNameTextController
                                                                              .text,
                                                                          registerId: functions.removeDash(_model
                                                                              .idcardTextController
                                                                              .text),
                                                                          mobilePhoneNumber: functions.removeDash(_model
                                                                              .textController4
                                                                              .text),
                                                                        );
                                                                        safeSetState(
                                                                            () {});
                                                                        if (FFAppState()
                                                                            .isGuest) {
                                                                          _model.apiResultSaveGuestStep1 = await AgentAPIGroup
                                                                              .leadsSaveGuestCall
                                                                              .call(
                                                                            url: FFDevEnvironmentValues().isProduction
                                                                                ? FFAppState().apiUrlDocData.agentWebApiUrl
                                                                                : FFAppState().apiUrlDocData.agentWebApiUrlUat,
                                                                            tokenHeader: FFDevEnvironmentValues().isProduction
                                                                                ? FFAppState().apiUrlDocData.agentWebApiToken
                                                                                : FFAppState().apiUrlDocData.agentWebApiTokenUat,
                                                                            firstName:
                                                                                _model.firstNameTextController.text,
                                                                            lastName:
                                                                                _model.lastNameTextController.text,
                                                                            registerId:
                                                                                functions.removeDash(_model.idcardTextController.text),
                                                                            mobilePhoneNumber:
                                                                                functions.removeDash(_model.textController4.text),
                                                                            privacyConsentFlag:
                                                                                'N',
                                                                            privacyConsentDate:
                                                                                getCurrentTimestamp.toString(),
                                                                            step:
                                                                                '1',
                                                                            latitude:
                                                                                functions.getLatLngStringFromDevice(currentUserLocationValue, 'lat'),
                                                                            longitude:
                                                                                functions.getLatLngStringFromDevice(currentUserLocationValue, 'lng'),
                                                                            imageCar:
                                                                                _model.uploadedLocalFile_uploadDataOqf,
                                                                            utmSource:
                                                                                FFAppState().utmSourceAppState,
                                                                            utmMedium:
                                                                                FFAppState().utmMediumAppState,
                                                                            utmCampaign:
                                                                                FFAppState().utmCampaignAppState,
                                                                            subProduct:
                                                                                widget.product,
                                                                          );

                                                                          _shouldSetState =
                                                                              true;
                                                                          if ((_model.apiResultSaveGuestStep1?.statusCode ?? 200) !=
                                                                              200) {
                                                                            await showDialog(
                                                                              context: context,
                                                                              builder: (dialogContext) {
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
                                                                                    child: ErrorMessageComponentWidget(
                                                                                      textMessage: 'พบข้อผิดพลาด Connection(${(_model.apiResultSaveGuestStep1?.statusCode ?? 200).toString()})',
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );

                                                                            if (_shouldSetState)
                                                                              safeSetState(() {});
                                                                            return;
                                                                          }
                                                                          if ('${getJsonField(
                                                                                (_model.apiResultSaveGuestStep1?.jsonBody ?? ''),
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
                                                                                  alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                  child: GestureDetector(
                                                                                    onTap: () {
                                                                                      FocusScope.of(dialogContext).unfocus();
                                                                                      FocusManager.instance.primaryFocus?.unfocus();
                                                                                    },
                                                                                    child: ErrorMessageComponentWidget(
                                                                                      textMessage: '${'${getJsonField(
                                                                                        (_model.apiResultSaveGuestStep1?.jsonBody ?? ''),
                                                                                        r'''$.message''',
                                                                                      ).toString()}'}',
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );

                                                                            if (_shouldSetState)
                                                                              safeSetState(() {});
                                                                            return;
                                                                          }
                                                                          FFAppState()
                                                                              .updateSaveLeadAgentDataStruct(
                                                                            (e) => e
                                                                              ..leadMobileId = getJsonField(
                                                                                (_model.apiResultSaveGuestStep1?.jsonBody ?? ''),
                                                                                r'''$.results.data.lead_mobile_id''',
                                                                              )
                                                                              ..firstName = _model.firstNameTextController.text
                                                                              ..lastName = _model.lastNameTextController.text
                                                                              ..registerId = functions.removeDash(_model.idcardTextController.text)
                                                                              ..mobilePhoneNumber = functions.removeDash(_model.textController4.text)
                                                                              ..subProduct = widget.product,
                                                                          );
                                                                          safeSetState(
                                                                              () {});

                                                                          context
                                                                              .pushNamed(
                                                                            LeadAgentConsentPageWidget.routeName,
                                                                            queryParameters:
                                                                                {
                                                                              'ref': serializeParam(
                                                                                '',
                                                                                ParamType.String,
                                                                              ),
                                                                              'phone': serializeParam(
                                                                                functions.removeDash(_model.textController4.text),
                                                                                ParamType.String,
                                                                              ),
                                                                              'fromPage': serializeParam(
                                                                                'customer',
                                                                                ParamType.String,
                                                                              ),
                                                                              'product': serializeParam(
                                                                                widget.product,
                                                                                ParamType.String,
                                                                              ),
                                                                              'agent': serializeParam(
                                                                                '',
                                                                                ParamType.String,
                                                                              ),
                                                                              'linkId': serializeParam(
                                                                                '',
                                                                                ParamType.String,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );

                                                                          if (_shouldSetState)
                                                                            safeSetState(() {});
                                                                          return;
                                                                        }
                                                                        if (_model
                                                                            .appConfig!
                                                                            .isUseOtp) {
                                                                          if (FFAppState().platform ==
                                                                              'mobile') {
                                                                            if (_model.customerConsentFlag ==
                                                                                'Y') {
                                                                              FFAppState().updateSaveLeadAgentDataStruct(
                                                                                (e) => e..smsCode = _model.smsCode,
                                                                              );
                                                                              safeSetState(() {});
                                                                              if (widget.product == 'L') {
                                                                                context.pushNamed(LeadAgentDetailLHPageWidget.routeName);
                                                                              } else {
                                                                                context.pushNamed(
                                                                                  LeadAgentDetailCarPageWidget.routeName,
                                                                                  queryParameters: {
                                                                                    'product': serializeParam(
                                                                                      widget.product,
                                                                                      ParamType.String,
                                                                                    ),
                                                                                  }.withoutNulls,
                                                                                );
                                                                              }

                                                                              if (_shouldSetState)
                                                                                safeSetState(() {});
                                                                              return;
                                                                            }
                                                                            _model.sendConsentSmsApiOutput =
                                                                                await AgentAPIGroup.sendConsentSmsApiCall.call(
                                                                              agentCode: FFAppState().agentProfileDataType.agentCode,
                                                                              firstName: _model.firstNameTextController.text,
                                                                              lastName: _model.lastNameTextController.text,
                                                                              phoneNumber: functions.removeDash(_model.textController4.text),
                                                                              registerId: functions.removeDash(_model.idcardTextController.text),
                                                                              pathConsent: FFDevEnvironmentValues().isProduction ? FFAppState().apiUrlDocData.agentWebCustomerConsent : FFAppState().apiUrlDocData.agentWebCustomerConsentUat,
                                                                              url: FFDevEnvironmentValues().isProduction ? FFAppState().apiUrlDocData.agentWebApiUrl : FFAppState().apiUrlDocData.agentWebApiUrlUat,
                                                                              tokenHeader: FFDevEnvironmentValues().isProduction ? FFAppState().apiUrlDocData.agentWebApiToken : FFAppState().apiUrlDocData.agentWebApiTokenUat,
                                                                            );

                                                                            _shouldSetState =
                                                                                true;
                                                                            if ((_model.sendConsentSmsApiOutput?.statusCode ?? 200) !=
                                                                                200) {
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (dialogContext) {
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
                                                                                      child: ErrorMessageComponentWidget(
                                                                                        textMessage: 'พบข้อผิดพลาด Connection(${(_model.sendConsentSmsApiOutput?.statusCode ?? 200).toString()})',
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              );

                                                                              if (_shouldSetState)
                                                                                safeSetState(() {});
                                                                              return;
                                                                            }
                                                                            if ('${getJsonField(
                                                                                  (_model.sendConsentSmsApiOutput?.jsonBody ?? ''),
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
                                                                                    alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                    child: GestureDetector(
                                                                                      onTap: () {
                                                                                        FocusScope.of(dialogContext).unfocus();
                                                                                        FocusManager.instance.primaryFocus?.unfocus();
                                                                                      },
                                                                                      child: ErrorMessageComponentWidget(
                                                                                        textMessage: '${getJsonField(
                                                                                          (_model.sendConsentSmsApiOutput?.jsonBody ?? ''),
                                                                                          r'''$.message''',
                                                                                        ).toString()}',
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              );

                                                                              if (_shouldSetState)
                                                                                safeSetState(() {});
                                                                              return;
                                                                            }
                                                                            _model.customerConsentFlag =
                                                                                'P';
                                                                            safeSetState(() {});
                                                                            _model.timerController.onResetTimer();

                                                                            await Future.delayed(
                                                                              Duration(
                                                                                milliseconds: 200,
                                                                              ),
                                                                            );
                                                                            _model.timerController.onStartTimer();
                                                                            _model.checkConsentStatusTimer =
                                                                                InstantTimer.periodic(
                                                                              duration: Duration(milliseconds: 5000),
                                                                              callback: (timer) async {
                                                                                _model.checkConsentStatusApiOutput = await AgentAPIGroup.checkConsentStatusApiCall.call(
                                                                                  agentCode: FFAppState().agentProfileDataType.agentCode,
                                                                                  phoneNumber: functions.removeDash(_model.textController4.text),
                                                                                  token: AgentAPIGroup.sendConsentSmsApiCall.token(
                                                                                    (_model.sendConsentSmsApiOutput?.jsonBody ?? ''),
                                                                                  ),
                                                                                  url: FFDevEnvironmentValues().isProduction ? FFAppState().apiUrlDocData.agentWebApiUrl : FFAppState().apiUrlDocData.agentWebApiUrlUat,
                                                                                  tokenHeader: FFDevEnvironmentValues().isProduction ? FFAppState().apiUrlDocData.agentWebApiToken : FFAppState().apiUrlDocData.agentWebApiTokenUat,
                                                                                );

                                                                                _shouldSetState = true;
                                                                                if ((_model.checkConsentStatusApiOutput?.statusCode ?? 200) != 200) {
                                                                                  await showDialog(
                                                                                    context: context,
                                                                                    builder: (dialogContext) {
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
                                                                                          child: ErrorMessageComponentWidget(
                                                                                            textMessage: 'พบข้อผิดพลาด Connection(${(_model.checkConsentStatusApiOutput?.statusCode ?? 200).toString()})',
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  );

                                                                                  if (_shouldSetState) safeSetState(() {});
                                                                                  return;
                                                                                }
                                                                                if ('${getJsonField(
                                                                                      (_model.checkConsentStatusApiOutput?.jsonBody ?? ''),
                                                                                      r'''$.code''',
                                                                                    ).toString()}' !=
                                                                                    '404') {
                                                                                  _model.customerConsentFlag = '${AgentAPIGroup.checkConsentStatusApiCall.isConsent(
                                                                                    (_model.checkConsentStatusApiOutput?.jsonBody ?? ''),
                                                                                  )}';
                                                                                  _model.smsCode = '${AgentAPIGroup.checkConsentStatusApiCall.token(
                                                                                    (_model.checkConsentStatusApiOutput?.jsonBody ?? ''),
                                                                                  )}';
                                                                                  safeSetState(() {});
                                                                                } else {
                                                                                  await showDialog(
                                                                                    context: context,
                                                                                    builder: (dialogContext) {
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
                                                                                          child: ErrorMessageComponentWidget(
                                                                                            textMessage: '${getJsonField(
                                                                                              (_model.checkConsentStatusApiOutput?.jsonBody ?? ''),
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

                                                                                if (_model.customerConsentFlag != 'P') {
                                                                                  _model.timerController.onStopTimer();
                                                                                  _model.timerController.onResetTimer();

                                                                                  _model.checkConsentStatusTimer?.cancel();
                                                                                }
                                                                              },
                                                                              startImmediately: false,
                                                                            );
                                                                          } else {
                                                                            context.pushNamed(
                                                                              LeadAgentConsentPageWidget.routeName,
                                                                              queryParameters: {
                                                                                'ref': serializeParam(
                                                                                  '',
                                                                                  ParamType.String,
                                                                                ),
                                                                                'phone': serializeParam(
                                                                                  functions.removeDash(_model.textController4.text),
                                                                                  ParamType.String,
                                                                                ),
                                                                                'fromPage': serializeParam(
                                                                                  'customer',
                                                                                  ParamType.String,
                                                                                ),
                                                                                'product': serializeParam(
                                                                                  widget.product,
                                                                                  ParamType.String,
                                                                                ),
                                                                                'agent': serializeParam(
                                                                                  FFAppState().saveLeadAgentData.agentCode,
                                                                                  ParamType.String,
                                                                                ),
                                                                                'linkId': serializeParam(
                                                                                  '',
                                                                                  ParamType.String,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          }
                                                                        } else {
                                                                          if ((FFAppState().platform == 'mobile') ||
                                                                              loggedIn) {
                                                                            if (widget.product ==
                                                                                'L') {
                                                                              context.pushNamed(LeadAgentDetailLHPageWidget.routeName);
                                                                            } else {
                                                                              context.pushNamed(
                                                                                LeadAgentDetailCarPageWidget.routeName,
                                                                                queryParameters: {
                                                                                  'product': serializeParam(
                                                                                    widget.product,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                              );
                                                                            }
                                                                          } else {
                                                                            context.pushNamed(
                                                                              LeadAgentConsentPageWidget.routeName,
                                                                              queryParameters: {
                                                                                'ref': serializeParam(
                                                                                  '',
                                                                                  ParamType.String,
                                                                                ),
                                                                                'phone': serializeParam(
                                                                                  functions.removeDash(_model.textController4.text),
                                                                                  ParamType.String,
                                                                                ),
                                                                                'fromPage': serializeParam(
                                                                                  'customer',
                                                                                  ParamType.String,
                                                                                ),
                                                                                'product': serializeParam(
                                                                                  widget.product,
                                                                                  ParamType.String,
                                                                                ),
                                                                                'agent': serializeParam(
                                                                                  FFAppState().saveLeadAgentData.agentCode,
                                                                                  ParamType.String,
                                                                                ),
                                                                                'linkId': serializeParam(
                                                                                  '',
                                                                                  ParamType.String,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          }
                                                                        }

                                                                        if (_shouldSetState)
                                                                          safeSetState(
                                                                              () {});
                                                                      },
                                                                text: (FFAppState()
                                                                            .isGuest
                                                                        ? false
                                                                        : ((_model.customerConsentFlag != 'N') &&
                                                                            (_model.customerConsentFlag !=
                                                                                'Y') &&
                                                                            _model.appConfig!.isUseOtp))
                                                                    ? 'ส่งข้อความยินยอมการเก็บข้อมูลส่วนตัว'
                                                                    : 'ถัดไป',
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 40.0,
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
                                                                  color: (FFAppState()
                                                                              .isGuest
                                                                          ? false
                                                                          : ((_model.customerConsentFlag != 'N') &&
                                                                              (_model.customerConsentFlag !=
                                                                                  'Y') &&
                                                                              _model
                                                                                  .appConfig!.isUseOtp))
                                                                      ? Color(
                                                                          0xFFFCEFE4)
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto San Thai',
                                                                        color: (FFAppState().isGuest
                                                                                ? false
                                                                                : ((_model.customerConsentFlag != 'N') && (_model.customerConsentFlag != 'Y') && _model.appConfig!.isUseOtp))
                                                                            ? FlutterFlowTheme.of(context).primary
                                                                            : FlutterFlowTheme.of(context).secondaryBackground,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  elevation:
                                                                      0.0,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                  disabledColor:
                                                                      Color(
                                                                          0x7FDB771A),
                                                                  disabledTextColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 12.0)),
                                                      ),
                                                    ),
                                                    if (FFAppState().isGuest
                                                        ? false
                                                        : (((_model
                                                                        .customerConsentFlag ==
                                                                    'P') ||
                                                                (_model.customerConsentFlag ==
                                                                    'N') ||
                                                                (_model.customerConsentFlag ==
                                                                    'Y')) &&
                                                            (FFAppState()
                                                                    .platform ==
                                                                'mobile')))
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        12.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  'ระบบจะส่ง OTP ไปยังเบอร์โทรศัพท์ที่ระบุไว้ด้านบน',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto San Thai',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 8.0)),
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
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  'กรุณาให้เพื่อนของคุณทำรายการจนกว่าจะเสร็จสิ้น',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto San Thai',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 8.0)),
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
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  'กรุณาอย่าปิดหน้าจอ จนกว่าเพื่อนของคุณจะทำรายการเสร็จสิ้น',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto San Thai',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 8.0)),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    if (false)
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          if (false)
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
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'วงเงินที่ต้องการ',
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Noto San Thai',
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
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
                                                                          '*',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Noto San Thai',
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        50.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            _model.textController5,
                                                                        focusNode:
                                                                            _model.textFieldFocusNode2,
                                                                        autofocus:
                                                                            false,
                                                                        textCapitalization:
                                                                            TextCapitalization.words,
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          labelStyle: FlutterFlowTheme.of(context)
                                                                              .labelLarge
                                                                              .override(
                                                                                fontFamily: 'Noto San Thai',
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          hintText:
                                                                              'ระบุวงเงินที่ต้องการ',
                                                                          hintStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: 'Noto San Thai',
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          enabledBorder:
                                                                              UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                const BorderRadius.only(
                                                                              topLeft: Radius.circular(4.0),
                                                                              topRight: Radius.circular(4.0),
                                                                            ),
                                                                          ),
                                                                          focusedBorder:
                                                                              UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                const BorderRadius.only(
                                                                              topLeft: Radius.circular(4.0),
                                                                              topRight: Radius.circular(4.0),
                                                                            ),
                                                                          ),
                                                                          errorBorder:
                                                                              UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                const BorderRadius.only(
                                                                              topLeft: Radius.circular(4.0),
                                                                              topRight: Radius.circular(4.0),
                                                                            ),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                const BorderRadius.only(
                                                                              topLeft: Radius.circular(4.0),
                                                                              topRight: Radius.circular(4.0),
                                                                            ),
                                                                          ),
                                                                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              16.0,
                                                                              16.0,
                                                                              8.0),
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .override(
                                                                              fontFamily: 'Noto San Thai',
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                              lineHeight: 1.0,
                                                                            ),
                                                                        maxLines:
                                                                            null,
                                                                        keyboardType:
                                                                            TextInputType.number,
                                                                        validator: _model
                                                                            .textController5Validator
                                                                            .asValidator(context),
                                                                        inputFormatters: [
                                                                          if (!isAndroid &&
                                                                              !isiOS)
                                                                            TextInputFormatter.withFunction((oldValue,
                                                                                newValue) {
                                                                              return TextEditingValue(
                                                                                selection: newValue.selection,
                                                                                text: newValue.text.toCapitalization(TextCapitalization.words),
                                                                              );
                                                                            }),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          if (false)
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
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'เวลาที่สะดวกให้ติดต่อ',
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Noto San Thai',
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      final _datePickedTime =
                                                                          await showTimePicker(
                                                                        context:
                                                                            context,
                                                                        initialTime:
                                                                            TimeOfDay.fromDateTime(getCurrentTimestamp),
                                                                        builder:
                                                                            (context,
                                                                                child) {
                                                                          return wrapInMaterialTimePickerTheme(
                                                                            context,
                                                                            child!,
                                                                            headerBackgroundColor:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            headerForegroundColor:
                                                                                FlutterFlowTheme.of(context).info,
                                                                            headerTextStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                  fontFamily: 'Noto San Thai',
                                                                                  fontSize: 32.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                            pickerBackgroundColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            pickerForegroundColor:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            selectedDateTimeBackgroundColor:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            selectedDateTimeForegroundColor:
                                                                                FlutterFlowTheme.of(context).info,
                                                                            actionButtonForegroundColor:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            iconSize:
                                                                                24.0,
                                                                          );
                                                                        },
                                                                      );
                                                                      if (_datePickedTime !=
                                                                          null) {
                                                                        safeSetState(
                                                                            () {
                                                                          _model.datePicked =
                                                                              DateTime(
                                                                            getCurrentTimestamp.year,
                                                                            getCurrentTimestamp.month,
                                                                            getCurrentTimestamp.day,
                                                                            _datePickedTime.hour,
                                                                            _datePickedTime.minute,
                                                                          );
                                                                        });
                                                                      } else if (_model
                                                                              .datePicked !=
                                                                          null) {
                                                                        safeSetState(
                                                                            () {
                                                                          _model.datePicked =
                                                                              getCurrentTimestamp;
                                                                        });
                                                                      }
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                          50.0,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              0.0,
                                                                              16.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            _model.datePicked != null
                                                                                ? dateTimeFormat(
                                                                                    "Hm",
                                                                                    _model.datePicked,
                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                  )
                                                                                : 'ระบุเวลาที่สะดวกให้ติดต่อ',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Noto San Thai',
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Divider(
                                                                    thickness:
                                                                        2.0,
                                                                    indent:
                                                                        16.0,
                                                                    endIndent:
                                                                        16.0,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    if (false)
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
                                                                    'ประเภทสินทรัพย์',
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
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
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
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 50.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child:
                                                                  FlutterFlowDropDown<
                                                                      String>(
                                                                controller: _model
                                                                        .dropDownLoanTypeValueController ??=
                                                                    FormFieldController<
                                                                        String>(
                                                                  _model.dropDownLoanTypeValue ??=
                                                                      '',
                                                                ),
                                                                options: List<String>.from(_model
                                                                    .masterLoanTypeData
                                                                    .map((e) =>
                                                                        e.vehicleCode)
                                                                    .toList()),
                                                                optionLabels: _model
                                                                    .masterLoanTypeData
                                                                    .map((e) =>
                                                                        e.vehicleName)
                                                                    .toList(),
                                                                onChanged:
                                                                    (val) async {
                                                                  safeSetState(() =>
                                                                      _model.dropDownLoanTypeValue =
                                                                          val);
                                                                  _model.productSelected = _model
                                                                      .masterLoanTypeData
                                                                      .elementAtOrNull(functions.findIndexInList(
                                                                          _model
                                                                              .masterLoanTypeData
                                                                              .map((e) => e.vehicleCode)
                                                                              .toList(),
                                                                          _model.dropDownLoanTypeValue)!);
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                width: 200.0,
                                                                height: 40.0,
                                                                textStyle: FlutterFlowTheme.of(
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
                                                                hintText:
                                                                    'ระบุประเภทสินทรัพย์',
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
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                                hidesUnderline:
                                                                    true,
                                                                isOverButton:
                                                                    false,
                                                                isSearchable:
                                                                    false,
                                                                isMultiSelect:
                                                                    false,
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
                                                    if ((_model.productSelected
                                                                ?.vehicleCode !=
                                                            'LH') &&
                                                        (_model.productSelected
                                                                ?.vehicleCode !=
                                                            'LA') &&
                                                        false)
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
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Container(
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
                                                                  controller: _model
                                                                      .textController6,
                                                                  focusNode: _model
                                                                      .textFieldFocusNode3,
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
                                                                        'ระบุทะเบียน',
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(4.0),
                                                                        topRight:
                                                                            Radius.circular(4.0),
                                                                      ),
                                                                    ),
                                                                    contentPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
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
                                                                      .textController6Validator
                                                                      .asValidator(
                                                                          context),
                                                                  inputFormatters: [
                                                                    if (!isAndroid &&
                                                                        !isiOS)
                                                                      TextInputFormatter.withFunction(
                                                                          (oldValue,
                                                                              newValue) {
                                                                        return TextEditingValue(
                                                                          selection:
                                                                              newValue.selection,
                                                                          text: newValue
                                                                              .text
                                                                              .toCapitalization(TextCapitalization.words),
                                                                        );
                                                                      }),
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
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (false)
                                    Container(
                                      width: double.infinity,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Builder(
                                                builder: (context) =>
                                                    FFButtonWidget(
                                                  onPressed: () async {
                                                    var _shouldSetState = false;
                                                    await showDialog(
                                                      context: context,
                                                      builder: (dialogContext) {
                                                        return Dialog(
                                                          elevation: 0,
                                                          insetPadding:
                                                              EdgeInsets.zero,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          alignment: AlignmentDirectional(
                                                                  0.0, 0.0)
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
                                                                ConfirmDialogComponentWidget(
                                                              textMessage:
                                                                  'คุณต้องการจะยกเลิกทำรายการนี้หรือไม่?',
                                                              cancelButtonText:
                                                                  'ยกเลิก',
                                                              confirmButtonText:
                                                                  'ยืนยัน',
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() => _model
                                                                .confirmOutput =
                                                            value));

                                                    _shouldSetState = true;
                                                    if (!_model
                                                        .confirmOutput!) {
                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                      return;
                                                    }
                                                    context.safePop();
                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                  },
                                                  text: valueOrDefault<String>(
                                                    'ย้อนกลับ',
                                                    'ย้อนกลับ',
                                                  ),
                                                  options: FFButtonOptions(
                                                    height: 60.0,
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
                                                        .info,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Noto San Thai',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Builder(
                                                builder: (context) =>
                                                    FFButtonWidget(
                                                  onPressed: ((_model.firstNameTextController.text ==
                                                                  '') ||
                                                          (_model.lastNameTextController.text ==
                                                                  '') ||
                                                          (_model.idcardTextController.text ==
                                                                  '') ||
                                                          (_model.textController4
                                                                      .text ==
                                                                  '') ||
                                                          (_model.textController5
                                                                      .text ==
                                                                  '') ||
                                                          (_model.dropDownLoanTypeValue ==
                                                                  null ||
                                                              _model.dropDownLoanTypeValue == ''))
                                                      ? null
                                                      : () async {
                                                          if (!false) {
                                                            if (!(_model.firstNameTextController
                                                                        .text !=
                                                                    '')) {
                                                              await showDialog(
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
                                                                          ErrorMessageComponentWidget(
                                                                        textMessage:
                                                                            'กรุณาระบุชื่อ',
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );

                                                              return;
                                                            }
                                                            if (!(_model.lastNameTextController
                                                                        .text !=
                                                                    '')) {
                                                              await showDialog(
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
                                                                          ErrorMessageComponentWidget(
                                                                        textMessage:
                                                                            'กรุณาระบุนามสกุล',
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );

                                                              return;
                                                            }
                                                            if (!(_model.idcardTextController
                                                                        .text !=
                                                                    '')) {
                                                              await showDialog(
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
                                                                          ErrorMessageComponentWidget(
                                                                        textMessage:
                                                                            'กรุณาระบุเลขบัตรประชาชน',
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );

                                                              return;
                                                            }
                                                            if (!functions.checkIdCard(
                                                                functions.removeDash(_model
                                                                    .idcardTextController
                                                                    .text))!) {
                                                              await showDialog(
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
                                                                          ErrorMessageComponentWidget(
                                                                        textMessage:
                                                                            'เลขบัตรประชาชนไม่ถูกต้อง',
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );

                                                              return;
                                                            }
                                                            if (!(_model.textController4
                                                                        .text !=
                                                                    '')) {
                                                              await showDialog(
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
                                                                          ErrorMessageComponentWidget(
                                                                        textMessage:
                                                                            'กรุณาระบุเบอร์โทรศัพท์',
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );

                                                              return;
                                                            }
                                                            if (!functions.checkPhoneNumberChar(
                                                                functions.removeDash(_model
                                                                    .textController4
                                                                    .text))!) {
                                                              await showDialog(
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
                                                                          ErrorMessageComponentWidget(
                                                                        textMessage:
                                                                            'เบอร์โทรศัพท์ไม่ถูกต้อง',
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );

                                                              return;
                                                            }
                                                            if (!(_model.textController5
                                                                        .text !=
                                                                    '')) {
                                                              await showDialog(
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
                                                                          ErrorMessageComponentWidget(
                                                                        textMessage:
                                                                            'กรุณาระบุวงเงินที่ต้องการ',
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );

                                                              return;
                                                            }
                                                            if (!(_model.dropDownLoanTypeValue !=
                                                                    null &&
                                                                _model.dropDownLoanTypeValue !=
                                                                    '')) {
                                                              await showDialog(
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
                                                                          ErrorMessageComponentWidget(
                                                                        textMessage:
                                                                            'กรุณาระบุประเภทสินทรัพย์',
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );

                                                              return;
                                                            }
                                                            FFAppState()
                                                                    .saveLeadAgentData =
                                                                SaveLeadAgentDataModelStruct(
                                                              agentGroupId: FFAppState()
                                                                  .agentProfileDataType
                                                                  .agentGroupId,
                                                              agentId: FFAppState()
                                                                  .agentProfileDataType
                                                                  .id
                                                                  .toString(),
                                                              agentCode: FFAppState()
                                                                  .agentProfileDataType
                                                                  .agentCode,
                                                              firstName: _model
                                                                  .firstNameTextController
                                                                  .text,
                                                              lastName: _model
                                                                  .lastNameTextController
                                                                  .text,
                                                              registerId: functions
                                                                  .removeDash(_model
                                                                      .idcardTextController
                                                                      .text),
                                                              mobilePhoneNumber:
                                                                  functions.removeDash(
                                                                      _model
                                                                          .textController4
                                                                          .text),
                                                              contactTime: _model
                                                                          .datePicked !=
                                                                      null
                                                                  ? _model
                                                                      .datePicked
                                                                      ?.toString()
                                                                  : '',
                                                              loanAmount: functions
                                                                  .removeCommaFromNumText(
                                                                      _model
                                                                          .textController5
                                                                          .text),
                                                              loanTypeId: _model
                                                                  .productSelected
                                                                  ?.vehicleId,
                                                              loanTypeCode: _model
                                                                  .productSelected
                                                                  ?.vehicleCode,
                                                              loanTypeName: _model
                                                                  .productSelected
                                                                  ?.vehicleName,
                                                              privacyConsentFlag:
                                                                  _model.consentFlagYValue!
                                                                      ? 'Y'
                                                                      : 'N',
                                                              privacyConsentDate:
                                                                  getCurrentTimestamp
                                                                      .toString(),
                                                              carRegistration: (_model
                                                                              .productSelected
                                                                              ?.vehicleCode !=
                                                                          'LH') ||
                                                                      (_model.productSelected
                                                                              ?.vehicleCode !=
                                                                          'LA')
                                                                  ? _model
                                                                      .textController6
                                                                      .text
                                                                  : '',
                                                            );
                                                            safeSetState(() {});
                                                            if ((_model.productSelected
                                                                        ?.vehicleCode ==
                                                                    'LH') ||
                                                                (_model.productSelected
                                                                        ?.vehicleCode ==
                                                                    'LA')) {
                                                              context.pushNamed(
                                                                LeadAgentDetailLHPageWidget
                                                                    .routeName,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  '__transition_info__':
                                                                      TransitionInfo(
                                                                    hasTransition:
                                                                        true,
                                                                    transitionType:
                                                                        PageTransitionType
                                                                            .rightToLeft,
                                                                  ),
                                                                },
                                                              );
                                                            } else {
                                                              context.pushNamed(
                                                                LeadAgentDetailCarPageWidget
                                                                    .routeName,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  '__transition_info__':
                                                                      TransitionInfo(
                                                                    hasTransition:
                                                                        true,
                                                                    transitionType:
                                                                        PageTransitionType
                                                                            .rightToLeft,
                                                                  ),
                                                                },
                                                              );
                                                            }
                                                          }
                                                        },
                                                  text: 'ถัดไป',
                                                  options: FFButtonOptions(
                                                    height: 60.0,
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
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    disabledColor:
                                                        Color(0x7FDB771A),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 12.0)),
                                        ),
                                      ),
                                    ),
                                ].addToStart(SizedBox(height: 12.0)),
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              final selectedMedia =
                                  await selectMediaWithSourceBottomSheet(
                                context: context,
                                allowPhoto: true,
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                safeSetState(() => _model
                                    .isDataUploading_uploadDataOqf = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];

                                try {
                                  selectedUploadedFiles = selectedMedia
                                      .map((m) => FFUploadedFile(
                                            name: m.storagePath.split('/').last,
                                            bytes: m.bytes,
                                            height: m.dimensions?.height,
                                            width: m.dimensions?.width,
                                            blurHash: m.blurHash,
                                            originalFilename:
                                                m.originalFilename,
                                          ))
                                      .toList();
                                } finally {
                                  _model.isDataUploading_uploadDataOqf = false;
                                }
                                if (selectedUploadedFiles.length ==
                                    selectedMedia.length) {
                                  safeSetState(() {
                                    _model.uploadedLocalFile_uploadDataOqf =
                                        selectedUploadedFiles.first;
                                  });
                                } else {
                                  safeSetState(() {});
                                  return;
                                }
                              }
                            },
                            child: Container(
                              width: 1.0,
                              height: 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
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
          )),
    );
  }
}
