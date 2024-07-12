import 'package:get/get.dart';

import '/helpers/api_handler.dart';
import '/models/marca_tarjeta.dart';

class CatalogoController extends GetxController {
  static const String endPoint = 'catalogos';

  Future<List<MarcaTarjeta>> listarMarcasTarjetas() async {
    List<MarcaTarjeta> marcas = <MarcaTarjeta>[];
    final Map<String, dynamic> parametros = <String, dynamic>{};
    // ignore: always_specify_types
    final response = await ApiHandler().get(endPoint, 'marcasTarjetas', parametros);
    if (response != null) {
      // ignore: avoid_dynamic_calls, always_specify_types
      marcas = (response as List).map((r) => MarcaTarjeta.fromJson(r)).toList();
    }
    return marcas;
  }
}
