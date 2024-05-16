import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay/screens/forgot_password/enter_new_password.dart';

import '../../classes/colors.dart';
import '../../classes/fonts.dart';
import '../../classes/main_class.dart';
import '../../widgets/button.dart';
import '../../widgets/input_field.dart';
import '../register/registration_screen.dart';

class VerifyIdentity extends StatefulWidget {
  const VerifyIdentity({Key key}) : super(key: key);
  static const routeName = '/verifyIdentity';

  @override
  State<VerifyIdentity> createState() => _VerifyIdentityState();
}

class _VerifyIdentityState extends State<VerifyIdentity> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w,  top: 50.h),
              child: Image.asset('assets/images/extras/profile.png', width: 90.w, height: 76.h,),
            ),
            MainClass.bH(20),
            Expanded(child:
            ListView(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              children: [
                MainClass.txtS6('Verify your identity', 24.sp),
                MainClass.bH(10),
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'Where would you like ',
                    style: TextStyle(
                        color: AppColor.colorAppGray3,
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: AppFonts.sfPro,
                        fontStyle: FontStyle.normal),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Smartpay ',
                          style:TextStyle(
                              color: AppColor.colorApp,
                              fontSize: 16.0.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: AppFonts.sfPro,
                              fontStyle: FontStyle.normal)),
                      TextSpan(
                          text: 'to send your\nsecurity code?',
                          style:TextStyle(
                              color: AppColor.colorAppGray3,
                              fontSize: 16.0.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: AppFonts.sfPro,
                              fontStyle: FontStyle.normal)),
                    ],
                  ),
                ),
                MainClass.bH(30),

              ],)),
            Observer(
              builder: (ctx) => Container(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                width: double.infinity,
                child: Button(
                    text: 'Continue',
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      Navigator.pushNamed(context, EnterNewPassword.routeName);
                    /*  if(registerStore.hasErrorsEmail){
                        return;
                      }else{
                        Navigator.pushNamed(context, EnterNewPassword.routeName);
                        // registerStore.submitEmail(api, context, (s) {}, (e){
                        //   showCustomDialog(context, "Notification", e);
                        // });
                      }*/
                    },
                    loading: registerStore.loading,
                    loaderColor: Colors.white,
                    textColor: Colors.white,
                    color: AppColor.colorAppBlack
                ),
              ),
            ),
            MainClass.bH(30),
          ],
        ),
      ),
    );
  }
}
