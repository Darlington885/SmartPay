
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:smartpay/utils/navigators.dart';
import 'package:validators/validators.dart';

import '../../classes/response_data.dart';
import '../../dto/login_dto.dart';
import '../../main.dart';
import '../../models/api_client_response.dart';
import '../../screens/dashboard/dashboard_screen.dart';
import '../../screens/services/api_client.dart';
import '../../screens/services/auth_storage.dart';


part 'login_store.g.dart';

class LoginStore extends _LoginStore with _$LoginStore {}

abstract class _LoginStore with Store {
  final LoginErrorStore error = LoginErrorStore();
  var localAuth = LocalAuthentication();

  @observable
  bool loading = false;

  @observable
  bool absorb = false;

  @observable
  bool passwordVisible = true;

  @observable
  String email;

  @observable
  String token;

  @observable
  String name;

  @observable
  String username;

  @observable
  String contactNumber;

  @observable
  String countryCode;

  @observable
  String password;

  @action
  void load(bool load) {
    loading = load;
  }

  @action
  void validatePassword(String value) {
    error.password =
    isNull(value) || value.isEmpty ? 'Password is required' : null;
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
      reaction((_) => email, validateEmail),
      reaction((_) => password, validatePassword),
    ];
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  bool get hasErrors {
    absorb = false;
    validateEmail(email);
    validatePassword(password);
    return error.hasErrors;
  }



  Future<void> submit(ApiClient api, BuildContext context, Function(String) s,
      Function(String) e, String deviceName) async {
    if (hasErrors) return;

    try {
      load(true);
      var res = await api.login(context, LoginDto(
        email: email.toLowerCase(),
        password: password,
        deviceName: deviceName,
      ));

      if (res.status == true ) {
       ResponseData.loginResponse = res;
       authStore.loginToken = res.data.token;
       AuthStorage().saveStringData("loginToken",res.data.token);
       var userSecret = await api.getSecret(context);
       ResponseData.dashboardResponse = userSecret;

        print(res);
        //Saving the login credentials locally
        authStore.loginUsername = email.toLowerCase();
        AuthStorage().saveStringData("loginEmail", email.toLowerCase());
        print(authStore.loginEmail);
        authStore.loginPassword = password;
        AuthStorage().saveStringData("loginPassword", password);
        print(authStore.loginPassword);
        authStore.onboarded = true;
        AuthStorage().saveBoolData("onboarded", true);
        print(authStore.onboarded);

        await navigateReplaceTwo(context,  DashBoardScreen());

        s("Login Success");

      } else {
        e(res.message ?? res.message);
        load(false);
      }
    } on ApiClientResponse catch (res) {
      e(res.message ?? "An Error Occurred");
    } on DioError catch (res) {
      e(res.message ?? "An Error Occurred");
    } on Exception catch (res) {
      print(res);
    } finally {
      load(false);
    }
  }

}

class LoginErrorStore = _LoginErrorStore with _$LoginErrorStore;

abstract class _LoginErrorStore with Store {

  @observable
  String name;

  @observable
  String username;

  @observable
  String confirmPassword;

  @observable
  String email;

  @observable
  String password;

  @computed
  bool get hasErrors => name != null || username != null || email != null || password != null;
  bool get regHasErrors => username != null || email != null || password != null;
}