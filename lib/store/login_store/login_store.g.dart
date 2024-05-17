// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on _LoginStore, Store {
   final _$loadingAtom =
      Atom(name: '_LoginStore.loading', );

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

   final _$absorbAtom = Atom(name: '_LoginStore.absorb', );

  @override
  bool get absorb {
    _$absorbAtom.reportRead();
    return super.absorb;
  }

  @override
  set absorb(bool value) {
    _$absorbAtom.reportWrite(value, super.absorb, () {
      super.absorb = value;
    });
  }

   final _$passwordVisibleAtom =
      Atom(name: '_LoginStore.passwordVisible', );

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

   final _$emailAtom = Atom(name: '_LoginStore.email', );

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

   final _$tokenAtom = Atom(name: '_LoginStore.token', );

  @override
  String get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(String value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

   final _$nameAtom = Atom(name: '_LoginStore.name', );

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

   final _$usernameAtom =
      Atom(name: '_LoginStore.username', );

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

   final _$contactNumberAtom =
      Atom(name: '_LoginStore.contactNumber', );

  @override
  String get contactNumber {
    _$contactNumberAtom.reportRead();
    return super.contactNumber;
  }

  @override
  set contactNumber(String value) {
    _$contactNumberAtom.reportWrite(value, super.contactNumber, () {
      super.contactNumber = value;
    });
  }

   final _$countryCodeAtom =
      Atom(name: '_LoginStore.countryCode', );

  @override
  String get countryCode {
    _$countryCodeAtom.reportRead();
    return super.countryCode;
  }

  @override
  set countryCode(String value) {
    _$countryCodeAtom.reportWrite(value, super.countryCode, () {
      super.countryCode = value;
    });
  }

   final _$passwordAtom =
      Atom(name: '_LoginStore.password', );

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

   final _$_LoginStoreActionController =
      ActionController(name: '_LoginStore', );

  @override
  void load(bool load) {
    final _$actionInfo =
        _$_LoginStoreActionController.startAction(name: '_LoginStore.load');
    try {
      return super.load(load);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword(String value) {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.validatePassword');
    try {
      return super.validatePassword(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateEmail(String value) {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.validateEmail');
    try {
      return super.validateEmail(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
absorb: ${absorb},
passwordVisible: ${passwordVisible},
email: ${email},
token: ${token},
name: ${name},
username: ${username},
contactNumber: ${contactNumber},
countryCode: ${countryCode},
password: ${password}
    ''';
  }
}

mixin _$LoginErrorStore on _LoginErrorStore, Store {
  Computed<bool> _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_LoginErrorStore.hasErrors'))
          .value;

   final _$nameAtom = Atom(name: '_LoginErrorStore.name', );

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

   final _$usernameAtom =
      Atom(name: '_LoginErrorStore.username', );

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

   final _$confirmPasswordAtom =
      Atom(name: '_LoginErrorStore.confirmPassword', );

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

   final _$emailAtom =
      Atom(name: '_LoginErrorStore.email', );

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

   final _$passwordAtom =
      Atom(name: '_LoginErrorStore.password', );

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

  @override
  String toString() {
    return '''
name: ${name},
username: ${username},
confirmPassword: ${confirmPassword},
email: ${email},
password: ${password},
hasErrors: ${hasErrors}
    ''';
  }
}
