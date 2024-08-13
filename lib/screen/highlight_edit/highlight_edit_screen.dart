import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:highlight_flutter/app/router/app_router.dart';
import 'package:highlight_flutter/screen/highlight_edit/color_select_bar.dart';
import 'package:highlight_flutter/screen/highlight_edit/content_field_bar.dart';
import 'package:highlight_flutter/screen/highlight_edit/date_select_bar.dart';
import 'package:highlight_flutter/screen/highlight_edit/photo_picker_bar.dart';
import 'package:highlight_flutter/screen/highlight_edit/title_field_bar.dart';

class HighlightEditScreen extends StatelessWidget {
  const HighlightEditScreen({super.key});

  void saveHighlight() {
    // TODO: 하이라이트 저장
  }

  void backToList(BuildContext context) {
    context.go('/${Routes.list}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                saveHighlight();
                backToList(context);
              },
              child: const Text('저장'))
        ],
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
