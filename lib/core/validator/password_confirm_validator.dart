class PasswordConfirmValidator {
  static String? validate(String? value2, String? password) {
    String? value = value2?.trim();
    if (value == null || value.isEmpty) {
      return 'Password confirmation is required';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }
}
