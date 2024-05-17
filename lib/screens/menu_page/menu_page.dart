
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay/classes/fonts.dart';
import 'package:smartpay/classes/response_data.dart';

import '../../classes/colors.dart';
import '../../classes/main_class.dart';
import '../../utils/alert_dailog.dart';


class MenuItem {
  final String title;
  final String icon;

  const MenuItem( this.title, this.icon);
}

class MenuItems {
  static const cardBank = MenuItem("Card and Bank",  "assets/images/extras/save.png");
  static const addBank = MenuItem("Add Bank",  "assets/images/extras/explore.png");
  static const aboutUs = MenuItem("About Us",  "assets/images/extras/dila.png");




  static const all = <MenuItem>[cardBank, addBank, aboutUs,];
}

class MenuPage extends StatelessWidget {
  final MenuItem currentItem;
  final ValueChanged<MenuItem> onSelectedItem;

  const MenuPage({Key key, this.currentItem, this.onSelectedItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData.dark(),
        child: Scaffold(
          backgroundColor: AppColor.colorAppLight,
          body: ListView(
            padding: EdgeInsets.zero,
            children: [

             Container(
               padding: const EdgeInsets.only(left: 20, top: 40),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [

                   const Padding(
                       padding: EdgeInsets.all(2.0),
                       child:
                       CircleAvatar(
                           radius: 30,
                           backgroundColor: Colors.transparent,
                           backgroundImage: AssetImage(
                               'assets/images/extras/picture.png'
                           ))
                   ),
                 MainClass.txtS6(ResponseData.loginResponse.data.user.fullName, 17.sp),


                   MainClass.bH(10),
               ],),
             ),
             MainClass.bH(10),
              ...MenuItems.all.map(buildMenuItem).toList(),

              InkWell(
                onTap: (){
                  openDialog(
                      MainClass.logOutDialog(context),
                      context,
                      barrierDismissible: false
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 5, left: 15, top: 15),
                  child: Row(children: [
                    Image.asset("assets/images/extras/logout.png", height: 18, width: 18,),
                    MainClass.bW(15),
                    Text("Log Out", style: TextStyle(color: Colors.white,)),
                  ],),
                ),
              ),
              MainClass.bH(20),
            ],
          ),
        ));
  }

  Widget buildMenuItem(MenuItem item) {
    return ListTileTheme(
      selectedTileColor: Colors.white,

      child: ListTile(
        style: ListTileStyle.drawer,
        selectedColor: Colors.black,
        selectedTileColor: Colors.white.withOpacity(0.5),
        selected: currentItem == item,
        minLeadingWidth: 10,
        //leading: Icon(item.icon),
        leading: Image.asset(item.icon, height: 18, width: 18,),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(item.title),
        ),
        onTap: () {
          onSelectedItem(item);
        },
      ),
    );
  }
}
