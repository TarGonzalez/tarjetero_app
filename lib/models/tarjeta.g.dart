// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tarjeta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tarjeta _$TarjetaFromJson(Map<String, dynamic> json) => Tarjeta(
      tarjetaId: json['tarjeta_id'] as String?,
      titulo: json['titulo'] as String?,
      numero: json['numero'] as String?,
      ultimosDigitos: (json['ultimos_digitos'] as num?)?.toInt(),
      titular: json['titular'] as String?,
      expiracion: json['expiracion'] as String?,
      codigoCvv: (json['codigo_cvv'] as num?)?.toInt(),
      color: json['color'] as String?,
      diaCorte: json['dia_corte'] as String?,
      diaPago: json['dia_pago'] as String?,
      comentario: json['comentario'] as String?,
    );

Map<String, dynamic> _$TarjetaToJson(Tarjeta instance) => <String, dynamic>{
      'tarjeta_id': instance.tarjetaId,
      'titulo': instance.titulo,
      'numero': instance.numero,
      'ultimos_digitos': instance.ultimosDigitos,
      'titular': instance.titular,
      'expiracion': instance.expiracion,
      'codigo_cvv': instance.codigoCvv,
      'color': instance.color,
      'dia_corte': instance.diaCorte,
      'dia_pago': instance.diaPago,
      'comentario': instance.comentario,
    };
