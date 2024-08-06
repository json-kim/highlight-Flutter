import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:highlight_flutter/screen/highlight_edit/highlight_edit_screen.dart';
import 'package:highlight_flutter/screen/highlight_list/highlight_list_screen.dart';
import 'package:highlight_flutter/screen/init/init_screen.dart';
import 'package:highlight_flutter/screen/main/main_screen.dart';
import 'package:highlight_flutter/screen/photo_grid/photo_grid_screen.dart';
import 'package:highlight_flutter/screen/profile/profile_screen.dart';
import 'package:highlight_flutter/screen/version/version_page.dart';

part 'app_router.g.dart';

abstract class Routes {
  static const home = '/';
  static const list = 'list';
  static const photos = 'photos';
  static const profile = 'profile';
  static const backup = 'backup';
  static const reset = 'reset';
  static const version = 'version';
  static const edit = 'edit';
}

final appRouter = GoRouter(
  routes: $appRoutes,
  initialLocation: Routes.home,
);

@TypedGoRoute<SampleMainRouteData>(
  path: Routes.home,
  routes: [
    TypedStatefulShellRoute<MainRouteData>(
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
        ]),
    TypedGoRoute<EditRouteData>(path: Routes.edit),
    TypedGoRoute<BackupRouteData>(path: Routes.backup),
    TypedGoRoute<ResetRouteData>(path: Routes.reset),
    TypedGoRoute<VersionRouteData>(path: Routes.version),
  ],
)
class SampleMainRouteData extends GoRouteData {
  const SampleMainRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const InitScreen();
  }
}

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
    return const NoTransitionPage(child: ProfileScreen());
  }
}

class BackupRouteData extends GoRouteData {
  const BackupRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AboutDialog();
  }
}

class ResetRouteData extends GoRouteData {
  const ResetRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AboutDialog();
  }
}

class VersionRouteData extends GoRouteData {
  const VersionRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return VersionPage();
  }
}

class EditRouteData extends GoRouteData {
  const EditRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: HighlightEditScreen());
  }
}
