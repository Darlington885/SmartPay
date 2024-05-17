// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ForgotPasswordStore on _ForgotPasswordStore, Store {
  final _$loadingAtom =
      Atom(name: '_ForgotPasswordStore.loading', );

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$passwordVisibleAtom =
      Atom(name: '_ForgotPasswordStore.passwordVisible', );

  @override
  bool get passwordVisible {
    _$passwordVisibleAtom.reportRead();
    return super.passwordVisible;
  }

  @override
  set passwordVisible(bool value) {
    _$passwordVisibleAtom.reportWrite(value, super.passwordVisible, () {
      super.passwordVisible = value;
    });
  }

  final _$passwordVisibleTwoAtom =
      Atom(name: '_ForgotPasswordStore.passwordVisibleTwo', );

  @override
  bool get passwordVisibleTwo {
    _$passwordVisibleTwoAtom.reportRead();
    return super.passwordVisibleTwo;
  }

  @override
  set passwordVisibleTwo(bool value) {
    _$passwordVisibleTwoAtom.reportWrite(value, super.passwordVisibleTwo, () {
      super.passwordVisibleTwo = value;
    });
  }

  final _$passwordVisibleThreeAtom =
      Atom(name: '_ForgotPasswordStore.passwordVisibleThree', );

  @override
  bool get passwordVisibleThree {
    _$passwordVisibleThreeAtom.reportRead();
    return super.passwordVisibleThree;
  }

  @override
  set passwordVisibleThree(bool value) {
    _$passwordVisibleThreeAtom.reportWrite(value, super.passwordVisibleThree,
        () {
      super.passwordVisibleThree = value;
    });
  }

  final _$isActiveAtom =
      Atom(name: '_ForgotPasswordStore.isActive', );

  @override
  bool get isActive {
    _$isActiveAtom.reportRead();
    return super.isActive;
  }

  @override
  set isActive(bool value) {
    _$isActiveAtom.reportWrite(value, super.isActive, () {
      super.isActive = value;
    });
  }

  final _$emailAtom =
      Atom(name: '_ForgotPasswordStore.email', );

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$otpAtom =
      Atom(name: '_ForgotPasswordStore.otp', );

  @override
  String get otp {
    _$otpAtom.reportRead();
    return super.otp;
  }

  @override
  set otp(String value) {
    _$otpAtom.reportWrite(value, super.otp, () {
      super.otp = value;
    });
  }

  final _$currentPasswordAtom =
      Atom(name: '_ForgotPasswordStore.currentPassword', );

  @override
  String get currentPassword {
    _$currentPasswordAtom.reportRead();
    return super.currentPassword;
  }

  @override
  set currentPassword(String value) {
    _$currentPasswordAtom.reportWrite(value, super.currentPassword, () {
      super.currentPassword = value;
    });
  }

  final _$passwordAtom =
      Atom(name: '_ForgotPasswordStore.password', );

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$confirmPasswordAtom =
      Atom(name: '_ForgotPasswordStore.confirmPassword', );

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  final _$_ForgotPasswordStoreActionController =
      ActionController(name: '_ForgotPasswordStore', );

  @override
  void load(bool load) {
    final _$actionInfo = _$_ForgotPasswordStoreActionController.startAction(
        name: '_ForgotPasswordStore.load');
    try {
      return super.load(load);
    } finally {
      _$_ForgotPasswordStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateCurrentPassword(String value) {
    final _$actionInfo = _$_ForgotPasswordStoreActionController.startAction(
        name: '_ForgotPasswordStore.validateCurrentPassword');
    try {
      return super.validateCurrentPassword(value);
    } finally {
      _$_ForgotPasswordStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword(String value) {
    final _$actionInfo = _$_ForgotPasswordStoreActionController.startAction(
        name: '_ForgotPasswordStore.validatePassword');
    try {
      return super.validatePassword(value);
    } finally {
      _$_ForgotPasswordStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateConfirmPassword(String value) {
    final _$actionInfo = _$_ForgotPasswordStoreActionController.startAction(
        name: '_ForgotPasswordStore.validateConfirmPassword');
    try {
      return super.validateConfirmPassword(value);
    } finally {
      _$_ForgotPasswordStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateOtp(String value) {
    final _$actionInfo = _$_ForgotPasswordStoreActionController.startAction(
        name: '_ForgotPasswordStore.validateOtp');
    try {
      return super.validateOtp(value);
    } finally {
      _$_ForgotPasswordStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateEmail(String value) {
    final _$actionInfo = _$_ForgotPasswordStoreActionController.startAction(
        name: '_ForgotPasswordStore.validateEmail');
    try {
      return super.validateEmail(value);
    } finally {
      _$_ForgotPasswordStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
passwordVisible: ${passwordVisible},
passwordVisibleTwo: ${passwordVisibleTwo},
passwordVisibleThree: ${passwordVisibleThree},
isActive: ${isActive},
email: ${email},
otp: ${otp},
currentPassword: ${currentPassword},
password: ${password},
confirmPassword: ${confirmPassword}
    ''';
  }
}

mixin _$ForgotPasswordErrorStore on _ForgotPasswordErrorStore, Store {
  Computed<bool> _$hasErrorsEmailComputed;

  @override
  bool get hasErrorsEmail =>
      (_$hasErrorsEmailComputed ??= Computed<bool>(() => super.hasErrorsEmail,
              name: '_ForgotPasswordErrorStore.hasErrorsEmail'))
          .value;
  Computed<bool> _$hasErrorsOtpComputed;

  @override
  bool get hasErrorsOtp =>
      (_$hasErrorsOtpComputed ??= Computed<bool>(() => super.hasErrorsOtp,
              name: '_ForgotPasswordErrorStore.hasErrorsOtp'))
          .value;
  Computed<bool> _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_ForgotPasswordErrorStore.hasErrors'))
          .value;

  final _$emailAtom =
      Atom(name: '_ForgotPasswordErrorStore.email', );

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$otpAtom =
      Atom(name: '_ForgotPasswordErrorStore.otp', );

  @override
  String get otp {
    _$otpAtom.reportRead();
    return super.otp;
  }

  @override
  set otp(String value) {
    _$otpAtom.reportWrite(value, super.otp, () {
      super.otp = value;
    });
  }

  final _$currentPasswordAtom =
      Atom(name: '_ForgotPasswordErrorStore.currentPassword', );

  @override
  String get currentPassword {
    _$currentPasswordAtom.reportRead();
    return super.currentPassword;
  }

  @override
  set currentPassword(String value) {
    _$currentPasswordAtom.reportWrite(value, super.currentPassword, () {
      super.currentPassword = value;
    });
  }

  final _$passwordAtom =
      Atom(name: '_ForgotPasswordErrorStore.password', );

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$confirmPasswordAtom =
      Atom(name: '_ForgotPasswordErrorStore.confirmPassword', );

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  @override
  String toString() {
    return '''
email: ${email},
otp: ${otp},
currentPassword: ${currentPassword},
password: ${password},
confirmPassword: ${confirmPassword},
hasErrorsEmail: ${hasErrorsEmail},
hasErrorsOtp: ${hasErrorsOtp},
hasErrors: ${hasErrors}
    ''';
  }
}
