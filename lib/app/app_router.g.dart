// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $mainRouteData,
    ];

RouteBase get $mainRouteData => ShellRouteData.$route(
      factory: $MainRouteDataExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/list',
          factory: $ListRouteDataExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/photos',
          factory: $PhotosRouteDataExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/profile',
          factory: $ProfileRouteDataExtension._fromState,
        ),
      ],
    );

extension $MainRouteDataExtension on MainRouteData {
  static MainRouteData _fromState(GoRouterState state) => MainRouteData();
}

extension $ListRouteDataExtension on ListRouteData {
  static ListRouteData _fromState(GoRouterState state) => ListRouteData();

  String get location => GoRouteData.$location(
        '/list',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PhotosRouteDataExtension on PhotosRouteData {
  static PhotosRouteData _fromState(GoRouterState state) => PhotosRouteData();

  String get location => GoRouteData.$location(
        '/photos',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ProfileRouteDataExtension on ProfileRouteData {
  static ProfileRouteData _fromState(GoRouterState state) => ProfileRouteData();

  String get location => GoRouteData.$location(
        '/profile',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
