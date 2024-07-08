import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';
import '../../helpers/tarjeta_helper.dart';
import '../../models/tarjeta.dart';

class TarjetaWidget extends StatelessWidget {
  const TarjetaWidget({
    super.key,
    this.ancho = 300.0,
    this.alto = 200,
    required this.tarjetaActual,
    required this.ctlr,
    this.mostrarOpciones = false,
    this.onEdit,
  });

  final double ancho;
  final double alto;
  final Tarjeta tarjetaActual;
  final GestureFlipCardController ctlr;
  final bool mostrarOpciones;
  final VoidCallback? onEdit;
  @override
  Widget build(BuildContext context) {
    Future<void> voltearCard() async {
      ctlr.flipcard();
    }

    return GestureDetector(
      onTap: () async {
        await voltearCard();
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                width: ancho,
                height: alto,
                child: GestureFlipCard(
                  animationDuration: const Duration(milliseconds: 300),
                  controller: ctlr,
                  enableController: true,
                  // key: GlobalKey(),
                  frontWidget: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: tarjetaActual.color ?? Colors.lightBlue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          tarjetaActual.titulo != null
                              ? tarjetaActual.titulo!
                              : '',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(flex: 2),
                        Text(
                          tarjetaActual.numero != null
                              ? TarjetaHelper.ponerMascaraNumero(
                                  numero: tarjetaActual.numero!)
                              : '',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                color: Colors.white,
                              ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(flex: 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Día de corte',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                ),
                                Text(
                                  tarjetaActual.diaCorte != null
                                      ? tarjetaActual.diaCorte!
                                      : '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  'Día de pago',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                ),
                                Text(
                                  tarjetaActual.diaPago != null
                                      ? tarjetaActual.diaPago!
                                      : '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                  textAlign: TextAlign.right,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  backWidget: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: tarjetaActual.color ?? Colors.lightBlue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        const SizedBox(height: 10),
                        Container(
                          color: Colors.white,
                          width: double.infinity,
                          height: 30,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            tarjetaActual.titular != null
                                ? tarjetaActual.titular!.toUpperCase()
                                : '',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  color: Colors.black87,
                                ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Válido hasta',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                ),
                                Text(
                                  tarjetaActual.expiracion != null
                                      ? tarjetaActual.expiracion!
                                      : '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  'CVV',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                ),
                                Text(
                                  tarjetaActual.codigo != null
                                      ? tarjetaActual.codigo!
                                      : '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (mostrarOpciones)
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      onEdit!();
                    },
                    child: const Icon(
                      Icons.edit,
                      size: 30,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Icon(
                    Icons.share,
                    size: 30,
                  ),
                  const SizedBox(height: 12),
                  const Icon(
                    Icons.remove_red_eye,
                    size: 30,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
