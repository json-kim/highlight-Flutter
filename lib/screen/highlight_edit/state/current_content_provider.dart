import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentContentProvider = StateProvider.autoDispose<String>(
  (ref) => '',
  name: '[Provider]CurrentContent',
);
