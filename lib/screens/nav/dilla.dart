
import 'package:flutter/material.dart';
import 'package:smartpay/classes/fonts.dart';

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
      //backgroundColor: AppColors.lightPurpleColor,
      body: Center(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/dila.png", color: Colors.white,),
            Text("Dilla",
              //textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: AppFonts.sfPro,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  fontStyle: FontStyle.normal,
                  color: Colors.white
              ),
            ),
          ],),
      ),
    );
  }
}