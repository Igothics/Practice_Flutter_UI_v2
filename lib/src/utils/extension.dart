extension StringExtension on String {
  String toCapitalize() => isNotEmpty ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : this;
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalize()).join(' ');
}

extension ListExtension on List {
  Iterable<E> mapWithIndex<E>(E Function(int index, E element) toElement) sync* {
    for (int i = 0; i < length; i++) {
      yield toElement(i, elementAt(i));
    }
  }
}

