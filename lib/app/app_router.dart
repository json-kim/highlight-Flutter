import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:highlight_flutter/screen/main/main_screen.dart';

part 'app_router.g.dart';

final appRouter = GoRouter(routes: $appRoutes);

@TypedGoRoute<MainScreenRoute>(path: '/')
@immutable
class MainScreenRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const MainScreen();
  }
}
