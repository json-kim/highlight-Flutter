import 'package:flutter/material.dart';
import 'package:highlight_flutter/screen/highlight_detail/content_bar.dart';

class ContentTextBar extends StatelessWidget {
  const ContentTextBar({required this.content, super.key});

  final String content;

  @override
  Widget build(BuildContext context) {
    return ContentBar(child: Text(content));
  }
}
