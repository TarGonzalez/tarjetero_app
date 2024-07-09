// import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
// import '../helpers/color_converter_helper.dart';

part 'tarjeta.g.dart';

@JsonSerializable()
class Tarjeta {
  Tarjeta({
    this.tarjetaId,
    this.titulo,
    this.numero,
    this.ultimosDigitos,
    this.titular,
    this.expiracion,
    this.codigoCvv,
    this.color,
    this.diaCorte,
    this.diaPago,
    this.comentario,
  });

  factory Tarjeta.fromJson(Map<String, dynamic> data) =>
      _$TarjetaFromJson(data);

  @JsonKey(name: 'tarjeta_id')
  String? tarjetaId;
  String? titulo;
  String? numero;
  @JsonKey(name: 'ultimos_digitos')
  int? ultimosDigitos;
  String? titular;
  String? expiracion;
  @JsonKey(name: 'codigo_cvv')
  int? codigoCvv;
  // @ColorConverterHelper()
  // Color? color;
  String? color;
  @JsonKey(name: 'dia_corte')
  String? diaCorte;
  @JsonKey(name: 'dia_pago')
  String? diaPago;
  String? comentario;
  Map<String, dynamic> toJson() => _$TarjetaToJson(this);

  Tarjeta copyWith({
    String? titulo,
    String? numero,
    int? ultimosDigitos,
    String? titular,
    String? expiracion,
    int? codigoCvv,
    String? color,
    String? diaCorte,
    String? diaPago,
  }) {
    return Tarjeta(
      titulo: titulo ?? this.titulo,
      numero: numero ?? this.numero,
      titular: titular ?? this.titular,
      expiracion: expiracion ?? this.expiracion,
      codigoCvv: codigoCvv ?? this.codigoCvv,
      color: color ?? this.color,
      diaCorte: diaCorte ?? this.diaCorte,
      diaPago: diaPago ?? this.diaPago,
    );
  }
}
