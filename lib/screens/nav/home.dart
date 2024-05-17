import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:mobx/mobx.dart';
import 'package:move_to_background/move_to_background.dart';
import 'package:smartpay/classes/main_class.dart';
import 'package:smartpay/main.dart';
import 'package:smartpay/models/dashboard_response.dart';

import 'package:smartpay/screens/services/api_client.dart';
import 'package:smartpay/store/home_store/home_store.dart';
import 'package:smartpay/utils/greeting.dart';
import 'package:smartpay/widgets/loader.dart';


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

  ApiClient apiClient = ApiClient(authStore);

  HomeStore homeStore = HomeStore();

  @override
  void initState() {
    super.initState();
    homeStore.fetchUserSecret(context, apiClient);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        MoveToBackground.moveTaskToBack();
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          Container(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 50.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Image.asset('assets/images/extras/picture.png', height: 40.h, width: 40.w,),
                  title:  MainClass.txtS6('Good ${greeting()}', 16.sp),
                  subtitle:  MainClass.txtS6(ResponseData.loginResponse.data.user.fullName, 18.sp),

                  trailing:  InkWell(
                      onTap: ()=> ZoomDrawer.of(context).toggle(),
                      child: Image.asset('assets/images/extras/menu.png', height: 24.h, width: 24.w,)),
                  contentPadding: const EdgeInsets.only(left: 0, right: 0),
                ),
              ],
            ),
          ),
          Expanded(child:
          RefreshIndicator(
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MainClass.txtB6('This is your secret:', 16.sp),
                MainClass.bH(20),
                SizedBox(
                  height: 20,
                  child: Observer(
                    builder: (_) {
                      final userStatus = homeStore.dashboardResponse.status;
                      switch (userStatus) {
                        case FutureStatus.pending:
                          return loaderOne;
                        case FutureStatus.rejected:
                          return MainClass.txtB6('', 14.sp);
                        case FutureStatus.fulfilled:
                          DashboardResponse liveData = homeStore.dashboardResponse.result;
                          print(liveData.toJson());
                          return liveData.data == null || liveData.data == ''
                              ?  MainClass.txtB6('You don\'t have any secret.', 14.sp)
                              : FittedBox(
                            child: MainClass.txtS6(liveData.data.secret, 18.sp),
                          );

                        default:
                          return const Center();
                      }
                    },
                  ),
                ),

              ],),
          ))
        ],),
      ),
    );
  }
}
