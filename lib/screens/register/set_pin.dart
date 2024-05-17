import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:smartpay/classes/colors.dart';
import 'package:smartpay/classes/fonts.dart';
import 'package:smartpay/classes/main_class.dart';
import 'package:smartpay/screens/forgot_password/success_screen.dart';
import 'package:smartpay/screens/register/registration_screen.dart';
import 'package:smartpay/screens/services/api_client.dart';
import 'package:smartpay/utils/alert_dailog.dart';
import 'package:smartpay/widgets/button.dart';

class SetPin extends StatefulWidget {
  final double buttonSize;
  final Color buttonColor;
  final Color iconColor;
  final TextEditingController controller;
  final Function delete;
  final Function onSubmit;
  const SetPin({Key key,
    this.buttonSize = 70,
    this.buttonColor = Colors.white,
    this.iconColor = Colors.amber,
    this.delete,
    this.onSubmit,
    this.controller,
  }) : super(key: key);
  static const routeName = '/setPin';

  @override
  State<SetPin> createState() => _SetPinState();
}

class _SetPinState extends State<SetPin> {
  bool confirmButtonActive = false;
  bool hasError = false;
  bool isLoading = false;

  String errorMessage;
  TextEditingController pinController = TextEditingController();

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final api = Provider.of<ApiClient>(context);
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: ListView(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 50.h),
          children: [
            MainClass.appTop(context),
            MainClass.bH(20),
            MainClass.txtS6('Set your PIN code', 24.sp),
            MainClass.bH(10),
            MainClass.txtS4('We use state-of-the-art security measures to\nprotect your information at all times', 16.sp),
            MainClass.bH(30),
            Observer(
              builder:(_) => Row(
                children: [
                  Expanded(
                    child: PinCodeTextField(
                      showCursor: false,
                      cursorHeight: 20,
                      autoFocus: false,
                      textStyle: TextStyle(
                        color: AppColor.colorAppBlack,
                        fontFamily: AppFonts.sfPro,
                        fontWeight: FontWeight.w600,
                        fontSize: 32.sp,
                      ),
                      obscuringCharacter:'●',
                      pastedTextStyle: TextStyle(
                        color: AppColor.colorAppBlack,
                        fontFamily: AppFonts.sfPro,
                        fontWeight: FontWeight.w600,
                        fontSize: 32.sp,
                      ),
                      pinTheme: PinTheme(
                          fieldOuterPadding: const EdgeInsets.only(left: 1, right: 1),
                          borderWidth: 1.0,
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(8),
                          fieldHeight: 63.h,
                          fieldWidth: 56.w,
                          //fieldWidth: 43.w,
                          inactiveColor: AppColor.colorAppGray,
                          inactiveFillColor: AppColor.colorAppGray,
                          selectedColor: AppColor.colorApp,
                          selectedFillColor: Colors.white,
                          activeColor: AppColor.colorApp,
                          activeFillColor: Colors.white,
                          errorBorderColor: Colors.red
                      ),
                      appContext: context,
                      length: 5,
                      animationDuration: const Duration(microseconds: 300),
                      enableActiveFill: true,
                      enablePinAutofill: true,
                      cursorColor: AppColor.colorApp,
                      scrollPadding: const EdgeInsets.all(0),
                      controller: pinController,
                      obscureText: true,
                      keyboardType: TextInputType.none,
                      onCompleted: (v){
                        registerStore.otp = v;
                        if(pinController.text.length == 5) {
                          setState(() {registerStore.isActive2=true;});
                        } else {
                          setState(() {registerStore.isActive2=false;});
                        }
                        if (v.length != 5) {
                          setState(() {
                            hasError = true;
                          });
                        }
                      },
                      onChanged: (value){
                        if (value.length != 5) {
                          setState(() {
                            hasError = false;
                          });
                        }
                        if(pinController.text.length == 5) {
                          setState(() {registerStore.isActive2=true;});
                        } else {
                          setState(() {registerStore.isActive2=false;});
                        }
                      },beforeTextPaste: (text){
                      return true;
                    },),
                  ),
                ],
              ),
            ),
            MainClass.bH(80),
            Observer(
              builder: (ctx) => SizedBox(
                width: double.infinity,
                child: Button(
                    text: 'Create Pin',
                    onPressed:registerStore.isActive2? () {
                      FocusScope.of(context).unfocus();
                      if(registerStore.hasOtpError){
                        return;
                      }else{
                        Navigator.pushNamed(context, SuccessScreen.routeName);
                      }
                    }:null,
                    loading: registerStore.loading,
                    loaderColor: Colors.white,
                    textColor: Colors.white,
                    color: registerStore.isActive2?AppColor.colorAppBlack:
                    AppColor.colorAppBlack.withOpacity(0.7)
                ),
              ),
            ),


            MainClass.bH(50),
            NumPad(
              buttonSize: 57,
              // buttonColor: Colors.purple,
              // iconColor: Colors.deepOrange,
              controller: pinController,
              delete: () {
                pinController.text = pinController.text
                    .substring(0, pinController.text.length - 1);
              },
            ),


          ],
        ),
      ),
    );
  }
}

class NumberButton extends StatelessWidget {
  final int number;
  final double size;
  final Color color;
  final TextEditingController controller;
  final Icon icon;


  const NumberButton({
    Key key,
    this.number,
    this.size,
    this.color,
    this.controller,
    this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      //RawMaterialButton
      child: RawMaterialButton(
        //style: ElevatedButton.styleFrom(
        // shadowColor: color,
        //  shape: RoundedRectangleBorder(
        //    borderRadius: BorderRadius.circular(size / 2),
        //  ),
        //),
        onPressed: () {
          controller.text += number.toString();
        },
        child: Center(
          child: Text(
            number.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.w500, color: AppColor.colorAppBlack, fontSize: 20, ),
          ),
        ),
      ),
    );
  }
}

class NumPad extends StatelessWidget {
  final double buttonSize;
  final Color buttonColor;
  final Color iconColor;
  final TextEditingController controller;
  final Function delete;
  final Function onSubmit;
  final IconData icon;

  const NumPad({
    Key key,
    this.buttonSize = 100,
    this.buttonColor = Colors.white,
    this.iconColor = AppColor.colorAppBlack,
    this.delete,
    this.onSubmit,
    this.controller,
    this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        children: [
          MainClass.bH(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // implement the number keys (from 0 to 9) with the NumberButton widget
            // the NumberButton widget is defined in the bottom of this file
            children: [
              NumberButton(
                number: 1,
                size: buttonSize,
                color: buttonColor,
                controller: controller,
              ),

              NumberButton(
                number: 2,
                size: buttonSize,
                color: buttonColor,
                controller: controller,
              ),

              NumberButton(
                number: 3,
                size: buttonSize,
                color: buttonColor,
                controller: controller,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberButton(
                number: 4,
                size: buttonSize,
                color: buttonColor,
                controller: controller,
              ),

              NumberButton(
                number: 5,
                size: buttonSize,
                color: buttonColor,
                controller: controller,
              ),

              NumberButton(
                number: 6,
                size: buttonSize,
                color: buttonColor,
                controller: controller,
              ),
            ],
          ),
          //const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberButton(
                number: 7,
                size: buttonSize,
                color: buttonColor,
                controller: controller,
              ),

              NumberButton(
                number: 8,
                size: buttonSize,
                color: buttonColor,
                controller: controller,
              ),

              NumberButton(
                number: 9,
                size: buttonSize,
                color: buttonColor,
                controller: controller,
              ),
            ],
          ),
          // const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //this button is used to delete the last number
              IconButton(
                onPressed: () {
                  var number = ".";
                  controller.text += number.toString();
                },
                icon: Icon(Icons.circle, size: 5.0,),
                iconSize: buttonSize,
              ),



              Padding(
                padding: const EdgeInsets.only(right: 25.0, left: 10),
                child: NumberButton(
                  number: 0,
                  size: buttonSize,
                  color: buttonColor,
                  controller: controller,
                ),
              ),


              // this button is used to submit the entered value
              Padding(
                  padding: const EdgeInsets.only(right: 20, left: 5),
                  child: InkWell(
                      onTap: () => delete(),
                      child: Image.asset('assets/images/extras/backspace.png', height: 24.sp, width:24.sp ,))
              ),
            ],
          ),
        ],
      ),
    );
  }
}
