class Regex {
  static const spaces = r'\s+';
  static const doubleSpaces = r'\s{2,}';
  static const email = r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-\s]+@[a-zA-Z0-9-\s]+(?:\.[a-zA-Z0-9-\s]+)$';
  static const phone = r'^0[0-9]{9}$';
  static const name = r'^[a-zA-Z0-9_\-=@,\.;\s]+$';
  static const transferAmount = r'^[0-9]*\.?[0-9]*$';
}