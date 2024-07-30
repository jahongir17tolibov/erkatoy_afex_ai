import 'package:erkatoy_afex_ai/di.dart';
import 'package:erkatoy_afex_ai/feature/auth/presentation/creating_account/bloc/create_account_bloc.dart';
import 'package:erkatoy_afex_ai/feature/auth/presentation/creating_account/creating_account_screen.dart';
import 'package:erkatoy_afex_ai/feature/auth/presentation/login/bloc/login_bloc.dart';
import 'package:erkatoy_afex_ai/feature/auth/presentation/login/login_screen.dart';
import 'package:erkatoy_afex_ai/feature/auth/presentation/register/bloc/register_bloc.dart';
import 'package:erkatoy_afex_ai/feature/auth/presentation/register/register_screen.dart';
import 'package:erkatoy_afex_ai/feature/change_lang/bloc/change_lang_bloc.dart';
import 'package:erkatoy_afex_ai/feature/change_lang/change_lang_screen.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/chat/bloc/chat_bloc.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/chat/chat_screen.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/daily_schedule/bloc/daily_schedule_bloc.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/daily_schedule/daily_schedule_screen.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/health/bloc/health_bloc.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/health/health_tips_screen.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/home/bloc/home_bloc.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/home/home_screen.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/nav_bar/scaffold_with_nav_bar.dart';
import 'package:erkatoy_afex_ai/feature/settings/presentation/settings_screen.dart';
import 'package:erkatoy_afex_ai/feature/splash/splash_screen.dart';
import 'package:erkatoy_afex_ai/feature/zen/presentation/zen_mode_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  static final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _bottomNavKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _homeNavKey = GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: SplashScreen.routeName,
    navigatorKey: _rootNavigatorKey,
    routes: [
      /// splash
      GoRoute(
        path: SplashScreen.routeName,
        builder: (context, _) => const SplashScreen(),
        routes: [
          GoRoute(
            path: ChangeLangScreen.routeName,
            name: ChangeLangScreen.routeName,
            pageBuilder: (context, _) => _materialPage(BlocProvider(
              create: (_) => getIt<ChangeLangBloc>(),
              child: const ChangeLangScreen(),
            )),
          ),
        ],
      ),

      ///auth
      GoRoute(
        path: RegisterScreen.routeName,
        pageBuilder: (context, _) => _cupertinoPage(BlocProvider(
          create: (_) => getIt<RegisterBloc>(),
          child: const RegisterScreen(),
        )),
        routes: [
          GoRoute(
            path: LoginScreen.routeName,
            name: LoginScreen.routeName,
            pageBuilder: (context, _) => _cupertinoPage(BlocProvider(
              create: (_) => getIt<LoginBloc>(),
              child: const LoginScreen(),
            )),
          ),
          GoRoute(
            path: CreatingAccountScreen.routePath,
            name: CreatingAccountScreen.routeName,
            pageBuilder: (context, state) {
              final phone = state.pathParameters['phone'];
              final password = state.pathParameters['pass'];
              return _cupertinoPage(BlocProvider(
                create: (_) => getIt<CreateAccountBloc>(),
                child: CreatingAccountScreen(phone: phone ?? '', password: password ?? ''),
              ));
            },
          ),
        ],
      ),

      GoRoute(
        path: ZenModeScreen.routePath,
        name: ZenModeScreen.routeName,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, _) => _materialPage(const ZenModeScreen()),
      ),

      /// home
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, _, navShell) => ScaffoldWithNavBar(navigationShell: navShell),
        branches: [
          /// zen
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: ZenModeScreen.routeBottom,
                builder: (context, _) => const ZenModeScreen(),
              ),
            ],
          ),

          /// home
          StatefulShellBranch(
            navigatorKey: _homeNavKey,
            routes: [
              GoRoute(
                path: HomeScreen.routeName,
                builder: (context, _) => BlocProvider(
                  create: (_) => getIt<HomeBloc>(),
                  child: const HomeScreen(),
                ),
                routes: [
                  GoRoute(
                    path: ChatScreen.routeName,
                    name: ChatScreen.routeName,
                    parentNavigatorKey: _rootNavigatorKey,
                    pageBuilder: (context, _) => _materialPage(BlocProvider(
                      create: (_) => getIt<ChatBloc>(),
                      child: const ChatScreen(),
                    )),
                  ),
                  GoRoute(
                    path: HealthTipsScreen.routeName,
                    name: HealthTipsScreen.routeName,
                    parentNavigatorKey: _rootNavigatorKey,
                    pageBuilder: (context, _) => _materialPage(BlocProvider(
                      create: (_) => getIt<HealthBloc>(),
                      child: const HealthTipsScreen(),
                    )),
                  ),
                  GoRoute(
                    path: DailyScheduleScreen.routePath,
                    name: DailyScheduleScreen.routeName,
                    parentNavigatorKey: _rootNavigatorKey,
                    pageBuilder: (context, state) {
                      final currentTime = state.pathParameters['current_time'];
                      return _materialPage(BlocProvider(
                        create: (_) => getIt<DailyScheduleBloc>(),
                        child: DailyScheduleScreen(currentTime: currentTime!),
                      ));
                    },
                  ),
                ],
              )
            ],
          ),

          /// settings
          StatefulShellBranch(
            routes: [
              GoRoute(
                  path: SettingsScreen.routeName,
                  builder: (context, _) => const SettingsScreen(),
                  routes: [
                    GoRoute(
                      path: CreatingAccountScreen.settingsRouteName,
                      name: CreatingAccountScreen.settingsRouteName,
                      parentNavigatorKey: _rootNavigatorKey,
                      pageBuilder: (context, _) {
                        return _cupertinoPage(BlocProvider(
                          create: (_) => getIt<CreateAccountBloc>(),
                          child: const CreatingAccountScreen(phone: '', password: ''),
                        ));
                      },
                    ),
                  ])
            ],
          )
        ],
      ),
    ],
  );

  static GoRouter get router => _router;

  static GlobalKey<NavigatorState> get navigatorKey => _rootNavigatorKey;

  static Page<dynamic> _materialPage(Widget screen) => MaterialPage(child: screen);

  static Page<dynamic> _cupertinoPage(Widget screen) => CupertinoPage(child: screen);
}
