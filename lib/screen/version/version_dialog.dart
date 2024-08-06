import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight_flutter/screen/version/state/version_info_provider.dart';

class VersionDialog extends ConsumerWidget {
  const VersionDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packageInfo = ref.watch(versionInfoProvider);
    return switch (packageInfo) {
      AsyncData(:final value) => AboutDialog(
          applicationName: '하이라이트',
          applicationVersion: value.version,
        ),
      _ => const AboutDialog(),
    };
  }
}
