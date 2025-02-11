import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

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
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const NavBarPage() : const HomePageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const NavBarPage() : const HomePageWidget(),
        ),
        FFRoute(
          name: 'login0',
          path: '/login_1',
          builder: (context, params) => const Login0Widget(),
        ),
        FFRoute(
          name: 'Tsignup',
          path: '/tsignup',
          builder: (context, params) => const TsignupWidget(),
        ),
        FFRoute(
          name: 'Welcome',
          path: '/welcome',
          builder: (context, params) => const WelcomeWidget(),
        ),
        FFRoute(
          name: 'DoctorDetails',
          path: '/doctorDetails',
          builder: (context, params) => const DoctorDetailsWidget(),
        ),
        FFRoute(
          name: 'Settings',
          path: '/settings',
          builder: (context, params) => const SettingsWidget(),
        ),
        FFRoute(
          name: 'dashboard',
          path: '/dashboard',
          builder: (context, params) => const DashboardWidget(),
        ),
        FFRoute(
          name: 'UserProfile',
          path: '/userProfile',
          builder: (context, params) => const UserProfileWidget(),
        ),
        FFRoute(
          name: 'Q01',
          path: '/q01',
          builder: (context, params) => const Q01Widget(),
        ),
        FFRoute(
          name: 'Q02',
          path: '/q02',
          builder: (context, params) => const Q02Widget(),
        ),
        FFRoute(
          name: 'Q03',
          path: '/q03',
          builder: (context, params) => const Q03Widget(),
        ),
        FFRoute(
          name: 'Q04',
          path: '/q04',
          builder: (context, params) => const Q04Widget(),
        ),
        FFRoute(
          name: 'Q05',
          path: '/q05',
          builder: (context, params) => const Q05Widget(),
        ),
        FFRoute(
          name: 'Q06',
          path: '/q06',
          builder: (context, params) => const Q06Widget(),
        ),
        FFRoute(
          name: 'Q07',
          path: '/q07',
          builder: (context, params) => const Q07Widget(),
        ),
        FFRoute(
          name: 'Q08',
          path: '/q08',
          builder: (context, params) => const Q08Widget(),
        ),
        FFRoute(
          name: 'Q09',
          path: '/q09',
          builder: (context, params) => const Q09Widget(),
        ),
        FFRoute(
          name: 'Q10',
          path: '/q10',
          builder: (context, params) => const Q10Widget(),
        ),
        FFRoute(
          name: 'Q11',
          path: '/q11',
          builder: (context, params) => const Q11Widget(),
        ),
        FFRoute(
          name: 'Q12',
          path: '/q12',
          builder: (context, params) => const Q12Widget(),
        ),
        FFRoute(
          name: 'Q13',
          path: '/q13',
          builder: (context, params) => const Q13Widget(),
        ),
        FFRoute(
          name: 'Q14',
          path: '/q14',
          builder: (context, params) => const Q14Widget(),
        ),
        FFRoute(
          name: 'Q15',
          path: '/q15',
          builder: (context, params) => const Q15Widget(),
        ),
        FFRoute(
          name: 'Tmainpage0',
          path: '/mainpage',
          builder: (context, params) => const Tmainpage0Widget(),
        ),
        FFRoute(
          name: 'main',
          path: '/main',
          builder: (context, params) => const MainWidget(),
        ),
        FFRoute(
          name: 'BlogDetails',
          path: '/blogDetails',
          builder: (context, params) => const BlogDetailsWidget(),
        ),
        FFRoute(
          name: 'LandingPage',
          path: '/landingPage',
          builder: (context, params) => const LandingPageWidget(),
        ),
        FFRoute(
          name: 'TSignup0',
          path: '/Signup',
          builder: (context, params) => const TSignup0Widget(),
        ),
        FFRoute(
          name: 'LoginPage',
          path: '/Login_02',
          builder: (context, params) => const LoginPageWidget(),
        ),
        FFRoute(
          name: 'SignupPage',
          path: '/login_01',
          builder: (context, params) => const SignupPageWidget(),
        ),
        FFRoute(
          name: 'blog',
          path: '/blog',
          builder: (context, params) => const BlogWidget(),
        ),
        FFRoute(
          name: 'ONBOARD',
          path: '/onboard',
          builder: (context, params) => const OnboardWidget(),
        ),
        FFRoute(
          name: 'onboarding',
          path: '/onboarding',
          builder: (context, params) => const OnboardingWidget(),
        ),
        FFRoute(
          name: 'HomePage',
          path: '/HomePage',
          builder: (context, params) => const HomePageWidget(),
        ),
        FFRoute(
          name: 'Tmain',
          path: '/Tmain',
          builder: (context, params) => const TmainWidget(),
        ),
        FFRoute(
          name: 'Mindoria',
          path: '/Mindoria',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'Mindoria')
              : const MindoriaWidget(),
        ),
        FFRoute(
          name: 'ChatScreen',
          path: '/ChatScreen',
          builder: (context, params) => const ChatScreenWidget(),
        ),
        FFRoute(
          name: 'ChatbotPage',
          path: '/ChatbotPage',
          builder: (context, params) => const ChatbotPageWidget(),
        ),
        FFRoute(
          name: 'VirtualTherapist',
          path: '/virtualTherapist',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'VirtualTherapist')
              : const VirtualTherapistWidget(),
        ),
        FFRoute(
          name: 'DoctorDetailsCopy',
          path: '/doctorDetailsCopy',
          builder: (context, params) => const DoctorDetailsCopyWidget(),
        ),
        FFRoute(
          name: 'Progress',
          path: '/progress',
          builder: (context, params) => const ProgressWidget(),
        ),
        FFRoute(
          name: 'Meditation',
          path: '/meditation',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'Meditation')
              : const MeditationWidget(),
        ),
        FFRoute(
          name: 'List13PropertyListview',
          path: '/list13PropertyListview',
          builder: (context, params) => const List13PropertyListviewWidget(),
        ),
        FFRoute(
          name: 'details',
          path: '/details',
          builder: (context, params) => const DetailsWidget(),
        ),
        FFRoute(
          name: 'Home18Travel',
          path: '/home18Travel',
          builder: (context, params) => const Home18TravelWidget(),
        ),
        FFRoute(
          name: 'Blogs',
          path: '/blogs',
          builder: (context, params) =>
              params.isEmpty ? const NavBarPage(initialPage: 'Blogs') : const BlogsWidget(),
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
            return '/HomePage';
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

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
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
