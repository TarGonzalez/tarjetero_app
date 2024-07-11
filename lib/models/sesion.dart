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
    this.fechaNacimiento,
    this.pin,
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
  @JsonKey(name: 'fecha_nacimiento')
  String? fechaNacimiento;
  String? pin;
  String? sexo;
  String? usuario;

  Map<String, dynamic> toJson() => _$SesionToJson(this);
}
