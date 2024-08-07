import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedColorProvider = StateProvider<Color>(
  (ref) {
    return Colors.purpleAccent;
  },
  name: '[Provider]SelectedColor',
);
