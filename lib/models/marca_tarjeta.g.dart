// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marca_tarjeta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarcaTarjeta _$MarcaTarjetaFromJson(Map<String, dynamic> json) => MarcaTarjeta(
      marcaTarjetaId: json['marca_tarjeta_id'] as String?,
      nombre: json['nombre'] as String?,
      descripcion: json['descripcion'] as String?,
      folio: (json['folio'] as num?)?.toInt(),
      icono: json['icono'] as String?,
      status: (json['status'] as num?)?.toInt(),
      clave: json['clave'] as String?,
    );

Map<String, dynamic> _$MarcaTarjetaToJson(MarcaTarjeta instance) =>
    <String, dynamic>{
      'marca_tarjeta_id': instance.marcaTarjetaId,
      'nombre': instance.nombre,
      'descripcion': instance.descripcion,
      'folio': instance.folio,
      'icono': instance.icono,
      'status': instance.status,
      'clave': instance.clave,
    };
