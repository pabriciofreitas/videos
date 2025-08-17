class NameValidator {
  static String? validate(String? value2) {
    String? value = value2?.trim();
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    return null;
  }
}
