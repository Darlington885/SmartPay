
import 'package:flutter/material.dart';
import '../classes/colors.dart';
import '../classes/fonts.dart';
import '../classes/main_class.dart';
import 'navigators.dart';





openDialog(Widget widget, BuildContext context, {barrierDismissible = false,}) {
  showDialog(
    useRootNavigator: false,
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return widget;
      });
}


/*class CustomPopupDialog extends StatefulWidget {


  final String title, description, buttonText;
  final String img;
  final VoidCallback onButtonPressed;

  const CustomPopupDialog({this.title, this.description, this.buttonText, this.img, this.onButtonPressed});


  @override
  _CustomPopupDialogState createState() => _CustomPopupDialogState();
}

class _CustomPopupDialogState extends State<CustomPopupDialog> {
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  static const double padding = 20;
  static const double avatarRadius = 45;

  @override
  Widget build(BuildContext context) {


    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 350,
          width: 320,

          padding: EdgeInsets.only(left: padding,top: 5
              + padding, right: 10,bottom: padding
          ),
          margin: EdgeInsets.only(top: avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(padding),
              boxShadow: [
                BoxShadow(color: Colors.transparent,offset: Offset(0,10),
                    blurRadius: 10
                ),
              ]
          ),

          child: PageView(
            controller: pageController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              SingleChildScrollView(
                child: Container(

                  padding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                              onTap:(){
                                popView(context);

                              },
                              child: Icon(Icons.cancel, color: AppColor.primaryColor2, size: 30,)),
                          // Image.asset(assetImageCancel,color: AppColor.blueColor.withOpacity(0.6), height: 32, width: 32)),
                          SizedBox(
                            width: 5,
                          ),

                        ],
                      ),

                      SizedBox(height: 10.0),
                      Container(
                        decoration: BoxDecoration(
                            color: AppColor.greenColor,
                            borderRadius: BorderRadius.all(Radius.circular(50))
                        ),
                        child: Icon(Icons.check, color:AppColor.whiteColor, size: 30,),
                        height: 55,
                        width: 55,
                      ),
                      // Image.asset(
                      //   widget.img,
                      //   width: 74,
                      //   height: 74,
                      //   // color:Colors.black,
                      //   // colorBlendMode: BlendMode.color,
                      // ),
                      SizedBox(height: 10.0),
                      Text(
                        widget.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColor.textColor,
                          fontFamily: AppFonts.Lato,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.description,
                              style: TextStyle(
                                color: AppColor.textColor,
                                fontWeight: FontWeight.w400,
                                fontFamily: AppFonts.Lato,
                                fontSize: 14.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          InkWell(
                            onTap: widget.onButtonPressed,
                            child: Container(
                              width: 140,
                              decoration: BoxDecoration(
                                color: AppColor.primaryColor2,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Center(
                                  child: Text(
                                    widget.buttonText,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: AppFonts.Lato,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // Button(
                          //   text: 'See whats new',
                          //   color: AppColor.primaryColor,
                          //   textColor: Colors.white,
                          //   onPressed: () {
                          //     Navigator.of(context).pop();
                          //   },
                          // ),
                          //
                          // Button(
                          //   text: 'Proceed to Dashboard',
                          //   color: AppColor.primaryColor,
                          //   textColor: Colors.white,
                          //   onPressed: () {
                          //     Navigator.of(context).pop();
                          //   },
                          // ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          // InkWell(
                          //   onTap: () {
                          //
                          //   },
                          //   child: Text(
                          //     'Proceed to Dashboard',
                          //     textAlign: TextAlign.center,
                          //     style: TextStyle(
                          //         color: secondaryColor,
                          //         fontFamily: AppFonts.Arial,
                          //         fontWeight: FontWeight.w700,
                          //         fontSize: 18.0,
                          //         decoration: TextDecoration.underline),
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 20.0,
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        // Positioned(
        //   // top: 3,
        //   left: padding,
        //   right: padding,
        //   child: CircleAvatar(
        //     backgroundColor: Colors.transparent,
        //     radius: avatarRadius,
        //     child: ClipRRect(
        //         borderRadius: BorderRadius.all(Radius.circular(avatarRadius)),
        //         child: Image.asset('assets/images/confetti.png',)
        //       // Image.asset(widget.img)
        //     ),
        //   ),
        // ),
      ],
    );
  }
}*/


void showCustomDialog(BuildContext context, String title,  String message) {
  showDialog(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext cxt) {
      return Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(14),
              bottomRight: Radius.circular(14),
            ),
            child: Material(
              color: Colors.white,
              shape: Border(
                left: BorderSide(
                  width: 4,
                  color: AppColor.colorApp.withOpacity(0.2),
                ),

              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            color: Colors.black,
                            fontFamily: AppFonts.sfPro,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                          ),
                        ),

                        Spacer(),

                        InkWell(
                            onTap:(){
                              Navigator.of(cxt).pop();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColor.colorApp.withOpacity(0.3)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Icon(Icons.close, size: 20, color: Colors.black.withOpacity(0.5) ),
                              ),
                            )
                          //Image.asset(assetImageCancel, height: 32, width: 32,),
                        ),
                       MainClass.bW(5),
                      ],
                    ),
                    MainClass.bH(8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            message ?? "",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontWeight: FontWeight.w700,
                              fontFamily: AppFonts.sfPro,
                              fontSize: 12.0,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
