import 'dart:convert';
import 'package:flutter/services.dart';

abstract class EnvReader {
  static late Map<String, dynamic>? _config;

  static Future<void> initialize({String flavor = 'dev'}) async {
    final String configString =
        await rootBundle.loadString('env/env_$flavor.json');
    _config = json.decode(configString) as Map<String, dynamic>;
  }

  static String getAppName() {
    return _config!['APP_NAME'] as String;
  }

  static String getAppMode() {
    return _config!['APP_MODE'] as String;
  }

  static String getApiKey() {
    return _config!['API_KEY'] as String;
  }

  static String getApiUrl() {
    return _config!['API_URL'] as String;
  }

  static String getBasePath() {
    return _config!['BASE_PATH'] as String;
  }
}
