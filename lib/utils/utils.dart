import 'dart:io';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/app_controller.dart';
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
    final AppController appController = Get.find<AppController>();
    if (themeMode == 'default') {
      final String theme = await obtenerThemeDefault(themeMode: themeMode);
      appController.theme.value = theme;
      Get.changeTheme(theme == themeTipoLight ? themeLight : themeDark);
      await prefs.setString('theme', themeTipoDefault);
    } else if (themeMode == 'light') {
      appController.theme.value = themeTipoLight;
      Get.changeTheme(themeLight);
      await prefs.setString('theme', themeTipoLight);
    } else {
      appController.theme.value = themeTipoDark;
      Get.changeTheme(themeDark);
      await prefs.setString('theme', themeTipoDark);
    }
  }

  static Future<String> obtenerThemeDefault({required String themeMode}) async {
    // final Brightness brightness =
    //     WidgetsBinding.instance.platformDispatcher.platformBrightness;
    // themeMode = brightness == Brightness.dark ? 'dark' : 'light';
    final int hour = DateTime.now().hour;
    themeMode = hour >= 19 || hour < 7 ? themeTipoDark : themeTipoLight;
    return themeMode;
  }
}
