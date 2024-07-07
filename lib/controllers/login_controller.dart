import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/constants.dart';
import '/helpers/api_handler.dart';
import '/models/sesion.dart';
import '/utils/utils.dart';
import 'app_controller.dart';

class LoginController extends GetxController {
  final AppController appCtr = Get.find<AppController>();

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
      await sesionGuardarDatos();
      return true;
    }
    return false;
  }

  Future<bool> registrarse({
    required String nombres,
    required String apellidos,
    required String email,
    required String usuario,
    required String password,
  }) async {
    final Map<String, dynamic> parametros = <String, dynamic>{
      'nombres': nombres,
      'apellidos': apellidos,
      'email': email,
      'usuario': usuario,
      'password': password,
    };
    // ignore: always_specify_types
    final response = await ApiHandler().post('auth', 'register', parametros);
    if (response != null) {
      await sesionGuardarDatos();
      return true;
    }
    return false;
  }

  Future<void> sesionGuardarDatos() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String theme = prefs.getString('theme') ?? themeTipoDefault;
    await prefs.setString('theme', theme);
    final Sesion temporal = Sesion(
      clienteId: 'wu3yrfh',
      email: 'miguel.gf.130@gmail.com',
      nombre: 'Miguel',
      apellidos: 'González Flores ',
      anioNacimiento: '1989',
      mesNacimiento: '06',
      sexo: 'Hombre',
      tokenSesion: 'ueEIGH-ifhuw@jenh38t4uh4',
      usuario: 'mike',
    );
    appCtr.sesionObj.value = temporal;
    appCtr.theme.value = theme;
    final Map<String, dynamic> sesionObj = temporal.toJson();
    await prefs.setString('sesion', jsonEncode(sesionObj));
  }

  Future<bool> sesionObtenerDatos() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String sesionJson = prefs.getString('sesion') ?? 'vacio';
    bool logeado = false;
    if (sesionJson != 'vacio') {
      final Map<String, dynamic> sesionObj = jsonDecode(sesionJson);
      final Sesion temporal = Sesion.fromJson(sesionObj);
      appCtr.sesionObj.value = temporal;
      logeado = true;
    } else {
      appCtr.sesionObj.value = Sesion();
    }
    final String theme = prefs.getString('theme') ?? themeTipoDefault;
    appCtr.theme.value = theme;
    Utils.cambiarTheme(themeMode: theme);
    return logeado;
  }

  Future<void> sesionEliminarDatos() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('sesion');
    appCtr.sesionObj.value = Sesion();
  }
}
