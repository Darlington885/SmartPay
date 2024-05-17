// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on _AuthStore, Store {
   final _$onboardedAtom =
      Atom(name: '_AuthStore.onboarded', );

  @override
  bool get onboarded {
    _$onboardedAtom.reportRead();
    return super.onboarded;
  }

  @override
  set onboarded(bool value) {
    _$onboardedAtom.reportWrite(value, super.onboarded, () {
      super.onboarded = value;
    });
  }

   final _$loginPinAtom =
      Atom(name: '_AuthStore.loginPin', );

  @override
  String get loginPin {
    _$loginPinAtom.reportRead();
    return super.loginPin;
  }

  @override
  set loginPin(String value) {
    _$loginPinAtom.reportWrite(value, super.loginPin, () {
      super.loginPin = value;
    });
  }

   final _$loginPasswordAtom =
      Atom(name: '_AuthStore.loginPassword', );

  @override
  String get loginPassword {
    _$loginPasswordAtom.reportRead();
    return super.loginPassword;
  }

  @override
  set loginPassword(String value) {
    _$loginPasswordAtom.reportWrite(value, super.loginPassword, () {
      super.loginPassword = value;
    });
  }

   final _$loginUsernameAtom =
      Atom(name: '_AuthStore.loginUsername', );

  @override
  String get loginUsername {
    _$loginUsernameAtom.reportRead();
    return super.loginUsername;
  }

  @override
  set loginUsername(String value) {
    _$loginUsernameAtom.reportWrite(value, super.loginUsername, () {
      super.loginUsername = value;
    });
  }

   final _$countryCodeAtom =
      Atom(name: '_AuthStore.countryCode', );

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

   final _$loginTokenAtom =
      Atom(name: '_AuthStore.loginToken', );

  @override
  String get loginToken {
    _$loginTokenAtom.reportRead();
    return super.loginToken;
  }

  @override
  set loginToken(String value) {
    _$loginTokenAtom.reportWrite(value, super.loginToken, () {
      super.loginToken = value;
    });
  }

   final _$loginEmailAtom =
      Atom(name: '_AuthStore.loginEmail', );

  @override
  String get loginEmail {
    _$loginEmailAtom.reportRead();
    return super.loginEmail;
  }

  @override
  set loginEmail(String value) {
    _$loginEmailAtom.reportWrite(value, super.loginEmail, () {
      super.loginEmail = value;
    });
  }

   final _$profileNameAtom =
      Atom(name: '_AuthStore.profileName', );

  @override
  String get profileName {
    _$profileNameAtom.reportRead();
    return super.profileName;
  }

  @override
  set profileName(String value) {
    _$profileNameAtom.reportWrite(value, super.profileName, () {
      super.profileName = value;
    });
  }

   final _$isSecurityEnableAtom =
      Atom(name: '_AuthStore.isSecurityEnable', );

  @override
  bool get isSecurityEnable {
    _$isSecurityEnableAtom.reportRead();
    return super.isSecurityEnable;
  }

  @override
  set isSecurityEnable(bool value) {
    _$isSecurityEnableAtom.reportWrite(value, super.isSecurityEnable, () {
      super.isSecurityEnable = value;
    });
  }

   final _$profilePictureAtom =
      Atom(name: '_AuthStore.profilePicture', );

  @override
  String get profilePicture {
    _$profilePictureAtom.reportRead();
    return super.profilePicture;
  }

  @override
  set profilePicture(String value) {
    _$profilePictureAtom.reportWrite(value, super.profilePicture, () {
      super.profilePicture = value;
    });
  }

  @override
  String toString() {
    return '''
onboarded: ${onboarded},
loginPin: ${loginPin},
loginPassword: ${loginPassword},
loginUsername: ${loginUsername},
countryCode: ${countryCode},
loginToken: ${loginToken},
loginEmail: ${loginEmail},
profileName: ${profileName},
isSecurityEnable: ${isSecurityEnable},
profilePicture: ${profilePicture}
    ''';
  }
}
