import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/m_g_m_agent/side_nav_component/side_nav_component_widget.dart';
import '/pages/loading/loading_widget.dart';
import '/index.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'web_app_bar_component_model.dart';
export 'web_app_bar_component_model.dart';

class WebAppBarComponentWidget extends StatefulWidget {
  const WebAppBarComponentWidget({super.key});

  @override
  State<WebAppBarComponentWidget> createState() =>
      _WebAppBarComponentWidgetState();
}

class _WebAppBarComponentWidgetState extends State<WebAppBarComponentWidget> {
  late WebAppBarComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WebAppBarComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Visibility(
      visible: responsiveVisibility(
        context: context,
        phone: false,
        tablet: false,
        tabletLandscape: false,
      ),
      child: Container(
        width: double.infinity,
        height: 90.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).backgroundColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16.0),
            bottomRight: Radius.circular(16.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(
              valueOrDefault<double>(
                MediaQuery.sizeOf(context).width * 0.035,
                0.0,
              ),
              0.0,
              valueOrDefault<double>(
                MediaQuery.sizeOf(context).width * 0.035,
                0.0,
              ),
              0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (loggedIn)
                      badges.Badge(
                        badgeContent: Text(
                          '1',
                          style:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Noto San Thai',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        showBadge:
                            '${FFAppState().agentProfileDataType.agentDocStatus}' !=
                                'COMPLETED',
                        shape: badges.BadgeShape.circle,
                        badgeColor: FlutterFlowTheme.of(context).primary,
                        elevation: 4.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                        position: badges.BadgePosition.topEnd(),
                        animationType: badges.BadgeAnimationType.scale,
                        toAnimate: true,
                        child: Builder(
                          builder: (context) => InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return Dialog(
                                    elevation: 0,
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    alignment: AlignmentDirectional(-1.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    child: SideNavComponentWidget(),
                                  );
                                },
                              );
                            },
                            child: Icon(
                              Icons.dehaze_rounded,
                              color: FlutterFlowTheme.of(context).secondary,
                              size: 40.0,
                            ),
                          ),
                        ),
                      ),
                    if ((getCurrentRoute(context) != '/agentMainMenuPage') &&
                        (getCurrentRoute(context) != '/') &&
                        ((FFAppState().clientDevicePlatform == 'android') ||
                            (FFAppState().clientDevicePlatform == 'ios')))
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (getCurrentRoute(context) == '/agentDetailPage') {
                            context
                                .goNamed(ShareAgentReferPageWidget.routeName);

                            return;
                          }
                          context.safePop();
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.arrow_back,
                              color: FlutterFlowTheme.of(context).secondary,
                              size: 40.0,
                            ),
                            Text(
                              'ย้อนกลับ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto San Thai',
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ].divide(SizedBox(width: 12.0)),
                        ),
                      ),
                  ].divide(SizedBox(width: 24.0)),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  if (!loggedIn) {
                    return;
                  }

                  context.goNamed(AgentMainMenuPageWidget.routeName);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/logo.png.png',
                        width: 150.0,
                        height: 150.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text(
                      FFDevEnvironmentValues().isProduction
                          ? ''
                          : ' (UAT V.${FFAppState().webUatVersion.toString()})',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Noto San Thai',
                            color: FlutterFlowTheme.of(context).secondary,
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (loggedIn)
                      Builder(
                        builder: (context) => InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: Container(
                                    height: double.infinity,
                                    width: double.infinity,
                                    child: LoadingWidget(),
                                  ),
                                );
                              },
                            );

                            if (FFAppState().apiUrlDocData == ApiUrlStruct()) {
                              _model.queryUrl =
                                  await ApplicationRecord.getDocumentOnce(
                                      FFAppState().configDocument!);
                              FFAppState().apiUrlDocData =
                                  _model.queryUrl!.apiUrl;
                              safeSetState(() {});
                            }
                            _model.apiResultjxr =
                                await AgentAPIGroup.logoutAgentCall.call(
                              username: FFAppState().agentCode,
                              url: FFDevEnvironmentValues().isProduction
                                  ? FFAppState().apiUrlDocData.agentWebApiUrl
                                  : FFAppState()
                                      .apiUrlDocData
                                      .agentWebApiUrlUat,
                              tokenHeader: FFDevEnvironmentValues().isProduction
                                  ? FFAppState().apiUrlDocData.agentWebApiToken
                                  : FFAppState()
                                      .apiUrlDocData
                                      .agentWebApiTokenUat,
                            );

                            FFAppState().agentCode = '';
                            FFAppState().agentProfileDataType =
                                AgentProfileModelStruct();
                            safeSetState(() {});
                            Navigator.pop(context);
                            GoRouter.of(context).prepareAuthEvent();
                            await authManager.signOut();
                            GoRouter.of(context).clearRedirectLocation();

                            context.goNamedAuth(AgentLoginPageWidget.routeName,
                                context.mounted);

                            safeSetState(() {});
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.login_outlined,
                                color: FlutterFlowTheme.of(context).secondary,
                                size: 50.0,
                              ),
                              Text(
                                'ออกจากระบบ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Noto San Thai',
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ].divide(SizedBox(width: 12.0)),
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
    );
  }
}
