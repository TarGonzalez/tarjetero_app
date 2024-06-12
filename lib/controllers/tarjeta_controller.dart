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
      fechaCorte: tarjetaActual.fechaCorte,
      fechaPago: tarjetaActual.fechaPago,
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
      fechaCorte: tarjetaActual.fechaCorte,
      fechaPago: tarjetaActual.fechaPago,
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
      fechaCorte: tarjetaActual.fechaCorte,
      fechaPago: tarjetaActual.fechaPago,
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
      fechaCorte: tarjetaActual.fechaCorte,
      fechaPago: tarjetaActual.fechaPago,
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
      fechaCorte: tarjetaActual.fechaCorte,
      fechaPago: tarjetaActual.fechaPago,
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
      fechaCorte: tarjetaActual.fechaCorte,
      fechaPago: tarjetaActual.fechaPago,
    );
  }

  Future<void> cambiarFechaCorte(DateTime val) async {
    final Tarjeta tarjetaActual = _tarjetaActual.value;
    _tarjetaActual.value = _tarjetaActual.value.copyWith(
      titulo: tarjetaActual.titulo,
      numero: tarjetaActual.numero,
      titular: tarjetaActual.titular,
      expiracion: tarjetaActual.expiracion,
      codigo: tarjetaActual.codigo,
      color: tarjetaActual.color,
      fechaCorte: val.toString(),
      fechaPago: tarjetaActual.fechaPago,
    );
  }

  Future<void> cambiarFechaPago(DateTime val) async {
    final Tarjeta tarjetaActual = _tarjetaActual.value;
    _tarjetaActual.value = _tarjetaActual.value.copyWith(
      titulo: tarjetaActual.titulo,
      numero: tarjetaActual.numero,
      titular: tarjetaActual.titular,
      expiracion: tarjetaActual.expiracion,
      codigo: tarjetaActual.codigo,
      color: tarjetaActual.color,
      fechaCorte: tarjetaActual.fechaCorte,
      fechaPago: val.toString(),
    );
  }

  Future<void> limpiarTarjetaActual() async {
    tarjetaActual = Tarjeta();
  }
}
