import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay/screens/forgot_password/verify_identity.dart';
import 'package:smartpay/store/forgot_password_store/forgot_password_store.dart';

import '../../classes/colors.dart';
import '../../classes/main_class.dart';
import '../../utils/alert_dailog.dart';
import '../../widgets/button.dart';
import '../../widgets/input_field.dart';
import '../register/registration_screen.dart';

var forgotPasswordStore = ForgotPasswordStore();
class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key key}) : super(key: key);
  static const routeName = '/forgotPassword';

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  TextEditingController emailController = TextEditingController();

  FocusNode emailFocus = FocusNode();

  @override
  void initState() {
    forgotPasswordStore.setupEmailValidations();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
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
              child: Image.asset('assets/images/extras/lock.png', width: 90.w, height: 76.h,),
            ),
            MainClass.bH(20),
            Expanded(child:
            ListView(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              children: [
              MainClass.txtS6('Password Recovery', 24.sp),
              MainClass.bH(10),
              MainClass.txtS4('Enter your registered email below to receive\npassword instructions', 16.sp),
              MainClass.bH(30),
              Observer(
                builder: (ctx) => InputField(
                  controller: emailController,
                  type: TextInputType.emailAddress,
                  hint: "Email",
                  filled: true,
                  onChanged: (text) {
                    forgotPasswordStore.email = text.trim();
                    if (text.contains("@")) {
                      setState(() {
                        forgotPasswordStore.isActive = true;
                      });
                    } else {
                      setState(() {
                        forgotPasswordStore.isActive = false;
                      });
                    }
                  },
                  message: forgotPasswordStore.error.email,
                  error: forgotPasswordStore.error.email != null,
                  color: Colors.black,
                  textColor: Colors.black,
                  focusedColor: AppColor.colorAppLight,
                  node: emailFocus,
                ),
              ),
            ],)),
            Observer(
              builder: (ctx) => Container(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                width: double.infinity,
                child: Button(
                    text: 'Send me email',
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      if(forgotPasswordStore.hasErrorsEmail){
                        return;
                      }else{
                        Navigator.pushNamed(context, VerifyIdentity.routeName);
                        // registerStore.submitEmail(api, context, (s) {}, (e){
                        //   showCustomDialog(context, "Notification", e);
                        // });
                      }
                    },
                    loading: forgotPasswordStore.loading,
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
