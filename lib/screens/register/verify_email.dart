import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smartpay/screens/register/registration_screen.dart';
import 'package:smartpay/screens/services/api_client.dart';

import '../../classes/colors.dart';
import '../../classes/fonts.dart';
import '../../classes/main_class.dart';
import '../../utils/alert_dailog.dart';
import '../../widgets/button.dart';
import '../../widgets/input_field.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({Key key}) : super(key: key);
  static const routeName = '/verifyEmail';

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {

  TextEditingController emailController = TextEditingController();

  FocusNode emailFocus = FocusNode();

  @override
  void initState() {
   registerStore.setupEmailValidations();
    super.initState();
  }


  @override
  void dispose() {
    emailController.dispose();
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
            RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                text: 'Create a ',
                style: TextStyle(
                    color: AppColor.colorAppBlack,
                    fontSize: 24.0.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: AppFonts.sfPro,
                    fontStyle: FontStyle.normal),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Smartpay',
                      style:TextStyle(
                          color: AppColor.colorApp,
                          fontSize: 24.0.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: AppFonts.sfPro,
                          fontStyle: FontStyle.normal)),
                ],
              ),
            ),
            MainClass.txtS6('account', 24.sp),
            MainClass.bH(30),
            Observer(
              builder: (ctx) => InputField(
                controller: emailController,
                type: TextInputType.emailAddress,
                hint: "Email",
                filled: false,
                onChanged: (text) {
                  registerStore.email = text.trim();
                  if (text.contains("@")) {
                    setState(() {
                     registerStore.isActive = true;
                    });
                  } else {
                    setState(() {
                      registerStore.isActive = false;
                    });
                  }
                },
                message: registerStore.error.email,
                error: registerStore.error.email != null,
                color: Colors.black,
                textColor: Colors.black,
                focusedColor: AppColor.colorAppLight,
                node: emailFocus,
              ),
            ),

            MainClass.bH(40),
            Observer(
              builder: (ctx) => SizedBox(
                width: double.infinity,
                child: Button(
                    text: 'Sign Up',
                    onPressed:registerStore.isActive? () {
                      FocusScope.of(context).unfocus();
                      if(registerStore.hasErrorsEmail){
                        return;
                      }else{
                        registerStore.submitEmail(api, context, (s) {}, (e){
                          showCustomDialog(context, "Notification", e);
                        }, emailController.text);
                      }
                    }:null,
                    loading: registerStore.loading,
                    loaderColor: Colors.white,
                    textColor: Colors.white,
                    color: registerStore.isActive?AppColor.colorAppBlack:
                    AppColor.colorAppBlack.withOpacity(0.7)
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
                text: 'Already have an account? ',
                style: TextStyle(
                    color: AppColor.colorAppGray2,
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: AppFonts.sfPro,
                    fontStyle: FontStyle.normal),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Sign In',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () =>Navigator.pushNamed(context, RegistrationScreen.routeName),
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
}
