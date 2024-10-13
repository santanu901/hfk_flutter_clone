extension StringExtension on String {
  /// Check If Two Strings Same Or Not
  bool equals(String comparableString, {bool ignoreCase = false}) {
    if(ignoreCase) {
      return toLowerCase().contains(comparableString.toLowerCase());
    }

    return contains(comparableString);
  }
}