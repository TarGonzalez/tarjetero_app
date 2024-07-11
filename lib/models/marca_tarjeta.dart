// import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'marca_tarjeta.g.dart';

@JsonSerializable()
class MarcaTarjeta {
  MarcaTarjeta({
    this.marcaTarjetaId,
    this.nombre,
    this.descripcion,
    this.folio,
    this.icono,
    this.status,
    this.clave,
  });

  factory MarcaTarjeta.fromJson(Map<String, dynamic> data) =>
      _$MarcaTarjetaFromJson(data);

  @JsonKey(name: 'marca_tarjeta_id')
  String? marcaTarjetaId;
  String? nombre;
  String? descripcion;
  int? folio;
  String? icono;
  int? status;
  String? clave;
  Map<String, dynamic> toJson() => _$MarcaTarjetaToJson(this);
}
