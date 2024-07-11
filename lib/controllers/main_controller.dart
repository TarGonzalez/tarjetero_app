import 'package:get/get.dart';

import 'app_controller.dart';
import 'catalogo_controller.dart';
import 'login_controller.dart';
import 'tarjeta_controller.dart';

class MainController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Get.put(AppController());
    Get.put(LoginController());
    Get.put(TarjetaController());
    Get.put(CatalogoController());
  }
}
