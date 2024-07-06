import 'package:json_annotation/json_annotation.dart';

part 'sesion.g.dart';

@JsonSerializable()
class Sesion {
  Sesion({
    this.clienteId,
    this.tokenSesion,
    this.nombre,
    this.apellidos,
    this.email,
    this.anioNacimiento,
    this.mesNacimiento,
    this.sexo,
    this.usuario,
  });

  factory Sesion.fromJson(Map<String, dynamic> data) => _$SesionFromJson(data);

  @JsonKey(name: 'cliente_id')
  String? clienteId;
  @JsonKey(name: 'token_sesion')
  String? tokenSesion;
  String? nombre;
  String? apellidos;
  String? email;
  @JsonKey(name: 'anio_nacimiento')
  String? anioNacimiento;
  @JsonKey(name: 'mes_nacimiento')
  String? mesNacimiento;
  String? sexo;
  String? usuario;

  Map<String, dynamic> toJson() => _$SesionToJson(this);
}
