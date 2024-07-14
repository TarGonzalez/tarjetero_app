import 'package:get/get.dart';

import '../models/sesion.dart';
import '../models/tarjeta.dart';

class AppController extends GetxController {
  Rx<Sesion> sesionObj = Rx<Sesion>(Sesion());
  Rx<String> theme = Rx<String>('');
  Rx<Tarjeta> tarjeta = Tarjeta().obs;
  Rx<bool> tipoTarjeta = Rx<bool>(false);

  Future<void> limpiarTarjetaActual() async {
    tarjeta.value = Tarjeta();
    tipoTarjeta.value = false;
  }
}
