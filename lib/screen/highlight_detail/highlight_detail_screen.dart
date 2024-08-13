import 'package:flutter/material.dart';
import 'package:highlight_flutter/screen/highlight_detail/color_bar.dart';
import 'package:highlight_flutter/screen/highlight_detail/content_text_bar.dart';
import 'package:highlight_flutter/screen/highlight_detail/date_bar.dart';
import 'package:highlight_flutter/screen/highlight_detail/photo_list_bar.dart';
import 'package:highlight_flutter/screen/highlight_detail/title_text_bar.dart';

class HighlightDetailScreen extends StatelessWidget {
  const HighlightDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        children: [
          DateBar(date: DateTime.now()),
          const ColorBar(color: Colors.red),
          const TitleTextBar(title: '토스트 맛있어'),
          const ContentTextBar(content: '란퐁유엔 토스트 맛이서'),
          const PhotoListBar(photos: []),
        ],
      ),
    );
  }
}
