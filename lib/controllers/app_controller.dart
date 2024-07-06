import 'package:get/get.dart';

import '../models/sesion.dart';

class AppController extends GetxController {
  Rx<Sesion> sesionObj = Rx<Sesion>(Sesion());
  Rx<String> theme = Rx<String>('');
}
