import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay/screens/forgot_password/forgot_password.dart';
import 'package:smartpay/screens/forgot_password/success_screen.dart';

import '../../classes/colors.dart';
import '../../classes/main_class.dart';
import '../../utils/alert_dailog.dart';
import '../../widgets/button.dart';
import '../../widgets/input_field.dart';
import '../register/registration_screen.dart';

class EnterNewPassword extends StatefulWidget {
  const EnterNewPassword({Key key}) : super(key: key);
  static const routeName = '/enterNewPassword';

  @override
  State<EnterNewPassword> createState() => _EnterNewPasswordState();
}

class _EnterNewPasswordState extends State<EnterNewPassword> {

  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();

  FocusNode passwordFocus = FocusNode();
  FocusNode cPasswordFocus = FocusNode();

  @override
  void initState() {
    forgotPasswordStore.setupValidations();
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    cPasswordController.dispose();
    super.dispose();
  }
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
              child: MainClass.appTop(context),
            ),
            MainClass.bH(20),
            Expanded(child:
            ListView(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              children: [
                MainClass.txtS6('Create New Password', 24.sp),
                MainClass.bH(10),
                MainClass.txtS4('Please, enter a new password below different\nfrom the previous password', 16.sp),
                MainClass.bH(30),
                Observer(
                  builder: (ctx) => InputField(
                    controller: passwordController,
                    type: TextInputType.text,
                    hint: "Password",
                    filled: false,
                    obscureText: forgotPasswordStore.passwordVisible,
                    suffixIcon: GestureDetector(
                        onTap: () {
                          forgotPasswordStore.passwordVisible = !forgotPasswordStore.passwordVisible;
                        },
                        child: IconButton(
                            icon:forgotPasswordStore.passwordVisible
                                ?  Image.asset('assets/images/extras/eye_off.png', height: 24.h, width: 24.w,)
                                :  const Icon(Icons.visibility, color: AppColor.colorAppGray2,)
                        )),
                    onChanged: (text) {
                      forgotPasswordStore.password = text.trim();
                    },
                    message: forgotPasswordStore.error.password,
                    error: forgotPasswordStore.error.password != null,
                    color: Colors.black,
                    textColor: AppColor.colorAppBlack,
                    focusedColor: AppColor.colorApp,
                    node: passwordFocus,
                  ),
                ),
                Observer(
                  builder: (ctx) => InputField(
                    controller: cPasswordController,
                    type: TextInputType.text,
                    hint: "Confirm Password",
                    filled: false,
                    obscureText: forgotPasswordStore.passwordVisibleTwo,
                    suffixIcon: GestureDetector(
                        onTap: () {
                          forgotPasswordStore.passwordVisibleTwo = !forgotPasswordStore.passwordVisibleTwo;
                        },
                        child: IconButton(
                            icon:forgotPasswordStore.passwordVisibleTwo
                                ?  Image.asset('assets/images/extras/eye_off.png', height: 24.h, width: 24.w,)
                                :  const Icon(Icons.visibility, color: AppColor.colorAppGray2,)
                        )),
                    onChanged: (text) {
                      forgotPasswordStore.confirmPassword = text.trim();
                    },
                    message: forgotPasswordStore.error.confirmPassword,
                    error: forgotPasswordStore.error.confirmPassword != null,
                    color: Colors.black,
                    textColor: AppColor.colorAppBlack,
                    focusedColor: AppColor.colorApp,
                    node: cPasswordFocus,
                  ),
                ),
                MainClass.bH(30),

              ],)),
            Observer(
              builder: (ctx) => Container(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                width: double.infinity,
                child: Button(
                    text: 'Create new password',
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      if(forgotPasswordStore.hasErrors){
                        return;
                      }else if(passwordController.text.trim() != cPasswordController.text.trim()){
                        showCustomDialog(context, 'Notification', 'Password Mismatch');
                      } else{
                        Navigator.pushNamed(context, SuccessScreen.routeName);
                        // registerStore.submitEmail(api, context, (s) {}, (e){
                        //   showCustomDialog(context, "Notification", e);
                        // });
                      }
                    },
                    //loading: forgotPasswordStore.loading,
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
