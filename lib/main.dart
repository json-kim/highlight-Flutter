import 'package:flutter/material.dart';
import 'package:highlight_flutter/screen/main/main_screen.dart';

void main() {
  runApp(const HighlightApp());
}

class HighlightApp extends StatelessWidget {
  const HighlightApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Highlight',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}
