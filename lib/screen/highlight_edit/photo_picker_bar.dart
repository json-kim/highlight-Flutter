import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight_flutter/const/highlight/highlight_data.dart';
import 'package:highlight_flutter/screen/highlight_edit/state/current_picked_photos_provider.dart';
import 'package:image_picker/image_picker.dart';

class PhotoPickerBar extends ConsumerStatefulWidget {
  const PhotoPickerBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PhotoPickerBarState();
}

class _PhotoPickerBarState extends ConsumerState<PhotoPickerBar> {
  final ScrollController _scrollController = ScrollController();

  bool couldPickMorePhotos(List<XFile> photos, int maxCount) {
    if (photos.length == maxCount) {
      return false;
    } else {
      return true;
    }
  }

  bool shouldBuildAddWidget(
      List<XFile> photos, int maxCount, int currentCount) {
    final couldPickMore = couldPickMorePhotos(photos, maxCount);
    if (photos.length == currentCount && couldPickMore) {
      return true;
    }

    return false;
  }

  void scrollToEnd() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) =>
        _scrollController.animateTo(_scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 200), curve: Curves.easeIn));
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(currentPickedPhotosProvider.select((value) => value.length),
        (previous, next) => scrollToEnd());
    final photos = ref.watch(currentPickedPhotosProvider);

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'asset/icons/camera.png',
            width: 32,
            height: 32,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: SizedBox(
              height: 80,
              child: ListView.builder(
                controller: _scrollController,
                itemCount: photos.length +
                    (couldPickMorePhotos(photos, HighlightData.maxPhotosLength)
                        ? 1
                        : 0),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  if (shouldBuildAddWidget(
                      photos, HighlightData.maxPhotosLength, index)) {
                    return const Padding(
                        padding: EdgeInsets.only(right: 4),
                        child: AddPhotoBox());
                  } else {
                    return Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: PhotoBox(file: photos[index]),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AddPhotoBox extends ConsumerWidget {
  const AddPhotoBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: () => ImagePicker()
            .pickImage(source: ImageSource.gallery, requestFullMetadata: false)
            .then(
          (value) {
            if (value == null) return;
            ref.watch(currentPickedPhotosProvider.notifier).addPhotos([value]);
          },
        ),
        child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(width: 0.5, color: Colors.black26),
            ),
            child: Center(
              child: Image.asset(
                'asset/icons/plus.png',
                width: 24,
                height: 24,
              ),
            )),
      ),
    );
  }
}

class PhotoBox extends StatelessWidget {
  const PhotoBox({required this.file, super.key});

  final XFile file;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(width: 0.5, color: Colors.black26),
          ),
          width: 80,
          height: 80,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.file(
              File(file.path),
              fit: BoxFit.cover,
              filterQuality: FilterQuality.low,
            ),
          ),
        ),
      ],
    );
  }
}
