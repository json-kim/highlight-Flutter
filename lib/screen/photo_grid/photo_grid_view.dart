import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight_flutter/app/router/app_router.dart';
import 'package:highlight_flutter/core/image/file_image_data.dart';
import 'package:highlight_flutter/core/image/image_data.dart';
import 'package:highlight_flutter/domain/model/photo_thumbnail_model.dart';
import 'package:highlight_flutter/screen/photo_grid/state/photo_thumbnail_list_provider.dart';
import 'package:highlight_flutter/screen/photo_grid/state/thumbnail_list_load_provider.dart';

class PhotoGridView extends ConsumerStatefulWidget {
  const PhotoGridView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PhotoGridViewState();
}

class _PhotoGridViewState extends ConsumerState<PhotoGridView> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    initLoad();
    scrollController.addListener(_onScroll);
    super.initState();
  }

  void initLoad() {
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => ref.watch(thumbnailListLoadProvider.notifier).listLoad());
  }

  void _onScroll() {
    if (!scrollController.hasClients) return;

    if (isNearEndOfScroll(scrollController.position)) loadNextPage();
  }

  void loadNextPage() {
    ref.watch(thumbnailListLoadProvider.notifier).listLoad();
  }

  bool isNearEndOfScroll(ScrollPosition position) {
    return position.maxScrollExtent - 200 <= position.pixels;
  }

  @override
  Widget build(BuildContext context) {
    final thumbnails = ref.watch(photoThumbnailListProvider);

    return RefreshIndicator(
      onRefresh: ref.watch(thumbnailListLoadProvider.notifier).initLoad,
      child: GridView.builder(
        controller: scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          final thumbnail = thumbnails[index];
          return PhotoGridItem(
            thumbnail: thumbnail,
            imageData: FileImageData(filePath: thumbnail.thumbnailPhoto.path),
          );
        },
        itemCount: thumbnails.length,
      ),
    );
  }
}

class PhotoGridItem extends StatelessWidget {
  const PhotoGridItem(
      {required this.thumbnail, required this.imageData, super.key});

  final ImageData imageData;
  final PhotoThumbnailModel thumbnail;

  @override
  Widget build(BuildContext context) {
    return Material(
        child: InkWell(
      onTap: () {
        DetailRouteDate(hid: thumbnail.highlightId).push(context);
      },
      child: imageData.toImageWidget(),
    ));
  }
}
