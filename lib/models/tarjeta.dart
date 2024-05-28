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

  Map<String, dynamic> toJson() => _$TarjetaToJson(this);

  Tarjeta copyWith(
      {String? titulo,
      String? numero,
      String? titular,
      String? expiracion,
      String? codigo}) {
    return Tarjeta(
      titulo: titulo ?? this.titulo,
      numero: numero ?? this.numero,
      titular: titular ?? this.titular,
      expiracion: expiracion ?? this.expiracion,
      codigo: codigo ?? this.codigo,
    );
  }
}
