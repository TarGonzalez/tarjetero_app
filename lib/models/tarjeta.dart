import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

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
  Color? color;

  Map<String, dynamic> toJson() => _$TarjetaToJson(this);

  Tarjeta copyWith({
    String? titulo,
    String? numero,
    String? titular,
    String? expiracion,
    String? codigo,
    Color? color,
  }) {
    return Tarjeta(
      titulo: titulo ?? this.titulo,
      numero: numero ?? this.numero,
      titular: titular ?? this.titular,
      expiracion: expiracion ?? this.expiracion,
      codigo: codigo ?? this.codigo,
      color: color ?? this.color,
    );
  }
}