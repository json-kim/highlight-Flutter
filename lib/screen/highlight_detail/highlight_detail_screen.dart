import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight_flutter/screen/common/fail_widget.dart';
import 'package:highlight_flutter/screen/common/state/platform_share_provider.dart';
import 'package:highlight_flutter/screen/highlight_detail/color_bar.dart';
import 'package:highlight_flutter/screen/highlight_detail/content_text_bar.dart';
import 'package:highlight_flutter/screen/highlight_detail/date_bar.dart';
import 'package:highlight_flutter/screen/highlight_detail/photo_list_bar.dart';
import 'package:highlight_flutter/screen/highlight_detail/state/detail_highlight_provider.dart';
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
          child: ref.watch(detailHighlightProvider).when(
                data: (highlight) => ListView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  children: [
                    DateBar(date: highlight.date),
                    ColorBar(color: highlight.color),
                    TitleTextBar(title: highlight.title),
                    ContentTextBar(content: highlight.content),
                    PhotoListBar(photos: highlight.photos),
                  ],
                ),
                error: (_, __) =>
                    const FailWidget(failText: '앗! 문제가 발생했어요\n잠시후 다시 시도해주세요'),
                loading: () => const Center(child: CircularProgressIndicator()),
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
