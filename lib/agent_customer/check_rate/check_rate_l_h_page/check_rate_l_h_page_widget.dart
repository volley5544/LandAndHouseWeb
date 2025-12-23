import '/agent_customer/check_rate/check_rate_l_h_form_component/check_rate_l_h_form_component_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/loading/loading_widget.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/permissions_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'check_rate_l_h_page_model.dart';
export 'check_rate_l_h_page_model.dart';

class CheckRateLHPageWidget extends StatefulWidget {
  const CheckRateLHPageWidget({super.key});

  static String routeName = 'CheckRateLHPage';
  static String routePath = '/checkRateLHPage';

  @override
  State<CheckRateLHPageWidget> createState() => _CheckRateLHPageWidgetState();
}

class _CheckRateLHPageWidgetState extends State<CheckRateLHPageWidget> {
  late CheckRateLHPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckRateLHPageModel());

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
                  visible: false,
                  child: InkWell(
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
                      size: 30.0,
                    ),
                  ),
                ),
                title: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    unawaited(
                      () async {}(),
                    );
                    await requestPermission(photoLibraryPermission);
                    _model.test = await actions.requestCameraPermission();
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          content: Text(_model.test!),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext),
                              child: Text('Ok'),
                            ),
                          ],
                        );
                      },
                    );

                    context.pushNamed(
                      CapturePictureSelfieIdcardPageWidget.routeName,
                      queryParameters: {
                        'imageType': serializeParam(
                          'idCard',
                          ParamType.String,
                        ),
                        'title': serializeParam(
                          'ถ่ายรูปบัตรประชาชน',
                          ParamType.String,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.rightToLeft,
                        ),
                      },
                    );

                    safeSetState(() {});
                  },
                  child: Text(
                    'กรอกข้อมูลลูกค้า ${FFDevEnvironmentValues().isProduction ? '' : ' (UAT)'}',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Noto San Thai',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                actions: [],
                centerTitle: true,
                elevation: 2.0,
              ),
              body: SafeArea(
                top: true,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.checkRateLHFormComponentModel,
                        updateCallback: () => safeSetState(() {}),
                        updateOnChange: true,
                        child: CheckRateLHFormComponentWidget(
                          isOnlyCheckRate: true,
                          updateFormState: (isFormState) async {
                            _model.isFormState = isFormState;
                            safeSetState(() {});
                          },
                          searchingDoneAction: () async {},
                        ),
                      ),
                    ].addToStart(SizedBox(height: 4.0)),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
