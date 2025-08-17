class PasswordValidator {
  static String? validate(String? value2) {
    String? value = value2?.trim();
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }
}
