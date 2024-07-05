// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sesion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sesion _$SesionFromJson(Map<String, dynamic> json) => Sesion(
      clienteId: json['cliente_id'] as String?,
      token: json['token'] as String?,
      nombre: json['nombre'] as String?,
    );

Map<String, dynamic> _$SesionToJson(Sesion instance) => <String, dynamic>{
      'cliente_id': instance.clienteId,
      'token': instance.token,
      'nombre': instance.nombre,
    };
