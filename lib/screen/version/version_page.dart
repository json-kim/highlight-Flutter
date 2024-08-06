import 'package:flutter/material.dart';
import 'package:highlight_flutter/screen/version/version_dialog.dart';

class VersionPage<T> extends Page<T> {
  @override
  Route<T> createRoute(BuildContext context) {
    return DialogRoute(
      settings: this,
      context: context,
      builder: (context) => const VersionDialog(),
      barrierDismissible: true,
    );
  }
}
