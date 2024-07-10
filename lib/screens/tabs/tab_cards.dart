import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/tarjeta_controller.dart';
import '../../models/tarjeta.dart';
import '../../widgets/global/global_banner_info.dart';
import '../../widgets/global/global_progress.dart';
import '../../widgets/tarjetas/tarjeta_tile.dart';

class TabCards extends StatelessWidget {
  const TabCards({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Tarjeta>>(
      future: Get.find<TarjetaController>().listar(clienteId: '1'),
      builder: (BuildContext context, AsyncSnapshot<List<Tarjeta>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // mientras este buscando
          return SizedBox(
            width: Get.width,
            height: Get.height / 3,
            child: const Center(
              child: GlobalProgress(
                size: 60,
              ),
            ),
          );
        } else if (snapshot.hasError) {
          // si hay un error
          return SizedBox(
            width: Get.width,
            height: Get.height / 2,
            child: GlobalBannerInfo(
              informacion: snapshot.error.toString(),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          // si no hay datos
          return const Center(child: Text('No hay tarjetas disponibles.'));
        } else {
          // lista las tarjetas
          return ListView.separated(
            itemCount: snapshot.data!.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return TarjetaTile(
                tarjeta: snapshot.data![index],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 24);
            },
          );
        }
      },
    );
  }
}
