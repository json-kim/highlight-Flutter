List<T> addElementFirst<T>(List<T> list, T element) {
  return [element, ...list];
}

List<T> addElementsFirst<T>(List<T> list, List<T> elements) {
  return [...elements, ...list];
}

List<T> addElementLast<T>(List<T> list, T element) {
  return [...list, element];
}

List<T> addElementsLast<T>(List<T> list, List<T> elements) {
  return [...list, ...elements];
}

List<T> removeElement<T>(List<T> list, T element) {
  final newList = [...list];
  newList.remove(element);
  return newList;
}
