// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tarjeta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tarjeta _$TarjetaFromJson(Map<String, dynamic> json) => Tarjeta(
      tarjetaId: json['tarjeta_id'] as String?,
      titulo: json['titulo'] as String?,
      numero: json['numero'] as String?,
      ultimosDigitos: json['ultimos_digitos'] as String?,
      titular: json['titular'] as String?,
      expiracion: json['expiracion'] as String?,
      anioExpiracion: json['anio_expiracion'] as String?,
      mesExpiracion: json['mes_expiracion'] as String?,
      codigoCvv: json['codigo_cvv'] as String?,
      color: json['color'] as String?,
      diaCorte: json['dia_corte'] as String?,
      diaPago: json['dia_pago'] as String?,
      comentario: json['comentario'] as String?,
      marcaTarjetaId: json['marca_tarjeta_id'] as String?,
      icono: json['icono'] as String?,
      tipo: (json['tipo'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TarjetaToJson(Tarjeta instance) => <String, dynamic>{
      'tarjeta_id': instance.tarjetaId,
      'titulo': instance.titulo,
      'numero': instance.numero,
      'ultimos_digitos': instance.ultimosDigitos,
      'titular': instance.titular,
      'expiracion': instance.expiracion,
      'anio_expiracion': instance.anioExpiracion,
      'mes_expiracion': instance.mesExpiracion,
      'codigo_cvv': instance.codigoCvv,
      'color': instance.color,
      'dia_corte': instance.diaCorte,
      'dia_pago': instance.diaPago,
      'comentario': instance.comentario,
      'marca_tarjeta_id': instance.marcaTarjetaId,
      'icono': instance.icono,
      'tipo': instance.tipo,
    };
