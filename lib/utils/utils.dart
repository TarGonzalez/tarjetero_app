import 'dart:io';

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
}
