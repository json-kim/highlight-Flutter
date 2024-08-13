import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight_flutter/const/highlight/highlight_data.dart';
import 'package:highlight_flutter/screen/highlight_detail/title_bar.dart';
import 'package:highlight_flutter/screen/highlight_edit/state/current_title_provider.dart';

class TitleFieldBar extends ConsumerWidget {
  const TitleFieldBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TitleBar(
      child: TextField(
        cursorWidth: 1,
        maxLines: 1,
        maxLength: HighlightData.maxTitleLength,
        onChanged: (value) =>
            ref.watch(currentTitleProvider.notifier).state = value,
      ),
    );
  }
}
