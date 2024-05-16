import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:smartpay/screens/register/registration_screen.dart';
import 'package:smartpay/screens/services/api_client.dart';

import '../../classes/colors.dart';
import '../../classes/fonts.dart';
import '../../classes/main_class.dart';
import '../../utils/alert_dailog.dart';
import '../../widgets/button.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({Key key}) : super(key: key);
  static const routeName = '/verifyOtp';

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {

  TextEditingController pinController = TextEditingController();

  @override
  void dispose() {
    dispose();
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
            MainClass.txtS6('Verify it\'s you', 24.sp),

            MainClass.bH(30),
            Observer(
              builder:(_) => Row(
                children: [
                  Expanded(
                    child: PinCodeTextField(
                      showCursor: false,
                      cursorHeight: 20,
                      autoFocus: true,
                      textStyle: TextStyle(
                        color: AppColor.colorAppBlack,
                        fontFamily: AppFonts.sfPro,
                        fontWeight: FontWeight.w600,
                        fontSize: 32.sp,
                      ),
                      // pastedTextStyle: TextStyle(
                      //   color: AppColor.colorAppBlack,
                      //   fontFamily: AppFonts.sfPro,
                      //   fontWeight: FontWeight.w600,
                      //   fontSize: 32.sp,
                      // ),
                      pinTheme: PinTheme(
                          fieldOuterPadding: const EdgeInsets.only(left: 1, right: 1),
                          borderWidth: 1.0,
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(8),
                          fieldHeight: 63.h,
                          fieldWidth: 56.w,
                          //fieldWidth: 43.w,
                          inactiveColor: AppColor.colorAppGray,
                          inactiveFillColor: AppColor.colorAppGray,
                          selectedColor: AppColor.colorApp,
                          selectedFillColor: Colors.white,
                          activeColor: AppColor.colorApp,
                          activeFillColor: Colors.white,
                          errorBorderColor: Colors.red
                      ),
                      appContext: context,
                      length: 5,
                      animationDuration: const Duration(microseconds: 300),
                      enableActiveFill: true,
                      enablePinAutofill: true,
                      cursorColor: AppColor.colorApp,
                      scrollPadding: const EdgeInsets.all(0),
                      controller: pinController,
                      obscureText: false,
                      keyboardType: TextInputType.number,
                      onCompleted: (v){
                        registerStore.otp = v;
                      },
                      onChanged: (value){
                        if(pinController.text.length == 4) {
                          setState(() {registerStore.isActive2=true;});
                        } else {
                          setState(() {registerStore.isActive2=false;});
                        }
                        // setState(() {
                        // // forgotPasswordStore.otp = value;
                        // });
                      },beforeTextPaste: (text){
                      return true;
                    },),
                  ),
                ],
              ),
            ),
            MainClass.bH(80),
            Observer(
              builder: (ctx) => SizedBox(
                width: double.infinity,
                child: Button(
                    text: 'Sign Up',
                    onPressed:registerStore.isActive? () {
                      FocusScope.of(context).unfocus();
                      if(registerStore.hasOtpError){
                        return;
                      }else{
                        registerStore.submitEmail(api, context, (s) {}, (e){
                          showCustomDialog(context, "Notification", e);
                        });
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


          ],
        ),
      ),
    );
  }
}
