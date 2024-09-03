class HighlightException implements Exception {
  HighlightException({this.message, this.trace});

  final String? message;
  final StackTrace? trace;

  @override
  String toString() {
    return '[HighlightException] $message';
  }
}
