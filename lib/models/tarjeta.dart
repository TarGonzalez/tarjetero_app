import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import '../helpers/color_converter_helper.dart';

part 'tarjeta.g.dart';

@JsonSerializable()
class Tarjeta {
  Tarjeta({
    this.tarjetaId,
    this.titulo,
    this.numero,
    this.titular,
    this.expiracion,
    this.codigo,
    this.color,
    this.diaCorte,
    this.diaPago,
  });

  factory Tarjeta.fromJson(Map<String, dynamic> data) =>
      _$TarjetaFromJson(data);

  @JsonKey(name: 'tarjeta_id')
  String? tarjetaId;
  String? titulo;
  String? numero;
  String? titular;
  String? expiracion;
  String? codigo;
  @ColorConverterHelper()
  Color? color;
  String? diaCorte;
  String? diaPago;
  Map<String, dynamic> toJson() => _$TarjetaToJson(this);

  Tarjeta copyWith({
    String? titulo,
    String? numero,
    String? titular,
    String? expiracion,
    String? codigo,
    Color? color,
    String? diaCorte,
    String? diaPago,
  }) {
    return Tarjeta(
      titulo: titulo ?? this.titulo,
      numero: numero ?? this.numero,
      titular: titular ?? this.titular,
      expiracion: expiracion ?? this.expiracion,
      codigo: codigo ?? this.codigo,
      color: color ?? this.color,
      diaCorte: diaCorte ?? this.diaCorte,
      diaPago: diaPago ?? this.diaPago,
    );
  }
}
