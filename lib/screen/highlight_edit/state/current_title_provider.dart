import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentTitleProvider = StateProvider<String>(
  (ref) => '',
  name: '[Provider]CurrentTitle',
);
