import '/agent_customer/drop_lead/progress_bar_component/progress_bar_component_widget.dart';
import '/agent_customer/drop_lead/review_detail_car_component/review_detail_car_component_widget.dart';
import '/agent_customer/drop_lead/review_detail_customer_component/review_detail_customer_component_widget.dart';
import '/agent_customer/drop_lead/review_detail_l_h_component/review_detail_l_h_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'lead_agent_review_detail_page_model.dart';
export 'lead_agent_review_detail_page_model.dart';

class LeadAgentReviewDetailPageWidget extends StatefulWidget {
  const LeadAgentReviewDetailPageWidget({
    super.key,
    this.product,
  });

  final String? product;

  static String routeName = 'LeadAgentReviewDetailPage';
  static String routePath = '/leadAgentReviewDetailPage';

  @override
  State<LeadAgentReviewDetailPageWidget> createState() =>
      _LeadAgentReviewDetailPageWidgetState();
}

class _LeadAgentReviewDetailPageWidgetState
    extends State<LeadAgentReviewDetailPageWidget> {
  late LeadAgentReviewDetailPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LeadAgentReviewDetailPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
              'ยืนยันข้อมูลลูกค้า',
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            wrapWithModel(
                              model: _model.progressBarComponentModel,
                              updateCallback: () => safeSetState(() {}),
                              child: ProgressBarComponentWidget(
                                step: '3',
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: wrapWithModel(
                                model:
                                    _model.reviewDetailCustomerComponentModel,
                                updateCallback: () => safeSetState(() {}),
                                child: ReviewDetailCustomerComponentWidget(
                                  name: '-',
                                  lastname: '-',
                                  idcard: '-',
                                  phonenumber: '-',
                                  amount: '-',
                                  product: '-',
                                  carregister: '-',
                                  time: '-',
                                ),
                              ),
                            ),
                            if (widget.product != 'LH')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: wrapWithModel(
                                  model: _model.reviewDetailCarComponentModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: ReviewDetailCarComponentWidget(
                                    gear: '-',
                                    brand: '-',
                                    model: '-',
                                    year: '-',
                                    productDetail: '-',
                                    rateAmount: '-',
                                  ),
                                ),
                              ),
                            if (widget.product == 'LH')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 16.0),
                                child: wrapWithModel(
                                  model: _model.reviewDetailLHComponentModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: ReviewDetailLHComponentWidget(
                                    chanodNO: '-',
                                    landNO: '-',
                                    rai: '-',
                                    ngan: '-',
                                    wa: '-',
                                    ltv1Amount: '-',
                                    ltv2Amount: '-',
                                    utmmap1: '-',
                                  ),
                                ),
                              ),
                          ],
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
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
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                    ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                          Expanded(
                            child: FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
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
    );
  }
}
