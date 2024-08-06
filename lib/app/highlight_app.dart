import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight_flutter/app/router/app_router.dart';
import 'package:highlight_flutter/app/provider/provider_logger.dart';

class HighlightApp extends StatelessWidget {
  const HighlightApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      observers: [
        ProviderLogger(),
      ],
      child: MaterialApp.router(
        title: 'Highlight',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: appRouter,
      ),
    );
  }
}
