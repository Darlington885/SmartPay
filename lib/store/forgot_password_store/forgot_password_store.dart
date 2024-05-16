
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';

import '../../screens/services/api_client.dart';

part 'forgot_password_store.g.dart';

class ForgotPasswordStore extends _ForgotPasswordStore with _$ForgotPasswordStore {}

abstract class _ForgotPasswordStore with Store {
  final ForgotPasswordErrorStore error = ForgotPasswordErrorStore();
  var localAuth = LocalAuthentication();

  @observable
  bool loading = false;

  @observable
  bool passwordVisible = true;

  @observable
  bool passwordVisibleTwo = true;

  @observable
  bool passwordVisibleThree = true;

  @observable
  bool isActive = false;

  @observable
  String email;

  @observable
  String otp;

  @observable
  String currentPassword;

  @observable
  String password;

  @observable
  String confirmPassword;

  @action
  void load(bool load) {
    loading = load;
  }

  @action
  void validateCurrentPassword(String value) {
    error.currentPassword =
    isNull(value) || value.isEmpty ? 'Password is required' : null;
  }

  @action
  void validatePassword(String value) {
    error.password =
    isNull(value) || value.isEmpty ? 'Password is required' : null;
  }

  @action
  void validateConfirmPassword(String value) {
    error.confirmPassword =
    isNull(value) || value.isEmpty ? 'Password is required' : null;
  }

  @action
  void validateOtp(String value) {
    error.otp =
    isNull(value) || value.isEmpty ? 'Otp is required' : null;
  }

  @action
  void validateEmail(String value) {
    if (isNull(value) || value.isEmpty) {
      error.email = 'Email is required';
    } else if (!isEmail(value)) {
      error.email = 'Enter a valid email';
    } else {
      error.email = null;
    }
  }

  List<ReactionDisposer> _disposers;

  void setupValidations() {
    _disposers = [
      reaction((_) => password, validatePassword),
      reaction((_) => confirmPassword, validateConfirmPassword),
    ];
  }

  void setupChangeValidations() {
    _disposers = [
       reaction((_) => currentPassword, validateCurrentPassword),
       reaction((_) => password, validatePassword),
        reaction((_) => confirmPassword, validateConfirmPassword),
    ];
  }

  void setupEmailValidations() {
    _disposers = [
      reaction((_) => email, validateEmail),
    ];
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }


  bool get hasErrorsEmail {
    validateEmail(email);
    return error.hasErrorsEmail;
  }

  bool get hasErrorsOtp {
    validateOtp(otp);
    return error.hasErrorsOtp;
  }

  bool get hasErrors {
    validatePassword(password);
    validateConfirmPassword(confirmPassword);
    return error.hasErrors;
  }

  bool get hasErrorsTwo {
    validatePassword(password);
    validatePassword(currentPassword);
    validateConfirmPassword(confirmPassword);
    return error.hasErrors;
  }

/*  Future<void> submit(ApiClient api, BuildContext context, Function(String) s,
      Function(String) e) async {

    try {
      load(true);
      // var data = {
      //   "email":email,
      //   "password":password,
      //   "password_confirmation":confirmPassword,
      //   "otp":otp
      // };

      var res = await api.resetPassword(context, email);
      if(res.success == true){
        Navigator.pushNamed(context, EnterOtpForgotPasswordScreen.routeName);
      }

      else{
        e(res.message ?? res.message);
        load(false);
      }
      s(res.message);

    }on ApiClientResponse catch (err) {
      load(false);
      e(err.message ?? "An Error Occurred");

    }on DioError catch (err) {
      load(false);
      e(err.message ?? "An Error Occurred");

    }
    finally {
      load(false);
    }

  }*/

/*  Future<void> submitTwo(ApiClient api, BuildContext context,
      Function(String) s, Function(String) e,) async {

    try {
      load(true);

      var d = {
        "email": email,
        "otp": otp,
      };

      var res = await api.verifyAccount(context, d, email, otp);

      if (res.success == true) {
      ResponseData.verifyOtpResponse = res;
        Navigator.pushNamed(context, EnterNewPassword.routeName);
      } else {
        e(res.message ?? res.message);
        load(false);
      }
    } on ApiClientResponse catch (res) {
      e(res.message ?? res.message);
      load(false);
    } on DioError catch (res) {
      e(res.message ?? res.message);
      load(false);
    } finally {
      load(false);
    }
  }

  Future<void> submitThree(ApiClient api, BuildContext context, Function(String) s, Function(String) e,) async {
    try {
      load(true);
      var d = {
        "password":password,
        "confirm_password":confirmPassword
      };
      var res = await api.changePasswordTwo(context, d);
      if (res.success == true) {
        navigate(context, WelcomeScreen(ty: 'change-password',));

      } else {
        e(res.message ?? res.message);
        load(false);
      }
    } on ApiClientResponse catch (res) {
      e(res.message ?? res.message);
      load(false);
    } on DioError catch (res) {
      e(res.message ?? res.message);
      load(false);
    } finally {
      load(false);
    }
  }*/



}

class ForgotPasswordErrorStore = _ForgotPasswordErrorStore with _$ForgotPasswordErrorStore;

abstract class _ForgotPasswordErrorStore with Store {

  @observable
  String email;

  @observable
  String otp;

  @observable
  String currentPassword;

  @observable
  String password;

  @observable
  String confirmPassword;

  @computed
  bool get hasErrorsEmail => email != null;

  @computed
  bool get hasErrorsOtp => otp != null;

  @computed
  bool get hasErrors => currentPassword != null || password != null|| confirmPassword != null;
}