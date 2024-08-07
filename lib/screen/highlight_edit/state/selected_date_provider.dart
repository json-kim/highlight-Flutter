import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedDateProvider = StateProvider.autoDispose<DateTime>(
  (ref) {
    return DateTime.now();
  },
  name: '[Provider]SelectedDate',
);
