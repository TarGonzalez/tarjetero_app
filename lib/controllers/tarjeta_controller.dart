import 'package:get/get.dart';

import '../models/tarjeta.dart';

class TarjetaController extends GetxController {
  final Rx<Tarjeta> _tarjetaActual = Tarjeta().obs;
  Tarjeta get tarjetaActual => _tarjetaActual.value;
  set tarjetaActual(Tarjeta newValue) => _tarjetaActual.value = newValue;

  Future<void> limpiarTarjetaActual() async {
    tarjetaActual = Tarjeta();
  }
}
