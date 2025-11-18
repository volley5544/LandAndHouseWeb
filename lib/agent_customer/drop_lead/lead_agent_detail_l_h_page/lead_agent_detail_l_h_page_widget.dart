import '/agent_customer/check_rate/check_rate_l_h_form_component/check_rate_l_h_form_component_widget.dart';
import '/agent_customer/drop_lead/progress_bar_component/progress_bar_component_widget.dart';
import '/agent_customer/drop_lead/review_detail_customer_component/review_detail_customer_component_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/error_message_component_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/loading/loading_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'lead_agent_detail_l_h_page_model.dart';
export 'lead_agent_detail_l_h_page_model.dart';

class LeadAgentDetailLHPageWidget extends StatefulWidget {
  const LeadAgentDetailLHPageWidget({super.key});

  static String routeName = 'LeadAgentDetailLHPage';
  static String routePath = '/leadAgentDetailLHPage';

  @override
  State<LeadAgentDetailLHPageWidget> createState() =>
      _LeadAgentDetailLHPageWidgetState();
}

class _LeadAgentDetailLHPageWidgetState
    extends State<LeadAgentDetailLHPageWidget> {
  late LeadAgentDetailLHPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LeadAgentDetailLHPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setDarkModeSetting(context, ThemeMode.light);
      FFAppState().chanodOutput = ChanodDataModelStruct();
      FFAppState().addressOutput = AddressDataModelStruct();
      FFAppState().addressDataOriginal = [];
      FFAppState().isSearchByChanodNo = false;
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
      _model.getAssetTypeMaster = await AgentAPIGroup.rateGetVehicleCall.call(
        categoryCode: 'L',
        url: FFDevEnvironmentValues().isProduction
            ? FFAppState().apiUrlDocData.agentWebApiUrl
            : FFAppState().apiUrlDocData.agentWebApiUrlUat,
        tokenHeader: FFDevEnvironmentValues().isProduction
            ? FFAppState().apiUrlDocData.agentWebApiToken
            : FFAppState().apiUrlDocData.agentWebApiTokenUat,
      );

      if ((_model.getAssetTypeMaster?.statusCode ?? 200) != 200) {
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
                      'พบข้อผิดพลาด connection (${(_model.getAssetTypeMaster?.statusCode ?? 200).toString()})',
                ),
              ),
            );
          },
        );

        Navigator.pop(context);
        return;
      }
      if ('${getJsonField(
            (_model.getAssetTypeMaster?.jsonBody ?? ''),
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
                    (_model.getAssetTypeMaster?.jsonBody ?? ''),
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
      _model.assetMasterData = AgentAPIGroup.rateGetVehicleCall
          .data(
            (_model.getAssetTypeMaster?.jsonBody ?? ''),
          )!
          .toList()
          .cast<MasterAgentVehicleDataModelStruct>();
      safeSetState(() {});
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
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              appBar: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).secondary,
                automaticallyImplyLeading: false,
                leading: Visibility(
                  visible: _model.isFormState,
                  child: InkWell(
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
                ),
                actions: [],
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    FFAppState().platform == 'mobile'
                        ? 'กรอกข้อมูลลูกค้า'
                        : 'กรุณากรอกข้อมูลให้ถูกต้อง',
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
                    height: double.infinity,
                    constraints: BoxConstraints(
                      maxWidth: 670.0,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: wrapWithModel(
                              model: _model.progressBarComponentModel,
                              updateCallback: () => safeSetState(() {}),
                              child: ProgressBarComponentWidget(
                                step: '2',
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: wrapWithModel(
                              model: _model.reviewDetailCustomerComponentModel,
                              updateCallback: () => safeSetState(() {}),
                              child: ReviewDetailCustomerComponentWidget(
                                name:
                                    '${FFAppState().saveLeadAgentData.firstName}',
                                lastname:
                                    '${FFAppState().saveLeadAgentData.lastName}',
                                idcard:
                                    '${FFAppState().saveLeadAgentData.registerId}',
                                phonenumber:
                                    '${'${FFAppState().saveLeadAgentData.mobilePhoneNumber}'}',
                                amount:
                                    '${FFAppState().saveLeadAgentData.loanAmount}',
                                product:
                                    '${FFAppState().saveLeadAgentData.loanTypeName}',
                                carregister:
                                    '${FFAppState().saveLeadAgentData.carRegistration}',
                                time:
                                    '${FFAppState().saveLeadAgentData.contactTime}',
                                fromPage: 'LandAndHousePage',
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 2.0,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 12.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'ประเภทสินทรัพย์',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto San Thai',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        '*',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto San Thai',
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                              .assetDropDownValueController ??=
                                          FormFieldController<String>(null),
                                      options: List<String>.from(_model
                                          .assetMasterData
                                          .map((e) => e.vehicleCode)
                                          .toList()),
                                      optionLabels: _model.assetMasterData
                                          .map((e) => e.vehicleName)
                                          .toList(),
                                      onChanged: (val) async {
                                        safeSetState(() =>
                                            _model.assetDropDownValue = val);
                                        FFAppState()
                                            .updateSaveLeadAgentDataStruct(
                                          (e) => e
                                            ..loanTypeId = _model
                                                .assetMasterData
                                                .elementAtOrNull(
                                                    functions.findIndexInList(
                                                        _model.assetMasterData
                                                            .map((e) =>
                                                                e.vehicleCode)
                                                            .toList(),
                                                        _model
                                                            .assetDropDownValue)!)
                                                ?.vehicleId
                                            ..loanTypeCode =
                                                _model.assetDropDownValue
                                            ..loanTypeName = _model
                                                .assetMasterData
                                                .elementAtOrNull(
                                                    functions.findIndexInList(
                                                        _model.assetMasterData
                                                            .map((e) =>
                                                                e.vehicleCode)
                                                            .toList(),
                                                        _model
                                                            .assetDropDownValue)!)
                                                ?.vehicleName,
                                        );
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
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Noto San Thai',
                                            letterSpacing: 0.0,
                                          ),
                                      hintText: 'ระบุประเภทสินทรัพย์',
                                      searchHintText: 'เลือกประเภทรถ',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 2.0,
                                      borderColor: Colors.transparent,
                                      borderWidth: 0.0,
                                      borderRadius: 8.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      isOverButton: false,
                                      isSearchable: true,
                                      isMultiSelect: false,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (_model.assetDropDownValue != null &&
                              _model.assetDropDownValue != '')
                            wrapWithModel(
                              model: _model.checkRateLHFormComponentModel,
                              updateCallback: () => safeSetState(() {}),
                              updateOnChange: true,
                              child: CheckRateLHFormComponentWidget(
                                isOnlyCheckRate: false,
                                updateFormState: (isFormState) async {
                                  _model.isFormState = isFormState;
                                  safeSetState(() {});
                                },
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
