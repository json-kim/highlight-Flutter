import 'package:flutter/material.dart';
import 'package:highlight_flutter/core/image/image_to_widget_convertor.dart';

abstract class ImageData {
  ImageToWidgetConvertor get convertor;

  Widget toImageWidget() {
    return convertor.widgetBuilder();
  }
}
