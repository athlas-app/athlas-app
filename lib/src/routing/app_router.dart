import 'package:athlas/src/app_controller.dart';
import 'package:athlas/src/data/auth/auth_repository.dart';
import 'package:athlas/src/ui/common/navigation/navigation_bar.dart';
import 'package:athlas/src/ui/screens/home/home_screen.dart';
import 'package:athlas/src/ui/screens/play/play_screen.dart';
import 'package:athlas/src/ui/screens/profile/profile_screen.dart';
import 'package:athlas/src/ui/screens/auth/auth_screen.dart';
import 'package:athlas/src/ui/screens/auth/auth_form_type.dart';
import 'package:athlas/src/routing/utils/go_router_refresh_stream.dart';
import 'package:athlas/src/ui/screens/error/not_found_screen.dart';
import 'package:athlas/src/ui/screens/social/social_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

enum AppRoute {
  home,
  play,
  social,
  profile,
  signIn;
}

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  final appState = ref.watch(appControllerProvider);

  return GoRouter(
    initialLocation: '/home',
    debugLogDiagnostics: kDebugMode,
    redirect: (context, state) {
      final isLoggedIn = (authRepository.currentUser != null);
      if (isLoggedIn) {
        if (state.location == '/signIn') {
          return '/home';
        }
      } else {
        if (state.location != '/signIn') {
          return '/signIn';
        }
      }
      return null;
    },
    refreshListenable: GoRouterRefreshStream(authRepository.authStateChanges()),
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return appState.when(
            data: (appState) {
              return Scaffold(
                backgroundColor: Colors.white,
                body: child,
                bottomNavigationBar:
                    NavigationBarUI(items: appState.navigationBarItems),
              );
            },
            error: (error, stackTrace) => const NotFoundScreen(),
            loading: () => const CircularProgressIndicator(),
          );
        },
        routes: [
          GoRoute(
            path: '/home',
            name: AppRoute.home.name,
            pageBuilder: (context, state) => MaterialPage<HomeScreen>(
              key: state.pageKey,
              child: HomeScreen(key: state.pageKey),
            ),
          ),
          GoRoute(
            path: '/play',
            name: AppRoute.play.name,
            pageBuilder: (context, state) => MaterialPage<PlayScreen>(
              key: state.pageKey,
              child: PlayScreen(),
            ),
          ),
          GoRoute(
            path: '/social',
            name: AppRoute.social.name,
            pageBuilder: (context, state) => MaterialPage<SocialScreen>(
              key: state.pageKey,
              child: SocialScreen(),
            ),
          ),
          GoRoute(
            path: '/profile',
            name: AppRoute.profile.name,
            pageBuilder: (context, state) => MaterialPage<ProfileScreen>(
              key: state.pageKey,
              child: ProfileScreen(),
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/signIn',
        name: AppRoute.signIn.name,
        pageBuilder: (context, state) => MaterialPage<AuthScreen>(
          key: state.pageKey,
          child: AuthScreen(
            key: state.pageKey,
            formType: AuthFormType.signIn,
          ),
        ),
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
}
