
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:smartpay/models/email_token_response.dart';
import 'package:smartpay/screens/dashboard/dashboard_screen.dart';
import 'dart:convert';

import '../../classes/response_data.dart';
import '../../config/config.dart';
import '../../dto/login_dto.dart';
import '../../models/api_client_response.dart';
import '../../models/dashboard_response.dart';
import '../../models/login_response.dart';
import '../../models/login_response2.dart';
import '../../store/auth_store/auth_store.dart';
import '../../utils/alert_dailog.dart';


class ApiClient {
  Dio dio;
  Dio dioTwo;
  BaseOptions baseOptions =  BaseOptions(baseUrl: Config.baseUrl);

  final AuthStore auth;

  ApiClient(this.auth) {
    dio = Dio(baseOptions);
    dioTwo = Dio();
    dio.interceptors.add(LogInterceptor(
        responseBody: true, requestBody: true, request: true, error: true));
    dioTwo.interceptors.add(LogInterceptor(
        responseBody: true, requestBody: true, request: true, error: true));
  }


  static String get token => ResponseData.loginResponse.data.token;


  Options get options {
    return Options(headers: {
      'Authorization': 'Bearer $token',
    }
    );
  }

  Options get dummyOptions {
    return Options(headers: {
      'x-client-id': "b0a7f361-bbb8-45fe-821d-78c86f0c0b55"
    });
  }


  Options get optionsta {
    return Options(headers: {
      'x-client-id':auth,
      'Bearer': '$token',
      'Content-Type': 'multipart/form-data',
      'Accept' : '*/*'
    });
  }

  Future<ApiClientResponse> _handleError(BuildContext context, DioError e) async{
    // The request was made and the server responded with a status code
    // that falls out of the range of 2xx and is also not 304.
    print(e);
    try {
      if (e.response != null) {
        print('API client error [status] ==> ${e.response.statusCode}');
        print('API client error [data] ==> ${e.response.data}');
        // Handle Unauthorized error
        if (e.response.statusCode == 401) {
          ApiClientResponse res = ApiClientResponse.fromJson(e.response.data);
          // TODO: find a way to notify the user and log the user out
          print('showDialog');
          showCustomDialog(context, "Notification",res.message);

        } else if (e.response.statusCode == 422) {
          ApiClientResponse res = ApiClientResponse.fromJson(e.response.data);
          print("this res res res");
          print(res.message);
          showCustomDialog(context, "Notification",res.message);
          return res;
        } else {
          ApiClientResponse res = ApiClientResponse.fromJson(e.response.data);
          showCustomDialog(context, "Notification", res.message);
          print("this res ress");
          print(res.message);
          return res;
        }
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print('API client error ==> ${e.message}');
        return ApiClientResponse(message: 'Network error. Try again later.');
      }
    }catch(e){
      print(e);
    }
  }



  Future<LoginResponse> login(BuildContext context, LoginDto d) async {
    try {
      var response = await dio.post('api/v1/auth/login', data: d.toJson());
      return LoginResponse.fromJson(response.data);
    } on DioError catch (e) {
      return Future.error(_handleError(context, e));
    }
  }

  //
  // Future<CreateAccountResponse> createAccount(BuildContext context, Map<String, dynamic> d) async {
  //   try {
  //     var response = await dio.post('api/v1/auth/signup', data: d,);
  //     return CreateAccountResponse.fromJson(response.data);
  //   } on DioError catch (e) {
  //     return Future.error(_handleError(context, e));
  //   }
  // }

  Future<EmailTokenResponse> verifyEmail(BuildContext context, Map<String, dynamic> d ) async {
    try {
      var response = await dio.post('api/v1/auth/email', data: d);
      return EmailTokenResponse.fromJson(response.data);
    } on DioError catch (e) {
      return Future.error(_handleError(context, e));
    }
  }

  Future<DashboardResponse> getSecret(BuildContext context, ) async {
    try {
      var response = await dio.get('api/v1/auth/dashboard', options: options);
      return DashboardResponse.fromJson(response.data);
    } on DioError catch (e) {
      return Future.error(_handleError(context, e));
    }
  }






}