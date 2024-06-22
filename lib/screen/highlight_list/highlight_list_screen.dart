import 'package:flutter/material.dart';
import 'package:highlight_flutter/screen/highlight_list/highlight_add_floating_action_button.dart';
import 'package:highlight_flutter/screen/highlight_list/highlight_list_view.dart';

class HighlightListScreen extends StatelessWidget {
  const HighlightListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Highlights'),
      ),
      body: const HighlightListView(),
      floatingActionButton: const HighlightAddFloatingActionButton(),
    );
  }
}
