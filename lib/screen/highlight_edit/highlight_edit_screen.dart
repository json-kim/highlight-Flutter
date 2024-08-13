import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:highlight_flutter/app/router/app_router.dart';
import 'package:highlight_flutter/screen/common/text_dialog.dart';
import 'package:highlight_flutter/screen/highlight_edit/color_select_bar.dart';
import 'package:highlight_flutter/screen/highlight_edit/content_field_bar.dart';
import 'package:highlight_flutter/screen/highlight_edit/date_select_bar.dart';
import 'package:highlight_flutter/screen/highlight_edit/photo_picker_bar.dart';
import 'package:highlight_flutter/screen/highlight_edit/state/highlight_save_provider.dart';
import 'package:highlight_flutter/screen/highlight_edit/state/save_valid_provider.dart';
import 'package:highlight_flutter/screen/highlight_edit/title_field_bar.dart';

class HighlightEditScreen extends ConsumerWidget {
  const HighlightEditScreen({super.key});

  void backToList(BuildContext context) {
    context.go('/${Routes.list}');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      highlightSaveProvider,
      (previous, next) {
        switch (next) {
          case SaveNotReady():
            showTextDialog(context, next.toString());
            break;
          case SaveSuccess():
            backToList(context);
            break;
          case SaveFail():
            showTextDialog(context, next.toString());
            break;
          case _:
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        actions: const [SaveButton()],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        children: const [
          DateSelectBar(),
          ColorSelectBar(),
          TitleFieldBar(),
          ContentFieldBar(),
          PhotoPickerBar(),
        ],
      ),
    );
  }
}

class SaveButton extends ConsumerWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final saveValid = ref.watch(saveValidProvider);

    return TextButton(
      onPressed: saveValid
          ? () => ref.watch(highlightSaveProvider.notifier).saveHighlight()
          : null,
      child: const Text('저장'),
    );
  }
}
