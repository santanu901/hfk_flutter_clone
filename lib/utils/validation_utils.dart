class ValidationUtils {
  ///ValidationUtils._(); is a private constructor which prevents the class from being instantiated.
  ValidationUtils._();

  static const String emailRegex = "r\"^[a-zA-Z0-9.a-zA-Z0-9.!#\$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+\"";
  static const String passwordRegex = "r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}\$";

  static bool isValidEmail(String email) {
    return RegExp(emailRegex).hasMatch(email);
  }

  /**
   * r'^
      (?=.*[A-Z])       // should contain at least one upper case
      (?=.*[a-z])       // should contain at least one lower case
      (?=.*?[0-9])      // should contain at least one digit
      (?=.*?[!@#\$&*~]) // should contain at least one Special character
      .{8,}             // Must be at least 8 characters in length
      $
   *////
  static bool isValidPassword(String password) {
    return RegExp(passwordRegex).hasMatch(password);
  }
}