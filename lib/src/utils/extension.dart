extension StringExtension on String {
  String toUpperFirst() => isNotEmpty ? '${this[0].toUpperCase()}${substring(1)}' : this;
  String toCapitalize() => isNotEmpty ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : this;
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalize()).join(' ');
}

extension ListExtension on List {
  Iterable<E> mapWithIndex<E>(E Function(int index, E element) toElement) sync* {
    for (int i = 0; i < length; i++) {
      yield toElement(i, elementAt(i));
    }
  }
  String toStringLines() => '[\n\t${join('\n\t')}\n  ]';
}
extension MapExtension on Map {
  String toStringLines() => '{\n\t${entries.map((e)=> '${e.key} : ${e.value}').join('\n\t')}\n  }';
}


