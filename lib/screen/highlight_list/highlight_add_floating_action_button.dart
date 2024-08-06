import 'package:flutter/material.dart';
import 'package:highlight_flutter/app/router/app_router.dart';

class HighlightAddFloatingActionButton extends StatelessWidget {
  const HighlightAddFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          const EditRouteData().push(context);
        },
      ),
    );
  }
}
