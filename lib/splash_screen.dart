import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay/classes/main_class.dart';
import 'package:smartpay/main.dart';
import 'package:smartpay/screens/auth/login.dart';
import 'package:smartpay/utils/navigators.dart';

import 'classes/colors.dart';
import 'classes/fonts.dart';
import 'onboard.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);
  static const routeName = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () async{
      authStore.onboarded ? navigateReplace(context, const LoginScreen()):
      navigateReplace(context, const Onboard());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/onboarding/logo.png', height:72.h, width: 72.w,),
            MainClass.bH(20),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                text: 'Smart',
                style:TextStyle(
                    color: Colors.black,
                    fontSize: 32.0,
                    fontWeight: FontWeight.w600,
                    fontFamily: AppFonts.sfPro,
                    fontStyle: FontStyle.normal),
                children: <TextSpan>[
                  TextSpan(
                      text: 'pay',
                      style: TextStyle(
                          color: AppColor.colorApp,
                          fontSize: 32.0,
                          fontWeight: FontWeight.w600,
                          fontFamily: AppFonts.sfPro,
                          fontStyle: FontStyle.normal)),
                ],
              ),
            ),


          ],
        ),),
    );
  }
}
