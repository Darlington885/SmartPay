
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_to_background/move_to_background.dart';
import 'package:smartpay/classes/colors.dart';
import 'package:smartpay/classes/main_class.dart';
import 'package:smartpay/main.dart';
import 'package:smartpay/screens/services/api_client.dart';
import 'package:smartpay/store/home_store/home_store.dart';


import '../../classes/fonts.dart';
import '../../classes/nav_bar.dart';
import '../nav/dilla.dart';
import '../nav/explore.dart';
import '../nav/home.dart';
import '../nav/save.dart';

class DashBoardScreen extends StatefulWidget {
  static const routeName = '/dashboard';

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashBoardScreen> {

  int _pageIndex = 0;

  final pages = [
    const NavBarScreen(),
    const SaveScreen(),
    const Explore(),
    const DillaScreen(),
  ];

  HomeStore homeStore = HomeStore();

  PageController _pageController;

  ApiClient apiClient = ApiClient(authStore);

  @override
  void initState() {
    super.initState();
    homeStore.fetchUserSecret(context, apiClient);
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    // authStore.persistAuth();
    return WillPopScope(
      onWillPop: () async{
        MoveToBackground.moveTaskToBack();
        return false;
      },
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: buildMyNavBar(context),

        body: pages[_pageIndex],
      ),
    );
  }

  bottomItem({int index, String title, String icon}) {
    if (index == _pageIndex) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Image.asset(
            icon,
            height: 27,
            width: 27,
            color: Colors.white,
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              height: title == "Loan" ? 26 : 23,
              width: title == "Loan" ? 26 : 23,
              color: AppColor.colorAppGray,
            ),
            SizedBox(height: title == "Loan" ? 3 : 5),
            Text(
              title,
              style: const TextStyle(
                  fontFamily: AppFonts.sfPro,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  fontStyle: FontStyle.normal,
                  color: AppColor.colorAppGray),
            )
          ],
        ),
      );
    }
  }

  void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    this._pageController.jumpToPage(index);
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 84,
      width: 375,
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(width: 0, color: Colors.white),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            enableFeedback: false,
            onTap: () {
              setState(() {
                _pageIndex = 0;
              });
            },
            child: homeItems(
                icon: "assets/images/extras/dila.png",
                title: "Home",
                index: 0,
                iconColor: AppColor.colorAppGray),
          ),
          InkWell(
              enableFeedback: false,
              onTap: () {
                setState(() {
                  _pageIndex = 1;
                });
              },
              child: homeItems(
                  icon: "assets/images/extras/save.png", title: "Save", index: 1)),
          InkWell(
            enableFeedback: false,
            onTap: () {
              setState(() {
                _pageIndex = 2;
              });
            },
            child: homeItems(
                icon: "assets/images/extras/explore.png", title: "Explore", index: 2),
          ),
          InkWell(
            enableFeedback: false,
            onTap: () {
              setState(() {
                _pageIndex = 3;
              });
            },
            child: homeItems(
                icon: "assets/images/extras/dila.png", title: "Learn", index: 3),
          ),

        ],
      ),
    );
  }

  Widget homeItems({int index, String title, String icon, Color iconColor}) {
    return Column(
      children: [
        SizedBox(
          height: 5,
        ),
        _pageIndex == index
            ? Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Image.asset(
            icon,
            color: AppColor.colorAppBlack,
            width: 25, height: 20,
          ),
        )
            : Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Image.asset(
            icon,
            color: iconColor,
            width: 25,
            height: 20,
          ),
        ),
        _pageIndex == index
            ? Padding(
          padding: const EdgeInsets.only(top: 6.86),
          child: MainClass.txtS4(title, 14.sp),

        )
            : Padding(
          padding: const EdgeInsets.only(top: 6.86),
          child: Text(
            title,
            style: TextStyle(
                fontFamily: AppFonts.sfPro,
                fontWeight: FontWeight.w400,
                fontSize: 14,
                fontStyle: FontStyle.normal,
                color: AppColor.colorAppGray2),
          ),
        )
      ],
    );
  }
}