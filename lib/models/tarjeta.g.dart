// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tarjeta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tarjeta _$TarjetaFromJson(Map<String, dynamic> json) => Tarjeta(
      tarjetaId: json['tarjeta_id'] as String?,
      titulo: json['titulo'] as String?,
      numero: json['numero'] as String?,
      titular: json['titular'] as String?,
      expiracion: json['expiracion'] as String?,
      codigo: json['codigo'] as String?,
      color: const ColorConverterHelper().fromJson(json['color'] as String?),
      diaCorte: json['diaCorte'] as String?,
      diaPago: json['diaPago'] as String?,
    );

Map<String, dynamic> _$TarjetaToJson(Tarjeta instance) => <String, dynamic>{
      'tarjeta_id': instance.tarjetaId,
      'titulo': instance.titulo,
      'numero': instance.numero,
      'titular': instance.titular,
      'expiracion': instance.expiracion,
      'codigo': instance.codigo,
      'color': const ColorConverterHelper().toJson(instance.color),
      'diaCorte': instance.diaCorte,
      'diaPago': instance.diaPago,
    };
