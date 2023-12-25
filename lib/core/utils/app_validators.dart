import 'package:flutter/material.dart';

class AppValidators {
  static String? validateEmail(String email) {
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);

    if (email.isEmpty) {
      return 'Email is required';
    }
    if (!emailValid) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  static String? validateName(String value) {
    if (value.isEmpty) {
      return 'Please input some data';
    }
    return null;
  }

  static String? validatePhone(String value) {
    if (value.isEmpty) {
      return 'Phone is required';
    }
    if (value.length < 8) {
      return 'Phone must be at least 8 characters';
    }
    if (value.length > 8) {
      return 'Phone cannot be greater than 8 characters';
    }
    return null;
  }

  static bool validateTextFields(List<TextEditingController> controllers) {
    bool isValid = false;

    for (var controller in controllers) {
      if (controller.text.isEmpty) {
        isValid = true;
        break;
      }
    }
    return isValid;
  }
}
