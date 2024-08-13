import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:highlight_flutter/app/router/router_object_cache.dart';
import 'package:highlight_flutter/screen/common/photo_view_screen.dart';
import 'package:highlight_flutter/screen/highlight_detail/highlight_detail_screen.dart';
import 'package:highlight_flutter/screen/highlight_edit/highlight_edit_screen.dart';
import 'package:highlight_flutter/screen/highlight_list/highlight_list_screen.dart';
import 'package:highlight_flutter/screen/init/init_screen.dart';
import 'package:highlight_flutter/screen/main/main_screen.dart';
import 'package:highlight_flutter/screen/photo_grid/photo_grid_screen.dart';
import 'package:highlight_flutter/screen/profile/profile_screen.dart';
import 'package:highlight_flutter/screen/version/version_page.dart';
import 'package:image_picker/image_picker.dart';

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
  static const detail = 'detail';
  static const photoview = 'photoview';
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
    TypedGoRoute<DetailRouteDate>(path: Routes.detail),
    TypedGoRoute<BackupRouteData>(path: Routes.backup),
    TypedGoRoute<ResetRouteData>(path: Routes.reset),
    TypedGoRoute<VersionRouteData>(path: Routes.version),
    TypedGoRoute<PhotoViewRouteDate>(path: Routes.photoview),
  ],
)
class SampleMainRouteData extends GoRouteData {
  const SampleMainRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const InitScreen();
  }

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    if (state.fullPath == Routes.home) {
      return '/${Routes.list}';
    }
    return super.redirect(context, state);
  }
}

class MainRouteData extends StatefulShellRouteData {
  const MainRouteData();

  @override
  Page<void> pageBuilder(BuildContext context, GoRouterState state,
      StatefulNavigationShell navigationShell) {
    return NoTransitionPage(
        key: state.pageKey,
        name: state.name,
        child: MainScreen(navigationShell: navigationShell));
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

class DetailRouteDate extends GoRouteData {
  const DetailRouteDate();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: HighlightDetailScreen());
  }
}

class PhotoViewRouteDate extends GoRouteData {
  PhotoViewRouteDate({this.initialIndex, required this.photoHash});

  final int? initialIndex;
  final int photoHash;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    final photos = RouterObjectCache().get(photoHash) as List<XFile>? ?? [];
    return NoTransitionPage(
        child:
            PhotoViewScreen(photos: photos, initialIndex: initialIndex ?? 0));
  }

  @override
  FutureOr<bool> onExit(BuildContext context, GoRouterState state) {
    RouterObjectCache().delete(photoHash);
    return super.onExit(context, state);
  }
}
