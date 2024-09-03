class PhotoException implements Exception {
  PhotoException({this.message, this.trace});

  final String? message;
  final StackTrace? trace;

  @override
  String toString() {
    return '[PhotoException] $message';
  }
}
