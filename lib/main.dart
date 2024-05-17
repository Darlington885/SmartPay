import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smartpay/router/routes.dart';
import 'package:smartpay/screens/services/api_client.dart';
import 'package:smartpay/splash_screen.dart';
import 'package:smartpay/store/auth_store/auth_store.dart';
import 'package:smartpay/widgets/loader.dart';

import 'config/config.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  //Initialize config and environment variables
  await Config.loadConfig('dev');

  // Setup orientation
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  AuthStore authStore = AuthStore();

  runApp(MyApp(authStore));
}

class MyApp extends StatelessWidget {
  final AuthStore authStore;
  MyApp(this.authStore);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthStore>(create: (_) => authStore),
        Provider<ApiClient>(create: (_) => ApiClient(authStore)),
        ChangeNotifierProvider<LoaderProvider>(create: (context) => LoaderProvider()),
      ],
      child: const SmartPayApp(),
    );
  }
}

class SmartPayApp extends StatefulWidget {
  const SmartPayApp({Key key}) : super(key: key);

  @override
  State<SmartPayApp> createState() => _SmartPayAppState();
}

AuthStore authStore;

class _SmartPayAppState extends State<SmartPayApp> {

  @override
  Widget build(BuildContext context) {
    authStore = Provider.of<AuthStore>(context);
    authStore.persistAuth();
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (BuildContext context, Widget child) =>  MaterialApp(
        debugShowCheckedModeBanner: false,
        showPerformanceOverlay: false,
        initialRoute:authStore.onboarded ? SplashScreen.routeName : SplashScreen.routeName,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
