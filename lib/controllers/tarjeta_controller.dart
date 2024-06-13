import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/tarjeta.dart';

class TarjetaController extends GetxController {
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
      codigo: tarjetaActual.codigo,
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
      codigo: tarjetaActual.codigo,
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
      codigo: tarjetaActual.codigo,
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
      codigo: tarjetaActual.codigo,
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
      codigo: val,
      color: tarjetaActual.color,
      diaCorte: tarjetaActual.diaCorte,
      diaPago: tarjetaActual.diaPago,
    );
  }

  Future<void> cambiarColor(Color val) async {
    final Tarjeta tarjetaActual = _tarjetaActual.value;
    _tarjetaActual.value = _tarjetaActual.value.copyWith(
      titulo: tarjetaActual.titulo,
      numero: tarjetaActual.numero,
      titular: tarjetaActual.titular,
      expiracion: tarjetaActual.expiracion,
      codigo: tarjetaActual.codigo,
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
      codigo: tarjetaActual.codigo,
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
      codigo: tarjetaActual.codigo,
      color: tarjetaActual.color,
      diaCorte: tarjetaActual.diaCorte,
      diaPago: val,
    );
  }

  Future<void> limpiarTarjetaActual() async {
    tarjetaActual = Tarjeta();
  }
}
