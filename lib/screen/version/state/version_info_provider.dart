import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

final versionInfoProvider =
    AsyncNotifierProvider<VersionInfoNotifier, PackageInfo>(
  () => VersionInfoNotifier(),
  name: '[Provider]VersionInfo',
);

class VersionInfoNotifier extends AsyncNotifier<PackageInfo> {
  @override
  FutureOr<PackageInfo> build() {
    return _fetchPackageInfo();
  }

  Future<PackageInfo> _fetchPackageInfo() => PackageInfo.fromPlatform();
}
