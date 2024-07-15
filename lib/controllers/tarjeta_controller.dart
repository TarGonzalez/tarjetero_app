import 'package:get/get.dart';

import '/helpers/api_handler.dart';
import '/models/tarjeta.dart';

class TarjetaController extends GetxController {
  static const String endPoint = 'tarjetas';
  final Rx<Tarjeta> _tarjetaActual = Tarjeta().obs;
  Tarjeta get tarjetaActual => _tarjetaActual.value;
  set tarjetaActual(Tarjeta newValue) => _tarjetaActual.value = newValue;

  Future<void> cambiarTitulo(String val) async {
    final Tarjeta tarjetaActual = _tarjetaActual.value;
    _tarjetaActual.value = _tarjetaActual.value.copyWith(
      titulo: val,
      numero: tarjetaActual.numero,
      titular: tarjetaActual.titular,
      expiracion: tarjetaActual.expiracion,
      codigoCvv: tarjetaActual.codigoCvv,
      color: tarjetaActual.color,
      diaCorte: tarjetaActual.diaCorte,
      diaPago: tarjetaActual.diaPago,
    );
  }

  Future<void> cambiarNumero(String val) async {
    final Tarjeta tarjetaActual = _tarjetaActual.value;
    _tarjetaActual.value = _tarjetaActual.value.copyWith(
      titulo: tarjetaActual.titulo,
      numero: val,
      titular: tarjetaActual.titular,
      expiracion: tarjetaActual.expiracion,
      codigoCvv: tarjetaActual.codigoCvv,
      color: tarjetaActual.color,
      diaCorte: tarjetaActual.diaCorte,
      diaPago: tarjetaActual.diaPago,
    );
  }

  Future<void> cambiarTitular(String val) async {
    final Tarjeta tarjetaActual = _tarjetaActual.value;
    _tarjetaActual.value = _tarjetaActual.value.copyWith(
      titulo: tarjetaActual.titulo,
      numero: tarjetaActual.numero,
      titular: val,
      expiracion: tarjetaActual.expiracion,
      codigoCvv: tarjetaActual.codigoCvv,
      color: tarjetaActual.color,
      diaCorte: tarjetaActual.diaCorte,
      diaPago: tarjetaActual.diaPago,
    );
  }

  Future<void> cambiarExpiracion(String val) async {
    final Tarjeta tarjetaActual = _tarjetaActual.value;
    _tarjetaActual.value = _tarjetaActual.value.copyWith(
      titulo: tarjetaActual.titulo,
      numero: tarjetaActual.numero,
      titular: tarjetaActual.titular,
      expiracion: val,
      codigoCvv: tarjetaActual.codigoCvv,
      color: tarjetaActual.color,
      diaCorte: tarjetaActual.diaCorte,
      diaPago: tarjetaActual.diaPago,
    );
  }

  Future<void> cambiarCodigo(String val) async {
    final Tarjeta tarjetaActual = _tarjetaActual.value;
    _tarjetaActual.value = _tarjetaActual.value.copyWith(
      titulo: tarjetaActual.titulo,
      numero: tarjetaActual.numero,
      titular: tarjetaActual.titular,
      expiracion: tarjetaActual.expiracion,
      codigoCvv: val,
      color: tarjetaActual.color,
      diaCorte: tarjetaActual.diaCorte,
      diaPago: tarjetaActual.diaPago,
    );
  }

  Future<void> cambiarColor(String val) async {
    final Tarjeta tarjetaActual = _tarjetaActual.value;
    _tarjetaActual.value = _tarjetaActual.value.copyWith(
      titulo: tarjetaActual.titulo,
      numero: tarjetaActual.numero,
      titular: tarjetaActual.titular,
      expiracion: tarjetaActual.expiracion,
      codigoCvv: tarjetaActual.codigoCvv,
      color: val,
      diaCorte: tarjetaActual.diaCorte,
      diaPago: tarjetaActual.diaPago,
    );
  }

  Future<void> cambiarFechaCorte(String val) async {
    final Tarjeta tarjetaActual = _tarjetaActual.value;
    _tarjetaActual.value = _tarjetaActual.value.copyWith(
      titulo: tarjetaActual.titulo,
      numero: tarjetaActual.numero,
      titular: tarjetaActual.titular,
      expiracion: tarjetaActual.expiracion,
      codigoCvv: tarjetaActual.codigoCvv,
      color: tarjetaActual.color,
      diaCorte: val,
      diaPago: tarjetaActual.diaPago,
    );
  }

  Future<void> cambiarFechaPago(String val) async {
    final Tarjeta tarjetaActual = _tarjetaActual.value;
    _tarjetaActual.value = _tarjetaActual.value.copyWith(
      titulo: tarjetaActual.titulo,
      numero: tarjetaActual.numero,
      titular: tarjetaActual.titular,
      expiracion: tarjetaActual.expiracion,
      codigoCvv: tarjetaActual.codigoCvv,
      color: tarjetaActual.color,
      diaCorte: tarjetaActual.diaCorte,
      diaPago: val,
    );
  }

  Future<void> limpiarTarjetaActual() async {
    tarjetaActual = Tarjeta();
  }

  Future<List<Tarjeta>> listar({
    required int status,
  }) async {
    List<Tarjeta> tarjetas = <Tarjeta>[];
    final Map<String, dynamic> parametros = <String, dynamic>{
      'status[0]': status
    };
    // ignore: always_specify_types
    final response = await ApiHandler().get(endPoint, 'listar', parametros);
    if (response != null) {
      // ignore: avoid_dynamic_calls, always_specify_types
      tarjetas = (response as List).map((r) => Tarjeta.fromJson(r)).toList();
    }
    return tarjetas;
  }

  Future<bool> agregar({required Tarjeta tarjeta}) async {
    final Map<String, dynamic> parametros = <String, dynamic>{
      'numero': tarjeta.numero,
      'titular': tarjeta.titular,
      'titulo': tarjeta.titulo,
      'color': tarjeta.color,
      'marcaTarjetaId': tarjeta.marcaTarjetaId,
      'anioExpiracion': tarjeta.anioExpiracion,
      'mesExpiracion': tarjeta.mesExpiracion,
      'codigoCvv': tarjeta.codigoCvv,
      'comentario': tarjeta.comentario,
      'diaCorte': tarjeta.diaCorte,
      'diaPago': tarjeta.diaPago,
    };
    // ignore: always_specify_types
    final response = await ApiHandler().post(endPoint, 'agregar', parametros);
    if (response != null) {
      return true;
    }
    return false;
  }

  Future<bool> editar({required Tarjeta tarjeta, required String tarjetaId,}) async {
    final Map<String, dynamic> parametros = <String, dynamic>{
      'tarjetaId': tarjetaId,
      'numero': tarjeta.numero,
      'titular': tarjeta.titular,
      'titulo': tarjeta.titulo,
      'color': tarjeta.color,
      'marcaTarjetaId': tarjeta.marcaTarjetaId,
      'anioExpiracion': tarjeta.anioExpiracion,
      'mesExpiracion': tarjeta.mesExpiracion,
      'codigoCvv': tarjeta.codigoCvv,
      'comentario': tarjeta.comentario,
      'diaCorte': tarjeta.diaCorte,
      'diaPago': tarjeta.diaPago,
    };
    // ignore: always_specify_types
    final response = await ApiHandler().post(endPoint, 'agregar', parametros);
    if (response != null) {
      return true;
    }
    return false;
  }
}
