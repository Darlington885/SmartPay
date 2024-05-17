import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay/screens/auth/login.dart';
import 'package:smartpay/screens/register/registration_screen.dart';
import 'package:smartpay/screens/register/verify_otp.dart';
import 'package:smartpay/widgets/button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'classes/colors.dart';
import 'classes/main_class.dart';

class Onboard extends StatefulWidget {
  const Onboard({Key key}) : super(key: key);
  static const routeName = '/onboard';

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
        body: Stack(
          children: [

            PageView(
              controller: pageController,
              children: [
              MainClass.onboardingImage('assets/images/onboarding/onboard1.jpeg', 'The fastest transaction\nprocess only here', t2),
              MainClass.onboardingImage('assets/images/onboarding/onboard2.jpeg', 'Finance app the safest\nand most trusted', t1),
              ],
            ),
            MainClass.skip('Skip',(){Navigator.pushNamed(context, LoginScreen.routeName);},),
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
                  },
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
