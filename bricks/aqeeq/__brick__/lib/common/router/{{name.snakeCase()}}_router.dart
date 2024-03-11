import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/extensions/extensions.dart';
import '../../core/widgets/widgets.dart';
import '../widgets/widgets.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

class {{name.pascalCase()}}Router {
{{name.pascalCase()}}Router();

  static GoRouter router(WidgetRef ref) {
    return GoRouter(
      navigatorKey: _rootNavigatorKey,
      debugLogDiagnostics: true,
      initialLocation: '/',
      observers: [
        RouteObserver(),
      ],
      routes: <RouteBase>[
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) => AppScaffold(
            body: child,
          ),
          routes: [
            GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              name: 'home',
              path: '/',
              pageBuilder: (context, state) => AppTransitionPage.fadeIn(
                key: state.pageKey,
                name: context.strings.home,
                child: const HomePage(),
              ),
            ),
            GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              name: 'posts',
              path: '/posts',
              pageBuilder: (context, state) => MaterialPage(
                key: state.pageKey,
                name: context.strings.subjects,
                child: const PostsPage(),
              ),
            ),
            GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              name: 'post',
              path: '/posts/:id',
              pageBuilder: (context, state) => MaterialPage(
                key: state.pageKey,
                name: 'Post',
                fullscreenDialog: true,
                child: PostPage(
                  courseId: state.pathParameters['id']!,
                ),
              ),
            ),
          ],
        ),
      ],
      errorPageBuilder: (context, state) => MaterialPage<void>(
        key: state.pageKey,
        name: 'Not Found',
        child: Scaffold(
          appBar: AppBar(),
          body: const StatusView.pageNotFound(),
        ),
      ),
    );
  }
}

class AppTransitionPage {
  static CustomTransitionPage<void> downToUp({
    required Widget child,
    LocalKey? key,
    String? name,
  }) {
    return CustomTransitionPage<void>(
      key: key,
      child: child,
      name: name,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0, 1);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }

  static CustomTransitionPage<void> endToStart({
    required Widget child,
    LocalKey? key,
    String? name,
  }) {
    return CustomTransitionPage<void>(
      key: key,
      child: child,
      name: name,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final begin = Offset(
          Directionality.of(context) == TextDirection.ltr ? 1.0 : -1.0,
          0,
        );
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: ColoredBox(
            color: context.theme.colorScheme.background,
            child: child,
          ),
        );
      },
    );
  }

  static CustomTransitionPage<void> fadeIn({
    required Widget child,
    LocalKey? key,
    String? name,
  }) {
    return CustomTransitionPage<void>(
      key: key,
      child: child,
      name: name,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}
