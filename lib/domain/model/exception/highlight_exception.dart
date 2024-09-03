class HighlightException implements Exception {
  HighlightException({this.message, this.trace});

  static const notExist = '저장된 하이라이트가 없습니다';
  static const saveRequestFail = '하이라이트 저장에 실패했습니다';
  static const retrieveRequestFail = '하이라이트를 가져오는데 실패했습니다';

  final String? message;
  final StackTrace? trace;

  @override
  String toString() {
    return '[HighlightException] $message';
  }
}
