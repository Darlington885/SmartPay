import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../classes/main_class.dart';

class SaveScreen extends StatefulWidget {
  const SaveScreen({Key key}) : super(key: key);
  static const routeName = '/save';

  @override
  State<SaveScreen> createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
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
