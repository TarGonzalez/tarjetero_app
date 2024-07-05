import 'package:get/get.dart';

import '../helpers/api_handler.dart'; 
// import '../models/sesion.dart';

class LoginController extends GetxController {
  Future<bool> inciarSesion({
    required String usuario,
    required String password,
  }) async {
    final Map<String, dynamic> parametros = <String, dynamic>{
      'usuario': usuario,
      'password': password,
    };
    // ignore: always_specify_types
    final response = await ApiHandler().post('auth', 'login', parametros);
    if (response != null) {
      return true;
    }
    return false;
  }
}
