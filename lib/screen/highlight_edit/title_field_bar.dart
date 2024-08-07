import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight_flutter/screen/highlight_edit/state/current_title_provider.dart';

class TitleFieldBar extends ConsumerWidget {
  const TitleFieldBar({super.key});

  static const titleFieldBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
    borderSide: BorderSide(width: 0.1),
  );

  static const maxTitleLength = 20;

  static const titleTextStyle = TextStyle(fontSize: 14);

  static const titleLengthTextStyle = TextStyle(fontSize: 10);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTitle = ref.watch(currentTitleProvider);
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          const Text('제목'),
          const SizedBox(width: 8),
          Expanded(
              child: TextField(
            style: titleTextStyle,
            decoration: InputDecoration(
              border: titleFieldBorder,
              enabledBorder: titleFieldBorder,
              focusedBorder: titleFieldBorder,
              disabledBorder: titleFieldBorder,
              focusedErrorBorder: titleFieldBorder,
              counterText: '',
              suffix: Text(
                '${currentTitle.length}/$maxTitleLength',
                style: titleLengthTextStyle,
              ),
              isDense: true,
            ),
            cursorWidth: 1,
            maxLines: 1,
            maxLength: maxTitleLength,
            onChanged: (value) =>
                ref.watch(currentTitleProvider.notifier).state = value,
          )),
        ],
      ),
    );
  }
}
