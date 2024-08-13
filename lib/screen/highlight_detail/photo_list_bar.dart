import 'package:flutter/material.dart';
import 'package:highlight_flutter/app/router/app_router.dart';
import 'package:highlight_flutter/app/router/router_object_cache.dart';
import 'package:highlight_flutter/screen/highlight_edit/photo_picker_bar.dart';
import 'package:image_picker/image_picker.dart';

class PhotoListBar extends StatelessWidget {
  const PhotoListBar({required this.photos, super.key});

  final List<XFile> photos;

  @override
  Widget build(BuildContext context) {
    if (photos.isEmpty) return const SizedBox();

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
                itemCount: photos.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: PhotoBox(
                      file: photos[index],
                      onTap: () {
                        RouterObjectCache().put(photos.hashCode, photos);
                        PhotoViewRouteDate(
                                initialIndex: index, photoHash: photos.hashCode)
                            .push(context);
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
