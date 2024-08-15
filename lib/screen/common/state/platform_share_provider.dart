import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';

final platformShareProvider =
    NotifierProvider.autoDispose<PlatformShare, ShareState>(
  () => PlatformShare(),
  name: '[Provider]PlatformShare',
);

class PlatformShare extends AutoDisposeNotifier<ShareState> {
  @override
  ShareState build() {
    return ShareReady();
  }

  Future<void> shareImage(List<XFile> photos) async {
    if (state is Sharing) return;
    state = Sharing();

    if (photos.isEmpty) {
      state = ShareFail(reason: '사진이 없습니다');
      return;
    }

    try {
      await Share.shareXFiles(photos);
      state = ShareReady();
    } catch (e) {
      state = ShareFail(reason: '공유에 실패했습니다');
    }
  }
}

sealed class ShareState {}

class Sharing extends ShareState {}

class ShareReady extends ShareState {}

class ShareFail extends ShareState {
  ShareFail({required this.reason});

  final String reason;
}

class ShareSuccess extends ShareState {}
