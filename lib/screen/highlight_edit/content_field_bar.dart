import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight_flutter/const/highlight/highlight_data.dart';
import 'package:highlight_flutter/screen/highlight_edit/state/current_content_provider.dart';

class ContentFieldBar extends ConsumerWidget {
  const ContentFieldBar({super.key});

  static const contentTextStyle = TextStyle(fontSize: 14);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('내용'),
          const SizedBox(width: 8),
          Expanded(
              child: SizedBox(
            height: 300,
            child: TextField(
              style: contentTextStyle,
              maxLines: null,
              expands: true,
              cursorWidth: 1,
              maxLength: HighlightData.maxContentLength,
              onChanged: (value) =>
                  ref.watch(currentContentProvider.notifier).state = value,
            ),
          ))
        ],
      ),
    );
  }
}
