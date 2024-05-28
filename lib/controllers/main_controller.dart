import 'package:get/get.dart';

import 'tarjeta_controller.dart';

class MainController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Get.put(TarjetaController());
  }
}
