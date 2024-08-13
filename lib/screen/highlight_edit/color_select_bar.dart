import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight_flutter/screen/highlight_detail/color_bar.dart';
import 'package:highlight_flutter/screen/highlight_edit/state/selected_color_provider.dart';

class ColorSelectBar extends ConsumerWidget {
  const ColorSelectBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedColor = ref.watch(selectedColorProvider);

    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () => showColorPickerDialog(context, selectedColor).then(
          (value) => ref.watch(selectedColorProvider.notifier).state = value,
        ),
        child: ColorBar(
          color: selectedColor,
        ),
      ),
    );
  }
}
