import 'dart:io';

import 'package:flutter/material.dart';
import 'package:highlight_flutter/core/image/image_to_widget_convertor.dart';
import 'package:highlight_flutter/screen/common/error_image.dart';

class FileImageToWidgetConvertor implements ImageToWidgetConvertor {
  FileImageToWidgetConvertor({required this.filePath});

  final String filePath;

  @override
  Widget widgetBuilder() {
    return Image.file(
      File(filePath),
      errorBuilder: (context, error, stackTrace) => const ErrorImage(),
    );
  }
}
