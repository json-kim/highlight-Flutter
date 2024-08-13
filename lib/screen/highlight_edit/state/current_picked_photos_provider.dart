import 'package:image_picker/image_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentPickedPhotosProvider =
    NotifierProvider.autoDispose<CurrentPickedPhotos, List<XFile>>(
  () => CurrentPickedPhotos(),
  name: '[Provider]CurrentPickedPhotos',
);

class CurrentPickedPhotos extends AutoDisposeNotifier<List<XFile>> {
  @override
  List<XFile> build() {
    return [];
  }

  void addPhotos(List<XFile> newPhotos) {
    state.addAll(newPhotos);
    ref.notifyListeners();
  }

  void deletePhoto(XFile photo) {
    state.remove(photo);
    ref.notifyListeners();
  }
}
