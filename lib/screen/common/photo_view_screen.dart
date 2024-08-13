import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoViewScreen extends StatelessWidget {
  PhotoViewScreen({required this.photos, int initialIndex = 0, super.key})
      : pageController = PageController(initialPage: initialIndex);

  final List<XFile> photos;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PhotoViewGallery.builder(
          pageController: pageController,
          itemCount: photos.length,
          builder: (context, index) => PhotoViewGalleryPageOptions(
              imageProvider: FileImage(File(photos[index].path)))),
    );
  }
}
