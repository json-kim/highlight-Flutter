// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $sampleMainRouteData,
    ];

RouteBase get $sampleMainRouteData => GoRouteData.$route(
      path: '/',
      factory: $SampleMainRouteDataExtension._fromState,
      routes: [
        StatefulShellRouteData.$route(
          factory: $MainRouteDataExtension._fromState,
          branches: [
            StatefulShellBranchData.$branch(
              routes: [
                GoRouteData.$route(
                  path: 'list',
                  factory: $ListRouteDataExtension._fromState,
                ),
              ],
            ),
            StatefulShellBranchData.$branch(
              routes: [
                GoRouteData.$route(
                  path: 'photos',
                  factory: $PhotosRouteDataExtension._fromState,
                ),
              ],
            ),
            StatefulShellBranchData.$branch(
              routes: [
                GoRouteData.$route(
                  path: 'profile',
                  factory: $ProfileRouteDataExtension._fromState,
                ),
              ],
            ),
          ],
        ),
        GoRouteData.$route(
          path: 'edit',
          factory: $EditRouteDataExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'detail',
          factory: $DetailRouteDateExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'backup',
          factory: $BackupRouteDataExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'reset',
          factory: $ResetRouteDataExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'version',
          factory: $VersionRouteDataExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'photoview',
          factory: $PhotoViewRouteDateExtension._fromState,
        ),
      ],
    );

extension $SampleMainRouteDataExtension on SampleMainRouteData {
  static SampleMainRouteData _fromState(GoRouterState state) =>
      const SampleMainRouteData();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $MainRouteDataExtension on MainRouteData {
  static MainRouteData _fromState(GoRouterState state) => const MainRouteData();
}

extension $ListRouteDataExtension on ListRouteData {
  static ListRouteData _fromState(GoRouterState state) => const ListRouteData();

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
  static PhotosRouteData _fromState(GoRouterState state) =>
      const PhotosRouteData();

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
  static ProfileRouteData _fromState(GoRouterState state) =>
      const ProfileRouteData();

  String get location => GoRouteData.$location(
        '/profile',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $EditRouteDataExtension on EditRouteData {
  static EditRouteData _fromState(GoRouterState state) => const EditRouteData();

  String get location => GoRouteData.$location(
        '/edit',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $DetailRouteDateExtension on DetailRouteDate {
  static DetailRouteDate _fromState(GoRouterState state) =>
      const DetailRouteDate();

  String get location => GoRouteData.$location(
        '/detail',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $BackupRouteDataExtension on BackupRouteData {
  static BackupRouteData _fromState(GoRouterState state) =>
      const BackupRouteData();

  String get location => GoRouteData.$location(
        '/backup',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ResetRouteDataExtension on ResetRouteData {
  static ResetRouteData _fromState(GoRouterState state) =>
      const ResetRouteData();

  String get location => GoRouteData.$location(
        '/reset',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $VersionRouteDataExtension on VersionRouteData {
  static VersionRouteData _fromState(GoRouterState state) =>
      const VersionRouteData();

  String get location => GoRouteData.$location(
        '/version',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PhotoViewRouteDateExtension on PhotoViewRouteDate {
  static PhotoViewRouteDate _fromState(GoRouterState state) =>
      PhotoViewRouteDate(
        initialIndex: _$convertMapValue(
            'initial-index', state.uri.queryParameters, int.parse),
        photoHash: int.parse(state.uri.queryParameters['photo-hash']!),
      );

  String get location => GoRouteData.$location(
        '/photoview',
        queryParams: {
          if (initialIndex != null) 'initial-index': initialIndex!.toString(),
          'photo-hash': photoHash.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

T? _$convertMapValue<T>(
  String key,
  Map<String, String> map,
  T Function(String) converter,
) {
  final value = map[key];
  return value == null ? null : converter(value);
}
