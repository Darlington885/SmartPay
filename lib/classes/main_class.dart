import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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



  static appTop(ctx){
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

}