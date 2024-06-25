import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:highlight_flutter/screen/highlight_list/highlight_list_screen.dart';
import 'package:highlight_flutter/screen/main/main_screen.dart';
import 'package:highlight_flutter/screen/photo_grid/photo_grid_screen.dart';

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

@TypedStatefulShellRoute<MainRouteData>(
    branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
      TypedStatefulShellBranch(
        routes: <TypedRoute<RouteData>>[
          TypedGoRoute<ListRouteData>(path: Routes.list),
        ],
      ),
      TypedStatefulShellBranch(
        routes: [
          TypedGoRoute<PhotosRouteData>(path: Routes.photos),
        ],
      ),
      TypedStatefulShellBranch(
        routes: [
          TypedGoRoute<ProfileRouteData>(path: Routes.profile),
        ],
      ),
    ])
class MainRouteData extends StatefulShellRouteData {
  const MainRouteData();

  @override
  Widget builder(BuildContext context, GoRouterState state,
      StatefulNavigationShell navigationShell) {
    return MainScreen(navigationShell: navigationShell);
  }
}

class ListRouteData extends GoRouteData {
  const ListRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: HighlightListScreen());
  }
}

class PhotosRouteData extends GoRouteData {
  const PhotosRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: PhotoGridScreen());
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
