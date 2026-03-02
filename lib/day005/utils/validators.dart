class Validators {
  static String? validateName(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) return 'Name cannot be empty';
    if (trimmed.length < 2) return 'Name is too short';
    return null;
  }
}