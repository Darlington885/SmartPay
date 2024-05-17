

import 'package:flutter/material.dart';
import 'package:smartpay/onboard.dart';
import 'package:smartpay/screens/Payment/about_us.dart';
import 'package:smartpay/screens/Payment/card_bank.dart';
import 'package:smartpay/screens/dashboard/dashboard_screen.dart';
import 'package:smartpay/screens/forgot_password/forgot_password.dart';
import 'package:smartpay/screens/forgot_password/success_screen.dart';
import 'package:smartpay/screens/nav/dilla.dart';
import 'package:smartpay/screens/nav/explore.dart';
import 'package:smartpay/screens/nav/save.dart';
import 'package:smartpay/screens/payment/add_bank.dart';
import 'package:smartpay/screens/register/set_pin.dart';
import 'package:smartpay/screens/register/verify_email.dart';

import '../classes/nav_bar.dart';
import '../screens/auth/login.dart';
import '../screens/forgot_password/enter_new_password.dart';
import '../screens/forgot_password/verify_identity.dart';
import '../screens/register/registration_screen.dart';
import '../screens/register/verify_otp.dart';
import '../splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RegistrationScreen.routeName:
        return MaterialPageRoute(builder: (_) => const RegistrationScreen());
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Onboard.routeName:
        return MaterialPageRoute(builder: (_) => const Onboard());
      case VerifyEmail.routeName:
        return MaterialPageRoute(builder: (_) => const VerifyEmail());
      case VerifyOtp.routeName:
        return MaterialPageRoute(builder: (_) => const VerifyOtp());
      case ForgotPassword.routeName:
        return MaterialPageRoute(builder: (_) => const ForgotPassword());
      case VerifyIdentity.routeName:
        return MaterialPageRoute(builder: (_) => const VerifyIdentity());
      case EnterNewPassword.routeName:
        return MaterialPageRoute(builder: (_) => const EnterNewPassword());
      case SuccessScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SuccessScreen());
      case DashBoardScreen.routeName:
        return MaterialPageRoute(builder: (_) => DashBoardScreen());
      case SaveScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SaveScreen());
      case Explore.routeName:
        return MaterialPageRoute(builder: (_) => const Explore());
      case DillaScreen.routeName:
        return MaterialPageRoute(builder: (_) => const DillaScreen());
      case NavBarScreen.routeName:
        return MaterialPageRoute(builder: (_) => const NavBarScreen());
      case SetPin.routeName:
        return MaterialPageRoute(builder: (_) => const SetPin());
      case AboutUs.routeName:
        return MaterialPageRoute(builder: (_) => const AboutUs());
      case CardBank.routeName:
        return MaterialPageRoute(builder: (_) => const CardBank());
      case AddBank.routeName:
        return MaterialPageRoute(builder: (_) => const AddBank());

      default:
      // If there is no such named route in the switch statement, e.g. /third
      // return MaterialPageRoute(builder: (_) => LoginScreen());
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
