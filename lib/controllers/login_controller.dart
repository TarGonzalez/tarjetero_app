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
      'email': usuario,
      'password': password,
    };
    // ignore: always_specify_types
    final response = await ApiHandler().post('auth', 'login', parametros);
    if (response != null) {
      await sesionGuardarDatos(response);
      return true;
    }
    return false;
  }

  Future<bool> registrarse({
    required String email,
    required String usuario,
    required String password,
    required String passwordConfirm,
    required String nombres,
    required String apellidos,
  }) async {
    final Map<String, dynamic> parametros = <String, dynamic>{
      'email': email,
      'usuario': usuario,
      'password': password,
      'passwordConfirm': passwordConfirm,
      'nombre': nombres,
      'apellidos': apellidos,
    };
    // ignore: always_specify_types
    final response = await ApiHandler().post('clientes', 'registro', parametros);
    if (response != null) {
      await sesionGuardarDatos(response);
      return true;
    }
    return false;
  }

  Future<void> sesionGuardarDatos(Map<String, dynamic> response) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String theme = prefs.getString('theme') ?? themeTipoDefault;
    await prefs.setString('theme', theme);
    final Sesion temporal = Sesion(
      clienteId: response['clienteId'],
      email: response['email'],
      nombre: response['nombre'],
      apellidos: response['apellidos'],
      fechaNacimiento: response['fechaNacimiento'],
      sexo: response['sexo'],
      tokenSesion: response['token'],
      pin: response['pin'],
      usuario: response['usuario'],
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
