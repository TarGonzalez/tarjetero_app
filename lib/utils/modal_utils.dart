import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModalUtils {
  static Future<void> mostrarBottomShet(
      {String? titulo, double? altura, Widget? contenido}) {
    return showModalBottomSheet(
      context: Get.context!,
      useSafeArea: true,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.8),
      backgroundColor: Theme.of(Get.context!).scaffoldBackgroundColor,
      elevation: 5,
      enableDrag: true,
      isDismissible: true,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxWidth: Get.width,
        minWidth: Get.width,
        maxHeight: altura ?? Get.height * 0.75,
        minHeight: altura ?? Get.height * 0.75,
      ),
      builder: (BuildContext context) {
        return Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey),
                ),
              ),
              child: Text(
                titulo ?? 'Sin titulo',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: contenido != null
                  ? SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 24),
                      child: contenido,
                    )
                  : const Center(
                      child: Text('Contenido del modal'),
                    ),
            ),
          ],
        );
      },
    );
  }
}
