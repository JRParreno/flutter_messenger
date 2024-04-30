import 'package:flutter_messenger/core/config/shared_prefences_keys.dart';
import 'package:flutter_messenger/core/notifier/shared_preferences_notifier.dart';
import 'package:flutter_messenger/src/chats/presentation/chats.dart';
import 'package:flutter_messenger/src/on_boarding/on_boarding_page.dart';
import 'package:flutter_messenger/src/navigation/scafold/main_nav.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

GoRouter routeConfig() {
  final sharedPreferencesNotifier = GetIt.instance<SharedPreferencesNotifier>();
  final bool isLoggedIn = sharedPreferencesNotifier.getValue(
      SharedPreferencesKeys.isLoggedIn, false);
  final bool isOnBoarded = sharedPreferencesNotifier.getValue(
      SharedPreferencesKeys.isOnBoarded, false);

  return GoRouter(
    initialLocation: isLoggedIn
        ? '/'
        : isOnBoarded
            ? '/chats'
            : '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const OnBoardingPage(),
      ),
      ShellRoute(
        routes: [
          GoRoute(
            path: '/chats',
            builder: (context, state) => const ChatsPage(),
          ),
        ],
        builder: (context, state, child) {
          return MainNav(
            child: child,
          );
        },
      ),
    ],
  );
}
