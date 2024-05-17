import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay/utils/navigators.dart';

import '../screens/auth/login.dart';
import 'colors.dart';
import 'fonts.dart';

class MainClass {
  static bH(sz) {
    double a1 = sz.toDouble();
    return SizedBox(height: a1);
  }

  static bW(sz) {
    double a1 = sz.toDouble();
    return SizedBox(width: a1);
  }

  static devH(ctx, sz) {
    double a1 = sz.toDouble();
    return MediaQuery.of(ctx).size.height / a1;
  }

  static devW(ctx, sz) {
    double a1 = sz.toDouble();
    return MediaQuery.of(ctx).size.width / a1;
  }

  static txtB6(txt, sz) {
    double a1 = sz.toDouble();
    return Text(
      txt,
      style: TextStyle(
          fontSize: a1,
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontFamily: AppFonts.sfPro),
      textAlign: TextAlign.center,
    );
  }

  static txtS6(txt, sz) {
    double a1 = sz.toDouble();
    return Text(
      txt,
      style: TextStyle(
          fontSize: a1,
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontFamily: AppFonts.sfPro),
      textAlign: TextAlign.start,
    );
  }

  static txtB4(txt, sz) {
    double a1 = sz.toDouble();
    return Text(
      txt,
      style: TextStyle(
          fontSize: a1,
          color: AppColor.colorAppGray3,
          fontWeight: FontWeight.w400,
          fontFamily: AppFonts.sfPro,
          letterSpacing: 0.3),
      textAlign: TextAlign.center,
    );
  }

  static txtS4(txt, sz) {
    double a1 = sz.toDouble();
    return Text(
      txt,
      style: TextStyle(
          fontSize: a1,
          color: AppColor.colorAppGray3,
          fontWeight: FontWeight.w400,
          fontFamily: AppFonts.sfPro,
          letterSpacing: 0.3),
      textAlign: TextAlign.start,
    );
  }
  static txtSG4(txt, sz) {
    double a1 = sz.toDouble();
    return Text(
      txt,
      style: TextStyle(
          fontSize: a1,
          color: AppColor.colorAppGray2,
          fontWeight: FontWeight.w400,
          fontFamily: AppFonts.sfPro,
      ),
      textAlign: TextAlign.start,
    );
  }

  static txtN5(txt, sz) {
    double a1 = sz.toDouble();
    return Text(txt,
        softWrap: true,
        style: TextStyle(
            color: AppColor.colorAppGray,
            fontSize: a1,
            fontFamily: AppFonts.sfPro,
            fontWeight: FontWeight.w500));
  }

  static txtGreen(txt, sz) {
    double a1 = sz.toDouble();
    return Text(
      txt,
      style: TextStyle(
          fontSize: a1,
          color: AppColor.colorApp,
          fontWeight: FontWeight.w600,
          fontFamily: AppFonts.sfPro,
          letterSpacing: 0.3),
      textAlign: TextAlign.start,
    );
  }

  static skip(t, onPressed,){
    return  InkWell(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.only(top: 60.h, right: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [MainClass.txtGreen(t, 18.sp)],) ),
    );
  }

  static padS(t, l) {
    double ver = t.toDouble();
    double hor = l.toDouble();
    return EdgeInsets.only(top: ver, bottom: ver, left: hor, right: hor);
  }

  static conDecor(r, c, b, col) {
    double r1 = r.toDouble();
    double b1 = b.toDouble();
    return BoxDecoration(
      color: col,
      borderRadius: BorderRadius.circular(r1),
      border: Border.all(
        color: c,
        width: b1,
      ),
    );
  }

  static appTop(ctx, {t}){
    return Row(children: [
      InkWell(
          onTap: (){
            Navigator.pop(ctx);
          },
          child: Image.asset('assets/images/extras/back.png', height: 40.h, width: 40.w,)),
      Expanded(child: Container()),
    ],);
  }

  static line(){
    return Container(
      margin: EdgeInsets.only(left: 8.w, right: 8.w),
      decoration: const BoxDecoration(
        color: AppColor.colorAppGray4,
      ),
      width: 138.w,
      height: 1.h,
    );
  }

  static socialIcon(ic, onPressed){
    return Expanded(
      child: InkWell(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColor.colorAppGray4),
          ),
          height: 56,
          width: 150,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(ic, height: 24.h, width: 24.w,),
          ),
        ),
      ),
    );
  }

  static logOutDialog(ctx){
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        child: Container(
          height: 154,
          width: 327,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Expanded(
                      child: Text(
                        "Are you sure you want to LOG OUT?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColor.colorAppLight,
                          fontFamily:  AppFonts.sfPro,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ],
                ),
               bH(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        navigateReplace(ctx, const LoginScreen());
                      },
                      child: Container(
                        height: 44, width: 89,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: AppColor.colorAppLight),
                            borderRadius: BorderRadius.circular(8.0)),
                        child: const Align(alignment: Alignment.center,
                          child: Text(
                            "Yes",
                            style: TextStyle(
                              color: Colors.red,
                              fontFamily:  AppFonts.sfPro,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    bW(20),
                    InkWell(
                      onTap: (){
                        Navigator.pop(ctx);
                      },
                      child: Container(
                        height: 44, width: 89,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: const Align(alignment: Alignment.center,
                          child: Text(
                            "No, Cancel",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily:  AppFonts.sfPro,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],)

              ],
            ),
          ),
        ));
  }

  static onboardingImage(ic, t, s){
    return  Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Image.asset(ic, fit: BoxFit.fitWidth,),
        ),

        Padding(
          padding: EdgeInsets.only(top: 450.h),
          child: Image.asset('assets/images/onboarding/fade.jpeg',fit: BoxFit.fitWidth,width: double.infinity,),
        ),
        Padding(
            padding: EdgeInsets.only(top: 500.h,),
            child:Center(
              child: Column(
                children: [
                 txtB6(t, 24.sp),
                  bH(20),
                  txtB4(s, 14.sp),
                ],),
            )
        ),
      ],);
  }

  static countryDetails(t, s, ic, chk) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(ic, height: 44, width: 44),
        bW(40),
        Row(
          children: [
            txtSG4(s, 16.sp),
            bW(10),
            txtB6(t, 16.sp)
          ],
        )

      ],
    );
  }

}