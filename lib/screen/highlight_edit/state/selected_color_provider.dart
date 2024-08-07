import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedColorProvider = StateProvider.autoDispose<Color>(
  (ref) => Colors.purpleAccent,
  name: '[Provider]SelectedColor',
);
