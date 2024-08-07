import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'asset/icons/palette.png',
                width: 32,
                height: 32,
              ),
              const SizedBox(width: 16),
              ColorBox(
                color: selectedColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ColorBox extends StatelessWidget {
  const ColorBox({required this.color, super.key});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
      ),
    );
  }
}
