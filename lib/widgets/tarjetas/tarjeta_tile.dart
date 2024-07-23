import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../controllers/app_controller.dart';
import '../../controllers/tarjeta_controller.dart';
import '../../helpers/color_helper.dart';
import '../../models/tarjeta.dart';
import '../../routes/routes_names.dart';
import '../../themes/color_palette.dart';
import 'marca_icono_widget.dart';

class TarjetaTile extends StatelessWidget {
  const TarjetaTile({
    super.key,
    required this.tarjeta,
  });
  final Tarjeta tarjeta;

  @override
  Widget build(BuildContext context) {
    final AppController appCtr = Get.find<AppController>();
    Future<void> irEditar() async {
      Get.find<TarjetaController>().tarjetaActual = tarjeta;
      Get.toNamed(nameEditarTarjetaScreen, arguments: <String, dynamic>{
        'tarjeta': tarjeta,
      });
    }

    Future<void> irDetalle() async {
      Get.toNamed(nameDetalleTarjetaScreen, arguments: <String, dynamic>{
        'tarjetaId': tarjeta.tarjetaId,
        'tarjeta': tarjeta,
      });
    }

    return InkWell(
      onTap: () async {
        irDetalle();
      },
      child: Card(
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Hero(
                tag: tarjeta.tarjetaId!,
                child: Container(
                  width: 84,
                  height: 49,
                  alignment: Alignment.bottomRight,
                  decoration: BoxDecoration(
                    color: ColorHelper.obtenerColor(tarjeta.color ?? 'morado'),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.only(right: 6, bottom: 6),
                      child: tarjeta.icono != null
                          ? MarcaIconoWidget(
                              icono: tarjeta.icono,
                            )
                          : null),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        tarjeta.titulo ?? '',
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  color: appCtr.theme.value == themeTipoLight
                                      ? colorTexto
                                      : darkColorTexto,
                                  overflow: TextOverflow.ellipsis,
                                ),
                      ),
                      Text(
                        tarjeta.titular ?? '',
                        style:
                            Theme.of(context).textTheme.displaySmall!.copyWith(
                                  color: appCtr.theme.value == themeTipoLight
                                      ? colorTexto
                                      : darkColorTexto,
                                  fontWeight: FontWeight.w300,
                                  overflow: TextOverflow.ellipsis,
                                ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Terminación *${tarjeta.ultimosDigitos}',
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  color: appCtr.theme.value == themeTipoLight
                                      ? colorTexto
                                      : darkColorTexto,
                                ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: InkWell(
                  onTap: () async {
                    irEditar();
                  },
                  child: const Icon(
                    Icons.more_horiz_rounded,
                    size: 26,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
