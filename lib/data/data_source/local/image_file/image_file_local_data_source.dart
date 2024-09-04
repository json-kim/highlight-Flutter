import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ImageFileLocalDataSource {
  Future<String> saveImage(XFile file) async {
    final newPath = await getFileSavePath(file.path);

    await _saveFile(file.path, newPath);
    return newPath;
  }

  Future<void> _saveFile(String filePath, String newPath) async {
    await File(filePath).copy(newPath);
  }

  Future<String> getFileSavePath(String filePath) async {
    final directory = await getApplicationDocumentsDirectory();

    return makeFilePath(directory.path, splitImageFileName(filePath));
  }

  String makeFilePath(String dir, String fileName) {
    return '$dir/$fileName';
  }

  String splitImageFileName(String filePath) {
    return filePath.split('/').last;
  }
}
