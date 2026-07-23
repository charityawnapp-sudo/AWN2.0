import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          ? const SignInWidget()
          : const SplashScreenWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? const SignInWidget()
              : const SplashScreenWidget(),
        ),
        FFRoute(
          name: SplashScreenWidget.routeName,
          path: SplashScreenWidget.routePath,
          builder: (context, params) => const SplashScreenWidget(),
        ),
        FFRoute(
          name: HomeScreenWidget.routeName,
          path: HomeScreenWidget.routePath,
          builder: (context, params) => const HomeScreenWidget(),
        ),
        FFRoute(
          name: AboutWidget.routeName,
          path: AboutWidget.routePath,
          builder: (context, params) => const AboutWidget(),
        ),
        FFRoute(
          name: OnBoardingWidget.routeName,
          path: OnBoardingWidget.routePath,
          builder: (context, params) => const OnBoardingWidget(),
        ),
        FFRoute(
          name: SignInWidget.routeName,
          path: SignInWidget.routePath,
          builder: (context, params) => const SignInWidget(),
        ),
        FFRoute(
          name: PaymentWidget.routeName,
          path: PaymentWidget.routePath,
          builder: (context, params) => const PaymentWidget(),
        ),
        FFRoute(
          name: RegisterWidget.routeName,
          path: RegisterWidget.routePath,
          builder: (context, params) => const RegisterWidget(),
        ),
        FFRoute(
          name: ContactUsWidget.routeName,
          path: ContactUsWidget.routePath,
          builder: (context, params) => const ContactUsWidget(),
        ),
        FFRoute(
          name: AddNewCardWidget.routeName,
          path: AddNewCardWidget.routePath,
          builder: (context, params) => const AddNewCardWidget(),
        ),
        FFRoute(
          name: SelectCaseWidget.routeName,
          path: SelectCaseWidget.routePath,
          builder: (context, params) => const SelectCaseWidget(),
        ),
        FFRoute(
          name: FeedbackWidget.routeName,
          path: FeedbackWidget.routePath,
          builder: (context, params) => const FeedbackWidget(),
        ),
        FFRoute(
          name: HelpAndSupportWidget.routeName,
          path: HelpAndSupportWidget.routePath,
          builder: (context, params) => const HelpAndSupportWidget(),
        ),
        FFRoute(
          name: SetNewPasswordWidget.routeName,
          path: SetNewPasswordWidget.routePath,
          builder: (context, params) => const SetNewPasswordWidget(),
        ),
        FFRoute(
          name: MyVolunteerWidget.routeName,
          path: MyVolunteerWidget.routePath,
          builder: (context, params) => const MyVolunteerWidget(),
        ),
        FFRoute(
          name: ForgotPasswordWidget.routeName,
          path: ForgotPasswordWidget.routePath,
          builder: (context, params) => const ForgotPasswordWidget(),
        ),
        FFRoute(
          name: AccountAuthWidget.routeName,
          path: AccountAuthWidget.routePath,
          builder: (context, params) => AccountAuthWidget(
            userEmail: params.getParam(
              'userEmail',
              ParamType.string,
            ),
          ),
        ),
        FFRoute(
          name: SettingScreenWidget.routeName,
          path: SettingScreenWidget.routePath,
          builder: (context, params) => const SettingScreenWidget(),
        ),
        FFRoute(
          name: BigcampingWidget.routeName,
          path: BigcampingWidget.routePath,
          builder: (context, params) => const BigcampingWidget(),
        ),
        FFRoute(
          name: InsideCharityWidget.routeName,
          path: InsideCharityWidget.routePath,
          builder: (context, params) => InsideCharityWidget(
            charityID: params.getParam(
              'charityID',
              ParamType.string,
            ),
          ),
        ),
        FFRoute(
          name: AddcharityadminWidget.routeName,
          path: AddcharityadminWidget.routePath,
          builder: (context, params) => const AddcharityadminWidget(),
        ),
        FFRoute(
          name: SignInAdminWidget.routeName,
          path: SignInAdminWidget.routePath,
          builder: (context, params) => const SignInAdminWidget(),
        ),
        FFRoute(
          name: AdminDashboardWidget.routeName,
          path: AdminDashboardWidget.routePath,
          builder: (context, params) => const AdminDashboardWidget(),
        ),
        FFRoute(
          name: AdminUserfeedbackWidget.routeName,
          path: AdminUserfeedbackWidget.routePath,
          builder: (context, params) => const AdminUserfeedbackWidget(),
        ),
        FFRoute(
          name: MysavedcardWidget.routeName,
          path: MysavedcardWidget.routePath,
          builder: (context, params) => const MysavedcardWidget(),
        ),
        FFRoute(
          name: AdminSettingWidget.routeName,
          path: AdminSettingWidget.routePath,
          builder: (context, params) => const AdminSettingWidget(),
        ),
        FFRoute(
          name: BecomeVolunteerWidget.routeName,
          path: BecomeVolunteerWidget.routePath,
          builder: (context, params) => const BecomeVolunteerWidget(),
        ),
        FFRoute(
          name: AdminManagementWidget.routeName,
          path: AdminManagementWidget.routePath,
          builder: (context, params) => const AdminManagementWidget(),
        ),
        FFRoute(
          name: NotificationadminWidget.routeName,
          path: NotificationadminWidget.routePath,
          builder: (context, params) => const NotificationadminWidget(),
        ),
        FFRoute(
          name: MangecharityadmainWidget.routeName,
          path: MangecharityadmainWidget.routePath,
          builder: (context, params) => const MangecharityadmainWidget(),
        ),
        FFRoute(
          name: ProfileComplateWidget.routeName,
          path: ProfileComplateWidget.routePath,
          builder: (context, params) => const ProfileComplateWidget(),
        ),
        FFRoute(
          name: AfterSendForgetpassWidget.routeName,
          path: AfterSendForgetpassWidget.routePath,
          builder: (context, params) => AfterSendForgetpassWidget(
            resetEmail: params.getParam(
              'resetEmail',
              ParamType.string,
            ),
          ),
        ),
        FFRoute(
          name: MapWidget.routeName,
          path: MapWidget.routePath,
          builder: (context, params) => const MapWidget(),
        ),
        FFRoute(
          name: ProfileScreenWidget.routeName,
          path: ProfileScreenWidget.routePath,
          builder: (context, params) => const ProfileScreenWidget(),
        ),
        FFRoute(
          name: CommunityWidget.routeName,
          path: CommunityWidget.routePath,
          builder: (context, params) => const CommunityWidget(),
        ),
        FFRoute(
          name: DonateWidget.routeName,
          path: DonateWidget.routePath,
          builder: (context, params) => const DonateWidget(),
        ),
        FFRoute(
          name: CharitiesWidget.routeName,
          path: CharitiesWidget.routePath,
          builder: (context, params) => const CharitiesWidget(),
        ),
        FFRoute(
          name: AdminBigcampingWidget.routeName,
          path: AdminBigcampingWidget.routePath,
          builder: (context, params) => const AdminBigcampingWidget(),
        ),
        FFRoute(
          name: ManagevolunteeradminWidget.routeName,
          path: ManagevolunteeradminWidget.routePath,
          builder: (context, params) => const ManagevolunteeradminWidget(),
        ),
        FFRoute(
          name: VolunteerWidget.routeName,
          path: VolunteerWidget.routePath,
          builder: (context, params) => const VolunteerWidget(),
        ),
        FFRoute(
          name: InsidedonatecategoryWidget.routeName,
          path: InsidedonatecategoryWidget.routePath,
          builder: (context, params) => InsidedonatecategoryWidget(
            donateCategory: params.getParam(
              'donateCategory',
              ParamType.string,
            ),
          ),
        ),
        FFRoute(
          name: AddvolunteeradminWidget.routeName,
          path: AddvolunteeradminWidget.routePath,
          builder: (context, params) => const AddvolunteeradminWidget(),
        ),
        FFRoute(
          name: InsideBigCampaignWidget.routeName,
          path: InsideBigCampaignWidget.routePath,
          builder: (context, params) => InsideBigCampaignWidget(
            bigcampaign: params.getParam(
              'bigcampaign',
              ParamType.string,
            ),
          ),
        ),
        FFRoute(
          name: AiAssistanceWidget.routeName,
          path: AiAssistanceWidget.routePath,
          builder: (context, params) => const AiAssistanceWidget(),
        ),
        FFRoute(
          name: AddBigCampaignWidget.routeName,
          path: AddBigCampaignWidget.routePath,
          builder: (context, params) => const AddBigCampaignWidget(),
        ),
        FFRoute(
          name: EditBigCampaignadminWidget.routeName,
          path: EditBigCampaignadminWidget.routePath,
          builder: (context, params) => EditBigCampaignadminWidget(
            bigcampaignid: params.getParam(
              'bigcampaignid',
              ParamType.string,
            ),
          ),
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
            return '/splashScreen';
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

  static TransitionInfo appDefault() =>
      const TransitionInfo(hasTransition: false);
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


