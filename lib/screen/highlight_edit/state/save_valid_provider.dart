import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight_flutter/screen/highlight_edit/state/current_content_provider.dart';
import 'package:highlight_flutter/screen/highlight_edit/state/current_title_provider.dart';

final saveValidProvider = Provider.autoDispose(
  (ref) {
    final titleValid =
        ref.watch(currentTitleProvider.select((value) => value.isNotEmpty));
    final contentValid =
        ref.watch(currentContentProvider.select((value) => value.isNotEmpty));

    return titleValid && contentValid;
  },
  name: '[Provider]SavePossible',
);
