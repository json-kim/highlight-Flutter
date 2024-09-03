List<T> addElementLast<T>(List<T> list, T element) {
  final newList = [...list];
  newList.add(element);
  return newList;
}

List<T> addElementsLast<T>(List<T> list, List<T> elements) {
  final newList = [...list];
  newList.addAll(elements);
  return newList;
}

List<T> removeElement<T>(List<T> list, T element) {
  final newList = [...list];
  newList.remove(element);
  return newList;
}
