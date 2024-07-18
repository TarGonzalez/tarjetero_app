import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
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
          textAlign: TextAlign.center,
        ),
        SizedBox(
          width: Get.width * 0.9,
          child: Image.asset(
            assetUrl ?? AppAssets.imgErrorUno,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 12),
        Html(
          data: informacion != null ? '<p>$informacion</p>' : '',
          style: <String, Style>{
            'p': Style(
              alignment: Alignment.center,
              textAlign: TextAlign.center,
            ),
          },
          shrinkWrap: true,
        ),
          // style: Theme.of(Get.context!).textTheme.bodySmall,
          // textAlign: TextAlign.center,
      ],
    );
  }
}
