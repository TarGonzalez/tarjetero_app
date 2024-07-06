import 'dart:io';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/constants.dart';
import '/themes/app_theme.dart';

class Utils {
  static Future<bool> validarConexion() async {
    try {
      final List<InternetAddress> result =
          await InternetAddress.lookup('www.google.com.mx');

      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (error) {
      return false;
    }
  }

  static String limpiarException(Object e) {
    return e.toString().replaceAll('Exception: ', '');
  }

  static Future<void> cambiarTheme({required String themeMode}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (themeMode == 'default') {
      // final Brightness brightness =
      //     WidgetsBinding.instance.platformDispatcher.platformBrightness;
      // themeMode = brightness == Brightness.dark ? 'oscuro' : 'light';
      final int hour = DateTime.now().hour;
      themeMode = hour >= 19 || hour < 7 ? 'oscuro' : 'light';
      await prefs.setString('theme', themeTipoDefault);
    }
    if (themeMode == 'light') {
      Get.changeTheme(themeLight);
      await prefs.setString('theme', themeTipoLight);
    } else {
      Get.changeTheme(themeDark);
      await prefs.setString('theme', themeTipoDark);
    }
  }
}
