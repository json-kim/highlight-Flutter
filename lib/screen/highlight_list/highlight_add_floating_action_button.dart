import 'package:flutter/material.dart';

class HighlightAddFloatingActionButton extends StatelessWidget {
  const HighlightAddFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
