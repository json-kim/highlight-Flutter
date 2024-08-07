import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedDateProvider = StateProvider.autoDispose<DateTime>(
  (ref) => DateTime.now(),
  name: '[Provider]SelectedDate',
);
