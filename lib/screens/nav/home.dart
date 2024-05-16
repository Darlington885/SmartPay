import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_to_background/move_to_background.dart';
import 'package:smartpay/classes/main_class.dart';

import '../../classes/colors.dart';
import '../../classes/fonts.dart';
import '../../classes/response_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        MoveToBackground.moveTaskToBack();
        return false;
      },
      child: Scaffold(
        backgroundColor: AppColor.colorAppBlack,
        body: Column(children: [
          Container(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 50.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  MainClass.txtB6('Hello ${ResponseData.loginResponse.data.user.fullName}!', 32.sp),
                  const Spacer(),
                  //ResponseData.loginResponse.data.user.profilePhotoUrl == null || ResponseData.loginResponse.data.user.profilePhotoUrl == ''?
                  Image.asset('assets/images/extras/profile.png', height: 40.h, width: 40.w,)
                ],),
              ],
            ),
          ),
          Expanded(child: RefreshIndicator(
            onRefresh: ()async{
          /*    await api.fetchUserDetails(context,).then(
                    (res) {
                  ResponseData.userUpdateResponse = res;
                  setState(() {

                  });
                  return res;
                },
              );*/
            },
            color: AppColor.colorApp,
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            child: ListView(
              padding: EdgeInsets.only(left: 20.w, right: 20.w,top: 20.h, bottom: 80.h),
              children: [
                MainClass.txtB6(ResponseData.loginResponse.data.user.fullName, 24.sp),
                MainClass.bH(20),

                MainClass.txtB6('This is your secret:', 16.sp),
                MainClass.txtB6('This is your secret:', 16.sp),





              ],),
          ))
        ],),
      ),
    );
  }
}
