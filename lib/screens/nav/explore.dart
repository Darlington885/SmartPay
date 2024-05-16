import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay/classes/main_class.dart';

class Explore extends StatefulWidget {
  const Explore({Key key}) : super(key: key);
  static const routeName = '/explore';

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: AppColors.lightPurpleColor,
      body: Center(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/extras/dila.png", color: Colors.white,),
            MainClass.txtB6('Explore', 18.sp),
          ],),
      ),
    );
  }
}
