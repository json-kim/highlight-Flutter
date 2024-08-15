import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight_flutter/screen/common/state/platform_share_provider.dart';
import 'package:highlight_flutter/screen/highlight_detail/color_bar.dart';
import 'package:highlight_flutter/screen/highlight_detail/content_text_bar.dart';
import 'package:highlight_flutter/screen/highlight_detail/date_bar.dart';
import 'package:highlight_flutter/screen/highlight_detail/photo_list_bar.dart';
import 'package:highlight_flutter/screen/highlight_detail/title_text_bar.dart';
import 'package:share_plus/share_plus.dart';

class HighlightDetailScreen extends ConsumerWidget {
  HighlightDetailScreen({super.key});

  final GlobalKey _widgetKey = GlobalKey();

  Future<XFile> _captureDetail() async {
    RenderRepaintBoundary boundary =
        _widgetKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 2);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();

    return XFile.fromData(pngBytes,
        mimeType: 'png',
        name: 'highlight_share_${DateTime.now().toIso8601String()}');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ShareButton(
            onShare: () => _captureDetail().then((value) =>
                ref.watch(platformShareProvider.notifier).shareImage([value])),
          ),
        ],
      ),
      body: RepaintBoundary(
        key: _widgetKey,
        child: Container(
          color: Theme.of(context).colorScheme.surface,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            children: [
              DateBar(date: DateTime.now()),
              const ColorBar(color: Colors.red),
              const TitleTextBar(title: '토스트 맛있어'),
              const ContentTextBar(content: '란퐁유엔 토스트 맛이서'),
              const PhotoListBar(photos: []),
            ],
          ),
        ),
      ),
    );
  }
}

class ShareButton extends StatelessWidget {
  const ShareButton({required this.onShare, super.key});

  final VoidCallback onShare;

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onShare, icon: const Icon(Icons.share));
  }
}
