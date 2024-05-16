import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'dart:io';

import '../../classes/colors.dart';
import '../../classes/fonts.dart';
import '../../classes/main_class.dart';
import '../../main.dart';
import '../../store/login_store/login_store.dart';
import '../../utils/alert_dailog.dart';
import '../../widgets/button.dart';
import '../../widgets/input_field.dart';
import '../forgot_password/forgot_password.dart';
import '../register/registration_screen.dart';
import '../register/verify_email.dart';
import '../services/api_client.dart';
import '../services/auth_storage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);
  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  LoginStore store = LoginStore();

  String devId = '', devName = '', devOS = '';

  @override
  void initState() {
    store.setupValidations();
    emailController.text = authStore.loginUsername;
    store.email = authStore.loginUsername;
    getData();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final api = Provider.of<ApiClient>(context);
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: ListView(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 50.h),
          children: [
            MainClass.appTop(context),
            MainClass.bH(20),
            MainClass.txtS6('Hi There!👋', 24.sp),
            MainClass.bH(10),
            MainClass.txtS4('Welcome back, Sign in to your account', 16.sp),
            MainClass.bH(30),
            Observer(
              builder: (ctx) => InputField(
                controller: emailController,
                type: TextInputType.emailAddress,
                hint: "Email",
                filled: false,
                onChanged: (text) {
                  store.email = text.trim();
                },
                message: store.error.email,
                error: store.error.email != null,
                color: Colors.black,
                textColor: Colors.black,
                focusedColor: AppColor.colorAppLight,
                node: emailFocus,
              ),
            ),
            MainClass.bH(10),
            Observer(
              builder: (ctx) => InputField(
                controller: passwordController,
                type: TextInputType.text,
                hint: "Password",
                filled: true,
                obscureText: store.passwordVisible,
                suffixIcon: GestureDetector(
                    onTap: () {
                      store.passwordVisible = !store.passwordVisible;
                    },
                    child: IconButton(
                        icon: store.passwordVisible
                            ?  Image.asset('assets/images/extras/eye_off.png', height: 24.h, width: 24.w,)
                            :  const Icon(Icons.visibility, color: AppColor.colorAppGray2,)
                    )),
                onChanged: (text) {
                  store.password = text.trim();
                },
                message: store.error.password,
                error: store.error.password != null,
                color: Colors.black,
                textColor: Colors.black,
                focusedColor: AppColor.colorAppLight,
                node: passwordFocus,
              ),
            ),

            InkWell(
              onTap: ()=> Navigator.pushNamed(context, ForgotPassword.routeName),
              child:MainClass.txtGreen('Forgot Password?', 16.sp),
            ),
            MainClass.bH(30),
            Observer(
              builder: (ctx) => SizedBox(
                width: double.infinity,
                child: Button(
                    text: 'Sign In',
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      if(store.hasErrors){
                        return;
                      }else{
                        store.submit(api, context, (s) {}, (e){
                          showCustomDialog(context, "Notification", e);
                        }, devName);
                      }
                    },
                    loading: store.loading,
                    loaderColor: Colors.white,
                    textColor: Colors.white,
                    color: Colors.black
                ),
              ),
            ),
            MainClass.bH(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MainClass.line(),
                MainClass.txtB4('OR', 14.sp),
                MainClass.line(),
              ],
            ),
            MainClass.bH(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MainClass.socialIcon('assets/images/extras/google.png',(){
                  //signInWithGoogle(context);
                }),
                MainClass.bW(20),
                MainClass.socialIcon('assets/images/extras/apple.png',(){}),
              ],),
            MainClass.bH(180),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Don\'t have an account? ',
                style: TextStyle(
                    color: AppColor.colorAppGray2,
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: AppFonts.sfPro,
                    fontStyle: FontStyle.normal),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Sign Up',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () =>Navigator.pushNamed(context, VerifyEmail.routeName),
                      style:TextStyle(
                          color: AppColor.colorApp,
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: AppFonts.sfPro,
                          fontStyle: FontStyle.normal)),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
  getData() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      setState(() {
        devId = androidInfo.fingerprint;
        devName = androidInfo.model;
        devOS = 'Android ${androidInfo.version.release}';
        //box.write('deviceInfo', '$devId,$devName,$devOS');
      });
    } else if (Platform.isIOS)  {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      setState(() {
        devId = iosInfo.identifierForVendor;
        devName = iosInfo.name;
        devOS = iosInfo.systemVersion;
        AuthStorage().saveStringData('deviceInfo','$devId,$devName,$devOS');
        //box.write('deviceInfo', '$devId,$devName,$devOS');
      });
    } else if (Platform.isWindows) {
      WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
      WindowsDeviceInfo windowsDeviceInfo= await deviceInfo.windowsInfo;
      devId = webBrowserInfo.platform;
      devName = webBrowserInfo.userAgent;
      devOS = windowsDeviceInfo.majorVersion.toString();
      AuthStorage().saveStringData('deviceInfo','$devId,$devName,$devOS');
      //box.write('deviceInfo', '$devId,$devName,$devOS');
    }
  }
}
