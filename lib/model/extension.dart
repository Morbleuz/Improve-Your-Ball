extension StringExtension on String? {
  bool isInt() {
    if (this is String) {
      String s = toString();
      try {
        int i = int.parse(s);
        return true;
      } catch (e) {
        return false;
      }
    }
    return false;
  }
}
