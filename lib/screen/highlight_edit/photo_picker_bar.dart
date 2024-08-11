import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight_flutter/const/highlight/highlight_data.dart';
import 'package:highlight_flutter/screen/highlight_edit/state/current_picked_photos_provider.dart';
import 'package:image_picker/image_picker.dart';

class PhotoPickerBar extends ConsumerWidget {
  const PhotoPickerBar({super.key});

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

    if (maxCount == currentCount && couldPickMore) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                itemCount: photos.length +
                    (couldPickMorePhotos(photos, HighlightData.maxPhotosLength)
                        ? 1
                        : 0),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  if (shouldBuildAddWidget(
                      photos, HighlightData.maxPhotosLength, index)) {
                    return const AddPhotoBox();
                  } else {
                    return PhotoBox(file: photos[index]);
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

class AddPhotoBox extends StatelessWidget {
  const AddPhotoBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: () {
          //TODO: 사진 선택
        },
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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(width: 0.5, color: Colors.black26),
      ),
      width: 80,
      height: 80,
      child: Image.file(File(file.path)),
    );
  }
}
