import 'package:flutter_riverpod/flutter_riverpod.dart';

final detailHighlightIdProvider = Provider.autoDispose<String>(
    (ref) => 'highlightId',
    name: '[Provider]DetailHighlightId');
