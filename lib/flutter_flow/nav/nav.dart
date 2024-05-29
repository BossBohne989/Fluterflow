import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

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
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? GameRoomWidget() : SponsorWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? GameRoomWidget() : SponsorWidget(),
        ),
        FFRoute(
          name: 'Login',
          path: '/login',
          builder: (context, params) => LoginWidget(),
        ),
        FFRoute(
          name: 'GameRoom',
          path: '/gameRoom',
          builder: (context, params) => GameRoomWidget(),
        ),
        FFRoute(
          name: 'Registration',
          path: '/registration',
          builder: (context, params) => RegistrationWidget(),
        ),
        FFRoute(
          name: 'MembersHome',
          path: '/membersHome',
          builder: (context, params) => MembersHomeWidget(
            wto: params.getParam<String>(
              'wto',
              ParamType.String,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: 'MembersProfil',
          path: '/membersProfil',
          builder: (context, params) => MembersProfilWidget(),
        ),
        FFRoute(
          name: 'Game_CreateRoom',
          path: '/Game_CreateRoom',
          builder: (context, params) => GameCreateRoomWidget(),
        ),
        FFRoute(
          name: 'Game_Settings_Team_Selection',
          path: '/Game_Settings_Team_Selection',
          builder: (context, params) => GameSettingsTeamSelectionWidget(),
        ),
        FFRoute(
          name: 'Game_Settings-Team',
          path: '/Game_SettingsTeam',
          builder: (context, params) => GameSettingsTeamWidget(),
        ),
        FFRoute(
          name: 'WTOTalkRoom',
          path: '/wTOTalkRoom',
          builder: (context, params) => WTOTalkRoomWidget(),
        ),
        FFRoute(
          name: 'WTOHome',
          path: '/wTOHome',
          builder: (context, params) => WTOHomeWidget(
            roundOne: params.getParam(
              'roundOne',
              ParamType.DateTime,
            ),
            roundTwo: params.getParam(
              'roundTwo',
              ParamType.DateTime,
            ),
          ),
        ),
        FFRoute(
          name: 'WTOAgenda',
          path: '/WTOAgenda',
          builder: (context, params) => WTOAgendaWidget(
            topic: params.getParam(
              'topic',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'WTOLobby',
          path: '/wTOLobby',
          builder: (context, params) => WTOLobbyWidget(),
        ),
        FFRoute(
          name: 'MembersWaitingRoom',
          path: '/membersWaitingRoom',
          builder: (context, params) => MembersWaitingRoomWidget(),
        ),
        FFRoute(
          name: 'CreateGroupChatPage',
          path: '/createGroupChatPage',
          builder: (context, params) => CreateGroupChatPageWidget(),
        ),
        FFRoute(
          name: 'MembersTalkRoom',
          path: '/membersTalkRoom',
          builder: (context, params) => MembersTalkRoomWidget(),
        ),
        FFRoute(
          name: 'MembersChat',
          path: '/membersChat',
          builder: (context, params) => MembersChatWidget(),
        ),
        FFRoute(
          name: 'Chatmessage',
          path: '/chatmessage',
          builder: (context, params) => ChatmessageWidget(),
        ),
        FFRoute(
          name: 'WTOChatmessage',
          path: '/wTOChatmessage',
          builder: (context, params) => WTOChatmessageWidget(),
        ),
        FFRoute(
          name: 'WTOAllTargets',
          path: '/wTOAllTargets',
          builder: (context, params) => WTOAllTargetsWidget(),
        ),
        FFRoute(
          name: 'Game_Settings_Team_Leader',
          path: '/Game_Settings_Team_Leader',
          builder: (context, params) => GameSettingsTeamLeaderWidget(),
        ),
        FFRoute(
          name: 'Country_Selection',
          path: '/countrySelection',
          builder: (context, params) => CountrySelectionWidget(),
        ),
        FFRoute(
          name: 'GroupeChatMes',
          path: '/groupechatmes',
          builder: (context, params) => GroupeChatMesWidget(),
        ),
        FFRoute(
          name: 'WTOInformationPage',
          path: '/WTOInformationPage',
          builder: (context, params) => WTOInformationPageWidget(),
        ),
        FFRoute(
          name: 'MembersAbkommen',
          path: '/membersAbkommen',
          builder: (context, params) => MembersAbkommenWidget(),
        ),
        FFRoute(
          name: 'MembersAbkommeninfo',
          path: '/MembersAbkommeninfo',
          builder: (context, params) => MembersAbkommeninfoWidget(),
        ),
        FFRoute(
          name: 'MembersAbkommenCreate',
          path: '/membersAbkommenCreate',
          builder: (context, params) => MembersAbkommenCreateWidget(),
        ),
        FFRoute(
          name: 'WTOPhase',
          path: '/WTOPhase',
          builder: (context, params) => WTOPhaseWidget(),
        ),
        FFRoute(
          name: 'Phase1',
          path: '/phase1',
          builder: (context, params) => Phase1Widget(),
        ),
        FFRoute(
          name: 'Phase2',
          path: '/phase2',
          builder: (context, params) => Phase2Widget(),
        ),
        FFRoute(
          name: 'Phase3',
          path: '/phase3',
          builder: (context, params) => Phase3Widget(),
        ),
        FFRoute(
          name: 'Phase4',
          path: '/phase4',
          builder: (context, params) => Phase4Widget(),
        ),
        FFRoute(
          name: 'Phase5',
          path: '/phase5',
          builder: (context, params) => Phase5Widget(),
        ),
        FFRoute(
          name: 'MembersPreAgenda',
          path: '/membersPreAgenda',
          builder: (context, params) => MembersPreAgendaWidget(
            wto: params.getParam<String>(
              'wto',
              ParamType.String,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: 'WTOPreAgenda',
          path: '/WTOPreAgenda',
          builder: (context, params) => WTOPreAgendaWidget(
            topic: params.getParam(
              'topic',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'WTOCrePreAgenda',
          path: '/WTOCrePreAgenda',
          builder: (context, params) => WTOCrePreAgendaWidget(
            topic: params.getParam(
              'topic',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Passwordreset',
          path: '/passwordreset',
          builder: (context, params) => PasswordresetWidget(),
        ),
        FFRoute(
          name: 'MembersWTOChat',
          path: '/membersWTOChat',
          builder: (context, params) => MembersWTOChatWidget(),
        ),
        FFRoute(
          name: 'WTOCommunique',
          path: '/WTOCommunique',
          builder: (context, params) => WTOCommuniqueWidget(
            topic: params.getParam(
              'topic',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'WTOEnd',
          path: '/WTOEnd',
          builder: (context, params) => WTOEndWidget(
            topic: params.getParam(
              'topic',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'WTOChat',
          path: '/wTOChat',
          builder: (context, params) => WTOChatWidget(),
        ),
        FFRoute(
          name: 'membersPreGoals',
          path: '/membersPreGoals',
          builder: (context, params) => MembersPreGoalsWidget(),
        ),
        FFRoute(
          name: 'Game_Settings',
          path: '/Game_Settings',
          builder: (context, params) => GameSettingsWidget(),
        ),
        FFRoute(
          name: 'Game_CreateCountrie',
          path: '/Game_CreateCountrie',
          builder: (context, params) => GameCreateCountrieWidget(),
        ),
        FFRoute(
          name: 'Game_Settings_GameCode',
          path: '/Game_Settings_GameCode',
          builder: (context, params) => GameSettingsGameCodeWidget(),
        ),
        FFRoute(
          name: 'WTOPreTalkRoom',
          path: '/WTOPreTalkRoom',
          builder: (context, params) => WTOPreTalkRoomWidget(),
        ),
        FFRoute(
          name: 'MembersPreTalkRoom',
          path: '/membersPreTalkRoom',
          builder: (context, params) => MembersPreTalkRoomWidget(),
        ),
        FFRoute(
          name: 'Game_Settings_Selection',
          path: '/Game_Settings_Selection',
          builder: (context, params) => GameSettingsSelectionWidget(),
        ),
        FFRoute(
          name: 'Game_Settings_Packages',
          path: '/Game_Settings_Packages',
          builder: (context, params) => GameSettingsPackagesWidget(),
        ),
        FFRoute(
          name: 'Game_Settings_Packages_01',
          path: '/Game_Settings_Packages_01',
          builder: (context, params) => GameSettingsPackages01Widget(),
        ),
        FFRoute(
          name: 'Game_Settings_Packages_02',
          path: '/Game_Settings_Packages_02',
          builder: (context, params) => GameSettingsPackages02Widget(),
        ),
        FFRoute(
          name: 'Game_Settings_Packages_03',
          path: '/Game_Settings_Packages_03',
          builder: (context, params) => GameSettingsPackages03Widget(),
        ),
        FFRoute(
          name: 'Sponsor',
          path: '/sponsor',
          builder: (context, params) => SponsorWidget(),
        ),
        FFRoute(
          name: 'membersGoals',
          path: '/membersGoals',
          builder: (context, params) => MembersGoalsWidget(),
        ),
        FFRoute(
          name: 'MembersAllinOne',
          path: '/membersAllinOne',
          builder: (context, params) => MembersAllinOneWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
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
            return '/sponsor';
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