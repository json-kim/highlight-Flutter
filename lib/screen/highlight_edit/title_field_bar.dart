import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight_flutter/const/highlight/highlight_data.dart';
import 'package:highlight_flutter/screen/highlight_edit/state/current_title_provider.dart';

class TitleFieldBar extends ConsumerWidget {
  const TitleFieldBar({super.key});

  static const titleTextStyle = TextStyle(fontSize: 14);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('제목'),
          const SizedBox(width: 8),
          Expanded(
              child: TextField(
            style: titleTextStyle,
            cursorWidth: 1,
            maxLines: 1,
            maxLength: HighlightData.maxTitleLength,
            onChanged: (value) =>
                ref.watch(currentTitleProvider.notifier).state = value,
          )),
        ],
      ),
    );
  }
}
