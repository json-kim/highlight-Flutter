import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight_flutter/const/highlight/highlight_data.dart';
import 'package:highlight_flutter/screen/highlight_detail/content_bar.dart';
import 'package:highlight_flutter/screen/highlight_edit/state/current_content_provider.dart';

class ContentFieldBar extends ConsumerWidget {
  const ContentFieldBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ContentBar(
      child: SizedBox(
        height: 300,
        child: TextField(
          maxLines: null,
          expands: true,
          cursorWidth: 1,
          maxLength: HighlightData.maxContentLength,
          onChanged: (value) =>
              ref.watch(currentContentProvider.notifier).state = value,
        ),
      ),
    );
  }
}
