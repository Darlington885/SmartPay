import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay/screens/auth/login.dart';
import 'package:smartpay/screens/register/registration_screen.dart';
import 'package:smartpay/widgets/button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'classes/colors.dart';
import 'classes/main_class.dart';

class Onboard extends StatefulWidget {
  const Onboard({Key key}) : super(key: key);
  static const routeName = '/Onboard';

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {

  int currentPage = 0;

  Timer timer;

  PageController pageController = PageController(initialPage: 0,);

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   SystemChrome.setSystemUIOverlayStyle(overlayStyle);
    // });
    timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (currentPage < 3) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 1500),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  String t1 = 'Your finance work starts here. Our here to help\nyou track and deal with speeding up your\ntransactions.',
         t2 = 'Get easy to pay all your bills with just a few\nsteps. Paying your bills become fast and\nefficient.' ;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        //backgroundColor: Colors.white,
        body: Stack(
          children: [

            PageView(
              controller: pageController,
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Image.asset('assets/images/onboarding/onboard1.jpeg', fit: BoxFit.fitWidth,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 450),
                      child: Image.asset('assets/images/onboarding/fade.jpeg',fit: BoxFit.fitWidth,width: double.infinity,),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 500.h,left: 80.w),
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            MainClass.txtB6('The fastest transaction\nprocess only here', 24.sp),
                            MainClass.bH(20),
                            MainClass.txtB4(t2, 14.sp),
                          ],)
                    ),


                  ],
                ),
               Stack(
                 children: [
                 Padding(
               padding: const EdgeInsets.only(top: 100),
                   child: Image.asset('assets/images/onboarding/onboard2.jpeg', fit: BoxFit.fitWidth,),
                 ),

                 Padding(
                   padding: EdgeInsets.only(top: 450.h),
                   child: Image.asset('assets/images/onboarding/fade.jpeg',fit: BoxFit.fitWidth,width: double.infinity,),
                 ),
                 Padding(
                   padding: EdgeInsets.only(top: 500.h,left: 80.w),
                   child:Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                     MainClass.txtB6('Finance app the safest\nand most trusted', 24.sp),
                     MainClass.bH(20),
                     MainClass.txtB4(t1, 14.sp),
                   ],)
                 ),
               ],)
              ],
            ),

            Padding(
              padding: EdgeInsets.only(top: 500.h, left: 20.w, right: 20.w),
              child: Center(
                child: SmoothPageIndicator(
                    effect: const ExpandingDotsEffect(
                        dotWidth: 8,
                        dotHeight: 8,
                        spacing: 4,
                        dotColor: AppColor.colorAppGray4,
                        activeDotColor: Colors.black),
                    controller: pageController,
                    count: 2),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 690.h, left: 20.w, right: 20.w),
              width: double.infinity,
              child: Button(
                  text: 'Get Started',
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    Navigator.pushNamed(context, LoginScreen.routeName);
                    //Navigator.pushNamed(context, RegistrationScreen.routeName);
                  },
                  //loading: registerStore.loading,
                  loaderColor: Colors.white,
                  textColor: Colors.white,
                  color: Colors.black
              ),
            ),

          ],
        ),
      ),
    );
  }
}
