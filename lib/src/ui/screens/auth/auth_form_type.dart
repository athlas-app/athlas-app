import 'package:athlas/src/localization/string_hardcoded.dart';

/// Form type for email & password authentication
enum AuthFormType {
  signIn,
  register,
}

extension AuthFormTypeX on AuthFormType {
  String get passwordLabelText {
    if (this == AuthFormType.register) {
      return 'Password (8+ characters)'.hardcoded;
    } else {
      return 'Password'.hardcoded;
    }
  }

  // Getters
  String get primaryButtonText {
    if (this == AuthFormType.register) {
      return 'Create an account'.hardcoded;
    } else {
      return 'Sign in'.hardcoded;
    }
  }

  String get secondaryButtonText {
    if (this == AuthFormType.register) {
      return 'Have an account? Sign in'.hardcoded;
    } else {
      return 'Need an account? Register'.hardcoded;
    }
  }

  AuthFormType get secondaryActionFormType {
    if (this == AuthFormType.register) {
      return AuthFormType.signIn;
    } else {
      return AuthFormType.register;
    }
  }

  String get errorAlertTitle {
    if (this == AuthFormType.register) {
      return 'Registration failed'.hardcoded;
    } else {
      return 'Sign in failed'.hardcoded;
    }
  }

  String get title {
    if (this == AuthFormType.register) {
      return 'Register'.hardcoded;
    } else {
      return 'Sign in'.hardcoded;
    }
  }
}
