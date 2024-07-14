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
    this.anioExpiracion,
    this.mesExpiracion,
    this.codigoCvv,
    this.color,
    this.diaCorte,
    this.diaPago,
    this.comentario,
    this.marcaTarjetaId,
    this.icono,
  });

  factory Tarjeta.fromJson(Map<String, dynamic> data) =>
      _$TarjetaFromJson(data);

  @JsonKey(name: 'tarjeta_id')
  String? tarjetaId;
  String? titulo;
  String? numero;
  @JsonKey(name: 'ultimos_digitos')
  String? ultimosDigitos;
  String? titular;
  String? expiracion;
  @JsonKey(name: 'anio_expiracion')
  String? anioExpiracion;
  @JsonKey(name: 'mes_expiracion')
  String? mesExpiracion;
  @JsonKey(name: 'codigo_cvv')
  String? codigoCvv;
  // @ColorConverterHelper()
  // Color? color;
  String? color;
  @JsonKey(name: 'dia_corte')
  String? diaCorte;
  @JsonKey(name: 'dia_pago')
  String? diaPago;
  String? comentario;
  @JsonKey(name: 'marca_tarjeta_id')
  String? marcaTarjetaId;
  String? icono;
  Map<String, dynamic> toJson() => _$TarjetaToJson(this);

  Tarjeta copyWith({
    String? titulo,
    String? numero,
    String? ultimosDigitos,
    String? titular,
    String? expiracion,
    String? codigoCvv,
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
