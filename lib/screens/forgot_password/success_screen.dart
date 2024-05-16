import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay/classes/main_class.dart';
import 'package:smartpay/classes/response_data.dart';
import 'package:smartpay/screens/auth/login.dart';
import 'package:smartpay/utils/navigators.dart';

import '../../widgets/button.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key key}) : super(key: key);
  static const routeName = '/successScreen';

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/extras/success.png', height: 134.h, width: 140.w,),
            MainClass.txtB6('Congratulations', 24.sp),
            MainClass.bH(15),
            MainClass.txtB4('You’ve completed the onboarding,\nyou can start using', 16.sp),
            MainClass.bH(30),
            Observer(
              builder: (ctx) => Container(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                width: double.infinity,
                child: Button(
                    text: 'Get Started',
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      navigateReplace(context, const LoginScreen());
                    },
                    //loading: store.loading,
                    loaderColor: Colors.white,
                    textColor: Colors.white,
                    color: Colors.black
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
