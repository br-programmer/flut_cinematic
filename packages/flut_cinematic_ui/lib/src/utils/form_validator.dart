class FormValidator {
  const FormValidator._();

  static final RegExp _emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  static String? email(
    String? value, {
    required String emailInvalid,
    required String emailRequired,
  }) {
    if (value == null || value.isEmpty) {
      return emailRequired;
    }
    if (!FormValidator._emailRegex.hasMatch(value)) {
      return emailInvalid;
    }
    return null;
  }

  static String? passwordValid(
    String? value, {
    required String passwordRequired,
    required String passwordShort,
  }) {
    if (value == null || value.isEmpty) {
      return passwordRequired;
    }
    if (value.length < 4) {
      return passwordShort;
    }
    return null;
  }
}
