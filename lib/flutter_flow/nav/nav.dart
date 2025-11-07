import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) => appStateNotifier.loggedIn
          ? SerchChanodPageWidget()
          : AddCustomerLeadWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? SerchChanodPageWidget()
              : AddCustomerLeadWidget(),
        ),
        FFRoute(
          name: HomePageWidget.routeName,
          path: HomePageWidget.routePath,
          builder: (context, params) => HomePageWidget(
            hashThaiId: params.getParam(
              'hashThaiId',
              ParamType.String,
            ),
            consentDate: params.getParam(
              'consentDate',
              ParamType.String,
            ),
            projectName: params.getParam(
              'projectName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: SerchChanodPageWidget.routeName,
          path: SerchChanodPageWidget.routePath,
          builder: (context, params) => SerchChanodPageWidget(
            imageChanodFront: params.getParam(
              'imageChanodFront',
              ParamType.FFUploadedFile,
            ),
            imageChanodBack: params.getParam(
              'imageChanodBack',
              ParamType.FFUploadedFile,
            ),
          ),
        ),
        FFRoute(
          name: SearchLocationWidget.routeName,
          path: SearchLocationWidget.routePath,
          builder: (context, params) => SearchLocationWidget(),
        ),
        FFRoute(
          name: InterestedPageWidget.routeName,
          path: InterestedPageWidget.routePath,
          builder: (context, params) => InterestedPageWidget(),
        ),
        FFRoute(
          name: AssignBranchPageWidget.routeName,
          path: AssignBranchPageWidget.routePath,
          builder: (context, params) => AssignBranchPageWidget(
            employeeId: params.getParam(
              'employeeId',
              ParamType.String,
            ),
            token: params.getParam(
              'token',
              ParamType.String,
            ),
            branchCodeSearch: params.getParam(
              'branchCodeSearch',
              ParamType.String,
            ),
            mode: params.getParam(
              'mode',
              ParamType.String,
            ),
            fromPage: params.getParam(
              'fromPage',
              ParamType.String,
            ),
            level: params.getParam(
              'level',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: SelectedBranchPageWidget.routeName,
          path: SelectedBranchPageWidget.routePath,
          builder: (context, params) => SelectedBranchPageWidget(
            fromPage: params.getParam(
              'fromPage',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ChanodListPageCopyWidget.routeName,
          path: ChanodListPageCopyWidget.routePath,
          builder: (context, params) => ChanodListPageCopyWidget(),
        ),
        FFRoute(
          name: TextLineLiffPageWidget.routeName,
          path: TextLineLiffPageWidget.routePath,
          builder: (context, params) => TextLineLiffPageWidget(),
        ),
        FFRoute(
          name: AddCustomerLeadWidget.routeName,
          path: AddCustomerLeadWidget.routePath,
          builder: (context, params) => AddCustomerLeadWidget(
            hashThaiId: params.getParam(
              'hashThaiId',
              ParamType.String,
            ),
            consentDate: params.getParam(
              'consentDate',
              ParamType.String,
            ),
            projectName: params.getParam(
              'projectName',
              ParamType.String,
            ),
            utmSource: params.getParam(
              'utmSource',
              ParamType.String,
            ),
            utmMedium: params.getParam(
              'utmMedium',
              ParamType.String,
            ),
            utmCampaign: params.getParam(
              'utmCampaign',
              ParamType.String,
            ),
            step: params.getParam(
              'step',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: HomePageWebWidget.routeName,
          path: HomePageWebWidget.routePath,
          builder: (context, params) => HomePageWebWidget(),
        ),
        FFRoute(
          name: RateWebPageWidget.routeName,
          path: RateWebPageWidget.routePath,
          builder: (context, params) => RateWebPageWidget(
            ltv1Amount: params.getParam(
              'ltv1Amount',
              ParamType.String,
            ),
            ltv2Amount: params.getParam(
              'ltv2Amount',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: AssignGrocerystorePageWidget.routeName,
          path: AssignGrocerystorePageWidget.routePath,
          builder: (context, params) => AssignGrocerystorePageWidget(
            employeeId: params.getParam(
              'employeeId',
              ParamType.String,
            ),
            token: params.getParam(
              'token',
              ParamType.String,
            ),
            branchCodeSearch: params.getParam(
              'branchCodeSearch',
              ParamType.String,
            ),
            mode: params.getParam(
              'mode',
              ParamType.String,
            ),
            fromPage: params.getParam(
              'fromPage',
              ParamType.String,
            ),
            level: params.getParam(
              'level',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ApproveInsurancePageWidget.routeName,
          path: ApproveInsurancePageWidget.routePath,
          builder: (context, params) => ApproveInsurancePageWidget(
            employeeId: params.getParam(
              'employeeId',
              ParamType.String,
            ),
            token: params.getParam(
              'token',
              ParamType.String,
            ),
            branchCodeSearch: params.getParam(
              'branchCodeSearch',
              ParamType.String,
            ),
            mode: params.getParam(
              'mode',
              ParamType.String,
            ),
            fromPage: params.getParam(
              'fromPage',
              ParamType.String,
            ),
            level: params.getParam(
              'level',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: SelectDueFirstPayWidget.routeName,
          path: SelectDueFirstPayWidget.routePath,
          builder: (context, params) => SelectDueFirstPayWidget(
            dataList: params.getParam<String>(
              'dataList',
              ParamType.String,
              isList: true,
            ),
            dueFromQuotationIndex: params.getParam(
              'dueFromQuotationIndex',
              ParamType.int,
            ),
            insuranceInfoData: params.getParam(
              'insuranceInfoData',
              ParamType.DataStruct,
              isList: false,
              structBuilder: InsuranceInfoDataModelStruct.fromSerializableMap,
            ),
            token: params.getParam(
              'token',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: TaxDetailDataPageWidget.routeName,
          path: TaxDetailDataPageWidget.routePath,
          builder: (context, params) => TaxDetailDataPageWidget(),
        ),
        FFRoute(
          name: TopupCardPageWidget.routeName,
          path: TopupCardPageWidget.routePath,
          builder: (context, params) => TopupCardPageWidget(
            token: params.getParam(
              'token',
              ParamType.String,
            ),
            hashThaiId: params.getParam(
              'hashThaiId',
              ParamType.String,
            ),
            source: params.getParam(
              'source',
              ParamType.String,
            ),
            referId: params.getParam(
              'referId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: TopupDetailDataPageWidget.routeName,
          path: TopupDetailDataPageWidget.routePath,
          builder: (context, params) => TopupDetailDataPageWidget(),
        ),
        FFRoute(
          name: CustomerDataPageWidget.routeName,
          path: CustomerDataPageWidget.routePath,
          builder: (context, params) => CustomerDataPageWidget(),
        ),
        FFRoute(
          name: SelectInstallmentPageWidget.routeName,
          path: SelectInstallmentPageWidget.routePath,
          builder: (context, params) => SelectInstallmentPageWidget(),
        ),
        FFRoute(
          name: QrPaymentPageWidget.routeName,
          path: QrPaymentPageWidget.routePath,
          builder: (context, params) => QrPaymentPageWidget(),
        ),
        FFRoute(
          name: TopupConclusionPageWidget.routeName,
          path: TopupConclusionPageWidget.routePath,
          builder: (context, params) => TopupConclusionPageWidget(
            bankIcon: params.getParam(
              'bankIcon',
              ParamType.FFUploadedFile,
            ),
          ),
        ),
        FFRoute(
          name: PdfViewerPageWidget.routeName,
          path: PdfViewerPageWidget.routePath,
          builder: (context, params) => PdfViewerPageWidget(
            pdfFileByte: params.getParam(
              'pdfFileByte',
              ParamType.FFUploadedFile,
            ),
            title: params.getParam(
              'title',
              ParamType.String,
            ),
            index: params.getParam(
              'index',
              ParamType.int,
            ),
            isFromConfirmButton: params.getParam(
              'isFromConfirmButton',
              ParamType.bool,
            ),
            fromPage: params.getParam(
              'fromPage',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: CapturePictureSelfieIdcardPageWidget.routeName,
          path: CapturePictureSelfieIdcardPageWidget.routePath,
          builder: (context, params) => CapturePictureSelfieIdcardPageWidget(
            imageType: params.getParam(
              'imageType',
              ParamType.String,
            ),
            title: params.getParam(
              'title',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: TopupStatusPageWidget.routeName,
          path: TopupStatusPageWidget.routePath,
          builder: (context, params) => TopupStatusPageWidget(
            fromPage: params.getParam(
              'fromPage',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: SaveTopupSuccessWidget.routeName,
          path: SaveTopupSuccessWidget.routePath,
          builder: (context, params) => SaveTopupSuccessWidget(),
        ),
        FFRoute(
          name: SaveLeadHLSuccessWidget.routeName,
          path: SaveLeadHLSuccessWidget.routePath,
          builder: (context, params) => SaveLeadHLSuccessWidget(),
        ),
        FFRoute(
          name: TestPageWidget.routeName,
          path: TestPageWidget.routePath,
          builder: (context, params) => TestPageWidget(),
        ),
        FFRoute(
          name: TestPageCopyWidget.routeName,
          path: TestPageCopyWidget.routePath,
          builder: (context, params) => TestPageCopyWidget(),
        ),
        FFRoute(
          name: CustomerQrPaymentPageWidget.routeName,
          path: CustomerQrPaymentPageWidget.routePath,
          builder: (context, params) => CustomerQrPaymentPageWidget(
            amount: params.getParam(
              'amount',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: LoanDetailPageWidget.routeName,
          path: LoanDetailPageWidget.routePath,
          builder: (context, params) => LoanDetailPageWidget(
            bankIcon: params.getParam(
              'bankIcon',
              ParamType.FFUploadedFile,
            ),
            hashThaiId: params.getParam(
              'hashThaiId',
              ParamType.String,
            ),
            contNo: params.getParam(
              'contNo',
              ParamType.String,
            ),
            token: params.getParam(
              'token',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: SelectPaymentPageWidget.routeName,
          path: SelectPaymentPageWidget.routePath,
          builder: (context, params) => SelectPaymentPageWidget(
            bankIcon: params.getParam(
              'bankIcon',
              ParamType.FFUploadedFile,
            ),
            hashThaiId: params.getParam(
              'hashThaiId',
              ParamType.String,
            ),
            contNo: params.getParam(
              'contNo',
              ParamType.String,
            ),
            from: params.getParam(
              'from',
              ParamType.String,
            ),
            token: params.getParam(
              'token',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: VmiListPageWidget.routeName,
          path: VmiListPageWidget.routePath,
          builder: (context, params) => VmiListPageWidget(),
        ),
        FFRoute(
          name: SelectTopupProductPageOldWidget.routeName,
          path: SelectTopupProductPageOldWidget.routePath,
          builder: (context, params) => SelectTopupProductPageOldWidget(),
        ),
        FFRoute(
          name: LeadAgentDetailCustomerPageWidget.routeName,
          path: LeadAgentDetailCustomerPageWidget.routePath,
          builder: (context, params) => LeadAgentDetailCustomerPageWidget(
            product: params.getParam(
              'product',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ShareAgentReferPageWidget.routeName,
          path: ShareAgentReferPageWidget.routePath,
          builder: (context, params) => ShareAgentReferPageWidget(),
        ),
        FFRoute(
          name: MyLeadDashboardPageWidget.routeName,
          path: MyLeadDashboardPageWidget.routePath,
          builder: (context, params) => MyLeadDashboardPageWidget(),
        ),
        FFRoute(
          name: MyPayDashboardPageWidget.routeName,
          path: MyPayDashboardPageWidget.routePath,
          builder: (context, params) => MyPayDashboardPageWidget(),
        ),
        FFRoute(
          name: LeadDetailMenuPageWidget.routeName,
          path: LeadDetailMenuPageWidget.routePath,
          builder: (context, params) => LeadDetailMenuPageWidget(),
        ),
        FFRoute(
          name: VerifyTransferPageWidget.routeName,
          path: VerifyTransferPageWidget.routePath,
          builder: (context, params) => VerifyTransferPageWidget(),
        ),
        FFRoute(
          name: ProductMenuPageWidget.routeName,
          path: ProductMenuPageWidget.routePath,
          builder: (context, params) => ProductMenuPageWidget(
            agentCode: params.getParam(
              'agentCode',
              ParamType.String,
            ),
            fromPage: params.getParam(
              'fromPage',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: LeadAgentDetailCarPageWidget.routeName,
          path: LeadAgentDetailCarPageWidget.routePath,
          builder: (context, params) => LeadAgentDetailCarPageWidget(
            product: params.getParam(
              'product',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: CheckRateLHPageWidget.routeName,
          path: CheckRateLHPageWidget.routePath,
          builder: (context, params) => CheckRateLHPageWidget(),
        ),
        FFRoute(
          name: LeadAgentReviewDetailPageWidget.routeName,
          path: LeadAgentReviewDetailPageWidget.routePath,
          builder: (context, params) => LeadAgentReviewDetailPageWidget(
            imageCarBack: params.getParam(
              'imageCarBack',
              ParamType.FFUploadedFile,
            ),
            chanodFrontFile: params.getParam(
              'chanodFrontFile',
              ParamType.FFUploadedFile,
            ),
            chanodBackFile: params.getParam(
              'chanodBackFile',
              ParamType.FFUploadedFile,
            ),
          ),
        ),
        FFRoute(
          name: LeadAgentDetailLHPageWidget.routeName,
          path: LeadAgentDetailLHPageWidget.routePath,
          builder: (context, params) => LeadAgentDetailLHPageWidget(),
        ),
        FFRoute(
          name: SelectTopupProductPageWidget.routeName,
          path: SelectTopupProductPageWidget.routePath,
          builder: (context, params) => SelectTopupProductPageWidget(),
        ),
        FFRoute(
          name: AgentMainMenuPageWidget.routeName,
          path: AgentMainMenuPageWidget.routePath,
          builder: (context, params) => AgentMainMenuPageWidget(
            agentCode: params.getParam(
              'agentCode',
              ParamType.String,
            ),
            platform: params.getParam(
              'platform',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: LeadSuccesPageWidget.routeName,
          path: LeadSuccesPageWidget.routePath,
          builder: (context, params) => LeadSuccesPageWidget(),
        ),
        FFRoute(
          name: LeadDupePageWidget.routeName,
          path: LeadDupePageWidget.routePath,
          builder: (context, params) => LeadDupePageWidget(),
        ),
        FFRoute(
          name: LeadAgentConsentPageWidget.routeName,
          path: LeadAgentConsentPageWidget.routePath,
          builder: (context, params) => LeadAgentConsentPageWidget(),
        ),
        FFRoute(
          name: VerifyAgentWidget.routeName,
          path: VerifyAgentWidget.routePath,
          builder: (context, params) => VerifyAgentWidget(
            agentCode: params.getParam(
              'agentCode',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: TestPageCopy2Widget.routeName,
          path: TestPageCopy2Widget.routePath,
          builder: (context, params) => TestPageCopy2Widget(),
        ),
        FFRoute(
          name: AgentConfirmSuccesPageWidget.routeName,
          path: AgentConfirmSuccesPageWidget.routePath,
          builder: (context, params) => AgentConfirmSuccesPageWidget(
            confirm: params.getParam(
              'confirm',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: MyWalletPageWidget.routeName,
          path: MyWalletPageWidget.routePath,
          builder: (context, params) => MyWalletPageWidget(),
        ),
        FFRoute(
          name: CommissionHistoryPageWidget.routeName,
          path: CommissionHistoryPageWidget.routePath,
          builder: (context, params) => CommissionHistoryPageWidget(
            leadId: params.getParam(
              'leadId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: NameCardPageWidget.routeName,
          path: NameCardPageWidget.routePath,
          builder: (context, params) => NameCardPageWidget(),
        ),
        FFRoute(
          name: TestPage3Widget.routeName,
          path: TestPage3Widget.routePath,
          builder: (context, params) => TestPage3Widget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/AddCustomerLead';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
