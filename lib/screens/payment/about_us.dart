import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:smartpay/classes/main_class.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key key}) : super(key: key);
  static const routeName = '/about';

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 50.h),
        children: [
          Row(
            children: [
              InkWell(
                  onTap: (){
                    ZoomDrawer.of(context).toggle();
                  },
                  child: Image.asset('assets/images/extras/back.png', height: 40.h, width: 40.w,)),
              MainClass.bW(50),
              MainClass.txtS6('About Us', 24.sp),
            ],
          )
        ],
      ),
    );
  }
}
