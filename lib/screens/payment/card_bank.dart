import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:smartpay/classes/main_class.dart';

class CardBank extends StatefulWidget {
  const CardBank({Key key}) : super(key: key);
  static const routeName = '/cardBank';

  @override
  State<CardBank> createState() => _CardBankState();
}

class _CardBankState extends State<CardBank> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: 50.h, left: 20.w, right:20.h),
        children: [
          Row(
            children: [
              InkWell(
                  onTap: (){
                    ZoomDrawer.of(context).toggle();
                  },
                  child: Image.asset('assets/images/extras/back.png', height: 40.h, width: 40.w,)),
              MainClass.bW(50),
              MainClass.txtS6('Card and Bank', 24.sp),
            ],
          )

      ],),
    );
  }
}
