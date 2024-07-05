import 'package:json_annotation/json_annotation.dart';

part 'sesion.g.dart';

@JsonSerializable()
class Sesion {
  Sesion({
    this.clienteId,
    this.token,
    this.nombre,
  });

  factory Sesion.fromJson(Map<String, dynamic> data) => _$SesionFromJson(data);

  @JsonKey(name: 'cliente_id')
  String? clienteId;
  String? token;
  String? nombre;

  Map<String, dynamic> toJson() => _$SesionToJson(this);
}
