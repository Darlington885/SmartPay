
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay/classes/colors.dart';
import 'package:smartpay/classes/fonts.dart';
import 'package:smartpay/classes/main_class.dart';

class DillaScreen extends StatefulWidget {
  const DillaScreen({Key key}) : super(key: key);
  static const routeName = '/dilla';

  @override
  _DillaScreenState createState() => _DillaScreenState();
}

class _DillaScreenState extends State<DillaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/extras/dila.png", color: AppColor.colorAppLight,),
            MainClass.txtB6('Smartpay',16.sp),

          ],),
      ),
    );
  }
}