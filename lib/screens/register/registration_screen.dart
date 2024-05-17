
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:smartpay/classes/response_data.dart';
import 'package:smartpay/screens/services/auth_storage.dart';

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
  final String email;
  const RegistrationScreen({Key key, this.email}) : super(key: key);
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

  String devId = '', devName = '', devOS = '';

  bool chk1 = false;

  String phoneNumber;
  String initialCountry = 'NG';
  //PhoneNumber number = PhoneNumber(isoCode: 'NG');

  TextEditingController naController = TextEditingController();

  FocusNode acNode = FocusNode();
  FocusNode naFocus = FocusNode();

  bool acTxt = false, naTxt = false, matching = false;

  ValueNotifier<String> ic = ValueNotifier('');
  ValueNotifier<String> countryName = ValueNotifier('');
  ValueNotifier<bool> selChk = ValueNotifier(false);
  String cc = '';

  @override
  void initState() {
    registerStore.setupValidations();
    super.initState();
    getData();
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
            MainClass.bH(4),
            InkWell(
              highlightColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
              onTap: () => showCountry(),
              child: Row(
                children: [
                  if (naTxt)
                    ValueListenableBuilder(
                      valueListenable: ic,
                      builder: (BuildContext context, value,
                          Widget child) {
                        return Image.asset(ic.value,
                            height: 24, width: 24);
                      },
                    ),
                  MainClass.bW(4),
                  ValueListenableBuilder(
                    valueListenable: selChk,
                    builder: (BuildContext context, value, Widget child) {
                      return Container(
                        width: 330.w,
                        padding: MainClass.padS(15, 14),
                        decoration: MainClass.conDecor(16, selChk.value ? AppColor.colorAppGray : AppColor.colorAppGray, 2, AppColor.colorAppGray),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if(!selChk.value )
                              MainClass.txtSG4('Select Country', 16.sp),
                            if(selChk.value)
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ValueListenableBuilder(
                                    valueListenable:ic,
                                    builder: (BuildContext context, String value, Widget child) {
                                      return Image.asset(ic.value, width: 18, height: 18);
                                    },
                                  ),
                                  MainClass.bW(8),
                                  ValueListenableBuilder(
                                    valueListenable: countryName,
                                    builder: (BuildContext context, String value, Widget child) {
                                      return MainClass.txtB6(countryName.value, 15);
                                    },
                                  ),
                                ],
                              ),
                            MainClass.bW(8),
                            Image.asset('assets/images/extras/ar_down.png', height: 10, width: 10,),
                          ],
                        ),
                      );
                    },
                  ),

                ],
              ),
            ),
            MainClass.bH(15),
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
                      print('Testing Registration');
                      FocusScope.of(context).unfocus();
                      if(registerStore.hasErrors){
                        print(widget.email);
                        print(naController.text);
                        print(devId);
                        print(registerStore.username);
                        print(registerStore.fullName);
                        print(registerStore.country);
                        return;
                      }else if(passwordController.text.length <6){
                        showCustomDialog(context, 'Notification', 'The password must be at least 6 characters.');
                      }  else if(!RegExp(r'(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])').hasMatch(passwordController.text)){
                        showCustomDialog(context, "Notification",
                            "The password must contain at least one number.");

                      } else{
                        print(devId);
                        print(cc);
                        print('registerStore.country');
                        registerStore.submit(api, context, (s) {}, (e){
                          showCustomDialog(context, "Notification", e);
                        },widget.email, devId);

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
  showCountry() {
    fNameFocus.unfocus();
    uNameFocus.unfocus();
    passwordFocus.unfocus();
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isDismissible: false,
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return Container(
                    padding: const EdgeInsets.only(
                        top: 40, bottom: 20, left: 20, right: 20),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        )),
                    child: Wrap(
                      runSpacing: 16,
                      children: [
                        //MainClass.sheetHead('Select Bank', '', context),
                        MainClass.bH(12),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MainClass.bH(12),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  countryName.value = 'Nigeria';
                                  selChk.value = true;
                                  ic.value = 'assets/images/country/nigeria.png';
                                  registerStore.country = 'NG';
                                });
                                Navigator.pop(context);
                              },
                              child: MainClass.countryDetails('Nigeria','NG',
                                  'assets/images/country/nigeria.png', false),
                            ),
                            MainClass.bH(24),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  countryName.value = 'United States';
                                  selChk.value = true;
                                  ic.value = 'assets/images/country/usa.png';
                                  registerStore.country = 'US';
                                });
                                Navigator.pop(context);
                              },
                              child: MainClass.countryDetails('United States','US',
                                  'assets/images/country/usa.png', false),
                            ),
                            MainClass.bH(24),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  countryName.value = 'United Kingdom';
                                  selChk.value = true;
                                  ic.value = 'assets/images/country/uk.png';
                                  registerStore.country = 'UK';
                                });
                                Navigator.pop(context);
                              },
                              child: MainClass.countryDetails(
                                  'United kingdom','UK', 'assets/images/country/uk.png', false),
                            ),
                            MainClass.bH(24),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  countryName.value = 'Netherland';
                                  selChk.value = true;
                                  ic.value = 'assets/images/country/nl.png';
                                  registerStore.country = 'NL';
                                });
                                Navigator.pop(context);
                              },
                              child: MainClass.countryDetails('Netherland','NL',
                                  'assets/images/country/nl.png', false),
                            ),
                            MainClass.bH(24),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  countryName.value = 'Singapore';
                                  selChk.value = true;
                                  ic.value = 'assets/images/country/sg.png';
                                  registerStore.country = 'SG';
                                });
                                Navigator.pop(context);
                              },
                              child: MainClass.countryDetails(
                                  'Singapore','SG', 'assets/images/country/sg.png', false),
                            ),
                            MainClass.bH(16),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
          );
        });
  }

  getData() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      setState(() {
        devId = androidInfo.fingerprint;
        devName = androidInfo.model;
        devOS = 'Android ${androidInfo.version.release}';
        AuthStorage().saveStringData('deviceInfo','$devId,$devName,$devOS');
        //box.write('deviceInfo', '$devId,$devName,$devOS');
      });
    } else if (Platform.isIOS)  {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      setState(() {
        devId = iosInfo.identifierForVendor;
        devName = iosInfo.name;
        devOS = iosInfo.systemVersion;
        AuthStorage().saveStringData('deviceInfo','$devId,$devName,$devOS');
        //box.write('deviceInfo', '$devId,$devName,$devOS');
      });
    } else if (Platform.isWindows) {
      WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
      WindowsDeviceInfo windowsDeviceInfo= await deviceInfo.windowsInfo;
      devId = webBrowserInfo.platform;
      devName = webBrowserInfo.userAgent;
      devOS = windowsDeviceInfo.majorVersion.toString();
      AuthStorage().saveStringData('deviceInfo','$devId,$devName,$devOS');
      //box.write('deviceInfo', '$devId,$devName,$devOS');
    }
  }

}
