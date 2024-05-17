import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:smartpay/classes/colors.dart';
import 'package:smartpay/screens/Payment/about_us.dart';
import 'package:smartpay/screens/Payment/card_bank.dart';
import 'package:smartpay/screens/nav/dilla.dart';
import 'package:smartpay/screens/nav/explore.dart';
import 'package:smartpay/screens/payment/add_bank.dart';

import '../screens/menu_page/menu_page.dart';
import '../screens/nav/home.dart';
import '../screens/nav/save.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({Key key}) : super(key: key);
  static const routeName = '/navBarScreen';


  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  var currentItem = MenuItems.cardBank;
  // MenuItem currentItem = MenuItems.payment;
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      style: DrawerStyle.defaultStyle,
      menuBackgroundColor: AppColor.colorAppLight,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
      //(ZoomDrawer.isRTL() ? .45 : 0.65),
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.bounceIn,
      showShadow: true,
      mainScreenTapClose: true,
      menuScreenTapClose: true,
      moveMenuScreen: false,
      androidCloseOnBackTap: true,
      shadowLayer1Color: AppColor.layerColor,
      shadowLayer2Color: Colors.white,
      drawerShadowsBackgroundColor: Colors.white,
      angle: 0.0,
      mainScreen: getScreen(),
      menuScreen:

      Builder(builder: (context) {
        return MenuPage(
            currentItem: currentItem,
            onSelectedItem: (item){
              setState(() {
                currentItem = item;
              });
              ZoomDrawer.of(context).close();
            }
        );
      }
      ),

    );
  }
  Widget getScreen(){
    switch(currentItem) {
      case MenuItems.cardBank:
        return const HomeScreen();
      case MenuItems.addBank:
        return const AddBank();
      case MenuItems.aboutUs:
        return const AboutUs();
    }
  }
}
