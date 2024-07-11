import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_assets.dart';

class GlobalBannerInfo extends StatelessWidget {
  const GlobalBannerInfo({
    super.key,
    this.titulo,
    this.assetUrl,
    this.informacion,
  });
  final String? titulo;
  final String? assetUrl;
  final String? informacion;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          titulo ?? 'Ocurrió algo inesperado',
          style: Theme.of(Get.context!).textTheme.bodyMedium,
        ),
        SizedBox(
          width: Get.width * 0.9,
          child: Image.asset(
            assetUrl ?? AppAssets.imgErrorUno,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          informacion ?? '',
          style: Theme.of(Get.context!).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
