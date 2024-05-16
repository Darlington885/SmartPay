import 'dart:async';

import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class Config {
  // add config vars
  static String baseUrl = dotenv.env['BASE_URL'];

  static Future<void> loadConfig(String envName) async {
    // const String env = String.fromEnvironment('dev');
    String envFile = 'env/$envName.env';
    // const envFile = 'env/dev.env';

    print(envFile);

    await dotenv.load(fileName: envFile);
  }
}
