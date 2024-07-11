// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sesion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sesion _$SesionFromJson(Map<String, dynamic> json) => Sesion(
      clienteId: json['cliente_id'] as String?,
      tokenSesion: json['token_sesion'] as String?,
      nombre: json['nombre'] as String?,
      apellidos: json['apellidos'] as String?,
      email: json['email'] as String?,
      fechaNacimiento: json['fecha_nacimiento'] as String?,
      pin: json['pin'] as String?,
      sexo: json['sexo'] as String?,
      usuario: json['usuario'] as String?,
    );

Map<String, dynamic> _$SesionToJson(Sesion instance) => <String, dynamic>{
      'cliente_id': instance.clienteId,
      'token_sesion': instance.tokenSesion,
      'nombre': instance.nombre,
      'apellidos': instance.apellidos,
      'email': instance.email,
      'fecha_nacimiento': instance.fechaNacimiento,
      'pin': instance.pin,
      'sexo': instance.sexo,
      'usuario': instance.usuario,
    };
