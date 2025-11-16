import 'package:restaurant_app_sonic/core/constants/reg_expr_constants.dart';

abstract class Validatior {
  static String? emailValidation(String? email) {
    final RegExp emailRegex = RegExp(RegExprConstants.emailRegEx);

    if (email == null || email.trim().isEmpty) {
      return 'Email cannot be empty';
    } else if (!emailRegex.hasMatch(email)) {
      return 'Enter a valid email address';
    } else {
      return null;
    }
  }

  static String? passwordValidation(String? password) {
    final RegExp passwordRegex = RegExp(RegExprConstants.passwordRegex);

    if (password == null || password.trim().isEmpty) {
      return 'Password cannot be empty';
    } else if (!passwordRegex.hasMatch(password)) {
      return 'Enter a valid password';
    } else {
      return null;
    }
  }

  static String? userNameValidation(String? userName) {
    final RegExp usernameRegex = RegExp(RegExprConstants.usernameRegex);

    if (userName == null || userName.trim().isEmpty) {
      return 'Name cannot be empty';
    } else if (!usernameRegex.hasMatch(userName)) {
      return 'Enter a valid userName';
    } else {
      return null;
    }
  }

  static String? phoneValidation(String? phone) {
    final RegExp phoneRegex = RegExp(RegExprConstants.phoneRegex);

    if (phone == null || phone.trim().isEmpty) {
      return 'phone cannot be empty';
    } else if (phone.length < 11) {
      return 'Enter Correct Phone Number';
    } else if (!phoneRegex.hasMatch(phone)) {
      return 'Enter Vaild Phone Number';
    } else {
      return null;
    }
  }

  static String? addressValidation(String? address) {
    if (address == null || address.trim().isEmpty) {
      return 'Address cannot be empty';
    }
    return null;
  }
}
