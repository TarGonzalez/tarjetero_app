import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class TarjetaHelper {
  static String ponerMascaraNumero(
      {required String numero, bool ocultar = false}) {
    MaskedTextController mask =
        MaskedTextController(text: numero, mask: '0000   0000   0000   0000');
    if (ocultar) {
      mask =
          MaskedTextController(text: numero, mask: '****     ****     ****     0000');
    }
    return mask.text;
  }

  static String fechaExpMostrar(
      {required String anio,
      required String mes,
      bool ocultarInformacion = false}) {
    return !ocultarInformacion ? '$mes/$anio' : '**/**';
  }

  static String codigoMostrar(
      {required String codigoCvv, bool ocultarInformacion = false}) {
    return !ocultarInformacion ? codigoCvv : '***';
  }

  static String numeroMostrar(
      {required String numero,
      required String ultimosDigitos,
      bool ocultarInformacion = false}) {
    if (!ocultarInformacion) {
      return ponerMascaraNumero(
        numero: numero,
        ocultar: ocultarInformacion,
      );
    } else {
      return ponerMascaraNumero(
        numero: '************$ultimosDigitos',
        ocultar: ocultarInformacion,
      );
    }
  }
}
