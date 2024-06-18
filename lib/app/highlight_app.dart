import 'package:flutter/material.dart';
import 'package:highlight_flutter/app/app_router.dart';

class HighlightApp extends StatelessWidget {
  const HighlightApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Highlight',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: appRouter,
    );
  }
}
