import '/agent_customer/drop_lead/progress_bar_component/progress_bar_component_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/error_message_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/loading/loading_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'lead_agent_detail_car_page_model.dart';
export 'lead_agent_detail_car_page_model.dart';

class LeadAgentDetailCarPageWidget extends StatefulWidget {
  const LeadAgentDetailCarPageWidget({super.key});

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
      _model.apiResultGear = await AgentAPIGroup.agentRateSearchCall.call(
        carVehicleCode: FFAppState().saveLeadAgentData.loanTypeCode,
      );

      if ((_model.apiResultGear?.statusCode ?? 200) != 200) {
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
                      'พบข้อผิดพลาด connection (${(_model.apiResultGear?.statusCode ?? 200).toString()})',
                ),
              ),
            );
          },
        );

        return;
      }
      if (AgentAPIGroup.agentRateSearchCall.code(
            (_model.apiResultGear?.jsonBody ?? ''),
          ) !=
          200) {
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
                  textMessage: '${AgentAPIGroup.agentRateSearchCall.message(
                    (_model.apiResultGear?.jsonBody ?? ''),
                  )}',
                ),
              ),
            );
          },
        );

        return;
      }
      _model.gearMasterPageState = AgentAPIGroup.agentRateSearchCall
          .gear(
            (_model.apiResultGear?.jsonBody ?? ''),
          )!
          .toList()
          .cast<MasterAgentGearModelStruct>();
      _model.brandMasterPageState = [];
      _model.modelMasterPageState = [];
      _model.ccMasterPageState = [];
      safeSetState(() {});
      if (!(_model.gearMasterPageState.isNotEmpty)) {
        _model.canNextButton = true;
        safeSetState(() {});
      }
      Navigator.pop(context);
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
            duration: 600.0.ms,
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
                'กรอกข้อมูลลูกค้า',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
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
          ),
          body: SafeArea(
            top: true,
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                width: double.infinity,
                constraints: BoxConstraints(
                  maxWidth: 670.0,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
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
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              wrapWithModel(
                                model: _model.progressBarComponentModel,
                                updateCallback: () => safeSetState(() {}),
                                child: ProgressBarComponentWidget(
                                  step: '2',
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 22.0,
                                      child: VerticalDivider(
                                        thickness: 4.0,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                    Text(
                                      'เช็คเรทรถ (Rate Book)',
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
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'ประเภทรถ',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto San Thai',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            '*',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto San Thai',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 50.0,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .dropDownVehicleValueController ??=
                                              FormFieldController<String>(
                                            _model.dropDownVehicleValue ??=
                                                FFAppState()
                                                    .saveLeadAgentData
                                                    .loanTypeName,
                                          ),
                                          options: [
                                            FFAppState()
                                                .saveLeadAgentData
                                                .loanTypeName
                                          ],
                                          onChanged: (val) async {
                                            safeSetState(() => _model
                                                .dropDownVehicleValue = val);
                                            _model.canNextButton = false;
                                            safeSetState(() {});
                                          },
                                          width: 200.0,
                                          height: 40.0,
                                          searchHintTextStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Noto San Thai',
                                                    letterSpacing: 0.0,
                                                    lineHeight: 1.0,
                                                  ),
                                          searchTextStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Noto San Thai',
                                                    letterSpacing: 0.0,
                                                  ),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Noto San Thai',
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintText: 'ระบุประเภทรถ',
                                          searchHintText: 'เลือกประเภทรถ',
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          elevation: 2.0,
                                          borderColor: Colors.transparent,
                                          borderWidth: 0.0,
                                          borderRadius: 8.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          disabled: true,
                                          isOverButton: false,
                                          isSearchable: true,
                                          isMultiSelect: false,
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
                                  (_model.gearMasterPageState.isNotEmpty))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'เกียร์',
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Noto San Thai',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              '*',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Noto San Thai',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 50.0,
                                        decoration: BoxDecoration(),
                                        child: Builder(
                                          builder: (context) => Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .dropDownGearValueController ??=
                                                  FormFieldController<String>(
                                                _model.dropDownGearValue ??= '',
                                              ),
                                              options: List<String>.from(_model
                                                  .gearMasterPageState
                                                  .map((e) => e.gearId)
                                                  .toList()),
                                              optionLabels: _model
                                                  .gearMasterPageState
                                                  .map((e) => e.gearName)
                                                  .toList(),
                                              onChanged: (val) async {
                                                safeSetState(() => _model
                                                    .dropDownGearValue = val);
                                                var _shouldSetState = false;
                                                _model.canNextButton = false;
                                                safeSetState(() {});
                                                showDialog(
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
                                                        child: LoadingWidget(),
                                                      ),
                                                    );
                                                  },
                                                );

                                                _model.apiResultBrand =
                                                    await AgentAPIGroup
                                                        .agentRateSearchCall
                                                        .call(
                                                  carVehicleCode: FFAppState()
                                                      .saveLeadAgentData
                                                      .loanTypeCode,
                                                  carGear:
                                                      _model.dropDownGearValue,
                                                );

                                                _shouldSetState = true;
                                                if ((_model.apiResultBrand
                                                            ?.statusCode ??
                                                        200) !=
                                                    200) {
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
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child:
                                                              ErrorMessageComponentWidget(
                                                            textMessage:
                                                                'พบข้อผิดพลาด connection (${(_model.apiResultBrand?.statusCode ?? 200).toString()})',
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );

                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                                if (AgentAPIGroup
                                                        .agentRateSearchCall
                                                        .code(
                                                      (_model.apiResultBrand
                                                              ?.jsonBody ??
                                                          ''),
                                                    ) !=
                                                    200) {
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
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child:
                                                              ErrorMessageComponentWidget(
                                                            textMessage:
                                                                '${AgentAPIGroup.agentRateSearchCall.message(
                                                              (_model.apiResultBrand
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
                                                safeSetState(() {
                                                  _model
                                                      .dropDownBrandValueController
                                                      ?.reset();
                                                  _model
                                                      .dropDownYearValueController
                                                      ?.reset();
                                                  _model
                                                      .dropDownModelValueController
                                                      ?.reset();
                                                  _model
                                                      .dropDownCCValueController
                                                      ?.reset();
                                                });
                                                safeSetState(() {
                                                  _model.textController
                                                      ?.clear();
                                                });
                                                _model.brandMasterPageState =
                                                    AgentAPIGroup
                                                        .agentRateSearchCall
                                                        .brand(
                                                          (_model.apiResultBrand
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!
                                                        .toList()
                                                        .cast<
                                                            MasterAgentBrandModelStruct>();
                                                _model.modelMasterPageState =
                                                    [];
                                                _model.ccMasterPageState = [];
                                                safeSetState(() {});
                                                if (!(_model
                                                    .brandMasterPageState
                                                    .isNotEmpty)) {
                                                  _model.canNextButton = true;
                                                  safeSetState(() {});
                                                }
                                                Navigator.pop(context);
                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                              },
                                              width: 200.0,
                                              height: 40.0,
                                              searchHintTextStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto San Thai',
                                                        letterSpacing: 0.0,
                                                      ),
                                              searchTextStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto San Thai',
                                                        letterSpacing: 0.0,
                                                      ),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto San Thai',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText: 'ระบุเกียร์',
                                              searchHintText: 'ค้นหา ...',
                                              icon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              elevation: 2.0,
                                              borderColor: Colors.transparent,
                                              borderWidth: 0.0,
                                              borderRadius: 8.0,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              isOverButton: false,
                                              isSearchable: true,
                                              isMultiSelect: false,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ).animateOnPageLoad(animationsMap[
                                      'columnOnPageLoadAnimation1']!),
                                ),
                              if ((_model.dropDownGearValue != null &&
                                      _model.dropDownGearValue != '') &&
                                  (_model.brandMasterPageState.isNotEmpty))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'ยี่ห้อรถ',
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Noto San Thai',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              '*',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Noto San Thai',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 50.0,
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .dropDownBrandValueController ??=
                                                FormFieldController<String>(
                                              _model.dropDownBrandValue ??= '',
                                            ),
                                            options: List<String>.from(_model
                                                .brandMasterPageState
                                                .map((e) => e.brandId)
                                                .toList()),
                                            optionLabels: _model
                                                .brandMasterPageState
                                                .map((e) => e.brandName)
                                                .toList(),
                                            onChanged: (val) async {
                                              safeSetState(() => _model
                                                  .dropDownBrandValue = val);
                                              safeSetState(() {
                                                _model
                                                    .dropDownYearValueController
                                                    ?.reset();
                                                _model
                                                    .dropDownModelValueController
                                                    ?.reset();
                                                _model.dropDownCCValueController
                                                    ?.reset();
                                              });
                                              safeSetState(() {
                                                _model.textController?.clear();
                                              });
                                            },
                                            width: 200.0,
                                            height: 40.0,
                                            searchHintTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily:
                                                          'Noto San Thai',
                                                      letterSpacing: 0.0,
                                                    ),
                                            searchTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          'Noto San Thai',
                                                      letterSpacing: 0.0,
                                                    ),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          'Noto San Thai',
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintText: 'ระบุยี่ห้อรถ',
                                            searchHintText: 'ค้นหา ...',
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2.0,
                                            borderColor: Colors.transparent,
                                            borderWidth: 0.0,
                                            borderRadius: 8.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            isOverButton: false,
                                            isSearchable: true,
                                            isMultiSelect: false,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ).animateOnPageLoad(animationsMap[
                                      'columnOnPageLoadAnimation2']!),
                                ),
                              if (_model.dropDownBrandValue != null &&
                                  _model.dropDownBrandValue != '')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'ปีผลิต',
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Noto San Thai',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              '*',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Noto San Thai',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 50.0,
                                        decoration: BoxDecoration(),
                                        child: Builder(
                                          builder: (context) => Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .dropDownYearValueController ??=
                                                  FormFieldController<String>(
                                                      null),
                                              options:
                                                  functions.generateListYear(
                                                      2025, 1972)!,
                                              onChanged: (val) async {
                                                safeSetState(() => _model
                                                    .dropDownYearValue = val);
                                                var _shouldSetState = false;
                                                _model.canNextButton = false;
                                                safeSetState(() {});
                                                showDialog(
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
                                                        child: LoadingWidget(),
                                                      ),
                                                    );
                                                  },
                                                );

                                                _model.apiResultModel =
                                                    await AgentAPIGroup
                                                        .agentRateSearchCall
                                                        .call(
                                                  carVehicleCode: FFAppState()
                                                      .saveLeadAgentData
                                                      .loanTypeCode,
                                                  carGear:
                                                      _model.dropDownGearValue,
                                                  carBrand:
                                                      _model.dropDownBrandValue,
                                                  carYear:
                                                      _model.dropDownYearValue,
                                                );

                                                _shouldSetState = true;
                                                if ((_model.apiResultModel
                                                            ?.statusCode ??
                                                        200) !=
                                                    200) {
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
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child:
                                                              ErrorMessageComponentWidget(
                                                            textMessage:
                                                                'พบข้อผิดพลาด connection (${(_model.apiResultModel?.statusCode ?? 200).toString()})',
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );

                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                                if (AgentAPIGroup
                                                        .agentRateSearchCall
                                                        .code(
                                                      (_model.apiResultModel
                                                              ?.jsonBody ??
                                                          ''),
                                                    ) !=
                                                    200) {
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
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child:
                                                              ErrorMessageComponentWidget(
                                                            textMessage:
                                                                '${AgentAPIGroup.agentRateSearchCall.message(
                                                              (_model.apiResultModel
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
                                                safeSetState(() {
                                                  _model
                                                      .dropDownModelValueController
                                                      ?.reset();
                                                  _model
                                                      .dropDownCCValueController
                                                      ?.reset();
                                                });
                                                safeSetState(() {
                                                  _model.textController
                                                      ?.clear();
                                                });
                                                _model.modelMasterPageState =
                                                    AgentAPIGroup
                                                        .agentRateSearchCall
                                                        .model(
                                                          (_model.apiResultModel
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!
                                                        .toList()
                                                        .cast<
                                                            MasterAgentModelModelStruct>();
                                                _model.ccMasterPageState = [];
                                                safeSetState(() {});
                                                if (!(_model
                                                    .modelMasterPageState
                                                    .isNotEmpty)) {
                                                  _model.canNextButton = true;
                                                  safeSetState(() {});
                                                }
                                                Navigator.pop(context);
                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                              },
                                              width: 200.0,
                                              height: 40.0,
                                              searchHintTextStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto San Thai',
                                                        letterSpacing: 0.0,
                                                      ),
                                              searchTextStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto San Thai',
                                                        letterSpacing: 0.0,
                                                      ),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto San Thai',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText: 'ระบุปีผลิต',
                                              searchHintText: 'ค้นหา ...',
                                              icon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              elevation: 2.0,
                                              borderColor: Colors.transparent,
                                              borderWidth: 0.0,
                                              borderRadius: 8.0,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              isOverButton: false,
                                              isSearchable: true,
                                              isMultiSelect: false,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ).animateOnPageLoad(animationsMap[
                                      'columnOnPageLoadAnimation3']!),
                                ),
                              if ((_model.dropDownBrandValue != null &&
                                      _model.dropDownBrandValue != '') &&
                                  (_model.dropDownYearValue != null &&
                                      _model.dropDownYearValue != '') &&
                                  (_model.modelMasterPageState.isNotEmpty))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'รุ่นรถ',
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Noto San Thai',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              '*',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Noto San Thai',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 50.0,
                                        decoration: BoxDecoration(),
                                        child: Builder(
                                          builder: (context) => Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .dropDownModelValueController ??=
                                                  FormFieldController<String>(
                                                _model.dropDownModelValue ??=
                                                    '',
                                              ),
                                              options: List<String>.from(_model
                                                  .modelMasterPageState
                                                  .map((e) => e.modelId)
                                                  .toList()),
                                              optionLabels: _model
                                                  .modelMasterPageState
                                                  .map((e) => e.modelName)
                                                  .toList(),
                                              onChanged: (val) async {
                                                safeSetState(() => _model
                                                    .dropDownModelValue = val);
                                                var _shouldSetState = false;
                                                _model.canNextButton = false;
                                                safeSetState(() {});
                                                showDialog(
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
                                                        child: LoadingWidget(),
                                                      ),
                                                    );
                                                  },
                                                );

                                                _model.apiResultCC =
                                                    await AgentAPIGroup
                                                        .agentRateSearchCall
                                                        .call(
                                                  carVehicleCode: FFAppState()
                                                      .saveLeadAgentData
                                                      .loanTypeCode,
                                                  carGear:
                                                      _model.dropDownGearValue,
                                                  carBrand:
                                                      _model.dropDownBrandValue,
                                                  carYear:
                                                      _model.dropDownYearValue,
                                                  carModel:
                                                      _model.dropDownModelValue,
                                                );

                                                _shouldSetState = true;
                                                if ((_model.apiResultCC
                                                            ?.statusCode ??
                                                        200) !=
                                                    200) {
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
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child:
                                                              ErrorMessageComponentWidget(
                                                            textMessage:
                                                                'พบข้อผิดพลาด connection (${(_model.apiResultCC?.statusCode ?? 200).toString()})',
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );

                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                                if (AgentAPIGroup
                                                        .agentRateSearchCall
                                                        .code(
                                                      (_model.apiResultCC
                                                              ?.jsonBody ??
                                                          ''),
                                                    ) !=
                                                    200) {
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
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child:
                                                              ErrorMessageComponentWidget(
                                                            textMessage:
                                                                '${AgentAPIGroup.agentRateSearchCall.message(
                                                              (_model.apiResultCC
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
                                                safeSetState(() {
                                                  _model
                                                      .dropDownCCValueController
                                                      ?.reset();
                                                });
                                                safeSetState(() {
                                                  _model.textController
                                                      ?.clear();
                                                });
                                                _model.ccMasterPageState =
                                                    AgentAPIGroup
                                                        .agentRateSearchCall
                                                        .cc(
                                                          (_model.apiResultCC
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!
                                                        .toList()
                                                        .cast<
                                                            MasterAgentCCModelStruct>();
                                                safeSetState(() {});
                                                if (!(_model.ccMasterPageState
                                                    .isNotEmpty)) {
                                                  _model.canNextButton = true;
                                                  safeSetState(() {});
                                                }
                                                Navigator.pop(context);
                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                              },
                                              width: 200.0,
                                              height: 40.0,
                                              searchHintTextStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto San Thai',
                                                        letterSpacing: 0.0,
                                                      ),
                                              searchTextStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto San Thai',
                                                        letterSpacing: 0.0,
                                                      ),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto San Thai',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText: 'ระบุรุ่นรถ',
                                              searchHintText: 'ค้นหา ...',
                                              icon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              elevation: 2.0,
                                              borderColor: Colors.transparent,
                                              borderWidth: 0.0,
                                              borderRadius: 8.0,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              isOverButton: false,
                                              isSearchable: true,
                                              isMultiSelect: false,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ).animateOnPageLoad(animationsMap[
                                      'columnOnPageLoadAnimation4']!),
                                ),
                              if ((_model.dropDownModelValue != null &&
                                      _model.dropDownModelValue != '') &&
                                  (_model.ccMasterPageState.isNotEmpty))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'รายละเอียดสินค้า',
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Noto San Thai',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              '*',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Noto San Thai',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 50.0,
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .dropDownCCValueController ??=
                                                FormFieldController<String>(
                                              _model.dropDownCCValue ??= '',
                                            ),
                                            options: List<String>.from(_model
                                                .ccMasterPageState
                                                .map((e) => e.ccId)
                                                .toList()),
                                            optionLabels: _model
                                                .ccMasterPageState
                                                .map((e) => e.ccName)
                                                .toList(),
                                            onChanged: (val) async {
                                              safeSetState(() =>
                                                  _model.dropDownCCValue = val);
                                              safeSetState(() {
                                                _model.textController?.clear();
                                              });
                                            },
                                            width: 200.0,
                                            height: 40.0,
                                            searchHintTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily:
                                                          'Noto San Thai',
                                                      letterSpacing: 0.0,
                                                    ),
                                            searchTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          'Noto San Thai',
                                                      letterSpacing: 0.0,
                                                    ),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          'Noto San Thai',
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintText: 'ระบุรายละเอียดสินค้า',
                                            searchHintText: 'ค้นหา ...',
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2.0,
                                            borderColor: Colors.transparent,
                                            borderWidth: 0.0,
                                            borderRadius: 8.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            isOverButton: false,
                                            isSearchable: true,
                                            isMultiSelect: false,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ).animateOnPageLoad(animationsMap[
                                      'columnOnPageLoadAnimation5']!),
                                ),
                              if ((_model.dropDownVehicleValue != null &&
                                      _model.dropDownVehicleValue != '') &&
                                  (_model.dropDownGearValue != null &&
                                      _model.dropDownGearValue != '') &&
                                  (_model.dropDownBrandValue != null &&
                                      _model.dropDownBrandValue != '') &&
                                  (_model.dropDownYearValue != null &&
                                      _model.dropDownYearValue != '') &&
                                  (_model.dropDownModelValue != null &&
                                      _model.dropDownModelValue != '') &&
                                  (_model.dropDownCCValue != null &&
                                      _model.dropDownCCValue != ''))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'เรทราคา (บาท)',
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Noto San Thai',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              width: double.infinity,
                                              height: 50.0,
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                child: TextFormField(
                                                  controller:
                                                      _model.textController,
                                                  focusNode:
                                                      _model.textFieldFocusNode,
                                                  autofocus: false,
                                                  textCapitalization:
                                                      TextCapitalization.words,
                                                  readOnly: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily:
                                                              'Noto San Thai',
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto San Thai',
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    errorBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    focusedErrorBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 16.0,
                                                                16.0, 8.0),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            'Noto San Thai',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        lineHeight: 3.0,
                                                      ),
                                                  maxLines: null,
                                                  validator: _model
                                                      .textControllerValidator
                                                      .asValidator(context),
                                                  inputFormatters: [
                                                    if (!isAndroid && !isiOS)
                                                      TextInputFormatter
                                                          .withFunction(
                                                              (oldValue,
                                                                  newValue) {
                                                        return TextEditingValue(
                                                          selection: newValue
                                                              .selection,
                                                          text: newValue.text
                                                              .toCapitalization(
                                                                  TextCapitalization
                                                                      .words),
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
                                              onPressed: () async {
                                                var _shouldSetState = false;
                                                if (!(_model.dropDownVehicleValue !=
                                                        null &&
                                                    _model.dropDownVehicleValue !=
                                                        '')) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        content: Text(
                                                            'กรุณาระบุประเภทรถ'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                                if (!(_model.dropDownGearValue !=
                                                        null &&
                                                    _model.dropDownGearValue !=
                                                        '')) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        content: Text(
                                                            'กรุณาระบุเกียร์'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                                if (!(_model.dropDownBrandValue !=
                                                        null &&
                                                    _model.dropDownBrandValue !=
                                                        '')) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        content: Text(
                                                            'กรุณาระบุยี่ห้อรถ'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                                if (!(_model.dropDownYearValue !=
                                                        null &&
                                                    _model.dropDownYearValue !=
                                                        '')) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        content: Text(
                                                            'กรุณาระบุปีที่ผลิต'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                                if (!(_model.dropDownModelValue !=
                                                        null &&
                                                    _model.dropDownModelValue !=
                                                        '')) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        content: Text(
                                                            'กรุณาระบุรุ่นรถ'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                                if (!(_model.dropDownCCValue !=
                                                        null &&
                                                    _model.dropDownCCValue !=
                                                        '')) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        content: Text(
                                                            'กรุณาระบุรายละเอียดสินค้า'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                                _model.canNextButton = true;
                                                safeSetState(() {});
                                                showDialog(
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
                                                        child: LoadingWidget(),
                                                      ),
                                                    );
                                                  },
                                                );

                                                _model.apiResultCheckRate =
                                                    await AgentAPIGroup
                                                        .agentCheckRateCall
                                                        .call(
                                                  carVehicleCode: FFAppState()
                                                      .saveLeadAgentData
                                                      .loanTypeCode,
                                                  carGear:
                                                      _model.dropDownGearValue,
                                                  carBrand:
                                                      _model.dropDownBrandValue,
                                                  carYear:
                                                      _model.dropDownYearValue,
                                                  carModel:
                                                      _model.dropDownModelValue,
                                                  carCc: _model.dropDownCCValue,
                                                  tenor: '10',
                                                  interest: '1',
                                                  thaiId: FFAppState()
                                                      .saveLeadAgentData
                                                      .registerId,
                                                );

                                                _shouldSetState = true;
                                                if ((_model.apiResultCheckRate
                                                            ?.statusCode ??
                                                        200) !=
                                                    200) {
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
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child:
                                                              ErrorMessageComponentWidget(
                                                            textMessage:
                                                                'พบข้อผิดพลาด connection (${(_model.apiResultCheckRate?.statusCode ?? 200).toString()})',
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );

                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                                if (AgentAPIGroup
                                                        .agentCheckRateCall
                                                        .statusCode(
                                                      (_model.apiResultCheckRate
                                                              ?.jsonBody ??
                                                          ''),
                                                    ) !=
                                                    200) {
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
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child:
                                                              ErrorMessageComponentWidget(
                                                            textMessage: AgentAPIGroup
                                                                .agentCheckRateCall
                                                                .statusMessage(
                                                              (_model.apiResultCheckRate
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )!,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );

                                                  if (_shouldSetState)
                                                    safeSetState(() {});
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
                                                safeSetState(() {});
                                                if (_model.carRateData !=
                                                    null) {
                                                  safeSetState(() {
                                                    _model.textController
                                                            ?.text =
                                                        functions
                                                            .returnNumberWithComma2Decimal(
                                                                _model
                                                                    .carRateData
                                                                    ?.rate)!;
                                                  });
                                                  if (_model.textController
                                                              .text ==
                                                          '0.00'
                                                      ? true
                                                      : false) {
                                                    safeSetState(() {
                                                      _model.textController
                                                          ?.text = 'ไม่พบเรท';
                                                    });
                                                  }
                                                } else {
                                                  safeSetState(() {
                                                    _model.textController
                                                        ?.text = 'ไม่พบเรท';
                                                  });
                                                }

                                                Navigator.pop(context);
                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                              },
                                              text: 'เช็คราคา',
                                              options: FFButtonOptions(
                                                height: 35.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: Color(0xFF18599F),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Noto San Thai',
                                                          color: Colors.white,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ).animateOnPageLoad(animationsMap[
                                      'columnOnPageLoadAnimation6']!),
                                ),
                            ].addToEnd(SizedBox(height: 30.0)),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
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
                                text: valueOrDefault<String>(
                                  'ย้อนกลับ',
                                  'ย้อนกลับ',
                                ),
                                options: FFButtonOptions(
                                  height: 60.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).info,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Noto San Thai',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        letterSpacing: 0.0,
                                      ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ),
                            Expanded(
                              child: FFButtonWidget(
                                onPressed: !_model.canNextButton
                                    ? null
                                    : () async {
                                        FFAppState()
                                            .updateSaveLeadAgentDataStruct(
                                          (e) => e
                                            ..carGear = _model
                                                            .dropDownGearValue !=
                                                        null &&
                                                    _model.dropDownGearValue !=
                                                        ''
                                                ? _model.dropDownGearValue
                                                : ''
                                            ..brandName = _model
                                                            .dropDownBrandValue !=
                                                        null &&
                                                    _model.dropDownBrandValue !=
                                                        ''
                                                ? _model.dropDownBrandValue
                                                : ''
                                            ..carYear = _model
                                                            .dropDownYearValue !=
                                                        null &&
                                                    _model.dropDownYearValue !=
                                                        ''
                                                ? _model.dropDownYearValue
                                                : ''
                                            ..carModel = _model
                                                            .dropDownModelValue !=
                                                        null &&
                                                    _model.dropDownModelValue !=
                                                        ''
                                                ? _model.dropDownModelValue
                                                : ''
                                            ..carCc = _model.dropDownCCValue !=
                                                        null &&
                                                    _model.dropDownCCValue != ''
                                                ? _model.dropDownCCValue
                                                : ''
                                            ..productDetail = _model
                                                            .dropDownCCValue !=
                                                        null &&
                                                    _model.dropDownCCValue != ''
                                                ? _model.dropDownCCValue
                                                : ''
                                            ..estimatePrice =
                                                _model.carRateData != null
                                                    ? _model.carRateData?.rate
                                                    : '0',
                                        );
                                        safeSetState(() {});

                                        context.pushNamed(
                                          LeadAgentReviewDetailPageWidget
                                              .routeName,
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType: PageTransitionType
                                                  .rightToLeft,
                                            ),
                                          },
                                        );
                                      },
                                text: 'ถัดไป',
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
                                  borderRadius: BorderRadius.circular(12.0),
                                  disabledColor: Color(0x7FDB771A),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 12.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
