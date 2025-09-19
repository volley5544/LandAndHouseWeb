import '/agent_customer/check_rate/check_rate_l_h_form_component/check_rate_l_h_form_component_widget.dart';
import '/agent_customer/drop_lead/progress_bar_component/progress_bar_component_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/loading/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'lead_agent_detail_l_h_page_model.dart';
export 'lead_agent_detail_l_h_page_model.dart';

class LeadAgentDetailLHPageWidget extends StatefulWidget {
  const LeadAgentDetailLHPageWidget({
    super.key,
    this.product,
  });

  final String? product;

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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: wrapWithModel(
                        model: _model.progressBarComponentModel,
                        updateCallback: () => safeSetState(() {}),
                        child: ProgressBarComponentWidget(
                          step: '2',
                        ),
                      ),
                    ),
                    Expanded(
                      child: wrapWithModel(
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
