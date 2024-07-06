import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/controllers/app_controller.dart';
import '/helpers/cuenta_helper.dart';

class CuentaWidget extends StatelessWidget {
  const CuentaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final AppController appController = Get.find<AppController>();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Obx(
        () => Column(
          children: <Widget>[
            Text(
              CuentaHelper.obtenerNombre(
                  nombre: appController.sesionObj.value.nombre ?? '',
                  apellidos: appController.sesionObj.value.apellidos ?? ''),
            ),
            Text(appController.sesionObj.value.email ?? ''),
            Text(appController.sesionObj.value.sexo ?? ''),
          ],
        ),
      ),
    );
  }
}
