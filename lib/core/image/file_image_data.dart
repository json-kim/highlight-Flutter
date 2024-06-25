import 'package:highlight_flutter/core/image/file_image_to_widget_convertor.dart';
import 'package:highlight_flutter/core/image/image_data.dart';
import 'package:highlight_flutter/core/image/image_to_widget_convertor.dart';

class FileImageData extends ImageData {
  FileImageData({required this.filePath})
      : convertor = FileImageToWidgetConvertor(filePath: filePath);

  String filePath;

  @override
  final ImageToWidgetConvertor convertor;
}
