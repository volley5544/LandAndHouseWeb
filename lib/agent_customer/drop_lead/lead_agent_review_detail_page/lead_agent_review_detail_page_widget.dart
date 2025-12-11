import '/agent_customer/drop_lead/progress_bar_component/progress_bar_component_widget.dart';
import '/agent_customer/drop_lead/review_detail_car_component/review_detail_car_component_widget.dart';
import '/agent_customer/drop_lead/review_detail_customer_component/review_detail_customer_component_widget.dart';
import '/agent_customer/drop_lead/review_detail_l_h_component/review_detail_l_h_component_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/error_message_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/loading/loading_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'lead_agent_review_detail_page_model.dart';
export 'lead_agent_review_detail_page_model.dart';

class LeadAgentReviewDetailPageWidget extends StatefulWidget {
  const LeadAgentReviewDetailPageWidget({
    super.key,
    this.imageCarBack,
    this.chanodFrontFile,
    this.chanodBackFile,
  });

  final FFUploadedFile? imageCarBack;
  final FFUploadedFile? chanodFrontFile;
  final FFUploadedFile? chanodBackFile;

  static String routeName = 'LeadAgentReviewDetailPage';
  static String routePath = '/leadAgentReviewDetailPage';

  @override
  State<LeadAgentReviewDetailPageWidget> createState() =>
      _LeadAgentReviewDetailPageWidgetState();
}

class _LeadAgentReviewDetailPageWidgetState
    extends State<LeadAgentReviewDetailPageWidget>
    with TickerProviderStateMixin {
  late LeadAgentReviewDetailPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LeadAgentReviewDetailPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
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

    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
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
                  'ยืนยันข้อมูล',
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
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                child: wrapWithModel(
                                  model: _model.progressBarComponentModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: ProgressBarComponentWidget(
                                    step: '3',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                child: wrapWithModel(
                                  model:
                                      _model.reviewDetailCustomerComponentModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: ReviewDetailCustomerComponentWidget(
                                    name:
                                        '${FFAppState().saveLeadAgentData.firstName}',
                                    lastname:
                                        '${FFAppState().saveLeadAgentData.lastName}',
                                    idcard:
                                        '${FFAppState().saveLeadAgentData.registerId}',
                                    phonenumber:
                                        '${FFAppState().saveLeadAgentData.mobilePhoneNumber}',
                                    amount:
                                        '${FFAppState().saveLeadAgentData.loanAmount}',
                                    product:
                                        '${FFAppState().saveLeadAgentData.loanTypeName}',
                                    carregister:
                                        '${(FFAppState().saveLeadAgentData.loanTypeCode == 'LH') || (FFAppState().saveLeadAgentData.loanTypeCode == 'LA') ? (FFAppState().isSearchByChanodNo ? FFAppState().saveLeadAgentData.carRegistration : FFAppState().saveLeadAgentData.landNo) : (FFAppState().saveLeadAgentData.carRegistration != '' ? FFAppState().saveLeadAgentData.carRegistration : 'ไม่ระบุทะเบียนรถ')}',
                                    time:
                                        '${FFAppState().saveLeadAgentData.contactTime != '' ? FFAppState().saveLeadAgentData.contactTime : 'ไม่ระบุเวลา'}',
                                    commission:
                                        '${FFAppState().saveLeadAgentData.comEstimateAmt}',
                                  ),
                                ),
                              ),
                              if ((FFAppState()
                                          .saveLeadAgentData
                                          .loanTypeCode !=
                                      'LH') &&
                                  (FFAppState()
                                          .saveLeadAgentData
                                          .loanTypeCode !=
                                      'LA'))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 16.0, 12.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.reviewDetailCarComponentModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: ReviewDetailCarComponentWidget(
                                      gear:
                                          '${FFAppState().saveLeadAgentData.carGear == 'no_gear' ? 'ไม่ระบุเกียร์' : FFAppState().saveLeadAgentData.carGear}',
                                      brand:
                                          '${FFAppState().saveLeadAgentData.brandName != '' ? FFAppState().saveLeadAgentData.brandName : 'ไม่ระบุยี่ห้อรถ'}',
                                      model:
                                          '${FFAppState().saveLeadAgentData.carModel != '' ? FFAppState().saveLeadAgentData.carModel : 'ไม่ระบุรุ่นรถ'}',
                                      year:
                                          '${FFAppState().saveLeadAgentData.carYear != '' ? FFAppState().saveLeadAgentData.carYear : 'ไม่ระบุปีผลิต'}',
                                      productDetail:
                                          '${FFAppState().saveLeadAgentData.productDetail != '' ? FFAppState().saveLeadAgentData.productDetail : 'ไม่ระบุรายละเอียดสินค้า'}',
                                      rateAmount:
                                          '${FFAppState().saveLeadAgentData.estimatePrice}',
                                      carProvince:
                                          '${FFAppState().saveLeadAgentData.carRegistration != '' ? FFAppState().saveLeadAgentData.carRegistration : 'ไม่ระบุทะเบียนรถ'}',
                                    ),
                                  ),
                                ),
                              if ((FFAppState()
                                          .saveLeadAgentData
                                          .loanTypeCode ==
                                      'LH') ||
                                  (FFAppState()
                                          .saveLeadAgentData
                                          .loanTypeCode ==
                                      'LA'))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 16.0, 12.0, 16.0),
                                  child: wrapWithModel(
                                    model: _model.reviewDetailLHComponentModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: ReviewDetailLHComponentWidget(
                                      chanodNO:
                                          '${FFAppState().saveLeadAgentData.carRegistration}',
                                      landNO:
                                          '${FFAppState().saveLeadAgentData.landNo}',
                                      rai:
                                          '${FFAppState().saveLeadAgentData.landAreaRai}',
                                      ngan:
                                          '${FFAppState().saveLeadAgentData.landAreaNgan}',
                                      wa: '${FFAppState().saveLeadAgentData.landAreaWa}',
                                      ltv1Amount:
                                          '${FFAppState().saveLeadAgentData.ltv1Amount}',
                                      ltv2Amount:
                                          '${FFAppState().saveLeadAgentData.ltv2Amount}',
                                      utmmap1:
                                          '${FFAppState().saveLeadAgentData.utmmap}',
                                      subDistrict:
                                          '${FFAppState().saveLeadAgentData.landSubdistrict}',
                                      district:
                                          '${FFAppState().saveLeadAgentData.landDistrict}',
                                      province:
                                          '${FFAppState().saveLeadAgentData.landProvince}',
                                    ),
                                  ),
                                ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 12.0, 12.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
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
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 16.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 22.0,
                                                child: VerticalDivider(
                                                  thickness: 4.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                ),
                                              ),
                                              Text(
                                                'ยินยอมให้เก็บข้อมูลส่วนตัว',
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 16.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Icon(
                                                      Icons.check_circle,
                                                      color: Color(0xFF24DB1A),
                                                      size: 24.0,
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
                                                        'ยินยอมให้เก็บข้อมูลส่วนตัวแล้ว',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Noto San Thai',
                                                              color: Color(
                                                                  0xFF24DB1A),
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ).animateOnPageLoad(animationsMap[
                                              'columnOnPageLoadAnimation']!),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ].addToEnd(SizedBox(height: 30.0)),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
                                child: Builder(
                                  builder: (context) => FFButtonWidget(
                                    onPressed: () async {
                                      var _shouldSetState = false;
                                      var confirmDialogResponse =
                                          await showDialog<bool>(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    content: Text(
                                                        'ยืนยันข้อมูลใช่หรือไม่'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                false),
                                                        child: Text('ยกเลิก'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                true),
                                                        child: Text('ยืนยัน'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ) ??
                                              false;
                                      if (!confirmDialogResponse) {
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }
                                      showDialog(
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
                                              child: LoadingWidget(),
                                            ),
                                          );
                                        },
                                      );

                                      _model.apiResulthto = await AgentAPIGroup
                                          .mgmLeadsSaveCall
                                          .call(
                                        agentId: FFAppState()
                                            .saveLeadAgentData
                                            .agentId,
                                        agentCode: FFAppState()
                                            .saveLeadAgentData
                                            .agentCode,
                                        firstName: FFAppState()
                                            .saveLeadAgentData
                                            .firstName,
                                        lastName: FFAppState()
                                            .saveLeadAgentData
                                            .lastName,
                                        registerId: FFAppState()
                                            .saveLeadAgentData
                                            .registerId,
                                        mobilePhoneNumber: FFAppState()
                                            .saveLeadAgentData
                                            .mobilePhoneNumber,
                                        contactTime: FFAppState()
                                            .saveLeadAgentData
                                            .contactTime,
                                        loanAmount: FFAppState()
                                            .saveLeadAgentData
                                            .loanAmount,
                                        loanTypeId: FFAppState()
                                            .saveLeadAgentData
                                            .loanTypeId,
                                        loanTypeCode: FFAppState()
                                            .saveLeadAgentData
                                            .loanTypeCode,
                                        loanTypeName: FFAppState()
                                            .saveLeadAgentData
                                            .loanTypeName,
                                        carGear: FFAppState()
                                            .saveLeadAgentData
                                            .carGear,
                                        brandName: FFAppState()
                                            .saveLeadAgentData
                                            .brandName,
                                        carYear: FFAppState()
                                            .saveLeadAgentData
                                            .carYear,
                                        carModel: FFAppState()
                                            .saveLeadAgentData
                                            .carModel,
                                        carCc: FFAppState()
                                            .saveLeadAgentData
                                            .carCc,
                                        productDetail: FFAppState()
                                            .saveLeadAgentData
                                            .productDetail,
                                        estimatePrice: FFAppState()
                                            .saveLeadAgentData
                                            .estimatePrice,
                                        landDistrict: FFAppState()
                                            .saveLeadAgentData
                                            .landDistrict,
                                        landSubdistrict: FFAppState()
                                            .saveLeadAgentData
                                            .landSubdistrict,
                                        landProvince: FFAppState()
                                            .saveLeadAgentData
                                            .landProvince,
                                        landPostcode: FFAppState()
                                            .saveLeadAgentData
                                            .landPostcode,
                                        landAreaRai: FFAppState()
                                            .saveLeadAgentData
                                            .landAreaRai,
                                        landAreaNgan: FFAppState()
                                            .saveLeadAgentData
                                            .landAreaNgan,
                                        landAreaWa: FFAppState()
                                            .saveLeadAgentData
                                            .landAreaWa,
                                        landNo: FFAppState()
                                            .saveLeadAgentData
                                            .landNo,
                                        utmmap: FFAppState()
                                            .saveLeadAgentData
                                            .utmmap,
                                        surveyNo: FFAppState()
                                            .saveLeadAgentData
                                            .surveyNo,
                                        ltv1Amount: FFAppState()
                                            .saveLeadAgentData
                                            .ltv1Amount,
                                        ltv2Amount: FFAppState()
                                            .saveLeadAgentData
                                            .ltv2Amount,
                                        agentGroupId: FFAppState()
                                            .agentProfileDataType
                                            .agentGroupId,
                                        privacyConsentFlag: 'Y',
                                        privacyConsentDate:
                                            getCurrentTimestamp.toString(),
                                        paymentMethod: FFAppState()
                                            .agentProfileDataType
                                            .paymentMethod,
                                        deductionPercent: FFAppState()
                                            .agentProfileDataType
                                            .deductionPercent,
                                        paymentChannel: FFAppState()
                                            .agentProfileDataType
                                            .paymentChannel,
                                        accountNumber: FFAppState()
                                            .agentProfileDataType
                                            .accountNumber,
                                        promptpayNumber: FFAppState()
                                            .agentProfileDataType
                                            .promptpayNumber,
                                        imageCarBook: widget.imageCarBack,
                                        imageChanodFront:
                                            widget.chanodFrontFile,
                                        imageChanodBack: widget.chanodBackFile,
                                        comEstimateAmt: FFAppState()
                                            .saveLeadAgentData
                                            .comEstimateAmt,
                                        comEstimateVat: FFAppState()
                                            .saveLeadAgentData
                                            .comEstimateVat,
                                        comEstimateNetAmt: FFAppState()
                                            .saveLeadAgentData
                                            .comEstimateNetAmt,
                                        defaultComPercent: FFAppState()
                                            .saveLeadAgentData
                                            .defaultComPercent,
                                        actualComPercent: FFAppState()
                                            .saveLeadAgentData
                                            .actualComPercent,
                                        comEstimateVatAmt: FFAppState()
                                            .saveLeadAgentData
                                            .comEstimateVatAmt,
                                        url: FFDevEnvironmentValues()
                                                .isProduction
                                            ? FFAppState()
                                                .apiUrlDocData
                                                .agentWebApiUrl
                                            : FFAppState()
                                                .apiUrlDocData
                                                .agentWebApiUrlUat,
                                        smsCode: FFAppState()
                                            .saveLeadAgentData
                                            .smsCode,
                                        tokenHeader: FFDevEnvironmentValues()
                                                .isProduction
                                            ? FFAppState()
                                                .apiUrlDocData
                                                .agentWebApiToken
                                            : FFAppState()
                                                .apiUrlDocData
                                                .agentWebApiTokenUat,
                                      );

                                      _shouldSetState = true;
                                      if ((_model.apiResulthto?.statusCode ??
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
                                                      'พบข้อผิดพลาด connection(${(_model.apiResulthto?.statusCode ?? 200).toString()})',
                                                ),
                                              ),
                                            );
                                          },
                                        );

                                        Navigator.pop(context);
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }
                                      if ('${getJsonField(
                                            (_model.apiResulthto?.jsonBody ??
                                                ''),
                                            r'''$.code''',
                                          ).toString()}' ==
                                          '200') {
                                        Navigator.pop(context);
                                      } else {
                                        if ('${getJsonField(
                                              (_model.apiResulthto?.jsonBody ??
                                                  ''),
                                              r'''$.code''',
                                            ).toString()}' ==
                                            '201') {
                                          Navigator.pop(context);
                                          if (FFAppState().platform ==
                                              'mobile') {
                                            context.goNamed(
                                              LeadDupePageWidget.routeName,
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType
                                                          .rightToLeft,
                                                ),
                                              },
                                            );

                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          }
                                        } else {
                                          Navigator.pop(context);
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
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
                                                        '${getJsonField(
                                                      (_model.apiResulthto
                                                              ?.jsonBody ??
                                                          ''),
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
                                      }

                                      context.goNamed(
                                        LeadSuccesPageWidget.routeName,
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.rightToLeft,
                                          ),
                                        },
                                      );

                                      if (_shouldSetState) safeSetState(() {});
                                    },
                                    text: 'ถัดไป',
                                    options: FFButtonOptions(
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
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
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
        ));
  }
}
