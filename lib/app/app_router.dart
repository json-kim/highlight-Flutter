import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:highlight_flutter/screen/main/main_screen.dart';

part 'app_router.g.dart';

abstract class Routes {
  static const home = '/';
  static const list = '/list';
  static const photos = '/photos';
  static const profile = '/profile';
}

final appRouter = GoRouter(
  routes: $appRoutes,
  initialLocation: Routes.list,
);

@TypedShellRoute<MainRouteData>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<ListRouteData>(path: Routes.list),
    TypedGoRoute<PhotosRouteData>(path: Routes.photos),
    TypedGoRoute<ProfileRouteData>(path: Routes.profile),
  ],
)
class MainRouteData extends ShellRouteData {
  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return MainScreen(child: navigator);
  }
}

class ListRouteData extends GoRouteData {
  const ListRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(
        child: Scaffold(
      body: Text('리스트'),
    ));
  }
}

class PhotosRouteData extends GoRouteData {
  const PhotosRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(
        child: Scaffold(
      body: Text('포토'),
    ));
  }
}

class ProfileRouteData extends GoRouteData {
  const ProfileRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(
        child: Scaffold(
      body: Text('프로필'),
    ));
  }
}
