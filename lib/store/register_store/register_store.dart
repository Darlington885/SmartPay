
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:smartpay/classes/response_data.dart';
import 'package:smartpay/models/dashboard_response.dart';
import 'package:smartpay/screens/register/registration_screen.dart';
import 'package:smartpay/screens/register/set_pin.dart';
import 'package:smartpay/screens/register/verify_otp.dart';
import 'package:smartpay/utils/navigators.dart';
import 'package:validators/validators.dart';

import '../../main.dart';
import '../../models/api_client_response.dart';
import '../../screens/services/api_client.dart';

part 'register_store.g.dart';

class RegisterStore = _RegisterStore with _$RegisterStore;

abstract class _RegisterStore with Store {
  final RegisterErrorStore error = RegisterErrorStore();
  var localAuth = LocalAuthentication();

  @observable
  bool loading = false;

  @observable
  bool isActive = false;

  @observable
  bool isActive2 = false;

  @observable
  bool passwordVisible = true;

  @observable
  bool passwordVisibleTwo = true;

  @observable
  bool passwordVisibleThree = true;

  @observable
  String fullName;

  @observable
  String country;

  @observable
  String username;

  @observable
  String storeName;

  @observable
  String lastName;

  @observable
  String email;

  @observable
  String otp;

  @observable
  String phoneNumber;

  @observable
  String countryCode;

  @observable
  String password;

  @observable
  String confirmPassword;

  @observable
  File picture;

  @observable
  File picture2;

  @observable
  File file;

  @action
  void load(bool load) {
    loading = load;
  }

  @action
  void loadFile(File file) {
    this.file = file;
  }

  @action
  void validateFullName(String value) {
    if (isNull(value) || value.isEmpty) {
      error.fullName = 'Full name is required';
    } else {
      error.fullName = null;
    }
  }


  @action
  void validateUserName(String value) {
    if (isNull(value) || value.isEmpty) {
      error.username = 'Username is required';
    } else {
      error.username = null;
    }
  }

  @action
  void validatePhone(String value) {
    if (isNull(value) || value.isEmpty) {
      error.phoneNumber = 'Phone Number is required';
    } else {
      error.phoneNumber= null;
    }
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

  @action
  void validatePassword(String value) {
    if (isNull(value) || value.isEmpty) {
      error.password = 'Password is required';
    } else {
      error.password = null;
    }
  }

  @action
  void validateConfirmPassword(String value) {
    if (isNull(value) || value.isEmpty) {
      error.confirmPassword = 'Password is required';
    } else {
      error.confirmPassword = null;
    }
  }

  @action
  void validateOtp(String value) {
    if (isNull(value) || value.isEmpty) {
      error.otp = 'Otp is required';
    } else {
      error.otp = null;
    }
  }

  List<ReactionDisposer> _disposers;
  void setupValidations() {
    _disposers = [
      reaction((_) => fullName, validateFullName),
      reaction((_) => lastName, validateUserName),
      //reaction((_) => phoneNumber, validatePhone),
      reaction((_) => password, validatePassword),

    ];
  }

  void setupEmailValidations() {
    _disposers = [
      reaction((_) => email, validateEmail),
    ];
  }

  void setupOtpValidation() {
    _disposers = [
      reaction((_) => otp, validateOtp),
    ];
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  bool get hasErrors {
    validateFullName(fullName);
    validateUserName(username);
    validatePassword(password);
    return error.hasErrors;
  }

  bool get hasOtpError{
    validateOtp(otp);
    return error.hasOtpError;
  }

  bool get hasErrorsEmail {
    validateEmail(email);

    return error.hasErrorsEmail;
  }


  Future<void> submit(ApiClient api, BuildContext context, Function(String) s,
      Function(String) e,String email, String deviceNam) async {
    //if (hasErrors) return;

    try {
      load(true);

      var d = {

        "full_name":fullName,
        "username":username,
        "email":email,
        "country": country,
        "password":password,
        "device_name": deviceNam

      };

      var res = await api.createAccount(context, d);

      if (res.status == true) {
        print(res);
        Navigator.pushNamed(context, SetPin.routeName);
      }
      else {
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

  Future<void> submitOtp(ApiClient api, BuildContext context,
      Function(String) s, Function(String) e,String em2) async {

    try {
      load(true);

      var d = {
        "email":em2,
        "token": otp,
      };

      var res = await api.verifyEmailToken(context, d,);

      if (res.status == true) {
          navigate(context, RegistrationScreen(email: em2));
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

  Future<void> submitEmail(ApiClient api, BuildContext context, Function(String) s, Function(String) e, String em) async {
    if (hasErrorsEmail) return;

    try {
      load(true);
      var data = {
        "email": email,
      };

      var res = await api.verifyEmail(context, data);

      if(res.status == true){
        ResponseData.emailTokenResponse = res;
        navigate(context, VerifyOtp(email: em));
        //Navigator.pushNamed(context, VerifyOtp.routeName);
      }else{
        e(res.message ?? res.message);
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
  }



}

class RegisterErrorStore = _RegisterErrorStore with _$RegisterErrorStore;

abstract class _RegisterErrorStore with Store {


  @observable
  String firstName;

  @observable
  String lastName;

  @observable
  String username;

  @observable
  String email;

  @observable
  String country;

  @observable
  String phoneNumber;

  @observable
  String password;

  @observable
  String confirmPassword;

  @observable
  String otp;

  @observable
  String fullName;


  @computed
  bool get hasErrors => firstName != null  || lastName != null || phoneNumber != null || email != null || password != null || confirmPassword != null;

  bool get hasErrorsTwo => firstName != null  || lastName != null || email != null || password != null || confirmPassword != null;

  @computed
  bool get hasOtpError => otp != null;

  @computed
  bool get hasErrorsEmail => email != null;

}