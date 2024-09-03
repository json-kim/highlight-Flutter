class PhotoException implements Exception {
  PhotoException({this.message, this.trace});

  static const notExist = '저장된 사진이 없습니다';
  static const saveRequestFail = '사진 저장에 실패했습니다';
  static const retrieveRequestFail = '사진을 가져오는데 실패했습니다';

  final String? message;
  final StackTrace? trace;

  @override
  String toString() {
    return '[PhotoException] $message';
  }
}
