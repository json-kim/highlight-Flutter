class RouterObjectCache {
  RouterObjectCache._();

  factory RouterObjectCache() => _instance;

  static final RouterObjectCache _instance = RouterObjectCache._();

  final Map<int, dynamic> _cache = {};

  int put(int hashCode, dynamic object) {
    _cache[hashCode] = object;

    return hashCode;
  }

  dynamic delete(int hashCode) {
    return _cache.remove(hashCode);
  }

  dynamic get(int hashCode) {
    return _cache[hashCode];
  }
}
