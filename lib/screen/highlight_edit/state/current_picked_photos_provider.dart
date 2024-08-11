import 'package:image_picker/image_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentPickedPhotosProvider = StateProvider.autoDispose<List<XFile>>(
  (ref) => [],
  name: '[Provider]CurrentPickedPhotos',
);
