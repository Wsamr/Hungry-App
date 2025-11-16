class RegExprConstants {
  static const String emailRegEx =
      r'^(?!.*\.\.)[a-zA-Z0-9!#$%&*?<>]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z]{2,6}$';
  static const String usernameRegex = r'^[a-zA-Z0-9.-!#$%&*?]+$';
  static const String phoneRegex = r'^[0-9]+$';
  static const String passwordRegex =
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$%^&*])[A-Za-z\d!@#\$%^&*]{8,}$';
}
