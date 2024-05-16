
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';

import '../../classes/colors.dart';
import '../../classes/fonts.dart';
import '../../classes/main_class.dart';
import '../../store/register_store/register_store.dart';
import '../../utils/alert_dailog.dart';
import '../../widgets/button.dart';
import '../../widgets/input_field.dart';
import '../services/api_client.dart';


var registerStore = RegisterStore();
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key key}) : super(key: key);
  static const routeName = '/register';

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  TextEditingController fNameController = TextEditingController();
  TextEditingController uNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  FocusNode fNameFocus = FocusNode();
  FocusNode lNameFocus = FocusNode();
  FocusNode uNameFocus = FocusNode();
  FocusNode phoneFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  bool chk1 = false;

  String phoneNumber;
  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');

  @override
  void initState() {
    registerStore.setupValidations();
    super.initState();
  }

  @override
  void dispose() {
    fNameController.dispose();
    uNameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    registerStore.dispose();
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
            RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                text: 'Tell us a bit about\n',
                style: TextStyle(
                    color: AppColor.colorAppBlack,
                    fontSize: 24.0.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: AppFonts.sfPro,
                    fontStyle: FontStyle.normal),
                children: <TextSpan>[
                  TextSpan(
                      text: 'yourself',

                      style:TextStyle(
                          color: AppColor.colorApp,
                          fontSize: 24.0.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: AppFonts.sfPro,
                          fontStyle: FontStyle.normal)),
                ],
              ),
            ),

            MainClass.bH(30),
            Observer(
              builder: (ctx) => InputField(
                controller: fNameController,
                type: TextInputType.text,
                hint: "Full name",
                filled: false,
                onChanged: (text) {
                  registerStore.fullName = text.trim();
                },
                message: registerStore.error.fullName,
                error: registerStore.error.fullName != null,
                color: Colors.black,
                textColor: Colors.black,
                focusedColor: AppColor.colorAppLight,
                node: fNameFocus,
              ),
            ),
            Observer(
              builder: (ctx) => InputField(
                controller: uNameController,
                type: TextInputType.text,
                hint: "Username",
                filled: false,
                onChanged: (text) {
                  registerStore.username = text.trim();
                },
                message: registerStore.error.username,
                error: registerStore.error.username != null,
                color: Colors.black,
                textColor: Colors.black,
                focusedColor: AppColor.colorAppLight,
                node: uNameFocus,
              ),
            ),
            Observer(
              builder: (ctx) => InputField(
                controller: passwordController,
                type: TextInputType.text,
                hint: "Password",
                filled: true,
                obscureText: registerStore.passwordVisible,
                suffixIcon: GestureDetector(
                    onTap: () {
                      registerStore.passwordVisible = !registerStore.passwordVisible;
                    },
                    child: IconButton(
                        icon: registerStore.passwordVisible
                            ?  Image.asset('assets/images/extras/eye_off.png', height: 24.h, width: 24.w,)
                            :  const Icon(Icons.visibility, color: AppColor.colorAppGray2,)
                    )),
                onChanged: (text) {
                  registerStore.password = text.trim();
                },
                message: registerStore.error.password,
                error: registerStore.error.password != null,
                color: Colors.black,
                textColor: Colors.black,
                focusedColor: AppColor.colorAppLight,
                node: passwordFocus,
              ),
            ),

            MainClass.bH(30),
            Observer(
              builder: (ctx) => SizedBox(
                width: double.infinity,
                child: Button(
                    text: 'Continue',
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      if(registerStore.hasErrors){
                        return;
                      }else{
                        // registerStore.submit(api, context, (s) {}, (e){
                        //   showCustomDialog(context, "Notification", e);
                        // });
                      }
                    },
                    loading: registerStore.loading,
                    loaderColor: Colors.white,
                    textColor: Colors.white,
                    color: Colors.black
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }
}
