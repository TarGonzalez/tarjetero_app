import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../app_assets.dart';

class Loader {
  static Future<void> mostrar({String? urlAsset, EdgeInsets? paddingLoader}) {
    return showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: Dialog(
            backgroundColor: const Color.fromRGBO(0, 0, 0, 0.8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            insetPadding: EdgeInsets.zero,
            child: Center(
              child: Padding(
                padding: paddingLoader ?? const EdgeInsets.all(100.0),
                child: Lottie.asset(
                  urlAsset ?? AppAssets.jsonCreditCards,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
