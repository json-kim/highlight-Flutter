import 'package:flutter/material.dart';
import 'package:highlight_flutter/core/image/file_image_data.dart';
import 'package:highlight_flutter/core/image/image_data.dart';

class PhotoGridView extends StatelessWidget {
  const PhotoGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) {
        return PhotoGridItem(
          imageData: FileImageData(filePath: 'filePath'),
        );
      },
      itemCount: 10,
    );
  }
}

class PhotoGridItem extends StatelessWidget {
  const PhotoGridItem({required this.imageData, super.key});

  final ImageData imageData;

  @override
  Widget build(BuildContext context) {
    return Material(
        child: InkWell(
      onTap: () {
        // TODO: 상세 화면 이동
      },
      child: imageData.toImageWidget(),
    ));
  }
}
